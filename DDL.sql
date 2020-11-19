CREATE DATABASE Nyous

USE Nyous

CREATE TABLE Classe(
	idClasse INT PRIMARY KEY IDENTITY NOT NULL,
	Tipo VARCHAR(50) NOT NULL
);

CREATE TABLE Categoria(
	idCategoria INT PRIMARY KEY IDENTITY NOT NULL,
	Titulo VARCHAR(50)
);

CREATE TABLE Localizacao(
	idLocalizacao INT PRIMARY KEY IDENTITY NOT NULL,
	Logradouro VARCHAR(100) NOT NULL,
	Numero VARCHAR(50),
	Complemento VARCHAR(50),
	Bairro VARCHAR(50) NOT NULL,
	Cidade VARCHAR(50) NOT NULL,
	CEP VARCHAR(10) NOT NULL,
	UF CHAR(2) NOT NULL
);

CREATE TABLE Usuario(
	idUsuario INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Senha VARCHAR(100) NOT NULL,
	DataNascimento DATETIME,

	--FK
	idClasse INT FOREIGN KEY REFERENCES Classe (idClasse)

);

CREATE TABLE Evento(
	idEvento INT PRIMARY KEY IDENTITY NOT NULL,
	DataEvento DATETIME NOT NULL,
	AcessoRestrito BINARY DEFAULT 0,
	Capacidade INT NOT NULL,
	Descricao VARCHAR(255),
	--FK
	idLocalizacao INT FOREIGN KEY REFERENCES Localizacao (idLocalizacao),
	idCategoria INT FOREIGN KEY REFERENCES Categoria (idCategoria)
);

CREATE TABLE Presenca(
	idPresenca INT PRIMARY KEY IDENTITY NOT NULL,
	Confirmado BIT DEFAULT NULL,
	--FK
	idUsuario INT FOREIGN KEY REFERENCES Usuario (idUsuario),
	idEvento INT FOREIGN KEY REFERENCES Evento (idEvento),
);

CREATE TABLE Convite(
	idConvite INT PRIMARY KEY IDENTITY NOT NULL,
	Confirmado BIT DEFAULT NULL,
	--FK
	idUsuarioEmissor INT FOREIGN KEY REFERENCES Usuario (idUsuario),
	idUsuarioConvidado INT FOREIGN KEY REFERENCES Usuario (idUsuario),
);