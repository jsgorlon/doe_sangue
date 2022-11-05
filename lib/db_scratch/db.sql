CREATE DATABASE DoeSangue;

USE DoeSangue;

CREATE TABLE usuarios (
    INT             idUsuario           IDENTITY,
    VARCHAR(80)     nome                NOT NULL,
    VARCHAR(320)    email               NOT NULL,
    VARCHAR(18)     telefone            NOT NULL,
    VARCHAR(3)      tipoSanguineo       NOT NULL,
    DATETIME        dataCadastro        NOT NULL DEFAULT GETDATE(),
    TEXT            senha               NOT NULL,
    BIT             ativo               NOT NULL DEFAULT 1,
    CONSTRAINT      pkusuarios_id       PRIMARY KEY(idUsuario),
    CONSTRAINT      ukusuarios_telefone UNIQUE(telefone),
    CONSTRAINT      ukusuarios_email    UNIQUE(email),
)
GO
CREATE TABLE doacoes (
    INT         idDoacao                    IDENTITY,
    INT         idUsuario                   NOT NULL,
    INT         idCampanha                      NULL,
    INT         idLocal                     NOT NULL,
    DATETIME    dataDoacao                  NOT NULL DEFAULT GETDATE(),
    CONSTRAINT  pkdoacoes_id                PRIMARY KEY(idDoacao),
    CONSTRAINT  fkdoacoes_idUsuario         FOREIGN KEY(idUsuario) REFERENCES usuarios(idUsuario),
    CONSTRAINT  fkdoacoes_idCampanha        FOREIGN KEY(idCampanha) REFERENCES campanhas(idCampanha),
    CONSTRAINT  fkdoacoes_idLocal           FOREIGN KEY(idLocal) REFERENCES locais_coleta(idLocal),
    CONSTRAINT  ukdoacoes_usuario_campanha  UNIQUE(idUsuario, idCampanha)
)
GO
CREATE TABLE campanhas (
    INT         idCampanha          IDENTITY,
    INT         idUsuario           NOT NULL,
    VARCHAR(80) nomeReceptor            NULL,
    INT         idLocal             NOT NULL,
    VARCHAR(3)  tipoSanguineo       NOT NULL,
    INT         qtdSolicitada       NOT NULL,
    INT         qtdDoada            NOT NULL DEFAULT 0,
    DATETIME    dataInicio          NOT NULL DEFAULT GETDATE(),
    BIT         ativa               NOT NULL DEFAULT 1,
    CONSTRAINT  pkcampanhas_id          PRIMARY KEY(idCampanha),
    CONSTRAINT  fkcampanhas_idUsuario   FOREIGN KEY(idUsuario) REFERENCES usuarios(idUsuario),
    CONSTRAINT  fkcampanhas_idLocal     FOREIGN KEY(idLocal) REFERENCES locais_coleta(idLocal),
    CONSTRAINT  ckqtdSolicitada         CHECK (qtdSolicitada > 0)
)
GO
CREATE TABLE estados 
(
  idEstado        INT         NOT NULL,
  nomeEstado      VARCHAR(75) NOT NULL,
  siglaUF   VARCHAR(2)  NOT NULL,
  
  CONSTRAINT pkestados_id           PRIMARY KEY(idEstado), 
  CONSTRAINT ukestados_siglaUF_nome UNIQUE(siglaUF, nome) 
)

CREATE TABLE cidades 
(
  idCidade    INT             IDENTITY,
  nomeCidade  VARCHAR(120)    NOT NULL, 
  idEstado    INT             NOT NULL,
  ibge        INT             NOT NULL, 
  CONSTRAINT pkcidades_id           PRIMARY KEY(idCidade),
  CONSTRAINT ukcidades_ibge_estado  UNIQUE(ibge, idEstado),
  CONSTRAINT fkcidades_idEstado     FOREIGN KEY(idEstado) REFERENCES estados(idEstado)
);
GO
CREATE TABLE locais_coleta (
    INT             idLocal     IDENTITY,
    INT             idCidade    NOT NULL,
    VARCHAR(120)    nomeLocal   NOT NULL,
    VARCHAR(100)    logradouro  NOT NULL,
    VARCHAR(80)     bairro      NOT NULL,
    VARCHAR(10)     cep         NOT NULL,
    INT             numero      NOT NULL,
    varchar(100)    complemento     NULL,
    CONSTRAINT      pklocais_id PRIMARY KEY(idLocal),
    CONSTRAINT      fklocais_idCidade  FOREIGN KEY(idCidade) REFERENCES cidades(idCidade)
)