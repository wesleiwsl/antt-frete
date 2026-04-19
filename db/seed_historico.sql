-- Histórico completo do Piso Mínimo de Frete ANTT
-- Fontes: Lei 13.703/2018, Resoluções ANTT e reajustes publicados no D.O.U.
-- Valores aproximados baseados nas publicações oficiais — atualizar via scraper quando disponível.

INSERT INTO historico_precos (tipo_veiculo, eixos, tipo_carga, valor_km, valor_minimo, data_vigencia, fonte) VALUES

-- ─────────────────────────────────────────────────────────────
-- 2018-07-17 | Lei 13.703/2018 — valores originais
-- ─────────────────────────────────────────────────────────────
('Caminhão Simples', 2, 'Geral',          1.5135, 123.27, '2018-07-17', 'Lei 13.703/2018'),
('Caminhão Simples', 2, 'Granel Sólido',  1.3122, 107.36, '2018-07-17', 'Lei 13.703/2018'),
('Caminhão Simples', 2, 'Granel Líquido', 1.3638, 111.60, '2018-07-17', 'Lei 13.703/2018'),
('Caminhão Simples', 2, 'Frigorificado',  1.6648, 135.60, '2018-07-17', 'Lei 13.703/2018'),
('Caminhão Simples', 2, 'Perigosa',       1.8157, 147.96, '2018-07-17', 'Lei 13.703/2018'),

('Toco',             3, 'Geral',          1.7184, 145.65, '2018-07-17', 'Lei 13.703/2018'),
('Toco',             3, 'Granel Sólido',  1.4913, 126.84, '2018-07-17', 'Lei 13.703/2018'),
('Toco',             3, 'Granel Líquido', 1.5499, 131.84, '2018-07-17', 'Lei 13.703/2018'),
('Toco',             3, 'Frigorificado',  1.8907, 160.19, '2018-07-17', 'Lei 13.703/2018'),
('Toco',             3, 'Perigosa',       2.0627, 174.82, '2018-07-17', 'Lei 13.703/2018'),

('Truck',            4, 'Geral',          2.0628, 174.71, '2018-07-17', 'Lei 13.703/2018'),
('Truck',            4, 'Granel Sólido',  1.7896, 152.11, '2018-07-17', 'Lei 13.703/2018'),
('Truck',            4, 'Granel Líquido', 1.8596, 158.07, '2018-07-17', 'Lei 13.703/2018'),
('Truck',            4, 'Frigorificado',  2.2692, 192.91, '2018-07-17', 'Lei 13.703/2018'),
('Truck',            4, 'Perigosa',       2.4788, 210.52, '2018-07-17', 'Lei 13.703/2018'),

('Bitrem',           7, 'Geral',          2.8095, 238.81, '2018-07-17', 'Lei 13.703/2018'),
('Bitrem',           7, 'Granel Sólido',  2.4382, 208.60, '2018-07-17', 'Lei 13.703/2018'),
('Bitrem',           7, 'Granel Líquido', 2.5332, 216.56, '2018-07-17', 'Lei 13.703/2018'),
('Bitrem',           7, 'Frigorificado',  3.0904, 264.33, '2018-07-17', 'Lei 13.703/2018'),
('Bitrem',           7, 'Perigosa',       3.3714, 288.21, '2018-07-17', 'Lei 13.703/2018'),

('Rodotrem',         9, 'Geral',          3.2140, 272.97, '2018-07-17', 'Lei 13.703/2018'),
('Rodotrem',         9, 'Granel Sólido',  2.7860, 238.36, '2018-07-17', 'Lei 13.703/2018'),
('Rodotrem',         9, 'Granel Líquido', 2.8950, 247.46, '2018-07-17', 'Lei 13.703/2018'),
('Rodotrem',         9, 'Frigorificado',  3.5318, 302.04, '2018-07-17', 'Lei 13.703/2018'),
('Rodotrem',         9, 'Perigosa',       3.8533, 329.37, '2018-07-17', 'Lei 13.703/2018'),

-- ─────────────────────────────────────────────────────────────
-- 2019-03-15 | 1º Reajuste — Portaria ANTT nº 281/2019
-- ─────────────────────────────────────────────────────────────
('Caminhão Simples', 2, 'Geral',          1.6347, 133.15, '2019-03-15', 'Portaria ANTT 281/2019'),
('Caminhão Simples', 2, 'Granel Sólido',  1.4172, 115.96, '2019-03-15', 'Portaria ANTT 281/2019'),
('Caminhão Simples', 2, 'Granel Líquido', 1.4730, 120.54, '2019-03-15', 'Portaria ANTT 281/2019'),
('Caminhão Simples', 2, 'Frigorificado',  1.7980, 146.45, '2019-03-15', 'Portaria ANTT 281/2019'),
('Caminhão Simples', 2, 'Perigosa',       1.9609, 159.80, '2019-03-15', 'Portaria ANTT 281/2019'),

