-- -----------------------------------------------------
-- Schema DEVaneiosDB -----------------------------------
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS DEVaneiosDB ;

CREATE SCHEMA IF NOT EXISTS DEVaneiosDB DEFAULT CHARACTER SET utf8 ;
USE DEVaneiosDB ;


-- -----------------------------------------------------
-- Table Pessoa ----------------------------------------
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Pessoa (
  CPF VARCHAR(11) NOT NULL DEFAULT '00000000000' CHECK(LENGTH(CPF) = 11),
  pNome VARCHAR(45) NOT NULL DEFAULT 'ARIANA' CHECK(LENGTH(pNome) >= 2),
  uNome VARCHAR(45) NOT NULL DEFAULT 'GRANDE' CHECK(LENGTH(uNome) >= 2),
  data_de_nascimento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  telefone1 VARCHAR(11) NOT NULL DEFAULT '00000000000' CHECK(LENGTH(telefone1) = 11),
  telefone2 VARCHAR(11) CHECK(LENGTH(telefone2) = 11),
  PRIMARY KEY (CPF));

-- -----------------------------------------------------
-- Table Data_idade ------------------------------------
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Data_idade (
  fk_Pessoa_CPF VARCHAR(11) NOT NULL DEFAULT '00000000000',
  idade INT NULL DEFAULT 18 CHECK(idade >= 18),
  PRIMARY KEY (fk_Pessoa_CPF),
  CONSTRAINT fk_Data_idade_Pessoa
    FOREIGN KEY (fk_Pessoa_CPF)
    REFERENCES Pessoa (CPF)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table Funcionario -----------------------------------
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Funcionario (
  fk_Pessoa_CPF VARCHAR(11) NOT NULL DEFAULT '00000000000',
  salario FLOAT NOT NULL DEFAULT 1045.0 CHECK(salario >= 0),
  turno VARCHAR(1) NOT NULL DEFAULT '-' CHECK(turno = 'M'  OR turno = 'T' OR turno = 'N' OR turno = '-'),
  id_funcao INT NOT NULL DEFAULT 0 CHECK(id_funcao >= 0),
  PRIMARY KEY (fk_Pessoa_CPF),
    CONSTRAINT fk_Funcionario_Pessoa
      FOREIGN KEY (fk_Pessoa_CPF)
      REFERENCES Pessoa (CPF)
      ON DELETE CASCADE
      ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table Hospede ---------------------------------------
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Hospede (
  fk_Pessoa_CPF VARCHAR(11) NOT NULL DEFAULT '00000000000',
  valor_consumo FLOAT NOT NULL DEFAULT 0 CHECK(valor_consumo > 0),
  PRIMARY KEY (fk_Pessoa_CPF),
  CONSTRAINT fk_Hospede_Pessoa
    FOREIGN KEY (fk_Pessoa_CPF)
    REFERENCES Pessoa (CPF)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table Recepcionista ---------------------------------
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Recepcionista (
  fk_Pessoa_CPF VARCHAR(11) NOT NULL DEFAULT '00000000000',
  PRIMARY KEY (fk_Pessoa_CPF),
  CONSTRAINT fk_Recepcionista_Pessoa
    FOREIGN KEY (fk_Pessoa_CPF)
    REFERENCES Pessoa (CPF)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table Faxineiro -------------------------------------
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Faxineiro (
  fk_Pessoa_CPF VARCHAR(11) NOT NULL DEFAULT '00000000000',
  PRIMARY KEY (fk_Pessoa_CPF),
    FOREIGN KEY (fk_Pessoa_CPF)
    REFERENCES Pessoa (CPF)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table Seguranca -------------------------------------
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Seguranca (
  fk_pessoa_CPF VARCHAR(11) NOT NULL,
  PRIMARY KEY (fk_pessoa_CPF),
  CONSTRAINT fk_Seguranca_Funcionario
    FOREIGN KEY (fk_pessoa_CPF)
    REFERENCES Funcionario(fk_pessoa_CPF)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table Reserva ---------------------------------------
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Reserva (
  identificador INT NOT NULL DEFAULT 0 CHECK(identificador >= 0),
  Recepcionista_fk_Pessoa_CPF VARCHAR(11) NOT NULL DEFAULT '00000000000',
  Hospede_fk_Pessoa_CPF VARCHAR(11) NOT NULL DEFAULT '00000000000',
  PRIMARY KEY (identificador),
  CONSTRAINT fk_Reserva_Recepcionista
    FOREIGN KEY (Recepcionista_fk_Pessoa_CPF)
    REFERENCES Recepcionista (fk_Pessoa_CPF)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_Reserva_Hospede
    FOREIGN KEY (Hospede_fk_Pessoa_CPF)
    REFERENCES Hospede (fk_Pessoa_CPF)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table Atributos_Reserva -----------------------------
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Atributos_Reserva (
  fk_Reserva_identificador INT NOT NULL DEFAULT 0,
  duracao INT NOT NULL DEFAULT 1 CHECK(duracao > 0),
  valor_total FLOAT NOT NULL DEFAULT 0 CHECK(valor_total >= 0),
  data DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_Atributos_Reserva_Reserva
    FOREIGN KEY (fk_Reserva_identificador)
    REFERENCES Reserva (identificador)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table Quarto ----------------------------------------
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Quarto (
  numero VARCHAR(3) NOT NULL CHECK(numero >= 1),
  fk_Reserva_identificador INT NOT NULL DEFAULT 0 ,
  valor FLOAT NOT NULL DEFAULT 0 CHECK(valor >= 0),
  tipo VARCHAR(30) NULL DEFAULT 'NONE' CHECK(LENGTH(tipo) >= 4),
  PRIMARY KEY (numero),
  CONSTRAINT fk_Quarto_Reserva
    FOREIGN KEY (fk_Reserva_identificador)
    REFERENCES Reserva (identificador)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table Gerente ---------------------------------------
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Gerente (
  fk_Pessoa_CPF VARCHAR(11) NOT NULL DEFAULT '00000000000',
  fk_funcionario_id_funcao INT NOT NULL DEFAULT '00000000000',
  codigo_gerente INT UNSIGNED NOT NULL DEFAULT 1 CHECK(codigo_gerente >= 1),
  CONSTRAINT fk_Funcionario_Gerente
    PRIMARY KEY (fk_Pessoa_CPF),
    FOREIGN KEY (fk_Pessoa_CPF) 
    REFERENCES Funcionario(fk_Pessoa_CPF)
    ON DELETE CASCADE 
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table Motel -----------------------------------------
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Motel (
  codigo_estabelecimento INT NOT NULL DEFAULT 0 CHECK(codigo_estabelecimento >= 0),
  fk_Gerente_Pessoa_CPF VARCHAR(11) NOT NULL DEFAULT '00000000000',
  endereco VARCHAR(45) NOT NULL DEFAULT 'RUA 1, N 0' CHECK(LENGTH(endereco) >= 10),
  PRIMARY KEY (codigo_estabelecimento),
  CONSTRAINT fk_Motel_Gerente
    FOREIGN KEY (fk_Gerente_Pessoa_CPF)
    REFERENCES Gerente (fk_Pessoa_CPF)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table Acompanhante ----------------------------------
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Acompanhante (
  fk_Pessoa_CPF VARCHAR(11) NOT NULL DEFAULT '00000000000',
  pNome VARCHAR(45) NOT NULL DEFAULT 'INDEFINIDO' CHECK(LENGTH(pNome) >= 2),
  CONSTRAINT fk_Acompanhante_Hospede
    FOREIGN KEY (fk_Pessoa_CPF)
    REFERENCES Hospede(fk_Pessoa_CPF)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table Socio -----------------------------------------
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Socio (
  fk_pessoa_CPF VARCHAR(11) NOT NULL DEFAULT '00000000000',
  porcentagem_de_participacao FLOAT NOT NULL DEFAULT 0,
  PRIMARY KEY (fk_pessoa_CPF),
  CONSTRAINT fk_Socio_Pessoa
    FOREIGN KEY (fk_pessoa_CPF)
    REFERENCES Pessoa(CPF)
    ON DELETE CASCADE
    ON UPDATE CASCADE);