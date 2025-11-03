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

INSERT INTO ImagenesArticulo (IdArticulo, RutaImagen)
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