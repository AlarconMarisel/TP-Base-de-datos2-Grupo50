/* ============================================================
   STORED PROCEDURES: SP_RegistrarReserva
   ============================================================ */
USE BD2_TPI_GRUPO_50;
GO

CREATE OR ALTER PROCEDURE SP_RegistrarReserva
    @IDUsuario INT,
    @IDArticulo INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Variables para los IDs de estado
    DECLARE @IdEstadoDisponible INT;
    DECLARE @IdEstadoReservado INT;
    DECLARE @IdEstadoActual INT;
    
    -- Variables para el calculo de la seña
    DECLARE @PrecioArticulo DECIMAL(10, 2);
    DECLARE @MontoSeñaCalculado DECIMAL(10, 2);

    -- Busca los IDs de los estados que se van a usar
    SELECT @IdEstadoDisponible = IdEstado FROM dbo.EstadosArticulo WHERE NombreEstado = 'Disponible';
    SELECT @IdEstadoReservado = IdEstado FROM dbo.EstadosArticulo WHERE NombreEstado = 'Reservado';

    -- Verifica que los estados necesarios existan
    IF @IdEstadoDisponible IS NULL
    BEGIN
        ;THROW 50004, 'El estado "Disponible" no está configurado en la tabla EstadosArticulo.', 1;
        RETURN;
    END

    IF @IdEstadoReservado IS NULL
    BEGIN
        ;THROW 50002, 'El estado "Reservado" no está configurado en la tabla EstadosArticulo.', 1;
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verifica el estado y obtiene el precio del articulo
        SELECT 
            @IdEstadoActual = IdEstado,
            @PrecioArticulo = Precio
        FROM dbo.Articulos WITH (UPDLOCK, HOLDLOCK)
        WHERE IdArticulo = @IDArticulo;

        -- Validaciones
        IF @IdEstadoActual IS NULL
        BEGIN
            ;THROW 50003, 'El artículo no existe.', 1;
        END
        ELSE IF @IdEstadoActual != @IdEstadoDisponible
        BEGIN
            ;THROW 50001, 'El artículo ya no se encuentra disponible.', 1;
        END

        -- Si OK, calcula la seña
        SET @MontoSeñaCalculado = @PrecioArticulo * 0.10;

        -- Inserta la reserva con la seña calculada
        INSERT INTO dbo.Reservas 
            (IDUsuario, IDArticulo, FechaReserva, FechaVencimientoReserva, MontoSeña, EstadoReserva)
        VALUES 
            -- Cambios
            (@IDUsuario, @IDArticulo, GETDATE(), DATEADD(hour, 72, GETDATE()), @MontoSeñaCalculado, 1); -- 1 = Activa

        -- Actualiza el estado del articulo
        UPDATE dbo.Articulos
        SET IdEstado = @IdEstadoReservado
        WHERE IdArticulo = @IDArticulo;

        COMMIT TRANSACTION;

        SELECT 'Reserva registrada exitosamente.' AS Mensaje;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        ;THROW;
    END CATCH
END

/* ============================================================
   STORED PROCEDURES: SP_ReporteDeVentasPorFechas
   ============================================================ */
USE BD2_TPI_GRUPO_50
GO

CREATE PROCEDURE SP_ReporteDeVentasPorFechas(
	@FechaInicio DATE, 
	@FechaFin DATE,
	@TotalVentasPeriodo DECIMAL OUTPUT
)
AS 
BEGIN

 -- Validacion de Fechas 
	IF @FechaInicio IS NULL OR @FechaFin IS NULL 
	BEGIN
	RAISERROR('NINGUNA DE LAS FECHAS PUEDE SER NULA.',16,1);
	SET @TotalVentasPeriodo=0;
	RETURN -1
	END
	
	IF @FechaInicio='' OR @FechaFin=''
	BEGIN
	RAISERROR('SE NECESITA INGRESAR UN RANGO DE FECHAS.',16,1);
	SET @TotalVentasPeriodo=0;
	RETURN -1
	END

 -- Devolver el listado detallado de ventas para el rango de fechas especificado
	SELECT * FROM VW_HistorialVentas 
	WHERE [Fecha Venta] BETWEEN @FechaInicio AND @FechaFin
	ORDER BY [Fecha Venta];

 -- Calcular el total de las ventas del período solicitado y asignarlo al parámetro de salida
	SELECT @TotalVentasPeriodo = SUM(Precio) 
	FROM VW_HistorialVentas 
	WHERE [Fecha Venta] BETWEEN @FechaInicio AND @FechaFin;
 
 -- Si no hay ventas en periodo
	IF @TotalVentasPeriodo IS NULL
	BEGIN
		SET @TotalVentasPeriodo=0;
	END
END
GO