INSERT INTO EMPRESA (id_empresa, nome)
VALUES (1, 'Estudio Exemplo');

INSERT INTO GENERO (id_genero, nome)
VALUES (1, 'Aventura'), (2, 'RPG'), (3, 'Indie');

INSERT INTO JOGO (id_jogo, titulo, data_lancamento, preco_base, id_empresa)
VALUES (1, 'Projeto Demonstracao', '2025-01-01', 39.90, 1);

INSERT INTO JOGO (id_jogo, titulo, data_lancamento, preco_base, id_empresa, id_jogo_base)
VALUES (2, 'Expansao de Demonstracao', '2025-06-01', 14.90, 1, 1);

INSERT INTO JOGO_GENERO (id_jogo, id_genero)
VALUES (1, 1), (1, 2), (2, 1), (2, 3);

INSERT INTO CONQUISTA (id_jogo, id_conquista, titulo, pontos_xp)
VALUES
    (1, 1, 'Primeiros Passos', 10),
    (1, 2, 'Explorador', 25),
    (2, 1, 'Novo Comeco', 15);