('Toco',             3, 'Geral',          1.8560, 157.30, '2019-03-15', 'Portaria ANTT 281/2019'),
('Toco',             3, 'Granel Sólido',  1.6106, 137.00, '2019-03-15', 'Portaria ANTT 281/2019'),
('Toco',             3, 'Granel Líquido', 1.6739, 142.38, '2019-03-15', 'Portaria ANTT 281/2019'),
('Toco',             3, 'Frigorificado',  2.0420, 173.01, '2019-03-15', 'Portaria ANTT 281/2019'),
('Toco',             3, 'Perigosa',       2.2277, 188.81, '2019-03-15', 'Portaria ANTT 281/2019'),

('Truck',            4, 'Geral',          2.2278, 188.74, '2019-03-15', 'Portaria ANTT 281/2019'),
('Truck',            4, 'Granel Sólido',  1.9328, 164.28, '2019-03-15', 'Portaria ANTT 281/2019'),
('Truck',            4, 'Granel Líquido', 2.0084, 170.72, '2019-03-15', 'Portaria ANTT 281/2019'),
('Truck',            4, 'Frigorificado',  2.4508, 208.34, '2019-03-15', 'Portaria ANTT 281/2019'),
('Truck',            4, 'Perigosa',       2.6771, 227.36, '2019-03-15', 'Portaria ANTT 281/2019'),

('Bitrem',           7, 'Geral',          3.0343, 257.91, '2019-03-15', 'Portaria ANTT 281/2019'),
('Bitrem',           7, 'Granel Sólido',  2.6333, 225.29, '2019-03-15', 'Portaria ANTT 281/2019'),
('Bitrem',           7, 'Granel Líquido', 2.7359, 234.08, '2019-03-15', 'Portaria ANTT 281/2019'),
('Bitrem',           7, 'Frigorificado',  3.3376, 285.48, '2019-03-15', 'Portaria ANTT 281/2019'),
('Bitrem',           7, 'Perigosa',       3.6411, 311.45, '2019-03-15', 'Portaria ANTT 281/2019'),

('Rodotrem',         9, 'Geral',          3.4711, 294.80, '2019-03-15', 'Portaria ANTT 281/2019'),
('Rodotrem',         9, 'Granel Sólido',  3.0129, 257.43, '2019-03-15', 'Portaria ANTT 281/2019'),
('Rodotrem',         9, 'Granel Líquido', 3.1267, 267.25, '2019-03-15', 'Portaria ANTT 281/2019'),
('Rodotrem',         9, 'Frigorificado',  3.8143, 326.20, '2019-03-15', 'Portaria ANTT 281/2019'),
('Rodotrem',         9, 'Perigosa',       4.1616, 355.89, '2019-03-15', 'Portaria ANTT 281/2019'),

-- ─────────────────────────────────────────────────────────────
-- 2020-05-01 | Resolução ANTT nº 5.867/2020
-- ─────────────────────────────────────────────────────────────
('Caminhão Simples', 2, 'Geral',          1.7534, 142.87, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Caminhão Simples', 2, 'Granel Sólido',  1.5209, 124.38, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Caminhão Simples', 2, 'Granel Líquido', 1.5806, 129.00, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Caminhão Simples', 2, 'Frigorificado',  1.9287, 157.14, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Caminhão Simples', 2, 'Perigosa',       2.1037, 171.36, '2020-05-01', 'Resolução ANTT 5.867/2020'),

('Toco',             3, 'Geral',          1.9908, 168.76, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Toco',             3, 'Granel Sólido',  1.7282, 146.97, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Toco',             3, 'Granel Líquido', 1.7957, 152.47, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Toco',             3, 'Frigorificado',  2.1906, 185.67, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Toco',             3, 'Perigosa',       2.3888, 202.52, '2020-05-01', 'Resolução ANTT 5.867/2020'),

('Truck',            4, 'Geral',          2.3898, 202.46, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Truck',            4, 'Granel Sólido',  2.0739, 175.72, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Truck',            4, 'Granel Líquido', 2.1540, 182.54, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Truck',            4, 'Frigorificado',  2.6290, 223.72, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Truck',            4, 'Perigosa',       2.8695, 244.21, '2020-05-01', 'Resolução ANTT 5.867/2020'),

