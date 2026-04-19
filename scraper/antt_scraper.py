"""
Raspa a tabela de piso mínimo de frete da ANTT (gov.br) e salva no PostgreSQL.
Tenta primeiro extrair tabelas HTML; se não encontrar, baixa o PDF e extrai via pdfplumber.
Execute manualmente ou agende via cron/schedule.
"""

import io
import logging
import os
import re
import sys
from datetime import date, datetime
from pathlib import Path

import pdfplumber
import requests
from bs4 import BeautifulSoup
from dotenv import load_dotenv
from sqlalchemy import create_engine, text

load_dotenv(Path(__file__).resolve().parent.parent / ".env")

logging.basicConfig(level=logging.INFO, format="%(asctime)s [%(levelname)s] %(message)s")
log = logging.getLogger(__name__)

ANTT_URL = "https://www.gov.br/antt/pt-br/assuntos/cargas/pisos-minimos-de-frete"
HEADERS  = {"User-Agent": "Mozilla/5.0 (compatible; ANTTMonitor/1.0)"}

VEICULO_MAP = {
    "caminhão simples": ("Caminhão Simples", 2),
    "caminhao simples": ("Caminhão Simples", 2),
    "toco":             ("Toco",             3),
    "truck":            ("Truck",            4),
    "bitrem":           ("Bitrem",           7),
    "rodotrem":         ("Rodotrem",         9),
}

CARGA_MAP = {
    "geral":           "Geral",
    "granel sólido":   "Granel Sólido",
    "granel solido":   "Granel Sólido",
    "granel líquido":  "Granel Líquido",
    "granel liquido":  "Granel Líquido",
    "frigorificado":   "Frigorificado",
    "congelado":       "Frigorificado",
    "perigosa":        "Perigosa",
    "carga perigosa":  "Perigosa",
}

engine = create_engine(os.environ["DB_URL"], pool_pre_ping=True)


def normalize(text: str) -> str:
    return re.sub(r"\s+", " ", text.strip().lower())


def parse_brl(value: str) -> float | None:
    cleaned = re.sub(r"[^\d,.]", "", value).replace(",", ".")
    try:
        return float(cleaned)
    except ValueError:
        return None


def fetch_page() -> BeautifulSoup:
    resp = requests.get(ANTT_URL, headers=HEADERS, timeout=30)
    resp.raise_for_status()
    return BeautifulSoup(resp.text, "lxml")


def find_pdf_links(soup: BeautifulSoup) -> list[str]:
    links = []
    for a in soup.find_all("a", href=True):
        href = a["href"]
        if href.lower().endswith(".pdf") and ("piso" in href.lower() or "frete" in href.lower()):
            links.append(href if href.startswith("http") else "https://www.gov.br" + href)
    return links


def extract_from_html(soup: BeautifulSoup) -> list[dict]:
    records = []
    tables = soup.find_all("table")
    for table in tables:
        rows = table.find_all("tr")
        if len(rows) < 3:
            continue
        headers = [normalize(th.get_text()) for th in rows[0].find_all(["th", "td"])]
        for row in rows[1:]:
            cells = [td.get_text(strip=True) for td in row.find_all("td")]
            if len(cells) < 3:
                continue
            record = dict(zip(headers, cells))
            records.append(record)
    return records


def extract_from_pdf(pdf_url: str) -> list[dict]:
    log.info("Baixando PDF: %s", pdf_url)
    resp = requests.get(pdf_url, headers=HEADERS, timeout=60)
    resp.raise_for_status()

    records = []
    with pdfplumber.open(io.BytesIO(resp.content)) as pdf:
        for page in pdf.pages:
            tables = page.extract_tables()
            for table in tables:
                if not table or len(table) < 2:
                    continue
                for row in table[1:]:
                    if not row or all(c is None for c in row):
                        continue
                    records.append({"_raw": row})

    log.info("PDF extraiu %d linhas brutas", len(records))
    return records


