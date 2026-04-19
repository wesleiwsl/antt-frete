-- ANTT Piso Mínimo de Frete — Schema

CREATE TABLE IF NOT EXISTS tabela_frete (
    id              SERIAL PRIMARY KEY,
    tipo_veiculo    VARCHAR(60)     NOT NULL,
    eixos           INTEGER         NOT NULL,
    tipo_carga      VARCHAR(60)     NOT NULL,
    valor_km        NUMERIC(10,4)   NOT NULL,
    valor_minimo    NUMERIC(10,2),
    vigente_desde   DATE            NOT NULL,
    fonte           TEXT,
    criado_em       TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    UNIQUE (tipo_veiculo, tipo_carga, vigente_desde)
);

CREATE TABLE IF NOT EXISTS historico_precos (
    id              SERIAL PRIMARY KEY,
    tipo_veiculo    VARCHAR(60)     NOT NULL,
    eixos           INTEGER         NOT NULL,
    tipo_carga      VARCHAR(60)     NOT NULL,
    valor_km        NUMERIC(10,4)   NOT NULL,
    valor_minimo    NUMERIC(10,2),
    data_vigencia   DATE            NOT NULL,
    fonte           TEXT,
    coletado_em     TIMESTAMPTZ     NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_tabela_vigente   ON tabela_frete (vigente_desde DESC);
CREATE INDEX IF NOT EXISTS idx_historico_data    ON historico_precos (data_vigencia DESC);
CREATE INDEX IF NOT EXISTS idx_historico_veiculo ON historico_precos (tipo_veiculo, tipo_carga);

-- Seed: tabela vigente (valores ANTT — atualizar via scraper)
INSERT INTO tabela_frete (tipo_veiculo, eixos, tipo_carga, valor_km, valor_minimo, vigente_desde, fonte)
VALUES
  ('Caminhão Simples', 2, 'Geral',             2.9676, 302.44, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Caminhão Simples', 2, 'Granel Sólido',     2.5726, 262.22, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Caminhão Simples', 2, 'Granel Líquido',    2.6741, 272.56, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Caminhão Simples', 2, 'Frigorificado',     3.2644, 332.69, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Caminhão Simples', 2, 'Perigosa',          3.5611, 362.93, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),

  ('Toco',             3, 'Geral',             3.3707, 343.57, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Toco',             3, 'Granel Sólido',     2.9241, 297.99, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Toco',             3, 'Granel Líquido',    3.0387, 309.67, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Toco',             3, 'Frigorificado',     3.7077, 377.95, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Toco',             3, 'Perigosa',          4.0448, 412.33, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),

  ('Truck',            4, 'Geral',             4.0448, 412.33, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Truck',            4, 'Granel Sólido',     3.5091, 357.63, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Truck',            4, 'Granel Líquido',    3.6456, 371.54, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Truck',            4, 'Frigorificado',     4.4493, 453.42, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Truck',            4, 'Perigosa',          4.8538, 494.73, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),

  ('Bitrem',           7, 'Geral',             5.5088, 561.54, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Bitrem',           7, 'Granel Sólido',     4.7807, 487.41, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Bitrem',           7, 'Granel Líquido',    4.9671, 506.41, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Bitrem',           7, 'Frigorificado',     6.0597, 617.71, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Bitrem',           7, 'Perigosa',          6.6107, 673.90, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),

  ('Rodotrem',         9, 'Geral',             6.2946, 641.55, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Rodotrem',         9, 'Granel Sólido',     5.4627, 556.77, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Rodotrem',         9, 'Granel Líquido',    5.6764, 578.56, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Rodotrem',         9, 'Frigorificado',     6.9241, 705.90, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes'),
  ('Rodotrem',         9, 'Perigosa',          7.5535, 770.03, '2023-01-01', 'ANTT Resolução 5.867/2020 + reajustes')
ON CONFLICT (tipo_veiculo, tipo_carga, vigente_desde) DO NOTHING;

-- Copia seed para histórico
INSERT INTO historico_precos (tipo_veiculo, eixos, tipo_carga, valor_km, valor_minimo, data_vigencia, fonte)
SELECT tipo_veiculo, eixos, tipo_carga, valor_km, valor_minimo, vigente_desde, fonte
FROM tabela_frete
ON CONFLICT DO NOTHING;
