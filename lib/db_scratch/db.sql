CREATE DATABASE DoeSangue;

USE DoeSangue;

CREATE TABLE usuarios (
    INT             id                  IDENTITY,
    VARCHAR(80)     nome                NOT NULL,
    VARCHAR(320)    email               NOT NULL,
    VARCHAR(18)     telefone            NOT NULL,
    VARCHAR(3)      tipoSanguineo       NOT NULL,
    DATETIME        dataCadastro        NOT NULL DEFAULT GETDATE(),
    TEXT            senha               NOT NULL,
    BIT             ativo               NOT NULL DEFAULT 1,
    CONSTRAINT      pkusuarios_id       PRIMARY KEY(id),
    CONSTRAINT      ukusuarios_telefone UNIQUE(telefone),
    CONSTRAINT      ukusuarios_email    UNIQUE(email),
)
GO
CREATE TABLE doacoes (
    INT         id                          IDENTITY,
    INT         idUsuario                   NOT NULL,
    INT         idCampanha                      NULL,
    INT         idLocal                     NOT NULL, --idealmente seria o local da doação
    DATETIME    dataDoacao                  NOT NULL DEFAULT GETDATE(),
    CONSTRAINT  pkdoacoes_id                PRIMARY KEY(id),
    CONSTRAINT  fkdoacoes_idUsuario         FOREIGN KEY(idUsuario) REFERENCES usuarios(id),
    CONSTRAINT  fkdoacoes_idCampanha        FOREIGN KEY(idCampanha) REFERENCES campanhas(id),
    CONSTRAINT  fkdoacoes_idLocal           FOREIGN KEY(idLocal) REFERENCES locais_coleta(id),
    CONSTRAINT  ukdoacoes_usuario_campanha  UNIQUE(idUsuario, idCampanha)
)
GO
CREATE TABLE campanhas (
    INT         id                  IDENTITY,
    INT         idUsuario           NOT NULL,
    VARCHAR(80) nomeReceptor            NULL,
    INT         idLocal             NOT NULL,
    VARCHAR(3)  tipoSanguineo       NOT NULL,
    INT         qtdSolicitada       NOT NULL,
    INT         qtdDoada            NOT NULL DEFAULT 0,
    DATETIME    dataInicio          NOT NULL DEFAULT GETDATE(),
    BIT         ativa               NOT NULL DEFAULT 1,
    CONSTRAINT  pkcampanhas_id          PRIMARY KEY(id),
    CONSTRAINT  fkcampanhas_idUsuario   FOREIGN KEY(idUsuario) REFERENCES usuarios(id),
    CONSTRAINT  fkcampanhas_idLocal     FOREIGN KEY(idLocal) REFERENCES locais_coleta(id),
    CONSTRAINT  ckqtdSolicitada         CHECK (qtdSolicitada > 0)
)
GO
CREATE TABLE estados 
(
  id        INT         NOT NULL,
  nome      VARCHAR(75) NOT NULL,
  siglaUF   VARCHAR(2)  NOT NULL,
  
  CONSTRAINT pkestados_id           PRIMARY KEY(id), 
  CONSTRAINT ukestados_siglaUF_nome UNIQUE(siglaUF, nome) 
)

CREATE TABLE cidades 
(
  id        INT             IDENTITY,
  nome      VARCHAR(120)    NOT NULL, 
  idEstado  INT             NOT NULL,
  ibge      INT             NOT NULL, 
  CONSTRAINT pkcidades_id           PRIMARY KEY(id),
  CONSTRAINT ukcidades_ibge_estado  UNIQUE(ibge, idEstado),
  CONSTRAINT fkcidades_idEstado     FOREIGN KEY(idEstado) REFERENCES estados(id)
);
GO
CREATE TABLE locais_coleta (
    INT             id          IDENTITY,
    INT             idCidade    NOT NULL,
    VARCHAR(100)    logradouro  NOT NULL,
    VARCHAR(80)     bairro      NOT NULL,
    VARCHAR(10)     cep         NOT NULL,
    INT             numero      NOT NULL,
    varchar(100)    complemento     NULL,
    CONSTRAINT      pklocais_id PRIMARY KEY(id),
    CONSTRAINT      fklocais_idCidade  FOREIGN KEY(idCidade) REFERENCES cidades(id)
)