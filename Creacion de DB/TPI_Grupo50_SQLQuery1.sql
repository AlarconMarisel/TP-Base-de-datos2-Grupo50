USE BD2_TPI_GRUPO_50
GO

CREATE TABLE Articulos (
    IdArticulo INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    NombreArticulo VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(100) NULL,
    Precio DECIMAL(10,2) NOT NULL CHECK (Precio > 0),
    IdCategoria INT NOT NULL,
    IdEstado INT NOT NULL,
    FOREIGN KEY (IdCategoria) REFERENCES Categorias(IdCategoria),
    FOREIGN KEY (IdEstado) REFERENCES EstadosArticulo(IdEstado)
);
GO

CREATE TABLE ImagenesArticulo (
    IdImagen INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    IdArticulo INT NOT NULL,
    RutaImagen VARCHAR(350) NULL,
    FOREIGN KEY (IdArticulo) REFERENCES Articulos(IdArticulo)
);
GO

CREATE TABLE Auditoria (
    IdAuditoria INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    IdArticulo INT NOT NULL,
    Fecha DATETIME NOT NULL DEFAULT(GETDATE()),
    Mensaje VARCHAR(255) NOT NULL,
    FOREIGN KEY (IdArticulo) REFERENCES Articulos(IdArticulo)
);
GO
