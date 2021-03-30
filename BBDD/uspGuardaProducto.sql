USE[italikaDB]
GO
/*||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|||||	DESCRIPCION: STORE PROCEDURE PARA GUARDAR UN NUEVO PRODUCTO				||||||*/
ALTER PROCEDURE dbo.uspGuardaProducto
@PISKU			VARCHAR(30),
@PIFert			VARCHAR(30),
@PIModelo		VARCHAR(30),
@PITipo			INT,
@PINumeroSerie	VARCHAR(50)
AS
DECLARE @wMsgError  NVARCHAR(MAX) = ''
BEGIN  TRAN
	BEGIN TRY
	INSERT INTO dbo.Productos
	(
		SKU,
		fert,
		modelo,
		tipo,
		numeroSerie
	)
	VALUES
	(
		@PISKU,
		@PIFert,
		@PIModelo,
		@PITipo,
		@PINumeroSerie
	)
	COMMIT TRAN
	END TRY
	BEGIN CATCH	
		ROLLBACK TRAN
		SET	@wMsgError	=		
		Char(13) +Char(13)	+
		' HA OCURRIDO UN ERROR-->'										+Char(13) +Char(13) +
		' DESCRIPCION ERR--->:'+	ERROR_MESSAGE()						+Char(13) +
		' NOMBRE PROCESO--->:' +	ERROR_PROCEDURE()					+Char(13) +
		' NUMERO ERR-------->:'+	CONVERT(NVARCHAR,ERROR_NUMBER())	+Char(13) +
		' GRADO ERR--------->:'+	CONVERT(NVARCHAR,ERROR_SEVERITY())	+Char(13) +
		' ESTADO ERR-------->:'+	CONVERT(NVARCHAR,ERROR_STATE())		+Char(13) +
		' LINEA ERR--------->:'+	CONVERT(NVARCHAR,ERROR_LINE())		+Char(13) +Char(13) +Char(13) 
		RAISERROR	(@wMsgError, 16, 1)
	END CATCH	

