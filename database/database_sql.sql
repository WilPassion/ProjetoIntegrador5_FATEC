-- Limpa notificacao
DROP TABLE IF EXISTS notificacao;

-- Limpa temperatura
DROP TABLE IF EXISTS temperatura;

-- Tabela dispositivo
DROP TABLE IF EXISTS dispositivo;
CREATE TABLE IF NOT EXISTS dispositivo (
    id_dispositivo INTEGER PRIMARY KEY,
    status_ativo BOOLEAN NOT NULL,
    nome_dispositivo VARCHAR(50) NOT NULL,
    data_registro TIMESTAMP NOT NULL
);

-- Tabela dispositivo temperatura
CREATE TABLE IF NOT EXISTS temperatura (
    id_leitura INTEGER PRIMARY KEY,
    id_dispositivo INTEGER NOT NULL REFERENCES dispositivo (id_dispositivo) ON DELETE CASCADE ON UPDATE CASCADE,
    temperatura NUMERIC(5,2) NOT NULL,
    data_leitura TIMESTAMP NOT NULL
);

-- Tabela notificacao
CREATE TABLE IF NOT EXISTS notificacao (
    id_notificacao INTEGER PRIMARY KEY,
    id_leitura INTEGER NOT NULL REFERENCES temperatura (id_leitura) ON DELETE CASCADE ON UPDATE CASCADE,
    canal_notificacao VARCHAR(20) NOT NULL,
    data_notificacao TIMESTAMP NOT NULL,
    mensagem_notificacao VARCHAR(260) NOT NULL
);