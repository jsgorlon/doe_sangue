CREATE TABLE usuarios (
    idUsuario       INTEGER   PRIMARY KEY AUTOINCREMENT,
    nomeUsuario     TEXT      NOT NULL,
    email           TEXT      NOT NULL  UNIQUE,
    telefone        TEXT      NOT NULL  UNIQUE,
    tipoSanguineo   TEXT      NOT NULL,
    sexo            TEXT      NOT NULL,
    dataNascimento  DATETIME  NOT NULL,
    ultimaDoacao    DATETIME  NULL,
    dataCadastro    DATETIME  NOT NULL DEFAULT current_timestamp,
    senha           TEXT      NOT NULL,
    ativo           BIT       NOT NULL DEFAULT 1
);
CREATE TABLE doacoes (
    idDoacao    INTEGER  PRIMARY KEY AUTOINCREMENT,
    idUsuario   INTEGER  NOT NULL,
    idCampanha  INTEGER      NULL,
    idLocal     INTEGER  NOT NULL,
    dataDoacao  DATETIME NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY(idUsuario)  REFERENCES usuarios(idUsuario),
    FOREIGN KEY(idCampanha) REFERENCES campanhas(idCampanha),
    FOREIGN KEY(idLocal)    REFERENCES locais_coleta(idLocal),
    UNIQUE(idUsuario, idCampanha)
);
CREATE TABLE campanhas (
    idCampanha    INTEGER   PRIMARY KEY AUTOINCREMENT,
    idUsuario     INTEGER   NOT NULL,
    nomeReceptor  TEXT          NULL,
    idLocal       INTEGER   NOT NULL,
    tipoSanguineo TEXT      NOT NULL,
    qtdSolicitada INTEGER   NOT NULL,
    dataInicio    DATETIME  NOT NULL DEFAULT current_timestamp,
    ativa         BIT       NOT NULL DEFAULT 1,
    FOREIGN KEY(idUsuario) REFERENCES usuarios(idUsuario),
    FOREIGN KEY(idLocal) REFERENCES locais_coleta(idLocal),
    CHECK (qtdSolicitada > 0)
);
CREATE TABLE estados (
  idEstado    INTEGER   PRIMARY KEY AUTOINCREMENT,
  nomeEstado  TEXT      NOT NULL,
  siglaUF     TEXT      NOT NULL,
  UNIQUE(siglaUF, nomeEstado) 
);
CREATE TABLE cidades (
  idCidade    INTEGER PRIMARY KEY AUTOINCREMENT,
  nomeCidade  TEXT    NOT NULL, 
  idEstado    INTEGER NOT NULL,
  ibge        INTEGER NOT NULL, 
  UNIQUE(ibge, idEstado),
  FOREIGN KEY(idEstado) REFERENCES estados(idEstado)
);
CREATE TABLE locais_coleta (
    idLocal     INTEGER PRIMARY KEY AUTOINCREMENT,
    idCidade    INTEGER NOT NULL,
    nomeLocal   TEXT    NOT NULL,
    logradouro  TEXT    NOT NULL,
    numero      TEXT    NOT NULL,
    bairro      TEXT    NOT NULL,
    cep         TEXT    NOT NULL,
    complemento TEXT        NULL,
    FOREIGN KEY(idCidade) REFERENCES cidades(idCidade)
);

INSERT INTO usuarios(nomeUsuario, email, telefone, tiposanguineo, dataNascimento, senha) VALUES ("Jo??o", "joao@gmail.com", "179395765", "AB+", "1992-10-20", "senha123"), ("Maria", "maria@fatec.sp.gov.br", "159965564", "A-", "1995-05-05", "senha123"), ("Julia", "julia@gmail.com", "228970346", "O-", "2009-10-20", "senha123");
INSERT INTO estados(nomeEstado, siglaUF) VALUES ("S??o Paulo", "SP"), ("Minas Gerais", "MG");
INSERT INTO cidades(nomeCidade, idEstado, ibge) VALUES ("S??o Jos?? do Rio Preto", 1, 3549805), ("Patos de Minas", 2, 3148004);
INSERT INTO campanhas(idUsuario, nomeReceptor, idLocal, tipoSanguineo, qtdSolicitada, dataInicio, ativa) VALUES (2, "Carla", 2, "A+", 5, "2022-01-05", 0);
INSERT INTO campanhas(idUsuario, idLocal, tipoSanguineo, qtdSolicitada) VALUES (1, 1, "AB+", 5);
INSERT INTO campanhas(idUsuario, nomeReceptor, idLocal, tipoSanguineo, qtdSolicitada) VALUES (2, "Marcia", 2, "O-", 5);
INSERT INTO locais_coleta(idCidade, nomeLocal, logradouro, numero, bairro, cep, complemento) VALUES (1, "Hemocentro Rio Preto", "Av. Jamil Feres Kfouri", "80", "Jardim Panorama", "15091-240", ""), (2, "Funda????o Hemominas", "Rua Major Gote", "1255", "Centro", "38700-000", "Segundo Andar");
INSERT INTO doacoes(idUsuario, idLocal, dataDoacao) VALUES (1, 1, "2022-10-29");
INSERT INTO doacoes(idUsuario, idCampanha, idLocal, dataDoacao) VALUES (2, 1, 2, "2022-01-06");
