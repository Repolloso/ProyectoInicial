-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2021 a las 17:50:44
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectoautos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `id_auto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `Nombre`, `eliminado`, `ts_create`, `ts_update`) VALUES
(1, 'Sedan', 0, '2021-06-25 13:09:52', '2021-07-25 18:12:37'),
(2, 'SUV\r\n', 0, '2021-07-19 15:10:00', '2021-07-19 15:10:30'),
(3, 'Pick Up', 0, '2021-07-19 15:10:23', '2021-07-19 15:10:23'),
(4, 'Camion', 1, '2021-07-25 18:17:53', '2021-07-25 18:17:57'),
(5, 'Camiones', 1, '2021-07-27 12:42:27', '2021-07-27 12:42:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `Apellido` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Direccion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `Eliminado` tinyint(4) DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `Nombre`, `Apellido`, `Telefono`, `Direccion`, `Eliminado`, `ts_create`, `ts_update`) VALUES
(3, 'Pablo', 'Benitez', 123, 'Cacatula 12345', 1, '2021-07-21 16:25:20', '2021-07-21 16:26:11'),
(4, 'Pablo', 'Benites', 123123, 'Cacatula 1234', 0, '2021-07-21 16:26:20', '2021-07-22 14:44:05'),
(5, 'Daniela', 'Rodriguez', 12341234, 'General Caca 731', 1, '2021-07-21 16:30:33', '2021-07-21 16:30:46'),
(6, 'Carlos', 'Menem', 123123, 'manzanares 731', 0, '2021-07-21 16:31:37', '2021-07-21 16:31:37'),
(7, 'Ricardo ', 'Perez', 123123, 'Papelon 321', 1, '2021-07-21 16:47:14', '2021-07-27 12:43:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados_imagenes`
--

CREATE TABLE `empleados_imagenes` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados_imagenes`
--

INSERT INTO `empleados_imagenes` (`id`, `uid`, `id_empleado`, `eliminado`, `ts_create`, `ts_update`) VALUES
(1, '0d44c49f-5950-42aa-8e1d-56ef3c2fc43b.jpeg', 3, 1, '2021-07-21 16:25:20', '2021-07-21 16:26:11'),
(2, 'bdb2873c-d7fd-4078-b8ee-7c07daa11c10.jpeg', 4, 0, '2021-07-21 16:26:20', '2021-07-21 16:26:20'),
(3, '4a24ef33-ccf8-40aa-87a9-c67e34360f7c.png', 5, 1, '2021-07-21 16:30:33', '2021-07-21 16:30:46'),
(4, '656efe61-006c-4912-bde9-7908e2cad043.png', 6, 0, '2021-07-21 16:31:37', '2021-07-21 16:31:37'),
(5, 'd1872872-99b9-484e-9321-c177d8067c4a.jpeg', 7, 1, '2021-07-21 16:47:14', '2021-07-27 12:43:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `confirmacionMail` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` int(11) NOT NULL,
  `Admin` tinyint(4) NOT NULL DEFAULT 0,
  `habilitado` int(11) NOT NULL DEFAULT 1,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `username`, `pass`, `mail`, `confirmacionMail`, `telefono`, `Admin`, `habilitado`, `eliminado`, `ts_create`, `ts_update`) VALUES