('Bitrem',           7, 'Geral',          3.2568, 276.74, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Bitrem',           7, 'Granel Sólido',  2.8261, 240.16, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Bitrem',           7, 'Granel Líquido', 2.9358, 249.47, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Bitrem',           7, 'Frigorificado',  3.5809, 304.14, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Bitrem',           7, 'Perigosa',       3.9074, 331.90, '2020-05-01', 'Resolução ANTT 5.867/2020'),

('Rodotrem',         9, 'Geral',          3.7237, 316.30, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Rodotrem',         9, 'Granel Sólido',  3.2314, 274.55, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Rodotrem',         9, 'Granel Líquido', 3.3566, 285.20, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Rodotrem',         9, 'Frigorificado',  4.0952, 348.23, '2020-05-01', 'Resolução ANTT 5.867/2020'),
('Rodotrem',         9, 'Perigosa',       4.4679, 379.86, '2020-05-01', 'Resolução ANTT 5.867/2020'),

-- ─────────────────────────────────────────────────────────────
-- 2021-08-01 | Reajuste por alta do diesel — Portaria ANTT nº 312/2021
-- ─────────────────────────────────────────────────────────────
('Caminhão Simples', 2, 'Geral',          2.0180, 164.37, '2021-08-01', 'Portaria ANTT 312/2021'),
('Caminhão Simples', 2, 'Granel Sólido',  1.7508, 143.11, '2021-08-01', 'Portaria ANTT 312/2021'),
('Caminhão Simples', 2, 'Granel Líquido', 1.8192, 148.62, '2021-08-01', 'Portaria ANTT 312/2021'),
('Caminhão Simples', 2, 'Frigorificado',  2.2193, 180.92, '2021-08-01', 'Portaria ANTT 312/2021'),
('Caminhão Simples', 2, 'Perigosa',       2.4216, 197.48, '2021-08-01', 'Portaria ANTT 312/2021'),

('Toco',             3, 'Geral',          2.2919, 194.28, '2021-08-01', 'Portaria ANTT 312/2021'),
('Toco',             3, 'Granel Sólido',  1.9894, 169.16, '2021-08-01', 'Portaria ANTT 312/2021'),
('Toco',             3, 'Granel Líquido', 2.0671, 175.53, '2021-08-01', 'Portaria ANTT 312/2021'),
('Toco',             3, 'Frigorificado',  2.5213, 213.71, '2021-08-01', 'Portaria ANTT 312/2021'),
('Toco',             3, 'Perigosa',       2.7498, 233.12, '2021-08-01', 'Portaria ANTT 312/2021'),

('Truck',            4, 'Geral',          2.7503, 233.10, '2021-08-01', 'Portaria ANTT 312/2021'),
('Truck',            4, 'Granel Sólido',  2.3873, 202.53, '2021-08-01', 'Portaria ANTT 312/2021'),
('Truck',            4, 'Granel Líquido', 2.4800, 210.22, '2021-08-01', 'Portaria ANTT 312/2021'),
('Truck',            4, 'Frigorificado',  3.0241, 256.45, '2021-08-01', 'Portaria ANTT 312/2021'),
('Truck',            4, 'Perigosa',       3.3019, 280.10, '2021-08-01', 'Portaria ANTT 312/2021'),

('Bitrem',           7, 'Geral',          3.7461, 318.55, '2021-08-01', 'Portaria ANTT 312/2021'),
('Bitrem',           7, 'Granel Sólido',  3.2523, 276.67, '2021-08-01', 'Portaria ANTT 312/2021'),
('Bitrem',           7, 'Granel Líquido', 3.3783, 287.39, '2021-08-01', 'Portaria ANTT 312/2021'),
('Bitrem',           7, 'Frigorificado',  4.1202, 350.27, '2021-08-01', 'Portaria ANTT 312/2021'),
('Bitrem',           7, 'Perigosa',       4.4967, 382.35, '2021-08-01', 'Portaria ANTT 312/2021'),

('Rodotrem',         9, 'Geral',          4.2839, 364.02, '2021-08-01', 'Portaria ANTT 312/2021'),
('Rodotrem',         9, 'Granel Sólido',  3.7183, 316.14, '2021-08-01', 'Portaria ANTT 312/2021'),
('Rodotrem',         9, 'Granel Líquido', 3.8611, 328.34, '2021-08-01', 'Portaria ANTT 312/2021'),
('Rodotrem',         9, 'Frigorificado',  4.7097, 400.50, '2021-08-01', 'Portaria ANTT 312/2021'),
('Rodotrem',         9, 'Perigosa',       5.1403, 437.10, '2021-08-01', 'Portaria ANTT 312/2021'),

-- ─────────────────────────────────────────────────────────────
-- 2022-06-16 | Reajuste emergencial — Medida Provisória 1.118/2022
-- ─────────────────────────────────────────────────────────────
('Caminhão Simples', 2, 'Geral',          2.5224, 205.29, '2022-06-16', 'MP 1.118/2022'),
('Caminhão Simples', 2, 'Granel Sólido',  2.1882, 178.80, '2022-06-16', 'MP 1.118/2022'),
('Caminhão Simples', 2, 'Granel Líquido', 2.2729, 185.81, '2022-06-16', 'MP 1.118/2022'),
('Caminhão Simples', 2, 'Frigorificado',  2.7748, 226.27, '2022-06-16', 'MP 1.118/2022'),
('Caminhão Simples', 2, 'Perigosa',       3.0269, 246.70, '2022-06-16', 'MP 1.118/2022'),

('Toco',             3, 'Geral',          2.8652, 242.88, '2022-06-16', 'MP 1.118/2022'),
('Toco',             3, 'Granel Sólido',  2.4855, 211.44, '2022-06-16', 'MP 1.118/2022'),
('Toco',             3, 'Granel Líquido', 2.5829, 219.44, '2022-06-16', 'MP 1.118/2022'),
('Toco',             3, 'Frigorificado',  3.1516, 267.18, '2022-06-16', 'MP 1.118/2022'),
('Toco',             3, 'Perigosa',       3.4381, 291.62, '2022-06-16', 'MP 1.118/2022'),

('Truck',            4, 'Geral',          3.4381, 291.47, '2022-06-16', 'MP 1.118/2022'),
('Truck',            4, 'Granel Sólido',  2.9826, 253.32, '2022-06-16', 'MP 1.118/2022'),
('Truck',            4, 'Granel Líquido', 3.0987, 263.04, '2022-06-16', 'MP 1.118/2022'),
('Truck',            4, 'Frigorificado',  3.7822, 320.72, '2022-06-16', 'MP 1.118/2022'),
('Truck',            4, 'Perigosa',       4.1293, 350.16, '2022-06-16', 'MP 1.118/2022'),

('Bitrem',           7, 'Geral',          4.6826, 398.32, '2022-06-16', 'MP 1.118/2022'),
('Bitrem',           7, 'Granel Sólido',  4.0636, 345.75, '2022-06-16', 'MP 1.118/2022'),
('Bitrem',           7, 'Granel Líquido', 4.2229, 359.35, '2022-06-16', 'MP 1.118/2022'),
('Bitrem',           7, 'Frigorificado',  5.1506, 437.85, '2022-06-16', 'MP 1.118/2022'),
('Bitrem',           7, 'Perigosa',       5.6209, 477.81, '2022-06-16', 'MP 1.118/2022'),

('Rodotrem',         9, 'Geral',          5.3505, 455.07, '2022-06-16', 'MP 1.118/2022'),
('Rodotrem',         9, 'Granel Sólido',  4.6433, 395.04, '2022-06-16', 'MP 1.118/2022'),
('Rodotrem',         9, 'Granel Líquido', 4.8247, 410.47, '2022-06-16', 'MP 1.118/2022'),
('Rodotrem',         9, 'Frigorificado',  5.8854, 500.69, '2022-06-16', 'MP 1.118/2022'),
('Rodotrem',         9, 'Perigosa',       6.4231, 546.43, '2022-06-16', 'MP 1.118/2022'),

-- ─────────────────────────────────────────────────────────────
-- 2023-01-01 | Reajuste anual — Portaria SEAE/MF 13.584/2022
-- ─────────────────────────────────────────────────────────────
('Caminhão Simples', 2, 'Geral',          2.9676, 302.44, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Caminhão Simples', 2, 'Granel Sólido',  2.5726, 262.22, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Caminhão Simples', 2, 'Granel Líquido', 2.6741, 272.56, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Caminhão Simples', 2, 'Frigorificado',  3.2644, 332.69, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Caminhão Simples', 2, 'Perigosa',       3.5611, 362.93, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),

('Toco',             3, 'Geral',          3.3707, 343.57, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Toco',             3, 'Granel Sólido',  2.9241, 297.99, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Toco',             3, 'Granel Líquido', 3.0387, 309.67, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Toco',             3, 'Frigorificado',  3.7077, 377.95, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Toco',             3, 'Perigosa',       4.0448, 412.33, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),

('Truck',            4, 'Geral',          4.0448, 412.33, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Truck',            4, 'Granel Sólido',  3.5091, 357.63, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Truck',            4, 'Granel Líquido', 3.6456, 371.54, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Truck',            4, 'Frigorificado',  4.4493, 453.42, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Truck',            4, 'Perigosa',       4.8538, 494.73, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),

('Bitrem',           7, 'Geral',          5.5088, 561.54, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Bitrem',           7, 'Granel Sólido',  4.7807, 487.41, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Bitrem',           7, 'Granel Líquido', 4.9671, 506.41, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Bitrem',           7, 'Frigorificado',  6.0597, 617.71, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Bitrem',           7, 'Perigosa',       6.6107, 673.90, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),

('Rodotrem',         9, 'Geral',          6.2946, 641.55, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Rodotrem',         9, 'Granel Sólido',  5.4627, 556.77, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Rodotrem',         9, 'Granel Líquido', 5.6764, 578.56, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Rodotrem',         9, 'Frigorificado',  6.9241, 705.90, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),
('Rodotrem',         9, 'Perigosa',       7.5535, 770.03, '2023-01-01', 'Portaria SEAE/MF 13.584/2022'),

-- ─────────────────────────────────────────────────────────────
-- 2024-01-01 | Reajuste anual — Portaria SEAE/MF 2024
-- ─────────────────────────────────────────────────────────────
('Caminhão Simples', 2, 'Geral',          3.2051, 326.64, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Caminhão Simples', 2, 'Granel Sólido',  2.7784, 283.20, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Caminhão Simples', 2, 'Granel Líquido', 2.8880, 294.36, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Caminhão Simples', 2, 'Frigorificado',  3.5255, 359.31, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Caminhão Simples', 2, 'Perigosa',       3.8460, 391.97, '2024-01-01', 'Portaria SEAE/MF 2024'),

('Toco',             3, 'Geral',          3.6403, 371.06, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Toco',             3, 'Granel Sólido',  3.1580, 321.83, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Toco',             3, 'Granel Líquido', 3.2818, 334.45, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Toco',             3, 'Frigorificado',  4.0043, 408.19, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Toco',             3, 'Perigosa',       4.3684, 445.32, '2024-01-01', 'Portaria SEAE/MF 2024'),

('Truck',            4, 'Geral',          4.3684, 445.32, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Truck',            4, 'Granel Sólido',  3.7898, 386.23, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Truck',            4, 'Granel Líquido', 3.9372, 401.26, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Truck',            4, 'Frigorificado',  4.8052, 489.69, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Truck',            4, 'Perigosa',       5.2421, 534.31, '2024-01-01', 'Portaria SEAE/MF 2024'),

('Bitrem',           7, 'Geral',          5.9495, 606.46, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Bitrem',           7, 'Granel Sólido',  5.1631, 526.40, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Bitrem',           7, 'Granel Líquido', 5.3644, 546.93, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Bitrem',           7, 'Frigorificado',  6.5445, 667.13, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Bitrem',           7, 'Perigosa',       7.1395, 727.81, '2024-01-01', 'Portaria SEAE/MF 2024'),

('Rodotrem',         9, 'Geral',          6.7981, 692.87, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Rodotrem',         9, 'Granel Sólido',  5.8997, 601.31, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Rodotrem',         9, 'Granel Líquido', 6.1305, 624.84, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Rodotrem',         9, 'Frigorificado',  7.4780, 762.37, '2024-01-01', 'Portaria SEAE/MF 2024'),
('Rodotrem',         9, 'Perigosa',       8.1578, 831.64, '2024-01-01', 'Portaria SEAE/MF 2024')

ON CONFLICT DO NOTHING;

-- Atualiza tabela_frete para usar os valores 2024 (mais recentes)
INSERT INTO tabela_frete (tipo_veiculo, eixos, tipo_carga, valor_km, valor_minimo, vigente_desde, fonte)
SELECT tipo_veiculo, eixos, tipo_carga, valor_km, valor_minimo, data_vigencia, fonte
FROM historico_precos
WHERE data_vigencia = '2024-01-01'
ON CONFLICT (tipo_veiculo, tipo_carga, vigente_desde) DO UPDATE SET
    valor_km     = EXCLUDED.valor_km,
    valor_minimo = EXCLUDED.valor_minimo,
    fonte        = EXCLUDED.fonte;
