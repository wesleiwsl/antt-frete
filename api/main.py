"""FastAPI — ANTT Piso Mínimo de Frete."""

import json
import os
from pathlib import Path
from typing import Any

from dotenv import load_dotenv

load_dotenv(Path(__file__).resolve().parent.parent / ".env")

import redis
from fastapi import FastAPI, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import create_engine, text

app = FastAPI(title="ANTT Frete API", version="1.0.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["GET"],
    allow_headers=["*"],
)

engine = create_engine(os.environ["DB_URL"], pool_pre_ping=True)
cache  = redis.from_url(os.environ["REDIS_URL"], decode_responses=True)
TTL    = 300


def _cached(key: str, query: str, params: dict | None = None) -> Any:
    hit = cache.get(key)
    if hit:
        return json.loads(hit)
    with engine.connect() as conn:
        rows   = conn.execute(text(query), params or {}).mappings().all()
        result = [dict(r) for r in rows]
    cache.setex(key, TTL, json.dumps(result, default=str))
    return result


@app.get("/tabela", summary="Tabela vigente de pisos mínimos")
def get_tabela(
    tipo_veiculo: str | None = Query(None),
    tipo_carga:   str | None = Query(None),
):
    conditions = ["vigente_desde = (SELECT MAX(vigente_desde) FROM tabela_frete)"]
    params: dict[str, Any] = {}

    if tipo_veiculo:
        conditions.append("tipo_veiculo ILIKE :tipo_veiculo")
        params["tipo_veiculo"] = f"%{tipo_veiculo}%"
    if tipo_carga:
        conditions.append("tipo_carga ILIKE :tipo_carga")
        params["tipo_carga"] = f"%{tipo_carga}%"

    where = " AND ".join(conditions)
    query = f"SELECT * FROM tabela_frete WHERE {where} ORDER BY eixos, tipo_carga"
    return _cached(f"tabela:{tipo_veiculo}:{tipo_carga}", query, params)


@app.get("/calcular", summary="Calcula o frete mínimo")
def calcular(
    tipo_veiculo: str  = Query(..., description="Tipo de veículo"),
    tipo_carga:   str  = Query(..., description="Tipo de carga"),
    distancia_km: float = Query(..., gt=0, description="Distância em km"),
    pedagio:      float = Query(0.0, ge=0, description="Valor do pedágio em R$"),
):
    query = """
        SELECT valor_km, valor_minimo, vigente_desde
        FROM tabela_frete
        WHERE tipo_veiculo ILIKE :veiculo
          AND tipo_carga   ILIKE :carga
        ORDER BY vigente_desde DESC
        LIMIT 1
    """
    rows = _cached(
        f"calc:{tipo_veiculo}:{tipo_carga}",
        query,
        {"veiculo": tipo_veiculo, "carga": tipo_carga},
    )

    if not rows:
        raise HTTPException(status_code=404, detail="Combinação não encontrada na tabela ANTT.")

    row         = rows[0]
    valor_km    = float(row["valor_km"])
    valor_min   = float(row["valor_minimo"] or 0)
    frete_km    = round(valor_km * distancia_km, 2)
    frete_base  = round(max(frete_km, valor_min), 2)
    frete_total = round(frete_base + pedagio, 2)

    return {
        "tipo_veiculo":    tipo_veiculo,
        "tipo_carga":      tipo_carga,
        "distancia_km":    distancia_km,
        "pedagio":         pedagio,
        "valor_km":        valor_km,
        "valor_minimo":    valor_min,
        "frete_por_km":    frete_km,
        "frete_base":      frete_base,
        "frete_total":     frete_total,
        "vigente_desde":   str(row["vigente_desde"]),
    }


@app.get("/historico", summary="Histórico de preços por veículo e carga")
def get_historico(
    tipo_veiculo: str = Query(...),
    tipo_carga:   str = Query(...),
):
    query = """
        SELECT data_vigencia, valor_km, valor_minimo, fonte
        FROM historico_precos
        WHERE tipo_veiculo ILIKE :veiculo
          AND tipo_carga   ILIKE :carga
        ORDER BY data_vigencia ASC
    """
    result = _cached(
        f"hist:{tipo_veiculo}:{tipo_carga}",
        query,
        {"veiculo": tipo_veiculo, "carga": tipo_carga},
    )
    if not result:
        raise HTTPException(status_code=404, detail="Histórico não encontrado.")
    return result


@app.get("/veiculos", summary="Lista de tipos de veículos disponíveis")
def get_veiculos():
    return _cached(
        "veiculos",
        "SELECT DISTINCT tipo_veiculo, eixos FROM tabela_frete ORDER BY eixos",
    )


@app.get("/cargas", summary="Lista de tipos de carga disponíveis")
def get_cargas():
    return _cached(
        "cargas",
        "SELECT DISTINCT tipo_carga FROM tabela_frete ORDER BY tipo_carga",
    )


@app.get("/health")
def health():
    return {"status": "ok"}
