CREATE DATABASE BD2_TPI_GRUPO_50
COLLATE Latin1_General_CI_AI
GO

USE BD2_TPI_GRUPO_50
GO

CREATE TABLE Categorias (
    IdCategoria INT PRIMARY KEY IDENTITY(1,1),
    NombreCategoria VARCHAR(50) NOT NULL
);

CREATE TABLE EstadosArticulo (
    IdEstado INT PRIMARY KEY IDENTITY(1,1),
    NombreEstado VARCHAR(50) NOT NULL
);

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

CREATE TABLE Usuarios(
	IDUsuario INT PRIMARY KEY IDENTITY(1,1),
	DNI VARCHAR (15) NOT NULL,
	Nombre VARCHAR (50) NOT NULL,
	Apellido VARCHAR (50) NOT NULL,
	Email NVARCHAR(200) NOT NULL UNIQUE,
	Telefono VARCHAR (20) NULL,
	Domicilio VARCHAR (100) NULL,
);
GO

CREATE TABLE Reservas(
IDReserva INT PRIMARY KEY IDENTITY(1,1),
IDUsuario INT NOT NULL,
IDArticulo INT NOT NULL,
FechaReserva DATETIME NOT NULL DEFAULT(GETDATE()),
FechaVencimientoReserva DATETIME NOT NULL,
MontoSeña DECIMAL NOT NULL,
EstadoReserva BIT NOT NULL,
FOREIGN KEY (IDUsuario) REFERENCES Usuarios (IDUsuario),
FOREIGN KEY (IDArticulo) REFERENCES Articulos (IDArticulo)
);
GO

CREATE TABLE Ventas(
IDVenta INT PRIMARY KEY IDENTITY(1,1),
IDReserva INT NOT NULL,
FechaVenta DATETIME NOT NULL DEFAULT(GETDATE()),
PrecioFinal DECIMAL NOT NULL,
FOREIGN KEY (IDReserva) REFERENCES RESERVAS (IDReserva)
);
GO
