USE Nyous;
GO

SELECT * FROM Usuario;

SELECT * FROM Localizacao;

SELECT * FROM Convite;

SELECT * FROM Evento
	INNER JOIN Categoria ON Evento.IdCategoria = Categoria.IdCategoria
	INNER JOIN Localizacao ON Evento.IdLocalizacao = Localizacao.IdLocalizacao
;
