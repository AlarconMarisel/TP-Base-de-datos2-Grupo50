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

