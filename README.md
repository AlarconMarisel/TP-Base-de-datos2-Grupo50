# 🛍️ Venta de Garage Web

## 🗃️ Descripción del Sistema que utilizará la DB

### ℹ️ Explicación del Sistema:
El sistema propuesto consiste en una base de datos para gestionar la venta de artículos usados a través de una plataforma web personal 🌐. El objetivo es resolver la necesidad de un administrador (el vendedor) 👨‍💼 de publicar artículos, y de los potenciales compradores 🧑‍💻 de buscar, reservar y comprar 🛒 dichos artículos de una manera ordenada y segura.
La principal característica del sistema es su mecanismo de reserva. Un comprador interesado puede reservar un artículo mediante el pago de una seña 💳 equivalente al 10% de su valor. Esta reserva asegura el artículo por 72 horas ⏳, pasándolo a un estado "Reservado" e impidiendo que otros lo compren. Si el comprador no completa la transacción en ese plazo, la seña no se devuelve y el artículo vuelve a estar "Disponible" automáticamente.

### 🚀 Funcionalidades Principales:

 * 🏷️ Gestión de Artículos: El administrador podrá publicar nuevos artículos, asignándoles un nombre, descripción, precio y categoría. También podrá modificar sus datos o eliminarlos del listado.
 * 👤 Gestión de Usuarios: El sistema registrará a los potenciales compradores, almacenando sus datos básicos para gestionar las reservas y ventas.
 * ⏳ Sistema de Reservas: Los usuarios podrán reservar un artículo. El sistema registrará la reserva, calculará el monto de la seña, y establecerá una fecha de vencimiento de 72 horas.
 * 💸 Proceso de Venta: Permite concretar la venta de un artículo previamente reservado, registrando el pago final y cambiando el estado del artículo a "Vendido".
 * 📊 Consultas y Reportes: Tanto el administrador como los usuarios (con distintos niveles de acceso) podrán consultar información clave, como el listado de artículos disponibles, el historial de ventas o las reservas activas.
