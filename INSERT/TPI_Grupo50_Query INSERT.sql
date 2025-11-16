USE BD2_TPI_GRUPO_50
GO

INSERT INTO [BD2_TPI_GRUPO_50].[dbo].[EstadosArticulo] ([NombreEstado])
VALUES
('Disponible'),
('Reservado'),
('Vendido')

INSERT INTO [BD2_TPI_GRUPO_50].[dbo].[Categorias] ([NombreCategoria])
VALUES 
('Electronica'),
('Ropa'),
('Muebles'),
('Libros'),
('Deportes'),
('Cocina'),
('Herramientas'),
('Jardin'),
('Juguetes'),
('Otros');

INSERT INTO [BD2_TPI_GRUPO_50].[dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Email], [Telefono], [Domicilio])
VALUES 
('12345678', 'Juan', 'García', 'juan.garcia@email.com', '1123456789', 'Calle Principal 123'),
('87654321', 'María', 'López', 'maria.lopez@email.com', '1187654321', 'Avenida Central 456'),
('11223344', 'Carlos', 'Martínez', 'carlos.martinez@email.com', '1111223344', 'Calle Secundaria 789'),
('44332211', 'Ana', 'Rodríguez', 'ana.rodriguez@email.com', '1144332211', 'Avenida Norte 321'),
('55667788', 'Pedro', 'Fernández', 'pedro.fernandez@email.com', '1155667788', 'Calle Sur 654'),
('99887766', 'Laura', 'Sánchez', 'laura.sanchez@email.com', '1199887766', 'Avenida Este 987'),
('33445566', 'Roberto', 'Díaz', 'roberto.diaz@email.com', '1133445566', 'Calle Oeste 147'),
('77889900', 'Sofía', 'Gómez', 'sofia.gomez@email.com', '1177889900', 'Avenida Sur 258'),
('22334455', 'Miguel', 'Pérez', 'miguel.perez@email.com', '1122334455', 'Calle Este 369'),
('66778899', 'Elena', 'Torres', 'elena.torres@email.com', '1166778899', 'Avenida Oeste 741');

INSERT INTO [BD2_TPI_GRUPO_50].[dbo].[Articulos] ([NombreArticulo], [Descripcion], [Precio], [IdCategoria], [IdEstado])
VALUES 
('Laptop Dell', 'Laptop 15 pulgadas Intel i7', 320000.00, 1, 1),
('Mouse Logitech', 'Mouse inalámbrico USB', 35000.50, 1, 1),
('Teclado Mecánico', 'Teclado RGB con switches azules', 45000.00, 1, 1),
('Monitor LG 24"', 'Monitor Full HD 1080p', 120000.00, 1, 1),
('Camiseta Básica', 'Camiseta 100% algodón talla M', 25000.00, 2, 1),
('Pantalón Jeans', 'Pantalón azul oscuro talla 32', 35000.00, 2, 1),
('Zapatillas Deportivas', 'Zapatillas running color negro', 19000.00, 2, 1),
('Silla de Oficina', 'Silla ergonómica con ruedas', 85000.00, 3, 1),
('Escritorio Madera', 'Escritorio 120x60 cm color roble', 75000.00, 3, 1),
('Estantería Metálica', 'Estantería 5 niveles', 20000.00, 3, 1),
('El Quijote', 'Novela clásica de Cervantes', 3500.00, 4, 1),
('Harry Potter 1', 'El Filósofo de la Piedra', 4800.00, 4, 1),
('Bicicleta Mountain Bike', 'Bicicleta 21 velocidades', 125000.00, 5, 1),
('Pelota de Fútbol', 'Pelota oficial tamaño 5', 7000.00, 5, 1),
('Mancuernas 10kg', 'Par de mancuernas ajustables', 22000.00, 5, 1),
('Licuadora Oster', 'Licuadora 1000W 5 velocidades', 12500.00, 6, 1),
('Juego de Ollas', 'Set 5 ollas antiadherentes', 18000.00, 6, 1),
('Cuchillos de Cocina', 'Set 6 cuchillos acero inoxidable', 9500.00, 6, 1),
('Taladro Bosch', 'Taladro percutor 800W', 28000.00, 7, 1),
('Destornillador Set', 'Set 20 destornilladores', 7500.00, 7, 1),
('Pala de Jardín', 'Pala acero con mango madera', 8500.00, 8, 1),
('Rastrillo Metálico', 'Rastrillo 12 dientes', 4000.00, 8, 1),
('Muñeca Barbie', 'Muñeca Barbie Fashion', 3500.00, 9, 1),
('Juego de Mesa Ajedrez', 'Ajedrez magnético plegable', 2500.00, 9, 1),
('Lámpara LED', 'Lámpara de escritorio LED', 650.00, 10, 1);

INSERT INTO [BD2_TPI_GRUPO_50].[dbo].[ImagenesArticulo] ([IdArticulo], [RutaImagen])
VALUES
(1, 'Imagenes_de_Articulos/LaptopDell.jpg'),
(1, 'Imagenes_de_Articulos/LaptopDell2.jpg'),
(1, 'Imagenes_de_Articulos/LaptopDell3.jpg'),
(2, 'Imagenes_de_Articulos/MouseLogitech.jpg'),
(3, 'Imagenes_de_Articulos/TecladoMecanico.jpg'),
(4, 'Imagenes_de_Articulos/MonitorLG24.jpg'),
(5, 'Imagenes_de_Articulos/CamisetaBasica.jpg'),
(6, 'Imagenes_de_Articulos/PantalonJeans.jpg'),
(8, 'Imagenes_de_Articulos/SillaOficina.jpg'),
(13, 'Imagenes_de_Articulos/BicicletaMountainBike.jpg'),
(19, 'Imagenes_de_Articulos/TaladroBosch.jpg'),
(19, 'Imagenes_de_Articulos/TaladroBosch2.jpg'),
(21, 'Imagenes_de_Articulos/PalaJardin.jpg');

INSERT INTO [BD2_TPI_GRUPO_50].[dbo].[Reservas] ([IDUsuario], [IDArticulo], [FechaReserva], [FechaVencimientoReserva],[MontoSeña], [EstadoReserva])
VALUES
(3,5,'2025-06-01','2025-06-03',2500.00,1),
(5,4,'2025-06-15','2025-06-17',12000.00,1),
(1,8,'2025-07-20','2025-07-22',8500.00,1),
(8,7,'2025-08-01','2025-08-03',1900.00,1),
(10,24,'2025-09-01','2025-09-03',250.00,1),
(2,25,'2025-09-15','2025-09-17',65.00,1),
(7,15,'2025-09-20','2025-09-22',2200.00,1),
(9,20,'2025-10-11','2025-10-13',750.00,1),
(5,16,'2025-11-01','2025-11-03',1250.00,1),
(3,2,'2025-11-10','2025-11-12',3500.00,1),
(4,2,'2025-10-10','2025-10-12',3500.00,0),
(7,8,'2025-06-20','2025-06-22',8500.00,0),
(6,5,'2025-05-01','2025-05-03',2500.00,0);

INSERT INTO [BD2_TPI_GRUPO_50].[dbo].[Ventas] ([IDReserva], [FechaVenta],[PrecioFinal])
VALUES
(6,'2025-06-01',25000.00),
(7,'2025-06-16',120000.00),
(8,'2025-07-22',85000.00),
(9,'2025-08-01',19000.00),
(10,'2025-09-02',2500.00),
(11,'2025-09-16',650.00),
(12,'2025-09-20',22000.00),
(13,'2025-10-12',7500.00),
(14,'2025-11-02',12500.00),
(15,'2025-11-11',35000.50);