def map_to_schema(raw_records: list[dict], fonte: str) -> list[dict]:
    """Tenta mapear linhas brutas para o schema da tabela."""
    mapped = []
    today = date.today()

    for rec in raw_records:
        if "_raw" in rec:
            cells = [str(c or "").strip() for c in rec["_raw"]]
            text_cells = " | ".join(cells).lower()
        else:
            text_cells = " | ".join(str(v).lower() for v in rec.values())
            cells = list(rec.values())

        veiculo_key = next((k for k in VEICULO_MAP if k in text_cells), None)
        carga_key   = next((k for k in CARGA_MAP   if k in text_cells), None)

        if not veiculo_key or not carga_key:
            continue

        tipo_veiculo, eixos = VEICULO_MAP[veiculo_key]
        tipo_carga = CARGA_MAP[carga_key]

        values = [parse_brl(c) for c in cells if parse_brl(c) is not None]
        if not values:
            continue

        valor_km     = values[0] if len(values) >= 1 else None
        valor_minimo = values[1] if len(values) >= 2 else None

        if valor_km and 0.5 < valor_km < 50:
            mapped.append({
                "tipo_veiculo":  tipo_veiculo,
                "eixos":         eixos,
                "tipo_carga":    tipo_carga,
                "valor_km":      valor_km,
                "valor_minimo":  valor_minimo,
                "vigente_desde": today,
                "fonte":         fonte,
            })

    return mapped


def save(records: list[dict]) -> int:
    if not records:
        return 0

    upsert = text("""
        INSERT INTO tabela_frete
            (tipo_veiculo, eixos, tipo_carga, valor_km, valor_minimo, vigente_desde, fonte)
        VALUES
            (:tipo_veiculo, :eixos, :tipo_carga, :valor_km, :valor_minimo, :vigente_desde, :fonte)
        ON CONFLICT (tipo_veiculo, tipo_carga, vigente_desde)
        DO UPDATE SET
            valor_km     = EXCLUDED.valor_km,
            valor_minimo = EXCLUDED.valor_minimo,
            fonte        = EXCLUDED.fonte
    """)

    insert_hist = text("""
        INSERT INTO historico_precos
            (tipo_veiculo, eixos, tipo_carga, valor_km, valor_minimo, data_vigencia, fonte)
        VALUES
            (:tipo_veiculo, :eixos, :tipo_carga, :valor_km, :valor_minimo, :vigente_desde, :fonte)
        ON CONFLICT DO NOTHING
    """)

    with engine.begin() as conn:
        conn.execute(upsert,    records)
        conn.execute(insert_hist, records)

    return len(records)


def run() -> None:
    log.info("Iniciando scraping ANTT…")
    try:
        soup = fetch_page()
    except Exception as exc:
        log.error("Falha ao acessar ANTT: %s", exc)
        sys.exit(1)

    records = []

    # Tenta HTML
    html_records = extract_from_html(soup)
    if html_records:
        log.info("Encontrou %d linhas em tabelas HTML", len(html_records))
        records = map_to_schema(html_records, ANTT_URL)

    # Fallback: PDF
    if not records:
        pdf_links = find_pdf_links(soup)
        log.info("PDFs encontrados: %s", pdf_links)
        for pdf_url in pdf_links[:2]:
            try:
                pdf_records = extract_from_pdf(pdf_url)
                records = map_to_schema(pdf_records, pdf_url)
                if records:
                    break
            except Exception as exc:
                log.warning("Falha no PDF %s: %s", pdf_url, exc)

    if records:
        saved = save(records)
        log.info("Salvo %d registros no banco.", saved)
    else:
        log.warning(
            "Nenhum dado estruturado extraído automaticamente. "
            "Os dados seed do schema.sql continuam vigentes. "
            "Verifique manualmente: %s", ANTT_URL
        )


if __name__ == "__main__":
    run()
