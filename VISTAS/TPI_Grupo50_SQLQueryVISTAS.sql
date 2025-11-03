/* ============================================================
   VISTAS CON FUNCIONES: dbo.CalcularTiempoRestante
   ============================================================ */
USE BD2_TPI_GRUPO_50;
GO

CREATE FUNCTION dbo.CalcularTiempoRestante (@FechaVencimiento DATETIME)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @SegundosRestantes INT = DATEDIFF(SECOND, GETDATE(), @FechaVencimiento);
    DECLARE @Horas INT, @Minutos INT, @Segundos INT;

    IF @SegundosRestantes <= 0
        RETURN 'Vencida';

    SET @Horas = @SegundosRestantes / 3600;
    SET @Minutos = (@SegundosRestantes % 3600) / 60;
    SET @Segundos = @SegundosRestantes % 60;

    RETURN FORMATMESSAGE('%02d:%02d:%02d', @Horas, @Minutos, @Segundos);
END;
GO

/* ============================================================
   VISTA: VW_ReservasActivas
   ============================================================ */
USE BD2_TPI_GRUPO_50;
GO

CREATE OR ALTER VIEW VW_ReservasActivas AS
SELECT 
    A.NombreArticulo AS Articulo,
    A.Precio AS Precio,
    U.Nombre + ' ' + U.Apellido AS Usuario,
    U.Email AS Correo,
    R.FechaReserva,
    R.FechaVencimientoReserva,
    dbo.CalcularTiempoRestante(R.FechaVencimientoReserva) AS TiempoRestante
FROM Reservas R
INNER JOIN Usuarios U ON R.IDUsuario = U.IDUsuario
INNER JOIN Articulos A ON R.IDArticulo = A.IDArticulo
WHERE R.EstadoReserva = 1
  AND R.FechaVencimientoReserva > GETDATE();
GO

/* ============================================================
   VISTA: VW_HistorialVentas
   ============================================================ */
USE BD2_TPI_GRUPO_50
GO

CREATE VIEW VW_HistorialVentas as
SELECT
	v.IDVenta as 'Nº Venta',
	v.FechaVenta as 'Fecha Venta',
	u.Nombre +' '+ u.Apellido as 'Nombre y Apellido',
	a.NombreArticulo as'Articulo',
	c.NombreCategoria as 'Categoria',
	v.PrecioFinal as 'Precio'
FROM
	Ventas v
INNER JOIN Reservas r ON v.IDReserva=r.IDReserva
INNER JOIN Usuarios u ON r.IDUsuario=u.IDUsuario
INNER JOIN Articulos a ON r.IDArticulo=a.IdArticulo
INNER JOIN Categorias c ON a.IdCategoria=c.IdCategoria


/* ============================================================
   VISTA: VW_ArticulosDisponibles
   ============================================================ */
USE BD2_TPI_GRUPO_50
GO

CREATE OR ALTER VIEW VW_ArticulosDisponibles AS
SELECT
    A.NombreArticulo        AS Articulo,
    C.NombreCategoria       AS Categoria,
    A.Descripcion,
    A.Precio,
    I.RutaImagen            AS Foto,
    E.NombreEstado          AS Estado
FROM
    dbo.Articulos AS A
INNER JOIN
    dbo.Categorias AS C ON A.IdCategoria = C.IdCategoria
INNER JOIN
    dbo.ImagenesArticulo AS I ON A.IdArticulo = I.IdArticulo
INNER JOIN
    dbo.EstadosArticulo AS E ON A.IdEstado = E.IdEstado
WHERE
    E.NombreEstado = 'Disponible';
