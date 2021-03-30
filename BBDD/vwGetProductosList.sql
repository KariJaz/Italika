USE[italikaDB]
GO
/*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|||||| DESCRIPCIÓN: CONSULTA BÁSICA QUE TRAERA LA LISTA DE TODOS LOS PRODUCTOS	|||||||||
||||||				LOS FILTROS CORRESPONDIENTES SE HACEN DESDE EL CLIENTE		|||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
ALTER VIEW dbo.vwGetProductosList
AS
SELECT	prod.idProducto		AS Producto,
		prod.SKU			AS SKU,
		prod.fert			AS Fert,
		prod.modelo			AS Modelo,
		tipo.Nombre			AS Tipo,
		prod.numeroSerie	AS NumeroSerie,
		convert(NVARCHAR,prod.fechaAlta, 103)		AS Fecha
FROM Productos AS prod
INNER JOIN			
tipoProducto				AS tipo
ON
prod.tipo = TIPO.Id