(10, 'Agustin', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'agus.rodriguez777@gmail.com', '78cecb72-4235-4b0d-9932-cd223b2a3308', 123456, 0, 1, 1, '2021-07-20 14:54:32', '2021-07-26 13:00:56'),
(11, 'Agustin1234', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'cacatula@gmail.com', '4171e382-6895-4be4-8016-a7f051d75f46', 12341234, 1, 1, 1, '2021-07-20 15:43:16', '2021-07-26 13:00:57'),
(12, 'Admin', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'agus.rodriguez777@hotmail.com', 'c61dbcb4-4ab2-4fe2-ac60-46119e300e54', 12341234, 1, 1, 0, '2021-07-20 15:46:40', '2021-07-20 15:46:50'),
(13, 'paula', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'paulagrodri@gmail.com', '901ffe1e-66af-4397-8cf2-dc7b17fef5e9', 1231323, 0, 1, 1, '2021-07-21 12:36:01', '2021-07-26 13:00:57'),
(14, 'dani', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'xd@gmail.com', '7af9014d-c88f-4381-a6ed-a0451fbe0d2b', 123123, 0, 1, 1, '2021-07-21 16:28:32', '2021-07-25 18:57:47'),
(15, 'Agustin', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'agus.rodriguez777@gmail.com', '58158187-ceed-46a9-b2fa-7b250d65ba99', 123123, 0, 1, 1, '2021-07-26 13:01:12', '2021-07-26 13:09:35'),
(16, 'Agustin', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'agus.rodriguez777@gmail.com', '880e1d0f-f339-414f-a5c6-2a6f0e4576a6', 123123, 0, 1, 1, '2021-07-26 13:09:55', '2021-07-26 15:37:42'),
(17, 'Agustin', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'agus.rodriguez777@gmail.com', '5da1e53a-6518-4614-bdbd-f1b1be233775', 123123, 0, 1, 1, '2021-07-26 15:37:57', '2021-07-26 16:48:51'),
(18, 'Agustin123', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'agus.rodriguez777@gmail.com', '7d13cd66-9739-416a-825c-21b65ad46ee7', 123123, 0, 1, 0, '2021-07-26 16:49:17', '2021-07-27 12:43:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id_autos` int(11) NOT NULL,
  `Marca` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Modelo` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Anio` int(4) NOT NULL,
  `Precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categorias` int(11) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id_autos`, `Marca`, `Modelo`, `Anio`, `Precio`, `stock`, `id_categorias`, `eliminado`, `ts_create`, `ts_update`) VALUES
(1, 'Volkswagen', 'Vento', 2015, 1390000, 0, 1, 1, '2021-06-25 13:12:02', '2021-07-21 14:20:17'),
(2, 'Toyota', 'Camry', 2015, 1790000, 5, 1, 0, '2021-07-19 12:03:57', '2021-07-22 21:57:15'),
(4, 'Audi', 'A8', 2017, 5000000, 5, 1, 1, '2021-07-19 12:05:26', '2021-07-22 16:03:41'),
(6, 'Toyota', 'SW4', 2017, 2500000, 10, 1, 0, '2021-07-19 15:12:36', '2021-07-22 22:02:51'),
(7, 'BMW', 'M5', 2017, 3500000, 10, 2, 0, '2021-07-22 11:55:30', '2021-07-22 11:55:30'),
(8, 'Audi', 'Q7', 2018, 4500000, 2, 2, 1, '2021-07-22 13:49:49', '2021-07-22 16:42:41'),
(9, 'Mercedes Benza', 'Clase x', 2020, 6000000, 1, 3, 1, '2021-07-22 13:50:38', '2021-07-22 16:03:48'),
(10, 'KIA', 'Sorento', 2020, 5500000, 4, 1, 1, '2021-07-22 20:40:51', '2021-07-23 11:12:39'),
(11, 'BMW', 'asd', 123123, 2147483647, 3, 1, 1, '2021-07-22 21:24:25', '2021-07-22 21:31:26'),
(12, 'Chevrolet', 'Cruce', 2017, 2500000, 11, 1, 0, '2021-07-23 11:13:09', '2021-07-23 11:13:09'),
(13, 'KIA', 'Sorento', 2015, 300000, 5, 1, 1, '2021-07-27 12:43:12', '2021-07-27 12:43:18');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_auto` (`id_auto`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados_imagenes`
--
ALTER TABLE `empleados_imagenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id_autos`),
  ADD KEY `id_categorias` (`id_categorias`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `empleados_imagenes`
--
ALTER TABLE `empleados_imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id_autos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_auto`) REFERENCES `vehiculos` (`id_autos`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `empleados_imagenes`
--
ALTER TABLE `empleados_imagenes`
  ADD CONSTRAINT `empleados_imagenes_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `vehiculos_ibfk_1` FOREIGN KEY (`id_categorias`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
