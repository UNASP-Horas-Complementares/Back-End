CREATE DATABASE IF NOT EXISTS HORA_COMPLEMENTAR;

USE DATABASE HORA_COMPLEMENTAR;

CREATE TABLE IF NOT EXISTS CURSO(
    curso_id            INT      NOT NULL AUTO_INCREMENT,
    curso_nome          VARCHAR (45)      NOT NULL,
    curso_quantidade    int               NOT NULL,
    PRIMARY KEY(curso_id)
);

CREATE TABLE IF NOT EXISTS USUARIO(
    usuario_id                  INT  NOT NULL AUTO_INCREMENT,
    usuario_nome                VARCHAR (45)  NOT NULL,
    usuario_matricula           VARCHAR (30)  NOT NULL,
    usuario_email               VARCHAR (30)  NOT NULL,
    usuario_senha               VARCHAR (100) NOT NULL,
    usuario_horas_computadas    VARCHAR (50)  NOT NULL,
    curso_id                    INT  NOT NULL,
    PRIMARY KEY(usuario_id),
    FOREIGN KEY(curso_id) REFERENCES CURSO(curso_id)
);

CREATE TABLE IF NOT EXISTS CATEGORIA(
    categoria_id            INT   NOT NULL AUTO_INCREMENT,
    categoria_nome          VARCHAR (45)   NOT NULL,
    categoria_descricao     VARCHAR (255)  NOT NULL,
    categoria_observacao    VARCHAR (45)   NOT NULL,
    categoria_limite        INT            NOT NULL,
    id_curso                BINARY  (16)   NOT NULL,
    PRIMARY KEY(categoria_id),
    FOREIGN KEY(id_curso) REFERENCES CURSO(curso_id)
);

CREATE TABLE IF NOT EXISTS ATIVIDADE(
    atividade_id                INT            NOT NULL AUTO_INCREMENT,
    atividade_nome              VARCHAR (45)   NOT NULL,
    atividade_descricao         VARCHAR (255)  NOT NULL,
    atividade_tipo_comprovante  VARCHAR (45)   NOT NULL,
    atividade_valor             INT            NOT NULL,
    id_categoria                BINARY  (16)   NOT NULL,
    PRIMARY KEY(atividade_id),
    FOREIGN KEY(id_categoria) REFERENCES CATEGORIA(categoria_id)
);

CREATE TABLE IF NOT EXISTS COMPROVANTE(
    comprovante_id              INT   NOT NULL AUTO_INCREMENT,
    comprovante_nome            VARCHAR (45)   NOT NULL,
    comprovante_descricao       VARCHAR (255)  NOT NULL,
    comprovante_valor           INT            NOT NULL,
    id_usuario                  BINARY  (16)   NOT NULL,
    id_atividade                BINARY  (16)   NOT NULL,
    PRIMARY KEY(comprovante_id),
    FOREIGN KEY(id_usuario)   REFERENCES USUARIO(usuario_id),
    FOREIGN KEY(id_atividade) REFERENCES ATIVIDADE(atividade_id)
);