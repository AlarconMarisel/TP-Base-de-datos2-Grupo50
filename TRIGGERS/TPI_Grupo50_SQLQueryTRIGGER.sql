/* ============================================================
   TRIGGER: TR_RestaurarDisponibilidadPorVentaFallida
   ============================================================ */
USE BD2_TPI_GRUPO_50;
GO

CREATE TRIGGER TR_RestaurarDisponibilidadPorVentaFallida
ON Reservas
AFTER DELETE
AS
BEGIN
    UPDATE A
    SET A.IDEstado = 1
    FROM Articulos A
    INNER JOIN deleted D ON A.IDArticulo = D.IDArticulo;
END;
GO


/* ============================================================
   TRIGGER: TR_AuditarArticuloPublicado
   ============================================================ */
USE BD2_TPI_GRUPO_50;
GO

CREATE OR ALTER TRIGGER TR_AuditarArticuloPublicado
ON dbo.Articulos
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Auditoria
        (IdArticulo, fecha, Mensaje)
    SELECT
        i.IdArticulo,

        GETDATE(),
        'Nuevo artículo publicado'
    FROM
        inserted AS i;
END
