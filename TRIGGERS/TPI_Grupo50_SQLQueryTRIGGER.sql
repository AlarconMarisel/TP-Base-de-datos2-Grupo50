/* ============================================================
   TRIGGERS: TR_RestaurarDisponibilidadPorVentaFallida
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