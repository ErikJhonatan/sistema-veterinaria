-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 12-07-2024 a las 21:35:16
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vetsys`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenes`
--

CREATE TABLE `almacenes` (
  `id` bigint UNSIGNED NOT NULL,
  `sede_id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ventas` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `almacenes`
--

INSERT INTO `almacenes` (`id`, `sede_id`, `nombre`, `estado`, `ventas`, `created_at`, `updated_at`) VALUES
(1, 2, 'Almacen A', '1', '', '2024-05-30 21:01:39', '2024-05-30 21:01:39'),
(2, 2, 'Almacen Sur', '1', '', '2024-06-07 14:14:19', '2024-06-07 14:14:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id` bigint UNSIGNED NOT NULL,
  `transaccion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `movimiento` enum('entrada','salida') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comprobante_id` bigint UNSIGNED DEFAULT NULL,
  `tipo_movimiento_id` bigint UNSIGNED DEFAULT NULL,
  `medio_pago_id` bigint UNSIGNED DEFAULT NULL,
  `importe_entrada` decimal(10,2) DEFAULT NULL,
  `importe_salida` decimal(10,2) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`id`, `transaccion`, `descripcion`, `movimiento`, `comprobante_id`, `tipo_movimiento_id`, `medio_pago_id`, `importe_entrada`, `importe_salida`, `fecha`, `created_at`, `updated_at`) VALUES
(1, 'IWO0F74T', 'Movimiento de caja de entrada para la venta #00000003', 'entrada', 3, 1, 1, 100.00, NULL, '2024-05-26 16:24:03', NULL, NULL),
(2, 'QIWCOAX1', 'Movimiento de caja de salida para la venta #00000003', 'salida', 3, 1, 1, NULL, 100.00, '2024-05-26 16:24:13', NULL, NULL),
(3, 'NJGFPKZU', 'Movimiento de caja de entrada para la venta #00000003', 'entrada', 3, 1, 1, 100.00, NULL, '2024-05-26 16:24:24', NULL, NULL),
(4, 'DLZZJZTH', 'Movimiento de caja de entrada para la venta #00000006', 'entrada', 6, 1, 1, 200.00, NULL, '2024-05-26 16:25:12', NULL, NULL),
(5, '91AD889I', 'Movimiento de caja de entrada para la venta #00000007', 'entrada', 7, 1, 2, 100.00, NULL, '2024-05-26 16:26:36', NULL, NULL),
(6, 'BIPHJQYS', 'Movimiento de caja de entrada para la venta #00000008', 'entrada', 8, 1, 1, 200.00, NULL, '2024-05-26 18:35:52', NULL, NULL),
(7, 'Z0N6DEDG', 'compra de alimentos para el personal', 'salida', NULL, 4, 1, NULL, 200.00, '2024-05-27 00:00:00', '2024-05-26 16:37:40', '2024-05-26 16:37:40'),
(8, 'GGDZLBZA', 'Movimiento de caja de entrada para la venta #00000009', 'entrada', 9, 1, 1, 100.00, NULL, '2024-05-26 18:50:20', NULL, NULL),
(9, 'JJZGIWWO', 'Movimiento de caja de salida para la venta #00000009', 'salida', 9, 1, 1, NULL, 100.00, '2024-05-26 18:51:02', NULL, NULL),
(10, 'K2AYUUAA', 'Movimiento de caja de entrada para la venta #00000009', 'entrada', 9, 1, 1, 200.00, NULL, '2024-05-26 18:51:14', NULL, NULL),
(11, 'RZIGR0AS', 'Movimiento de caja de entrada para la venta #00000010', 'entrada', 10, 1, 2, 100.00, NULL, '2024-05-26 18:55:32', NULL, NULL),
(12, '52K9SQUV', 'Movimiento de caja de entrada para la venta #00000012', 'entrada', 12, 1, 1, 100.00, NULL, '2024-05-26 19:01:02', NULL, NULL),
(13, 'LWWTOIXO', 'Movimiento de caja de entrada para la venta #00000013', 'entrada', 13, 1, 1, 200.00, NULL, '2024-05-26 19:04:02', NULL, NULL),
(14, 'IBHZB3FZ', 'Movimiento de caja de entrada para la venta #00000014', 'entrada', 14, 1, 1, 200.00, NULL, '2024-05-26 20:09:50', NULL, NULL),
(15, 'U5JTXN8V', 'compra de alimentos para el personal', 'salida', NULL, 4, 1, NULL, 500.00, '2024-05-27 00:00:00', '2024-05-26 18:11:32', '2024-05-26 18:11:32'),
(16, 'UPWZFCM6', 'Movimiento de caja de entrada para la venta #00000016', 'entrada', 16, 1, 1, 100.00, NULL, '2024-05-30 23:03:30', NULL, NULL),
(17, 'FY9FF8GN', 'Movimiento de caja de entrada para la venta #00000017', 'entrada', 17, 1, 2, 100.00, NULL, '2024-06-01 10:33:41', NULL, NULL),
(18, 'QAEECFHF', 'Movimiento de caja de entrada para la venta #00000018', 'entrada', 18, 1, 1, 100.00, NULL, '2024-06-01 10:40:31', NULL, NULL),
(19, 'NLE7AIQW', 'Movimiento de caja de entrada para la venta #00000018', 'entrada', 18, 1, 1, 100.00, NULL, '2024-06-01 10:42:57', NULL, NULL),
(20, 'XZQLI6LP', 'Movimiento de caja de entrada para la venta #00000019', 'entrada', 19, 1, 1, 100.00, NULL, '2024-06-01 11:26:27', NULL, NULL),
(21, 'SBPPP3YO', 'Movimiento de caja de entrada para la venta #00000020', 'entrada', 20, 1, 1, 20.00, NULL, '2024-06-07 16:17:04', NULL, NULL),
(22, 'BSCABFCM', 'Movimiento de caja de entrada para la venta #00000021', 'entrada', 21, 1, 1, 100.00, NULL, '2024-06-15 10:15:15', NULL, NULL),
(23, 'REY5LNHN', 'Movimiento de caja de entrada para la venta #00000022', 'entrada', 22, 1, 1, 500.00, NULL, '2024-06-15 10:40:59', NULL, NULL),
(24, 'UYMS8LD2', 'Movimiento de caja de entrada para la venta #00000025', 'entrada', 24, 1, 2, 16000.00, NULL, '2024-06-15 11:39:43', NULL, NULL),
(25, '5V9Z9254', 'Movimiento de caja de entrada para la venta #00000026', 'entrada', 25, 1, 1, 100.00, NULL, '2024-06-15 11:50:35', NULL, NULL),
(26, 'VWHBGWMQ', 'Movimiento de caja de entrada para la venta #00000027', 'entrada', 26, 1, 1, 100.00, NULL, '2024-06-15 17:28:04', NULL, NULL),
(27, 'SFRJSGJY', 'Movimiento de caja de entrada para la venta #00000028', 'entrada', 27, 1, 1, 100.00, NULL, '2024-06-15 18:10:58', NULL, NULL),
(28, 'K1WWVTEW', 'Movimiento de caja de entrada para la venta #00000029', 'entrada', 28, 1, 2, 100.00, NULL, '2024-06-18 19:56:00', NULL, NULL),
(29, '5IDAWG3F', 'Movimiento de caja de entrada para la venta #00000030', 'entrada', 29, 1, 2, 100.00, NULL, '2024-06-18 19:59:14', NULL, NULL),
(30, '5G9TMQZR', 'Movimiento de caja de entrada para la venta #00000032', 'entrada', 30, 1, 1, 120.00, NULL, '2024-06-18 21:41:58', NULL, NULL),
(31, 'H2DO2QPM', 'Movimiento de caja de entrada para la venta #00000033', 'entrada', 31, 1, 1, 100.00, NULL, '2024-06-22 11:29:44', NULL, NULL),
(32, 'JJYC0T6R', 'Movimiento de caja de entrada  para la venta #00000035', 'entrada', 32, 1, 1, 100.00, NULL, '2024-06-22 17:18:20', NULL, NULL),
(33, '2D0C2CRY', 'Movimiento de caja de entrada y salida para la venta #00000035', 'entrada', 32, 1, 3, 100.00, 8.00, '2024-06-22 17:19:03', NULL, NULL),
(34, 'MJUXZUR3', 'Movimiento de caja de entrada y salida para la venta #00000036', 'entrada', 33, 1, 1, 2000.00, 350.84, '2024-06-22 17:21:06', NULL, NULL),
(35, '966HL7KH', 'Movimiento de caja de entrada y salida para la venta #00000037', 'entrada', 34, 1, 1, 500.00, 11.36, '2024-06-22 17:24:47', NULL, NULL),
(36, '9E1GLH8T', 'Movimiento de caja de entrada y salida para la venta #00000038', 'entrada', 35, 1, 1, 500.00, 11.36, '2024-06-24 22:11:05', NULL, NULL),
(37, 'JSCJSDOD', 'Movimiento de caja de entrada y salida para la venta #00000039', 'entrada', 36, 1, 1, 200.00, 52.16, '2024-06-24 22:12:12', NULL, NULL),
(38, 'XKUF4SMJ', 'Movimiento de caja de entrada y salida para la venta #00000040', 'entrada', 37, 1, 1, 105.00, 0.36, '2024-06-24 22:17:04', NULL, NULL),
(39, 'IG0QSICD', 'Movimiento de caja de entrada y salida para la venta #00000041', 'entrada', 38, 1, 1, 400.00, 60.16, '2024-06-29 10:24:06', NULL, NULL),
(40, 'LJRRDO7T', 'mantenimiento del local', 'salida', NULL, 4, 2, NULL, 2000.00, '2024-06-29 00:00:00', '2024-06-29 09:10:15', '2024-06-29 09:10:15'),
(41, 'GWKVQWR9', 'seguridad del local', 'salida', NULL, 4, 1, NULL, 2500.00, '2024-06-29 00:00:00', '2024-06-29 09:11:41', '2024-06-29 09:11:41'),
(42, '2LJUUWNW', 'devolucion de prestamos', 'entrada', NULL, 4, 2, 5000.00, NULL, '2024-06-29 00:00:00', '2024-06-29 09:12:14', '2024-06-29 09:12:14'),
(43, 'A7GMIZRZ', 'caja', 'entrada', NULL, 4, 1, 6300.00, NULL, '2024-07-12 00:00:00', '2024-07-12 04:58:03', '2024-07-12 04:58:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint UNSIGNED NOT NULL,
  `IdLinea` bigint UNSIGNED NOT NULL,
  `Categoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `IdLinea`, `Categoria`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pastillas', NULL, NULL),
(2, 2, 'Chequeos', NULL, NULL),
(3, 2, 'Cirugia', NULL, NULL),
(4, 3, 'Baño', NULL, NULL),
(5, 4, 'Vitaminas y Suplementos', NULL, NULL),
(6, 2, 'Insumos Medicos', '2024-05-26 16:43:05', '2024-05-26 16:43:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint UNSIGNED NOT NULL,
  `idDepartamento` bigint UNSIGNED NOT NULL,
  `idProvincia` bigint UNSIGNED NOT NULL,
  `idDistrito` bigint UNSIGNED NOT NULL,
  `Nombre` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Apellido` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DocumentoIdentidad` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TelefonoFijo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TelefonoMovil` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TelefonoTrabajo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Direccion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ZonaResidencia` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClienteReferido` tinyint(1) NOT NULL,
  `Observaciones` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NombreEmpresa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RegistroTributario` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DireccionEmpresa` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Facebook` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Instagram` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReferenciaDireccion` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `idDepartamento`, `idProvincia`, `idDistrito`, `Nombre`, `Apellido`, `DocumentoIdentidad`, `FechaNacimiento`, `Email`, `TelefonoFijo`, `TelefonoMovil`, `TelefonoTrabajo`, `Direccion`, `ZonaResidencia`, `ClienteReferido`, `Observaciones`, `NombreEmpresa`, `RegistroTributario`, `DireccionEmpresa`, `Facebook`, `Instagram`, `ReferenciaDireccion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 15, 135, 1402, 'dennis', 'admin', '20202020', '2000-10-10', 'dennis@gmail.com', NULL, NULL, NULL, 'aaaaaaaaaaaaa', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'a', NULL, '2024-05-30 21:16:14', NULL),
(2, 15, 135, 1406, 'pedro', 'perez', '20202020', '2000-10-10', 'pedro@gmail.com', NULL, NULL, NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 7, 135, 1403, 'cristiano', 'ronaldo', '10101010', '1990-02-02', 'cristiano1@gmail.com', '672354', NULL, NULL, 'av siempre viva 123', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'av siempre viva 123', NULL, '2024-06-07 14:06:17', NULL),
(4, 1, 1, 251, 'alvaroS', 'petrolino', '30303030', '1986-11-04', 'petrolino@gmail.com', NULL, NULL, NULL, 'av', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-30 21:05:00', NULL),
(5, 15, 128, 1299, 'carmen', 'ramos', '75757545', '2020-02-20', NULL, NULL, NULL, NULL, 'av siempre viva 123', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-15 09:44:38', '2024-06-15 09:48:38', '2024-06-15 09:48:38'),
(6, 7, 67, 694, 'carmen', 'ramos', '75757545', '2020-02-20', NULL, NULL, NULL, NULL, 'av siempre viva 123', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-15 09:45:13', '2024-06-15 09:45:13', NULL),
(7, 2, 8, 85, 'elizabeth', 'lopez', '78457852', '1998-03-20', NULL, NULL, NULL, NULL, 'calle los girasoles 123', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-18 19:34:33', '2024-06-18 19:34:33', NULL),
(8, 15, 135, 1402, 'Pedro', 'Palacios', '48588888', NULL, 'aplicaciones-tablet@hotmail.com', '2632179', NULL, NULL, 'av siempre viva 123', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'av siempre viva 123', '2024-06-22 09:53:29', '2024-06-22 09:57:38', '2024-06-22 09:57:38'),
(9, 2, 9, 98, 'Carlos', 'Zambrano', '47475858', NULL, NULL, NULL, NULL, NULL, 'calle los girasoles 123', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'calle los girasoles 123', '2024-06-22 15:23:49', '2024-06-22 15:23:49', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantes`
--

CREATE TABLE `comprobantes` (
  `id` bigint UNSIGNED NOT NULL,
  `serie` int NOT NULL,
  `comprobante` int NOT NULL,
  `tipo_id` bigint UNSIGNED DEFAULT NULL,
  `venta_id` bigint UNSIGNED DEFAULT NULL,
  `cliente_id` bigint UNSIGNED DEFAULT NULL,
  `amortizacion` decimal(10,2) DEFAULT NULL,
  `dinero_recibido` decimal(10,2) DEFAULT NULL,
  `saldo_pendiente` decimal(10,2) DEFAULT NULL,
  `vuelto` decimal(10,2) DEFAULT NULL,
  `anulado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comprobantes`
--

INSERT INTO `comprobantes` (`id`, `serie`, `comprobante`, `tipo_id`, `venta_id`, `cliente_id`, `amortizacion`, `dinero_recibido`, `saldo_pendiente`, `vuelto`, `anulado`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 2, 0.00, 1500.00, 0.00, 1260.00, 0, '2024-05-26 10:14:11', '2024-05-26 10:15:45'),
(2, 1, 2, 1, 2, 3, 0.00, 1700.00, 0.00, 1529.00, 0, '2024-05-26 10:16:13', '2024-05-26 10:16:32'),
(3, 1, 3, 1, 3, 1, 0.00, 2300.00, 0.00, 2231.00, 0, '2024-05-26 10:17:17', '2024-05-26 14:24:24'),
(4, 1, 4, 1, 4, 3, 0.00, 1900.00, 0.00, 1729.00, 0, '2024-05-26 10:53:51', '2024-05-26 10:54:18'),
(5, 1, 5, 1, 5, 1, 0.00, 2200.00, 0.00, 1960.00, 0, '2024-05-26 10:55:12', '2024-05-26 10:55:29'),
(6, 1, 6, 1, 6, 3, 0.00, 2500.00, 0.00, 2329.00, 0, '2024-05-26 14:24:49', '2024-05-26 14:25:12'),
(7, 1, 7, 1, 7, 1, 0.00, 2600.00, 0.00, 2531.00, 0, '2024-05-26 14:26:08', '2024-05-26 14:26:36'),
(8, 1, 8, 1, 8, 3, 0.00, 2800.00, 0.00, 2629.00, 0, '2024-05-26 16:35:20', '2024-05-26 16:35:52'),
(9, 1, 9, 1, 9, 2, 0.00, 3000.00, 0.00, 2931.00, 0, '2024-05-26 16:49:53', '2024-05-26 16:51:14'),
(10, 1, 10, 1, 10, 3, 0.00, 3100.00, 0.00, 3031.00, 0, '2024-05-26 16:54:49', '2024-05-26 16:55:32'),
(11, 1, 11, 1, 11, 2, 0.00, 0.00, 279.00, 0.00, 0, '2024-05-26 16:59:50', '2024-05-26 16:59:50'),
(12, 1, 12, 1, 12, 2, 0.00, 3200.00, 0.00, 3131.00, 0, '2024-05-26 17:00:27', '2024-05-26 17:01:02'),
(13, 1, 13, 1, 13, 1, 0.00, 3400.00, 0.00, 3229.00, 0, '2024-05-26 17:03:03', '2024-05-26 17:04:02'),
(14, 1, 14, 1, 14, 1, 0.00, 3600.00, 0.00, 3492.00, 0, '2024-05-26 18:07:48', '2024-05-26 18:09:50'),
(15, 1, 15, 1, 15, 2, 0.00, 0.00, 279.00, 0.00, 0, '2024-05-26 18:15:17', '2024-05-26 18:15:17'),
(16, 1, 16, 1, 16, 3, 0.00, 3700.00, 0.00, 3631.00, 0, '2024-05-30 21:03:13', '2024-05-30 21:03:30'),
(17, 1, 17, 1, 17, 1, 0.00, 3800.00, 0.00, 3749.00, 0, '2024-06-01 08:33:18', '2024-06-01 08:33:41'),
(18, 1, 18, 1, 18, 3, 0.00, 4000.00, 0.00, 3949.00, 0, '2024-06-01 08:39:12', '2024-06-01 08:42:57'),
(19, 1, 19, 1, 19, 3, 0.00, 4100.00, 0.00, 4049.00, 0, '2024-06-01 09:25:35', '2024-06-01 09:26:27'),
(20, 1, 20, 1, 20, 3, 0.00, 4120.00, 0.00, 4000.00, 0, '2024-06-07 14:16:47', '2024-06-07 14:17:04'),
(21, 1, 21, 1, 21, 3, 0.00, 100.00, 0.00, 78.76, 0, '2024-06-15 08:15:03', '2024-06-15 08:15:15'),
(22, 1, 22, 1, 22, 1, 0.00, 500.00, 0.00, 287.60, 0, '2024-06-15 08:40:06', '2024-06-15 08:40:59'),
(23, 1, 23, 1, 23, 2, 0.00, 0.00, 6108.00, 0.00, 0, '2024-06-15 09:38:23', '2024-06-15 09:38:23'),
(24, 1, 24, 1, 25, 3, 0.00, 16000.00, 0.00, 795.40, 0, '2024-06-15 09:39:28', '2024-06-15 09:39:43'),
(25, 1, 25, 1, 26, 1, 0.00, 100.00, 0.00, 43.36, 0, '2024-06-15 09:50:23', '2024-06-15 09:50:35'),
(26, 1, 26, 1, 27, 6, 0.00, 100.00, 0.00, 64.60, 0, '2024-06-15 15:27:37', '2024-06-15 15:28:04'),
(27, 1, 27, 1, 28, 2, 0.00, 100.00, 0.00, 43.36, 0, '2024-06-15 16:10:22', '2024-06-15 16:10:58'),
(28, 1, 28, 1, 29, 1, 0.00, 100.00, 0.00, 43.36, 0, '2024-06-18 17:55:46', '2024-06-18 17:56:00'),
(29, 1, 29, 1, 30, 3, 0.00, 100.00, 0.00, 78.76, 0, '2024-06-18 17:59:03', '2024-06-18 17:59:14'),
(30, 1, 30, 1, 32, 7, 0.00, 120.00, 0.00, 15.36, 0, '2024-06-18 19:41:45', '2024-06-18 19:41:58'),
(31, 1, 31, 2, 33, 3, 0.00, 100.00, 0.00, 43.36, 0, '2024-06-22 09:29:27', '2024-06-22 09:29:44'),
(32, 1, 32, 1, 35, 3, 0.00, 200.00, 0.00, 8.00, 0, '2024-06-22 15:18:03', '2024-06-22 15:19:03'),
(33, 1, 33, 1, 36, 2, 0.00, 2000.00, 0.00, 350.84, 0, '2024-06-22 15:20:50', '2024-06-22 15:21:06'),
(34, 1, 34, 1, 37, 9, 0.00, 500.00, 0.00, 11.36, 0, '2024-06-22 15:24:38', '2024-06-22 15:24:47'),
(35, 1, 35, 1, 38, 1, 0.00, 500.00, 0.00, 11.36, 0, '2024-06-24 20:10:54', '2024-06-24 20:11:05'),
(36, 1, 36, 1, 39, 1, 0.00, 200.00, 0.00, 52.16, 0, '2024-06-24 20:12:03', '2024-06-24 20:12:12'),
(37, 1, 37, 1, 40, 1, 0.00, 105.00, 0.00, 0.36, 0, '2024-06-24 20:16:53', '2024-06-24 20:17:04'),
(38, 1, 38, 1, 41, 6, 0.00, 400.00, 0.00, 60.16, 0, '2024-06-29 08:22:35', '2024-06-29 08:24:06'),
(39, 1, 39, 1, 42, 2, 0.00, 0.00, 35.40, 0.00, 0, '2024-07-12 04:57:11', '2024-07-12 04:57:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantes_pagos`
--

CREATE TABLE `comprobantes_pagos` (
  `id` bigint UNSIGNED NOT NULL,
  `comprobante_id` bigint UNSIGNED DEFAULT NULL,
  `medio_pago_id` bigint UNSIGNED DEFAULT NULL,
  `tipo_movimiento_id` bigint UNSIGNED DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL,
  `motivo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `anulado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comprobantes_pagos`
--

INSERT INTO `comprobantes_pagos` (`id`, `comprobante_id`, `medio_pago_id`, `tipo_movimiento_id`, `importe`, `motivo`, `anulado`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 500.00, 'na', 0, '2024-05-26 10:15:34', NULL),
(2, 1, 1, 1, 500.00, 'na', 0, '2024-05-26 10:15:41', NULL),
(3, 1, 3, 1, 500.00, 'na', 0, '2024-05-26 10:15:45', NULL),
(4, 2, 1, 1, 200.00, 'a', 0, '2024-05-26 10:16:32', NULL),
(5, 4, 2, 1, 200.00, 'a', 0, '2024-05-26 10:54:18', NULL),
(6, 5, 1, 1, 300.00, 'a', 0, '2024-05-26 10:55:29', NULL),
(7, 3, 1, 1, 100.00, 'a', 1, '2024-05-26 14:24:03', '2024-05-26 14:24:13'),
(8, 3, 1, 3, 100.00, NULL, 1, '2024-05-26 14:24:13', NULL),
(9, 3, 1, 1, 100.00, 'a', 0, '2024-05-26 14:24:24', NULL),
(10, 6, 1, 1, 200.00, 'a', 0, '2024-05-26 14:25:12', NULL),
(11, 7, 2, 1, 100.00, 'a', 0, '2024-05-26 14:26:36', NULL),
(12, 8, 1, 1, 200.00, 'a', 0, '2024-05-26 16:35:52', NULL),
(13, 9, 1, 1, 100.00, 'na', 1, '2024-05-26 16:50:20', '2024-05-26 16:51:02'),
(14, 9, 1, 3, 100.00, NULL, 1, '2024-05-26 16:51:02', NULL),
(15, 9, 1, 1, 200.00, 'na', 0, '2024-05-26 16:51:14', NULL),
(16, 10, 2, 1, 100.00, 'na', 0, '2024-05-26 16:55:32', NULL),
(17, 12, 1, 1, 100.00, 'ninguna', 0, '2024-05-26 17:01:02', NULL),
(18, 13, 1, 1, 200.00, '200', 0, '2024-05-26 17:04:02', NULL),
(19, 14, 1, 1, 200.00, 'na', 0, '2024-05-26 18:09:50', NULL),
(20, 16, 1, 1, 100.00, 'na', 0, '2024-05-30 21:03:30', NULL),
(21, 17, 2, 1, 100.00, 'a', 0, '2024-06-01 08:33:41', NULL),
(22, 18, 1, 1, 100.00, 'na', 0, '2024-06-01 08:40:31', NULL),
(23, 18, 1, 1, 100.00, 'na', 0, '2024-06-01 08:42:57', NULL),
(24, 19, 1, 1, 100.00, 'na', 0, '2024-06-01 09:26:27', NULL),
(25, 20, 1, 1, 20.00, 'a', 0, '2024-06-07 14:17:04', NULL),
(26, 21, 1, 1, 100.00, '—', 0, '2024-06-15 08:15:15', NULL),
(27, 22, 1, 1, 500.00, '—', 0, '2024-06-15 08:40:59', NULL),
(28, 24, 2, 1, 16000.00, '—', 0, '2024-06-15 09:39:43', NULL),
(29, 25, 1, 1, 100.00, '—', 0, '2024-06-15 09:50:35', NULL),
(30, 26, 1, 1, 100.00, '—', 0, '2024-06-15 15:28:04', NULL),
(31, 27, 1, 1, 100.00, '—', 0, '2024-06-15 16:10:58', NULL),
(32, 28, 2, 1, 100.00, '—', 0, '2024-06-18 17:56:00', NULL),
(33, 29, 2, 1, 100.00, '—', 0, '2024-06-18 17:59:14', NULL),
(34, 30, 1, 1, 120.00, '—', 0, '2024-06-18 19:41:58', NULL),
(35, 31, 1, 1, 100.00, '—', 0, '2024-06-22 09:29:44', NULL),
(36, 32, 1, 1, 100.00, '—', 0, '2024-06-22 15:18:20', NULL),
(37, 32, 3, 1, 100.00, '—', 0, '2024-06-22 15:19:03', NULL),
(38, 33, 1, 1, 2000.00, '—', 0, '2024-06-22 15:21:06', NULL),
(39, 34, 1, 1, 500.00, '—', 0, '2024-06-22 15:24:47', NULL),
(40, 35, 1, 1, 500.00, '—', 0, '2024-06-24 20:11:05', NULL),
(41, 36, 1, 1, 200.00, '—', 0, '2024-06-24 20:12:12', NULL),
(42, 37, 1, 1, 105.00, '—', 0, '2024-06-24 20:17:04', NULL),
(43, 38, 1, 1, 400.00, '—', 0, '2024-06-29 08:24:06', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` bigint UNSIGNED NOT NULL,
  `Departamento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `Departamento`, `created_at`, `updated_at`) VALUES
(1, 'AMAZONAS', NULL, NULL),
(2, 'ANCASH', NULL, NULL),
(3, 'APURÍMAC', NULL, NULL),
(4, 'AREQUIPA', NULL, NULL),
(5, 'AYACUCHO', NULL, NULL),
(6, 'CAJAMARCA', NULL, NULL),
(7, 'CALLAO', NULL, NULL),
(8, 'CUSCO', NULL, NULL),
(9, 'HUANCAVELICA', NULL, NULL),
(10, 'HUÁNUCO', NULL, NULL),
(11, 'ICA', NULL, NULL),
(12, 'JUNÍN', NULL, NULL),
(13, 'LA LIBERTAD', NULL, NULL),
(14, 'LAMBAYEQUE', NULL, NULL),
(15, 'LIMA', NULL, NULL),
(16, 'LORETO', NULL, NULL),
(17, 'MADRE DE DIOS', NULL, NULL),
(18, 'MOQUEGUA', NULL, NULL),
(19, 'PASCO', NULL, NULL),
(20, 'PIURA', NULL, NULL),
(21, 'PUNO', NULL, NULL),
(22, 'SAN MARTÍN', NULL, NULL),
(23, 'TACNA', NULL, NULL),
(24, 'TUMBES', NULL, NULL),
(25, 'UCAYALI', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_historia_clinicas`
--

CREATE TABLE `detalle_historia_clinicas` (
  `id` bigint UNSIGNED NOT NULL,
  `idHistoriaClinica` bigint UNSIGNED NOT NULL,
  `idTipoHistoriaClinica` bigint UNSIGNED NOT NULL,
  `motivo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temperatura` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaCardiaca` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuenciaRespiratoria` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `peso` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dht` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tlc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `presionArterial` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `examenTactoRectal` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `examenClinico` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Observaciones` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnosticos`
--

CREATE TABLE `diagnosticos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `diagnosticos`
--

INSERT INTO `diagnosticos` (`id`, `nombre`) VALUES
(1, 'Parvovirus'),
(2, 'Moquillo'),
(3, 'Leptospirosis'),
(4, 'Rabia'),
(5, 'Tos de las perreras'),
(6, 'Enfermedad de Lyme'),
(7, 'Infección por parásitos intestinales'),
(8, 'Dermatofitosis'),
(9, 'Otitis'),
(10, 'Alergias'),
(11, 'Enfermedad cardíaca'),
(12, 'Cistitis'),
(13, 'Artritis'),
(14, 'Diabetes'),
(15, 'Insuficiencia renal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnosticos_mascotas`
--

CREATE TABLE `diagnosticos_mascotas` (
  `id` bigint UNSIGNED NOT NULL,
  `diagnostico_id` bigint UNSIGNED NOT NULL,
  `mascota_id` bigint UNSIGNED NOT NULL,
  `historia_clinica_id` bigint UNSIGNED NOT NULL,
  `observacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `diagnosticos_mascotas`
--

INSERT INTO `diagnosticos_mascotas` (`id`, `diagnostico_id`, `mascota_id`, `historia_clinica_id`, `observacion`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias_preferidos`
--

CREATE TABLE `dias_preferidos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distritos`
--

CREATE TABLE `distritos` (
  `id` bigint UNSIGNED NOT NULL,
  `idProvincia` bigint UNSIGNED NOT NULL,
  `Distrito` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `distritos`
--

INSERT INTO `distritos` (`id`, `idProvincia`, `Distrito`, `created_at`, `updated_at`) VALUES
(1, 1, 'CHACHAPOYAS', NULL, NULL),
(2, 1, 'ASUNCION', NULL, NULL),
(3, 1, 'BALSAS', NULL, NULL),
(4, 1, 'CHETO', NULL, NULL),
(5, 1, 'CHILIQUIN', NULL, NULL),
(6, 1, 'CHUQUIBAMBA', NULL, NULL),
(7, 1, 'GRANADA', NULL, NULL),
(8, 1, 'HUANCAS', NULL, NULL),
(9, 1, 'LA JALCA', NULL, NULL),
(10, 1, 'LEIMEBAMBA', NULL, NULL),
(11, 1, 'LEVANTO', NULL, NULL),
(12, 1, 'MAGDALENA', NULL, NULL),
(13, 1, 'MARISCAL CASTILLA', NULL, NULL),
(14, 1, 'MOLINOPAMPA', NULL, NULL),
(15, 1, 'MONTEVIDEO', NULL, NULL),
(16, 1, 'OLLEROS', NULL, NULL),
(17, 1, 'QUINJALCA', NULL, NULL),
(18, 1, 'SAN FRANCISCO DE DAGUAS', NULL, NULL),
(19, 1, 'SAN ISIDRO DE MAINO', NULL, NULL),
(20, 1, 'SOLOCO', NULL, NULL),
(21, 1, 'SONCHE', NULL, NULL),
(22, 2, 'BAGUA', NULL, NULL),
(23, 2, 'ARAMANGO', NULL, NULL),
(24, 2, 'COPALLIN', NULL, NULL),
(25, 2, 'EL PARCO', NULL, NULL),
(26, 2, 'IMAZA', NULL, NULL),
(27, 2, 'LA PECA', NULL, NULL),
(28, 3, 'JUMBILLA', NULL, NULL),
(29, 3, 'CHISQUILLA', NULL, NULL),
(30, 3, 'CHURUJA', NULL, NULL),
(31, 3, 'COROSHA', NULL, NULL),
(32, 3, 'CUISPES', NULL, NULL),
(33, 3, 'FLORIDA', NULL, NULL),
(34, 3, 'JAZAN', NULL, NULL),
(35, 3, 'RECTA', NULL, NULL),
(36, 3, 'SAN CARLOS', NULL, NULL),
(37, 3, 'SHIPASBAMBA', NULL, NULL),
(38, 3, 'VALERA', NULL, NULL),
(39, 3, 'YAMBRASBAMBA', NULL, NULL),
(40, 4, 'NIEVA', NULL, NULL),
(41, 4, 'EL CENEPA', NULL, NULL),
(42, 4, 'RIO SANTIAGO', NULL, NULL),
(43, 5, 'LAMUD', NULL, NULL),
(44, 5, 'CAMPORREDONDO', NULL, NULL),
(45, 5, 'COCABAMBA', NULL, NULL),
(46, 5, 'COLCAMAR', NULL, NULL),
(47, 5, 'CONILA', NULL, NULL),
(48, 5, 'INGUILPATA', NULL, NULL),
(49, 5, 'LONGUITA', NULL, NULL),
(50, 5, 'LONYA CHICO', NULL, NULL),
(51, 5, 'LUYA', NULL, NULL),
(52, 5, 'LUYA VIEJO', NULL, NULL),
(53, 5, 'MARIA', NULL, NULL),
(54, 5, 'OCALLI', NULL, NULL),
(55, 5, 'OCUMAL', NULL, NULL),
(56, 5, 'PISUQUIA', NULL, NULL),
(57, 5, 'PROVIDENCIA', NULL, NULL),
(58, 5, 'SAN CRISTOBAL', NULL, NULL),
(59, 5, 'SAN FRANCISCO DEL YESO', NULL, NULL),
(60, 5, 'SAN JERONIMO', NULL, NULL),
(61, 5, 'SAN JUAN DE LOPECANCHA', NULL, NULL),
(62, 5, 'SANTA CATALINA', NULL, NULL),
(63, 5, 'SANTO TOMAS', NULL, NULL),
(64, 5, 'TINGO', NULL, NULL),
(65, 5, 'TRITA', NULL, NULL),
(66, 6, 'SAN NICOLAS', NULL, NULL),
(67, 6, 'CHIRIMOTO', NULL, NULL),
(68, 6, 'COCHAMAL', NULL, NULL),
(69, 6, 'HUAMBO', NULL, NULL),
(70, 6, 'LIMABAMBA', NULL, NULL),
(71, 6, 'LONGAR', NULL, NULL),
(72, 6, 'MARISCAL BENAVIDES', NULL, NULL),
(73, 6, 'MILPUC', NULL, NULL),
(74, 6, 'OMIA', NULL, NULL),
(75, 6, 'SANTA ROSA', NULL, NULL),
(76, 6, 'TOTORA', NULL, NULL),
(77, 6, 'VISTA ALEGRE', NULL, NULL),
(78, 7, 'BAGUA GRANDE', NULL, NULL),
(79, 7, 'CAJARURO', NULL, NULL),
(80, 7, 'CUMBA', NULL, NULL),
(81, 7, 'EL MILAGRO', NULL, NULL),
(82, 7, 'JAMALCA', NULL, NULL),
(83, 7, 'LONYA GRANDE', NULL, NULL),
(84, 7, 'YAMON', NULL, NULL),
(85, 8, 'HUARAZ', NULL, NULL),
(86, 8, 'COCHABAMBA', NULL, NULL),
(87, 8, 'COLCABAMBA', NULL, NULL),
(88, 8, 'HUANCHAY', NULL, NULL),
(89, 8, 'INDEPENDENCIA', NULL, NULL),
(90, 8, 'JANGAS', NULL, NULL),
(91, 8, 'LA LIBERTAD', NULL, NULL),
(92, 8, 'OLLEROS', NULL, NULL),
(93, 8, 'PAMPAS GRANDE', NULL, NULL),
(94, 8, 'PARIACOTO', NULL, NULL),
(95, 8, 'PIRA', NULL, NULL),
(96, 8, 'TARICA', NULL, NULL),
(97, 9, 'AIJA', NULL, NULL),
(98, 9, 'CORIS', NULL, NULL),
(99, 9, 'HUACLLAN', NULL, NULL),
(100, 9, 'LA MERCED', NULL, NULL),
(101, 9, 'SUCCHA', NULL, NULL),
(102, 10, 'LLAMELLIN', NULL, NULL),
(103, 10, 'ACZO', NULL, NULL),
(104, 10, 'CHACCHO', NULL, NULL),
(105, 10, 'CHINGAS', NULL, NULL),
(106, 10, 'MIRGAS', NULL, NULL),
(107, 10, 'SAN JUAN DE RONTOY', NULL, NULL),
(108, 11, 'CHACAS', NULL, NULL),
(109, 11, 'ACOCHACA', NULL, NULL),
(110, 12, 'CHIQUIAN', NULL, NULL),
(111, 12, 'ABELARDO PARDO LEZAMETA', NULL, NULL),
(112, 12, 'ANTONIO RAYMONDI', NULL, NULL),
(113, 12, 'AQUIA', NULL, NULL),
(114, 12, 'CAJACAY', NULL, NULL),
(115, 12, 'CANIS', NULL, NULL),
(116, 12, 'COLQUIOC', NULL, NULL),
(117, 12, 'HUALLANCA', NULL, NULL),
(118, 12, 'HUASTA', NULL, NULL),
(119, 12, 'HUAYLLACAYAN', NULL, NULL),
(120, 12, 'LA PRIMAVERA', NULL, NULL),
(121, 12, 'MANGAS', NULL, NULL),
(122, 12, 'PACLLON', NULL, NULL),
(123, 12, 'SAN MIGUEL DE CORPANQUI', NULL, NULL),
(124, 12, 'TICLLOS', NULL, NULL),
(125, 13, 'CARHUAZ', NULL, NULL),
(126, 13, 'ACOPAMPA', NULL, NULL),
(127, 13, 'AMASHCA', NULL, NULL),
(128, 13, 'ANTA', NULL, NULL),
(129, 13, 'ATAQUERO', NULL, NULL),
(130, 13, 'MARCARA', NULL, NULL),
(131, 13, 'PARIAHUANCA', NULL, NULL),
(132, 13, 'SAN MIGUEL DE ACO', NULL, NULL),
(133, 13, 'SHILLA', NULL, NULL),
(134, 13, 'TINCO', NULL, NULL),
(135, 13, 'YUNGAR', NULL, NULL),
(136, 14, 'SAN LUIS', NULL, NULL),
(137, 14, 'SAN NICOLAS', NULL, NULL),
(138, 14, 'YAUYA', NULL, NULL),
(139, 15, 'CASMA', NULL, NULL),
(140, 15, 'BUENA VISTA ALTA', NULL, NULL),
(141, 15, 'COMANDANTE NOEL', NULL, NULL),
(142, 15, 'YAUTAN', NULL, NULL),
(143, 16, 'CORONGO', NULL, NULL),
(144, 16, 'ACO', NULL, NULL),
(145, 16, 'BAMBAS', NULL, NULL),
(146, 16, 'CUSCA', NULL, NULL),
(147, 16, 'LA PAMPA', NULL, NULL),
(148, 16, 'YANAC', NULL, NULL),
(149, 16, 'YUPAN', NULL, NULL),
(150, 17, 'HUARI', NULL, NULL),
(151, 17, 'ANRA', NULL, NULL),
(152, 17, 'CAJAY', NULL, NULL),
(153, 17, 'CHAVIN DE HUANTAR', NULL, NULL),
(154, 17, 'HUACACHI', NULL, NULL),
(155, 17, 'HUACCHIS', NULL, NULL),
(156, 17, 'HUACHIS', NULL, NULL),
(157, 17, 'HUANTAR', NULL, NULL),
(158, 17, 'MASIN', NULL, NULL),
(159, 17, 'PAUCAS', NULL, NULL),
(160, 17, 'PONTO', NULL, NULL),
(161, 17, 'RAHUAPAMPA', NULL, NULL),
(162, 17, 'RAPAYAN', NULL, NULL),
(163, 17, 'SAN MARCOS', NULL, NULL),
(164, 17, 'SAN PEDRO DE CHANA', NULL, NULL),
(165, 17, 'UCO', NULL, NULL),
(166, 18, 'HUARMEY', NULL, NULL),
(167, 18, 'COCHAPETI', NULL, NULL),
(168, 18, 'CULEBRAS', NULL, NULL),
(169, 18, 'HUAYAN', NULL, NULL),
(170, 18, 'MALVAS', NULL, NULL),
(171, 19, 'CARAZ', NULL, NULL),
(172, 19, 'HUALLANCA', NULL, NULL),
(173, 19, 'HUATA', NULL, NULL),
(174, 19, 'HUAYLAS', NULL, NULL),
(175, 19, 'MATO', NULL, NULL),
(176, 19, 'PAMPAROMAS', NULL, NULL),
(177, 19, 'PUEBLO LIBRE', NULL, NULL),
(178, 19, 'SANTA CRUZ', NULL, NULL),
(179, 19, 'SANTO TORIBIO', NULL, NULL),
(180, 19, 'YURACMARCA', NULL, NULL),
(181, 20, 'PISCOBAMBA', NULL, NULL),
(182, 20, 'CASCA', NULL, NULL),
(183, 20, 'ELEAZAR GUZMAN BARRON', NULL, NULL),
(184, 20, 'FIDEL OLIVAS ESCUDERO', NULL, NULL),
(185, 20, 'LLAMA', NULL, NULL),
(186, 20, 'LLUMPA', NULL, NULL),
(187, 20, 'LUCMA', NULL, NULL),
(188, 20, 'MUSGA', NULL, NULL),
(189, 21, 'OCROS', NULL, NULL),
(190, 21, 'ACAS', NULL, NULL),
(191, 21, 'CAJAMARQUILLA', NULL, NULL),
(192, 21, 'CARHUAPAMPA', NULL, NULL),
(193, 21, 'COCHAS', NULL, NULL),
(194, 21, 'CONGAS', NULL, NULL),
(195, 21, 'LLIPA', NULL, NULL),
(196, 21, 'SAN CRISTOBAL DE RAJAN', NULL, NULL),
(197, 21, 'SAN PEDRO', NULL, NULL),
(198, 21, 'SANTIAGO DE CHILCAS', NULL, NULL),
(199, 22, 'CABANA', NULL, NULL),
(200, 22, 'BOLOGNESI', NULL, NULL),
(201, 22, 'CONCHUCOS', NULL, NULL),
(202, 22, 'HUACASCHUQUE', NULL, NULL),
(203, 22, 'HUANDOVAL', NULL, NULL),
(204, 22, 'LACABAMBA', NULL, NULL),
(205, 22, 'LLAPO', NULL, NULL),
(206, 22, 'PALLASCA', NULL, NULL),
(207, 22, 'PAMPAS', NULL, NULL),
(208, 22, 'SANTA ROSA', NULL, NULL),
(209, 22, 'TAUCA', NULL, NULL),
(210, 23, 'POMABAMBA', NULL, NULL),
(211, 23, 'HUAYLLAN', NULL, NULL),
(212, 23, 'PAROBAMBA', NULL, NULL),
(213, 23, 'QUINUABAMBA', NULL, NULL),
(214, 24, 'RECUAY', NULL, NULL),
(215, 24, 'CATAC', NULL, NULL),
(216, 24, 'COTAPARACO', NULL, NULL),
(217, 24, 'HUAYLLAPAMPA', NULL, NULL),
(218, 24, 'LLACLLIN', NULL, NULL),
(219, 24, 'MARCA', NULL, NULL),
(220, 24, 'PAMPAS CHICO', NULL, NULL),
(221, 24, 'PARARIN', NULL, NULL),
(222, 24, 'TAPACOCHA', NULL, NULL),
(223, 24, 'TICAPAMPA', NULL, NULL),
(224, 25, 'CHIMBOTE', NULL, NULL),
(225, 25, 'CACERES DEL PERU', NULL, NULL),
(226, 25, 'COISHCO', NULL, NULL),
(227, 25, 'MACATE', NULL, NULL),
(228, 25, 'MORO', NULL, NULL),
(229, 25, 'NEPEÑA', NULL, NULL),
(230, 25, 'SAMANCO', NULL, NULL),
(231, 25, 'SANTA', NULL, NULL),
(232, 25, 'NUEVO CHIMBOTE', NULL, NULL),
(233, 26, 'SIHUAS', NULL, NULL),
(234, 26, 'ACOBAMBA', NULL, NULL),
(235, 26, 'ALFONSO UGARTE', NULL, NULL),
(236, 26, 'CASHAPAMPA', NULL, NULL),
(237, 26, 'CHINGALPO', NULL, NULL),
(238, 26, 'HUAYLLABAMBA', NULL, NULL),
(239, 26, 'QUICHES', NULL, NULL),
(240, 26, 'RAGASH', NULL, NULL),
(241, 26, 'SAN JUAN', NULL, NULL),
(242, 26, 'SICSIBAMBA', NULL, NULL),
(243, 27, 'YUNGAY', NULL, NULL),
(244, 27, 'CASCAPARA', NULL, NULL),
(245, 27, 'MANCOS', NULL, NULL),
(246, 27, 'MATACOTO', NULL, NULL),
(247, 27, 'QUILLO', NULL, NULL),
(248, 27, 'RANRAHIRCA', NULL, NULL),
(249, 27, 'SHUPLUY', NULL, NULL),
(250, 27, 'YANAMA', NULL, NULL),
(251, 28, 'ABANCAY', NULL, NULL),
(252, 28, 'CHACOCHE', NULL, NULL),
(253, 28, 'CIRCA', NULL, NULL),
(254, 28, 'CURAHUASI', NULL, NULL),
(255, 28, 'HUANIPACA', NULL, NULL),
(256, 28, 'LAMBRAMA', NULL, NULL),
(257, 28, 'PICHIRHUA', NULL, NULL),
(258, 28, 'SAN PEDRO DE CACHORA', NULL, NULL),
(259, 28, 'TAMBURCO', NULL, NULL),
(260, 29, 'ANDAHUAYLAS', NULL, NULL),
(261, 29, 'ANDARAPA', NULL, NULL),
(262, 29, 'CHIARA', NULL, NULL),
(263, 29, 'HUANCARAMA', NULL, NULL),
(264, 29, 'HUANCARAY', NULL, NULL),
(265, 29, 'HUAYANA', NULL, NULL),
(266, 29, 'KISHUARA', NULL, NULL),
(267, 29, 'PACOBAMBA', NULL, NULL),
(268, 29, 'PACUCHA', NULL, NULL),
(269, 29, 'PAMPACHIRI', NULL, NULL),
(270, 29, 'POMACOCHA', NULL, NULL),
(271, 29, 'SAN ANTONIO DE CACHI', NULL, NULL),
(272, 29, 'SAN JERONIMO', NULL, NULL),
(273, 29, 'SAN MIGUEL DE CHACCRAMPA', NULL, NULL),
(274, 29, 'SANTA MARIA DE CHICMO', NULL, NULL),
(275, 29, 'TALAVERA', NULL, NULL),
(276, 29, 'TUMAY HUARACA', NULL, NULL),
(277, 29, 'TURPO', NULL, NULL),
(278, 29, 'KAQUIABAMBA', NULL, NULL),
(279, 29, 'JOSE MARIA ARGUEDAS', NULL, NULL),
(280, 30, 'ANTABAMBA', NULL, NULL),
(281, 30, 'EL ORO', NULL, NULL),
(282, 30, 'HUAQUIRCA', NULL, NULL),
(283, 30, 'JUAN ESPINOZA MEDRANO', NULL, NULL),
(284, 30, 'OROPESA', NULL, NULL),
(285, 30, 'PACHACONAS', NULL, NULL),
(286, 30, 'SABAINO', NULL, NULL),
(287, 31, 'CHALHUANCA', NULL, NULL),
(288, 31, 'CAPAYA', NULL, NULL),
(289, 31, 'CARAYBAMBA', NULL, NULL),
(290, 31, 'CHAPIMARCA', NULL, NULL),
(291, 31, 'COLCABAMBA', NULL, NULL),
(292, 31, 'COTARUSE', NULL, NULL),
(293, 31, 'HUAYLLO', NULL, NULL),
(294, 31, 'JUSTO APU SAHUARAURA', NULL, NULL),
(295, 31, 'LUCRE', NULL, NULL),
(296, 31, 'POCOHUANCA', NULL, NULL),
(297, 31, 'SAN JUAN DE CHACÑA', NULL, NULL),
(298, 31, 'SAÑAYCA', NULL, NULL),
(299, 31, 'SORAYA', NULL, NULL),
(300, 31, 'TAPAIRIHUA', NULL, NULL),
(301, 31, 'TINTAY', NULL, NULL),
(302, 31, 'TORAYA', NULL, NULL),
(303, 31, 'YANACA', NULL, NULL),
(304, 32, 'TAMBOBAMBA', NULL, NULL),
(305, 32, 'COTABAMBAS', NULL, NULL),
(306, 32, 'COYLLURQUI', NULL, NULL),
(307, 32, 'HAQUIRA', NULL, NULL),
(308, 32, 'MARA', NULL, NULL),
(309, 32, 'CHALLHUAHUACHO', NULL, NULL),
(310, 33, 'CHINCHEROS', NULL, NULL),
(311, 33, 'ANCO_HUALLO', NULL, NULL),
(312, 33, 'COCHARCAS', NULL, NULL),
(313, 33, 'HUACCANA', NULL, NULL),
(314, 33, 'OCOBAMBA', NULL, NULL),
(315, 33, 'ONGOY', NULL, NULL),
(316, 33, 'URANMARCA', NULL, NULL),
(317, 33, 'RANRACANCHA', NULL, NULL),
(318, 33, 'ROCCHACC', NULL, NULL),
(319, 33, 'EL PORVENIR', NULL, NULL),
(320, 33, 'LOS CHANKAS', NULL, NULL),
(321, 34, 'CHUQUIBAMBILLA', NULL, NULL),
(322, 34, 'CURPAHUASI', NULL, NULL),
(323, 34, 'GAMARRA', NULL, NULL),
(324, 34, 'HUAYLLATI', NULL, NULL),
(325, 34, 'MAMARA', NULL, NULL),
(326, 34, 'MICAELA BASTIDAS', NULL, NULL),
(327, 34, 'PATAYPAMPA', NULL, NULL),
(328, 34, 'PROGRESO', NULL, NULL),
(329, 34, 'SAN ANTONIO', NULL, NULL),
(330, 34, 'SANTA ROSA', NULL, NULL),
(331, 34, 'TURPAY', NULL, NULL),
(332, 34, 'VILCABAMBA', NULL, NULL),
(333, 34, 'VIRUNDO', NULL, NULL),
(334, 34, 'CURASCO', NULL, NULL),
(335, 35, 'AREQUIPA', NULL, NULL),
(336, 35, 'ALTO SELVA ALEGRE', NULL, NULL),
(337, 35, 'CAYMA', NULL, NULL),
(338, 35, 'CERRO COLORADO', NULL, NULL),
(339, 35, 'CHARACATO', NULL, NULL),
(340, 35, 'CHIGUATA', NULL, NULL),
(341, 35, 'JACOBO HUNTER', NULL, NULL),
(342, 35, 'LA JOYA', NULL, NULL),
(343, 35, 'MARIANO MELGAR', NULL, NULL),
(344, 35, 'MIRAFLORES', NULL, NULL),
(345, 35, 'MOLLEBAYA', NULL, NULL),
(346, 35, 'PAUCARPATA', NULL, NULL),
(347, 35, 'POCSI', NULL, NULL),
(348, 35, 'POLOBAYA', NULL, NULL),
(349, 35, 'QUEQUEÑA', NULL, NULL),
(350, 35, 'SABANDIA', NULL, NULL),
(351, 35, 'SACHACA', NULL, NULL),
(352, 35, 'SAN JUAN DE SIGUAS', NULL, NULL),
(353, 35, 'SAN JUAN DE TARUCANI', NULL, NULL),
(354, 35, 'SANTA ISABEL DE SIGUAS', NULL, NULL),
(355, 35, 'SANTA RITA DE SIGUAS', NULL, NULL),
(356, 35, 'SOCABAYA', NULL, NULL),
(357, 35, 'TIABAYA', NULL, NULL),
(358, 35, 'UCHUMAYO', NULL, NULL),
(359, 35, 'VITOR', NULL, NULL),
(360, 35, 'YANAHUARA', NULL, NULL),
(361, 35, 'YARABAMBA', NULL, NULL),
(362, 35, 'YURA', NULL, NULL),
(363, 35, 'JOSE LUIS BUSTAMANTE Y RIVERO', NULL, NULL),
(364, 36, 'CAMANA', NULL, NULL),
(365, 36, 'JOSE MARIA QUIMPER', NULL, NULL),
(366, 36, 'MARIANO NICOLAS VALCARCEL', NULL, NULL),
(367, 36, 'MARISCAL CACERES', NULL, NULL),
(368, 36, 'NICOLAS DE PIEROLA', NULL, NULL),
(369, 36, 'OCOÑA', NULL, NULL),
(370, 36, 'QUILCA', NULL, NULL),
(371, 36, 'SAMUEL PASTOR', NULL, NULL),
(372, 37, 'CARAVELI', NULL, NULL),
(373, 37, 'ACARI', NULL, NULL),
(374, 37, 'ATICO', NULL, NULL),
(375, 37, 'ATIQUIPA', NULL, NULL),
(376, 37, 'BELLA UNION', NULL, NULL),
(377, 37, 'CAHUACHO', NULL, NULL),
(378, 37, 'CHALA', NULL, NULL),
(379, 37, 'CHAPARRA', NULL, NULL),
(380, 37, 'HUANUHUANU', NULL, NULL),
(381, 37, 'JAQUI', NULL, NULL),
(382, 37, 'LOMAS', NULL, NULL),
(383, 37, 'QUICACHA', NULL, NULL),
(384, 37, 'YAUCA', NULL, NULL),
(385, 38, 'APLAO', NULL, NULL),
(386, 38, 'ANDAGUA', NULL, NULL),
(387, 38, 'AYO', NULL, NULL),
(388, 38, 'CHACHAS', NULL, NULL),
(389, 38, 'CHILCAYMARCA', NULL, NULL),
(390, 38, 'CHOCO', NULL, NULL),
(391, 38, 'HUANCARQUI', NULL, NULL),
(392, 38, 'MACHAGUAY', NULL, NULL),
(393, 38, 'ORCOPAMPA', NULL, NULL),
(394, 38, 'PAMPACOLCA', NULL, NULL),
(395, 38, 'TIPAN', NULL, NULL),
(396, 38, 'UÑON', NULL, NULL),
(397, 38, 'URACA', NULL, NULL),
(398, 38, 'VIRACO', NULL, NULL),
(399, 39, 'CHIVAY', NULL, NULL),
(400, 39, 'ACHOMA', NULL, NULL),
(401, 39, 'CABANACONDE', NULL, NULL),
(402, 39, 'CALLALLI', NULL, NULL),
(403, 39, 'CAYLLOMA', NULL, NULL),
(404, 39, 'COPORAQUE', NULL, NULL),
(405, 39, 'HUAMBO', NULL, NULL),
(406, 39, 'HUANCA', NULL, NULL),
(407, 39, 'ICHUPAMPA', NULL, NULL),
(408, 39, 'LARI', NULL, NULL),
(409, 39, 'LLUTA', NULL, NULL),
(410, 39, 'MACA', NULL, NULL),
(411, 39, 'MADRIGAL', NULL, NULL),
(412, 39, 'SAN ANTONIO DE CHUCA', NULL, NULL),
(413, 39, 'SIBAYO', NULL, NULL),
(414, 39, 'TAPAY', NULL, NULL),
(415, 39, 'TISCO', NULL, NULL),
(416, 39, 'TUTI', NULL, NULL),
(417, 39, 'YANQUE', NULL, NULL),
(418, 39, 'MAJES', NULL, NULL),
(419, 40, 'CHUQUIBAMBA', NULL, NULL),
(420, 40, 'ANDARAY', NULL, NULL),
(421, 40, 'CAYARANI', NULL, NULL),
(422, 40, 'CHICHAS', NULL, NULL),
(423, 40, 'IRAY', NULL, NULL),
(424, 40, 'RIO GRANDE', NULL, NULL),
(425, 40, 'SALAMANCA', NULL, NULL),
(426, 40, 'YANAQUIHUA', NULL, NULL),
(427, 41, 'MOLLENDO', NULL, NULL),
(428, 41, 'COCACHACRA', NULL, NULL),
(429, 41, 'DEAN VALDIVIA', NULL, NULL),
(430, 41, 'ISLAY', NULL, NULL),
(431, 41, 'MEJIA', NULL, NULL),
(432, 41, 'PUNTA DE BOMBON', NULL, NULL),
(433, 42, 'COTAHUASI', NULL, NULL),
(434, 42, 'ALCA', NULL, NULL),
(435, 42, 'CHARCANA', NULL, NULL),
(436, 42, 'HUAYNACOTAS', NULL, NULL),
(437, 42, 'PAMPAMARCA', NULL, NULL),
(438, 42, 'PUYCA', NULL, NULL),
(439, 42, 'QUECHUALLA', NULL, NULL),
(440, 42, 'SAYLA', NULL, NULL),
(441, 42, 'TAURIA', NULL, NULL),
(442, 42, 'TOMEPAMPA', NULL, NULL),
(443, 42, 'TORO', NULL, NULL),
(444, 43, 'AYACUCHO', NULL, NULL),
(445, 43, 'ACOCRO', NULL, NULL),
(446, 43, 'ACOS VINCHOS', NULL, NULL),
(447, 43, 'CARMEN ALTO', NULL, NULL),
(448, 43, 'CHIARA', NULL, NULL),
(449, 43, 'OCROS', NULL, NULL),
(450, 43, 'PACAYCASA', NULL, NULL),
(451, 43, 'QUINUA', NULL, NULL),
(452, 43, 'SAN JOSE DE TICLLAS', NULL, NULL),
(453, 43, 'SAN JUAN BAUTISTA', NULL, NULL),
(454, 43, 'SANTIAGO DE PISCHA', NULL, NULL),
(455, 43, 'SOCOS', NULL, NULL),
(456, 43, 'TAMBILLO', NULL, NULL),
(457, 43, 'VINCHOS', NULL, NULL),
(458, 43, 'JESUS NAZARENO', NULL, NULL),
(459, 43, 'ANDRES AVELINO CACERES DORREGARAY', NULL, NULL),
(460, 44, 'CANGALLO', NULL, NULL),
(461, 44, 'CHUSCHI', NULL, NULL),
(462, 44, 'LOS MOROCHUCOS', NULL, NULL),
(463, 44, 'MARIA PARADO DE BELLIDO', NULL, NULL),
(464, 44, 'PARAS', NULL, NULL),
(465, 44, 'TOTOS', NULL, NULL),
(466, 45, 'SANCOS', NULL, NULL),
(467, 45, 'CARAPO', NULL, NULL),
(468, 45, 'SACSAMARCA', NULL, NULL),
(469, 45, 'SANTIAGO DE LUCANAMARCA', NULL, NULL),
(470, 46, 'HUANTA', NULL, NULL),
(471, 46, 'AYAHUANCO', NULL, NULL),
(472, 46, 'HUAMANGUILLA', NULL, NULL),
(473, 46, 'IGUAIN', NULL, NULL),
(474, 46, 'LURICOCHA', NULL, NULL),
(475, 46, 'SANTILLANA', NULL, NULL),
(476, 46, 'SIVIA', NULL, NULL),
(477, 46, 'LLOCHEGUA', NULL, NULL),
(478, 46, 'CANAYRE', NULL, NULL),
(479, 46, 'UCHURACCAY', NULL, NULL),
(480, 46, 'PUCACOLPA', NULL, NULL),
(481, 46, 'CHACA', NULL, NULL),
(482, 47, 'SAN MIGUEL', NULL, NULL),
(483, 47, 'ANCO', NULL, NULL),
(484, 47, 'AYNA', NULL, NULL),
(485, 47, 'CHILCAS', NULL, NULL),
(486, 47, 'CHUNGUI', NULL, NULL),
(487, 47, 'LUIS CARRANZA', NULL, NULL),
(488, 47, 'SANTA ROSA', NULL, NULL),
(489, 47, 'TAMBO', NULL, NULL),
(490, 47, 'SAMUGARI', NULL, NULL),
(491, 47, 'ANCHIHUAY', NULL, NULL),
(492, 47, 'ORONCCOY', NULL, NULL),
(493, 48, 'PUQUIO', NULL, NULL),
(494, 48, 'AUCARA', NULL, NULL),
(495, 48, 'CABANA', NULL, NULL),
(496, 48, 'CARMEN SALCEDO', NULL, NULL),
(497, 48, 'CHAVIÑA', NULL, NULL),
(498, 48, 'CHIPAO', NULL, NULL),
(499, 48, 'HUAC-HUAS', NULL, NULL),
(500, 48, 'LARAMATE', NULL, NULL),
(501, 48, 'LEONCIO PRADO', NULL, NULL),
(502, 48, 'LLAUTA', NULL, NULL),
(503, 48, 'LUCANAS', NULL, NULL),
(504, 48, 'OCAÑA', NULL, NULL),
(505, 48, 'OTOCA', NULL, NULL),
(506, 48, 'SAISA', NULL, NULL),
(507, 48, 'SAN CRISTOBAL', NULL, NULL),
(508, 48, 'SAN JUAN', NULL, NULL),
(509, 48, 'SAN PEDRO', NULL, NULL),
(510, 48, 'SAN PEDRO DE PALCO', NULL, NULL),
(511, 48, 'SANCOS', NULL, NULL),
(512, 48, 'SANTA ANA DE HUAYCAHUACHO', NULL, NULL),
(513, 48, 'SANTA LUCIA', NULL, NULL),
(514, 49, 'CORACORA', NULL, NULL),
(515, 49, 'CHUMPI', NULL, NULL),
(516, 49, 'CORONEL CASTAÑEDA', NULL, NULL),
(517, 49, 'PACAPAUSA', NULL, NULL),
(518, 49, 'PULLO', NULL, NULL),
(519, 49, 'PUYUSCA', NULL, NULL),
(520, 49, 'SAN FRANCISCO DE RAVACAYCO', NULL, NULL),
(521, 49, 'UPAHUACHO', NULL, NULL),
(522, 50, 'PAUSA', NULL, NULL),
(523, 50, 'COLTA', NULL, NULL),
(524, 50, 'CORCULLA', NULL, NULL),
(525, 50, 'LAMPA', NULL, NULL),
(526, 50, 'MARCABAMBA', NULL, NULL),
(527, 50, 'OYOLO', NULL, NULL),
(528, 50, 'PARARCA', NULL, NULL),
(529, 50, 'SAN JAVIER DE ALPABAMBA', NULL, NULL),
(530, 50, 'SAN JOSE DE USHUA', NULL, NULL),
(531, 50, 'SARA SARA', NULL, NULL),
(532, 51, 'QUEROBAMBA', NULL, NULL),
(533, 51, 'BELEN', NULL, NULL),
(534, 51, 'CHALCOS', NULL, NULL),
(535, 51, 'CHILCAYOC', NULL, NULL),
(536, 51, 'HUACAÑA', NULL, NULL),
(537, 51, 'MORCOLLA', NULL, NULL),
(538, 51, 'PAICO', NULL, NULL),
(539, 51, 'SAN PEDRO DE LARCAY', NULL, NULL),
(540, 51, 'SAN SALVADOR DE QUIJE', NULL, NULL),
(541, 51, 'SANTIAGO DE PAUCARAY', NULL, NULL),
(542, 51, 'SORAS', NULL, NULL),
(543, 52, 'HUANCAPI', NULL, NULL),
(544, 52, 'ALCAMENCA', NULL, NULL),
(545, 52, 'APONGO', NULL, NULL),
(546, 52, 'ASQUIPATA', NULL, NULL),
(547, 52, 'CANARIA', NULL, NULL),
(548, 52, 'CAYARA', NULL, NULL),
(549, 52, 'COLCA', NULL, NULL),
(550, 52, 'HUAMANQUIQUIA', NULL, NULL),
(551, 52, 'HUANCARAYLLA', NULL, NULL),
(552, 52, 'HUAYA', NULL, NULL),
(553, 52, 'SARHUA', NULL, NULL),
(554, 52, 'VILCANCHOS', NULL, NULL),
(555, 53, 'VILCAS HUAMAN', NULL, NULL),
(556, 53, 'ACCOMARCA', NULL, NULL),
(557, 53, 'CARHUANCA', NULL, NULL),
(558, 53, 'CONCEPCION', NULL, NULL),
(559, 53, 'HUAMBALPA', NULL, NULL),
(560, 53, 'INDEPENDENCIA', NULL, NULL),
(561, 53, 'SAURAMA', NULL, NULL),
(562, 53, 'VISCHONGO', NULL, NULL),
(563, 54, 'CAJAMARCA', NULL, NULL),
(564, 54, 'ASUNCION', NULL, NULL),
(565, 54, 'CHETILLA', NULL, NULL),
(566, 54, 'COSPAN', NULL, NULL),
(567, 54, 'ENCAÑADA', NULL, NULL),
(568, 54, 'JESUS', NULL, NULL),
(569, 54, 'LLACANORA', NULL, NULL),
(570, 54, 'LOS BAÑOS DEL INCA', NULL, NULL),
(571, 54, 'MAGDALENA', NULL, NULL),
(572, 54, 'MATARA', NULL, NULL),
(573, 54, 'NAMORA', NULL, NULL),
(574, 54, 'SAN JUAN', NULL, NULL),
(575, 55, 'CAJABAMBA', NULL, NULL),
(576, 55, 'CACHACHI', NULL, NULL),
(577, 55, 'CONDEBAMBA', NULL, NULL),
(578, 55, 'SITACOCHA', NULL, NULL),
(579, 56, 'CELENDIN', NULL, NULL),
(580, 56, 'CHUMUCH', NULL, NULL),
(581, 56, 'CORTEGANA', NULL, NULL),
(582, 56, 'HUASMIN', NULL, NULL),
(583, 56, 'JORGE CHAVEZ', NULL, NULL),
(584, 56, 'JOSE GALVEZ', NULL, NULL),
(585, 56, 'MIGUEL IGLESIAS', NULL, NULL),
(586, 56, 'OXAMARCA', NULL, NULL),
(587, 56, 'SOROCHUCO', NULL, NULL),
(588, 56, 'SUCRE', NULL, NULL),
(589, 56, 'UTCO', NULL, NULL),
(590, 56, 'LA LIBERTAD DE PALLAN', NULL, NULL),
(591, 57, 'CHOTA', NULL, NULL),
(592, 57, 'ANGUIA', NULL, NULL),
(593, 57, 'CHADIN', NULL, NULL),
(594, 57, 'CHIGUIRIP', NULL, NULL),
(595, 57, 'CHIMBAN', NULL, NULL),
(596, 57, 'CHOROPAMPA', NULL, NULL),
(597, 57, 'COCHABAMBA', NULL, NULL),
(598, 57, 'CONCHAN', NULL, NULL),
(599, 57, 'HUAMBOS', NULL, NULL),
(600, 57, 'LAJAS', NULL, NULL),
(601, 57, 'LLAMA', NULL, NULL),
(602, 57, 'MIRACOSTA', NULL, NULL),
(603, 57, 'PACCHA', NULL, NULL),
(604, 57, 'PION', NULL, NULL),
(605, 57, 'QUEROCOTO', NULL, NULL),
(606, 57, 'SAN JUAN DE LICUPIS', NULL, NULL),
(607, 57, 'TACABAMBA', NULL, NULL),
(608, 57, 'TOCMOCHE', NULL, NULL),
(609, 57, 'CHALAMARCA', NULL, NULL),
(610, 58, 'CONTUMAZA', NULL, NULL),
(611, 58, 'CHILETE', NULL, NULL),
(612, 58, 'CUPISNIQUE', NULL, NULL),
(613, 58, 'GUZMANGO', NULL, NULL),
(614, 58, 'SAN BENITO', NULL, NULL),
(615, 58, 'SANTA CRUZ DE TOLED', NULL, NULL),
(616, 58, 'TANTARICA', NULL, NULL),
(617, 58, 'YONAN', NULL, NULL),
(618, 59, 'CUTERVO', NULL, NULL),
(619, 59, 'CALLAYUC', NULL, NULL),
(620, 59, 'CHOROS', NULL, NULL),
(621, 59, 'CUJILLO', NULL, NULL),
(622, 59, 'LA RAMADA', NULL, NULL),
(623, 59, 'PIMPINGOS', NULL, NULL),
(624, 59, 'QUEROCOTILLO', NULL, NULL),
(625, 59, 'SAN ANDRES DE CUTERVO', NULL, NULL),
(626, 59, 'SAN JUAN DE CUTERVO', NULL, NULL),
(627, 59, 'SAN LUIS DE LUCMA', NULL, NULL),
(628, 59, 'SANTA CRUZ', NULL, NULL),
(629, 59, 'SANTO DOMINGO DE LA CAPILLA', NULL, NULL),
(630, 59, 'SANTO TOMAS', NULL, NULL),
(631, 59, 'SOCOTA', NULL, NULL),
(632, 59, 'TORIBIO CASANOVA', NULL, NULL),
(633, 60, 'BAMBAMARCA', NULL, NULL),
(634, 60, 'CHUGUR', NULL, NULL),
(635, 60, 'HUALGAYOC', NULL, NULL),
(636, 61, 'JAEN', NULL, NULL),
(637, 61, 'BELLAVISTA', NULL, NULL),
(638, 61, 'CHONTALI', NULL, NULL),
(639, 61, 'COLASAY', NULL, NULL),
(640, 61, 'HUABAL', NULL, NULL),
(641, 61, 'LAS PIRIAS', NULL, NULL),
(642, 61, 'POMAHUACA', NULL, NULL),
(643, 61, 'PUCARA', NULL, NULL),
(644, 61, 'SALLIQUE', NULL, NULL),
(645, 61, 'SAN FELIPE', NULL, NULL),
(646, 61, 'SAN JOSE DEL ALTO', NULL, NULL),
(647, 61, 'SANTA ROSA', NULL, NULL),
(648, 62, 'SAN IGNACIO', NULL, NULL),
(649, 62, 'CHIRINOS', NULL, NULL),
(650, 62, 'HUARANGO', NULL, NULL),
(651, 62, 'LA COIPA', NULL, NULL),
(652, 62, 'NAMBALLE', NULL, NULL),
(653, 62, 'SAN JOSE DE LOURDES', NULL, NULL),
(654, 62, 'TABACONAS', NULL, NULL),
(655, 63, 'PEDRO GALVEZ', NULL, NULL),
(656, 63, 'CHANCAY', NULL, NULL),
(657, 63, 'EDUARDO VILLANUEVA', NULL, NULL),
(658, 63, 'GREGORIO PITA', NULL, NULL),
(659, 63, 'ICHOCAN', NULL, NULL),
(660, 63, 'JOSE MANUEL QUIROZ', NULL, NULL),
(661, 63, 'JOSE SABOGAL', NULL, NULL),
(662, 64, 'SAN MIGUEL', NULL, NULL),
(663, 64, 'BOLIVAR', NULL, NULL),
(664, 64, 'CALQUIS', NULL, NULL),
(665, 64, 'CATILLUC', NULL, NULL),
(666, 64, 'EL PRADO', NULL, NULL),
(667, 64, 'LA FLORIDA', NULL, NULL),
(668, 64, 'LLAPA', NULL, NULL),
(669, 64, 'NANCHOC', NULL, NULL),
(670, 64, 'NIEPOS', NULL, NULL),
(671, 64, 'SAN GREGORIO', NULL, NULL),
(672, 64, 'SAN SILVESTRE DE COCHAN', NULL, NULL),
(673, 64, 'TONGOD', NULL, NULL),
(674, 64, 'UNION AGUA BLANCA', NULL, NULL),
(675, 65, 'SAN PABLO', NULL, NULL),
(676, 65, 'SAN BERNARDINO', NULL, NULL),
(677, 65, 'SAN LUIS', NULL, NULL),
(678, 65, 'TUMBADEN', NULL, NULL),
(679, 66, 'SANTA CRUZ', NULL, NULL),
(680, 66, 'ANDABAMBA', NULL, NULL),
(681, 66, 'CATACHE', NULL, NULL),
(682, 66, 'CHANCAYBAÑOS', NULL, NULL),
(683, 66, 'LA ESPERANZA', NULL, NULL),
(684, 66, 'NINABAMBA', NULL, NULL),
(685, 66, 'PULAN', NULL, NULL),
(686, 66, 'SAUCEPAMPA', NULL, NULL),
(687, 66, 'SEXI', NULL, NULL),
(688, 66, 'UTICYACU', NULL, NULL),
(689, 66, 'YAUYUCAN', NULL, NULL),
(690, 67, 'CALLAO', NULL, NULL),
(691, 67, 'BELLAVISTA', NULL, NULL),
(692, 67, 'CARMEN DE LA LEGUA REYNOSO', NULL, NULL),
(693, 67, 'LA PERLA', NULL, NULL),
(694, 67, 'LA PUNTA', NULL, NULL),
(695, 67, 'VENTANILLA', NULL, NULL),
(696, 67, 'MI PERU', NULL, NULL),
(697, 68, 'CUSCO', NULL, NULL),
(698, 68, 'CCORCA', NULL, NULL),
(699, 68, 'POROY', NULL, NULL),
(700, 68, 'SAN JERONIMO', NULL, NULL),
(701, 68, 'SAN SEBASTIAN', NULL, NULL),
(702, 68, 'SANTIAGO', NULL, NULL),
(703, 68, 'SAYLLA', NULL, NULL),
(704, 68, 'WANCHAQ', NULL, NULL),
(705, 69, 'ACOMAYO', NULL, NULL),
(706, 69, 'ACOPIA', NULL, NULL),
(707, 69, 'ACOS', NULL, NULL),
(708, 69, 'MOSOC LLACTA', NULL, NULL),
(709, 69, 'POMACANCHI', NULL, NULL),
(710, 69, 'RONDOCAN', NULL, NULL),
(711, 69, 'SANGARARA', NULL, NULL),
(712, 70, 'ANTA', NULL, NULL),
(713, 70, 'ANCAHUASI', NULL, NULL),
(714, 70, 'CACHIMAYO', NULL, NULL),
(715, 70, 'CHINCHAYPUJIO', NULL, NULL),
(716, 70, 'HUAROCONDO', NULL, NULL),
(717, 70, 'LIMATAMBO', NULL, NULL),
(718, 70, 'MOLLEPATA', NULL, NULL),
(719, 70, 'PUCYURA', NULL, NULL),
(720, 70, 'ZURITE', NULL, NULL),
(721, 71, 'CALCA', NULL, NULL),
(722, 71, 'COYA', NULL, NULL),
(723, 71, 'LAMAY', NULL, NULL),
(724, 71, 'LARES', NULL, NULL),
(725, 71, 'PISAC', NULL, NULL),
(726, 71, 'SAN SALVADOR', NULL, NULL),
(727, 71, 'TARAY', NULL, NULL),
(728, 71, 'YANATILE', NULL, NULL),
(729, 72, 'YANAOCA', NULL, NULL),
(730, 72, 'CHECCA', NULL, NULL),
(731, 72, 'KUNTURKANKI', NULL, NULL),
(732, 72, 'LANGUI', NULL, NULL),
(733, 72, 'LAYO', NULL, NULL),
(734, 72, 'PAMPAMARCA', NULL, NULL),
(735, 72, 'QUEHUE', NULL, NULL),
(736, 72, 'TUPAC AMARU', NULL, NULL),
(737, 73, 'SICUANI', NULL, NULL),
(738, 73, 'CHECACUPE', NULL, NULL),
(739, 73, 'COMBAPATA', NULL, NULL),
(740, 73, 'MARANGANI', NULL, NULL),
(741, 73, 'PITUMARCA', NULL, NULL),
(742, 73, 'SAN PABLO', NULL, NULL),
(743, 73, 'SAN PEDRO', NULL, NULL),
(744, 73, 'TINTA', NULL, NULL),
(745, 74, 'SANTO TOMAS', NULL, NULL),
(746, 74, 'CAPACMARCA', NULL, NULL),
(747, 74, 'CHAMACA', NULL, NULL),
(748, 74, 'COLQUEMARCA', NULL, NULL),
(749, 74, 'LIVITACA', NULL, NULL),
(750, 74, 'LLUSCO', NULL, NULL),
(751, 74, 'QUIÑOTA', NULL, NULL),
(752, 74, 'VELILLE', NULL, NULL),
(753, 75, 'ESPINAR', NULL, NULL),
(754, 75, 'CONDOROMA', NULL, NULL),
(755, 75, 'COPORAQUE', NULL, NULL),
(756, 75, 'OCORURO', NULL, NULL),
(757, 75, 'PALLPATA', NULL, NULL),
(758, 75, 'PICHIGUA', NULL, NULL),
(759, 75, 'SUYCKUTAMBO', NULL, NULL),
(760, 75, 'ALTO PICHIGUA', NULL, NULL),
(761, 76, 'SANTA ANA', NULL, NULL),
(762, 76, 'ECHARATE', NULL, NULL),
(763, 76, 'HUAYOPATA', NULL, NULL),
(764, 76, 'MARANURA', NULL, NULL),
(765, 76, 'OCOBAMBA', NULL, NULL),
(766, 76, 'QUELLOUNO', NULL, NULL),
(767, 76, 'KIMBIRI', NULL, NULL),
(768, 76, 'SANTA TERESA', NULL, NULL),
(769, 76, 'VILCABAMBA', NULL, NULL),
(770, 76, 'PICHARI', NULL, NULL),
(771, 76, 'INKAWASI', NULL, NULL),
(772, 76, 'VILLA VIRGEN', NULL, NULL),
(773, 76, 'VILLA KINTIARINA', NULL, NULL),
(774, 76, 'MEGANTONI', NULL, NULL),
(775, 77, 'PARURO', NULL, NULL),
(776, 77, 'ACCHA', NULL, NULL),
(777, 77, 'CCAPI', NULL, NULL),
(778, 77, 'COLCHA', NULL, NULL),
(779, 77, 'HUANOQUITE', NULL, NULL),
(780, 77, 'OMACHA', NULL, NULL),
(781, 77, 'PACCARITAMBO', NULL, NULL),
(782, 77, 'PILLPINTO', NULL, NULL),
(783, 77, 'YAURISQUE', NULL, NULL),
(784, 78, 'PAUCARTAMBO', NULL, NULL),
(785, 78, 'CAICAY', NULL, NULL),
(786, 78, 'CHALLABAMBA', NULL, NULL),
(787, 78, 'COLQUEPATA', NULL, NULL),
(788, 78, 'HUANCARANI', NULL, NULL),
(789, 78, 'KOSÑIPATA', NULL, NULL),
(790, 79, 'URCOS', NULL, NULL),
(791, 79, 'ANDAHUAYLILLAS', NULL, NULL),
(792, 79, 'CAMANTI', NULL, NULL),
(793, 79, 'CCARHUAYO', NULL, NULL),
(794, 79, 'CCATCA', NULL, NULL),
(795, 79, 'CUSIPATA', NULL, NULL),
(796, 79, 'HUARO', NULL, NULL),
(797, 79, 'LUCRE', NULL, NULL),
(798, 79, 'MARCAPATA', NULL, NULL),
(799, 79, 'OCONGATE', NULL, NULL),
(800, 79, 'OROPESA', NULL, NULL),
(801, 79, 'QUIQUIJANA', NULL, NULL),
(802, 80, 'URUBAMBA', NULL, NULL),
(803, 80, 'CHINCHERO', NULL, NULL),
(804, 80, 'HUAYLLABAMBA', NULL, NULL),
(805, 80, 'MACHUPICCHU', NULL, NULL),
(806, 80, 'MARAS', NULL, NULL),
(807, 80, 'OLLANTAYTAMBO', NULL, NULL),
(808, 80, 'YUCAY', NULL, NULL),
(809, 81, 'HUANCAVELICA', NULL, NULL),
(810, 81, 'ACOBAMBILLA', NULL, NULL),
(811, 81, 'ACORIA', NULL, NULL),
(812, 81, 'CONAYCA', NULL, NULL),
(813, 81, 'CUENCA', NULL, NULL),
(814, 81, 'HUACHOCOLPA', NULL, NULL),
(815, 81, 'HUAYLLAHUARA', NULL, NULL),
(816, 81, 'IZCUCHACA', NULL, NULL),
(817, 81, 'LARIA', NULL, NULL),
(818, 81, 'MANTA', NULL, NULL),
(819, 81, 'MARISCAL CACERES', NULL, NULL),
(820, 81, 'MOYA', NULL, NULL),
(821, 81, 'NUEVO OCCORO', NULL, NULL),
(822, 81, 'PALCA', NULL, NULL),
(823, 81, 'PILCHACA', NULL, NULL),
(824, 81, 'VILCA', NULL, NULL),
(825, 81, 'YAULI', NULL, NULL),
(826, 81, 'ASCENSION', NULL, NULL),
(827, 81, 'HUANDO', NULL, NULL),
(828, 82, 'ACOBAMBA', NULL, NULL),
(829, 82, 'ANDABAMBA', NULL, NULL),
(830, 82, 'ANTA', NULL, NULL),
(831, 82, 'CAJA', NULL, NULL),
(832, 82, 'MARCAS', NULL, NULL),
(833, 82, 'PAUCARA', NULL, NULL),
(834, 82, 'POMACOCHA', NULL, NULL),
(835, 82, 'ROSARIO', NULL, NULL),
(836, 83, 'LIRCAY', NULL, NULL),
(837, 83, 'ANCHONGA', NULL, NULL),
(838, 83, 'CALLANMARCA', NULL, NULL),
(839, 83, 'CCOCHACCASA', NULL, NULL),
(840, 83, 'CHINCHO', NULL, NULL),
(841, 83, 'CONGALLA', NULL, NULL),
(842, 83, 'HUANCA-HUANCA', NULL, NULL),
(843, 83, 'HUAYLLAY GRANDE', NULL, NULL),
(844, 83, 'JULCAMARCA', NULL, NULL),
(845, 83, 'SAN ANTONIO DE ANTAPARCO', NULL, NULL),
(846, 83, 'SANTO TOMAS DE PATA', NULL, NULL),
(847, 83, 'SECCLLA', NULL, NULL),
(848, 84, 'CASTROVIRREYNA', NULL, NULL),
(849, 84, 'ARMA', NULL, NULL),
(850, 84, 'AURAHUA', NULL, NULL),
(851, 84, 'CAPILLAS', NULL, NULL),
(852, 84, 'CHUPAMARCA', NULL, NULL),
(853, 84, 'COCAS', NULL, NULL),
(854, 84, 'HUACHOS', NULL, NULL),
(855, 84, 'HUAMATAMBO', NULL, NULL),
(856, 84, 'MOLLEPAMPA', NULL, NULL),
(857, 84, 'SAN JUAN', NULL, NULL),
(858, 84, 'SANTA ANA', NULL, NULL),
(859, 84, 'TANTARA', NULL, NULL),
(860, 84, 'TICRAPO', NULL, NULL),
(861, 85, 'CHURCAMPA', NULL, NULL),
(862, 85, 'ANCO', NULL, NULL),
(863, 85, 'CHINCHIHUASI', NULL, NULL),
(864, 85, 'EL CARMEN', NULL, NULL),
(865, 85, 'LA MERCED', NULL, NULL),
(866, 85, 'LOCROJA', NULL, NULL),
(867, 85, 'PAUCARBAMBA', NULL, NULL),
(868, 85, 'SAN MIGUEL DE MAYOCC', NULL, NULL),
(869, 85, 'SAN PEDRO DE CORIS', NULL, NULL),
(870, 85, 'PACHAMARCA', NULL, NULL),
(871, 85, 'COSME', NULL, NULL),
(872, 86, 'HUAYTARA', NULL, NULL),
(873, 86, 'AYAVI', NULL, NULL),
(874, 86, 'CORDOVA', NULL, NULL),
(875, 86, 'HUAYACUNDO ARMA', NULL, NULL),
(876, 86, 'LARAMARCA', NULL, NULL),
(877, 86, 'OCOYO', NULL, NULL),
(878, 86, 'PILPICHACA', NULL, NULL),
(879, 86, 'QUERCO', NULL, NULL),
(880, 86, 'QUITO-ARMA', NULL, NULL),
(881, 86, 'SAN ANTONIO DE CUSICANCHA', NULL, NULL),
(882, 86, 'SAN FRANCISCO DE SANGAYAICO', NULL, NULL),
(883, 86, 'SAN ISIDRO', NULL, NULL),
(884, 86, 'SANTIAGO DE CHOCORVOS', NULL, NULL),
(885, 86, 'SANTIAGO DE QUIRAHUARA', NULL, NULL),
(886, 86, 'SANTO DOMINGO DE CAPILLAS', NULL, NULL),
(887, 86, 'TAMBO', NULL, NULL),
(888, 87, 'PAMPAS', NULL, NULL),
(889, 87, 'ACOSTAMBO', NULL, NULL),
(890, 87, 'ACRAQUIA', NULL, NULL),
(891, 87, 'AHUAYCHA', NULL, NULL),
(892, 87, 'COLCABAMBA', NULL, NULL),
(893, 87, 'DANIEL HERNANDEZ', NULL, NULL),
(894, 87, 'HUACHOCOLPA', NULL, NULL),
(895, 87, 'HUARIBAMBA', NULL, NULL),
(896, 87, 'ÑAHUIMPUQUIO', NULL, NULL),
(897, 87, 'PAZOS', NULL, NULL),
(898, 87, 'QUISHUAR', NULL, NULL),
(899, 87, 'SALCABAMBA', NULL, NULL),
(900, 87, 'SALCAHUASI', NULL, NULL),
(901, 87, 'SAN MARCOS DE ROCCHAC', NULL, NULL),
(902, 87, 'SURCUBAMBA', NULL, NULL),
(903, 87, 'TINTAY PUNCU', NULL, NULL),
(904, 87, 'QUICHUAS', NULL, NULL),
(905, 87, 'ANDAYMARCA', NULL, NULL),
(906, 87, 'ROBLE', NULL, NULL),
(907, 87, 'PICHOS', NULL, NULL),
(908, 87, 'SANTIAGO DE TUCUMA', NULL, NULL),
(909, 88, 'HUANUCO', NULL, NULL),
(910, 88, 'AMARILIS', NULL, NULL),
(911, 88, 'CHINCHAO', NULL, NULL),
(912, 88, 'CHURUBAMBA', NULL, NULL),
(913, 88, 'MARGOS', NULL, NULL),
(914, 88, 'QUISQUI (KICHKI)', NULL, NULL),
(915, 88, 'SAN FRANCISCO DE CAYRAN', NULL, NULL),
(916, 88, 'SAN PEDRO DE CHAULAN', NULL, NULL),
(917, 88, 'SANTA MARIA DEL VALLE', NULL, NULL),
(918, 88, 'YARUMAYO', NULL, NULL),
(919, 88, 'PILLCO MARCA', NULL, NULL),
(920, 88, 'YACUS', NULL, NULL),
(921, 88, 'SAN PABLO DE PILLAO', NULL, NULL),
(922, 89, 'AMBO', NULL, NULL),
(923, 89, 'CAYNA', NULL, NULL),
(924, 89, 'COLPAS', NULL, NULL),
(925, 89, 'CONCHAMARCA', NULL, NULL),
(926, 89, 'HUACAR', NULL, NULL),
(927, 89, 'SAN FRANCISCO', NULL, NULL),
(928, 89, 'SAN RAFAEL', NULL, NULL),
(929, 89, 'TOMAY KICHWA', NULL, NULL),
(930, 90, 'LA UNION', NULL, NULL),
(931, 90, 'CHUQUIS', NULL, NULL),
(932, 90, 'MARIAS', NULL, NULL),
(933, 90, 'PACHAS', NULL, NULL),
(934, 90, 'QUIVILLA', NULL, NULL),
(935, 90, 'RIPAN', NULL, NULL),
(936, 90, 'SHUNQUI', NULL, NULL),
(937, 90, 'SILLAPATA', NULL, NULL),
(938, 90, 'YANAS', NULL, NULL),
(939, 91, 'HUACAYBAMBA', NULL, NULL),
(940, 91, 'CANCHABAMBA', NULL, NULL),
(941, 91, 'COCHABAMBA', NULL, NULL),
(942, 91, 'PINRA', NULL, NULL),
(943, 92, 'LLATA', NULL, NULL),
(944, 92, 'ARANCAY', NULL, NULL),
(945, 92, 'CHAVIN DE PARIARCA', NULL, NULL),
(946, 92, 'JACAS GRANDE', NULL, NULL),
(947, 92, 'JIRCAN', NULL, NULL),
(948, 92, 'MIRAFLORES', NULL, NULL),
(949, 92, 'MONZON', NULL, NULL),
(950, 92, 'PUNCHAO', NULL, NULL),
(951, 92, 'PUÑOS', NULL, NULL),
(952, 92, 'SINGA', NULL, NULL),
(953, 92, 'TANTAMAYO', NULL, NULL),
(954, 93, 'RUPA-RUPA', NULL, NULL),
(955, 93, 'DANIEL ALOMIA ROBLES', NULL, NULL),
(956, 93, 'HERMILIO VALDIZAN', NULL, NULL),
(957, 93, 'JOSE CRESPO Y CASTILLO', NULL, NULL),
(958, 93, 'LUYANDO', NULL, NULL),
(959, 93, 'MARIANO DAMASO BERAUN', NULL, NULL),
(960, 93, 'PUCAYACU', NULL, NULL),
(961, 93, 'CASTILLO GRANDE', NULL, NULL),
(962, 93, 'PUEBLO NUEVO', NULL, NULL),
(963, 93, 'SANTO DOMINGO DE ANDA', NULL, NULL),
(964, 94, 'HUACRACHUCO', NULL, NULL),
(965, 94, 'CHOLON', NULL, NULL),
(966, 94, 'SAN BUENAVENTURA', NULL, NULL),
(967, 94, 'LA MORADA', NULL, NULL),
(968, 94, 'SANTA ROSA DE ALTO YANAJANCA', NULL, NULL),
(969, 95, 'PANAO', NULL, NULL),
(970, 95, 'CHAGLLA', NULL, NULL),
(971, 95, 'MOLINO', NULL, NULL),
(972, 95, 'UMARI', NULL, NULL),
(973, 96, 'PUERTO INCA', NULL, NULL),
(974, 96, 'CODO DEL POZUZO', NULL, NULL),
(975, 96, 'HONORIA', NULL, NULL),
(976, 96, 'TOURNAVISTA', NULL, NULL),
(977, 96, 'YUYAPICHIS', NULL, NULL),
(978, 97, 'JESUS', NULL, NULL),
(979, 97, 'BAÑOS', NULL, NULL),
(980, 97, 'JIVIA', NULL, NULL),
(981, 97, 'QUEROPALCA', NULL, NULL),
(982, 97, 'RONDOS', NULL, NULL),
(983, 97, 'SAN FRANCISCO DE ASIS', NULL, NULL),
(984, 97, 'SAN MIGUEL DE CAURI', NULL, NULL),
(985, 98, 'CHAVINILLO', NULL, NULL),
(986, 98, 'CAHUAC', NULL, NULL),
(987, 98, 'CHACABAMBA', NULL, NULL),
(988, 98, 'APARICIO POMARES', NULL, NULL),
(989, 98, 'JACAS CHICO', NULL, NULL),
(990, 98, 'OBAS', NULL, NULL),
(991, 98, 'PAMPAMARCA', NULL, NULL),
(992, 98, 'CHORAS', NULL, NULL),
(993, 99, 'ICA', NULL, NULL),
(994, 99, 'LA TINGUIÑA', NULL, NULL),
(995, 99, 'LOS AQUIJES', NULL, NULL),
(996, 99, 'OCUCAJE', NULL, NULL),
(997, 99, 'PACHACUTEC', NULL, NULL),
(998, 99, 'PARCONA', NULL, NULL),
(999, 99, 'PUEBLO NUEVO', NULL, NULL),
(1000, 99, 'SALAS', NULL, NULL),
(1001, 99, 'SAN JOSE DE LOS MOLINOS', NULL, NULL),
(1002, 99, 'SAN JUAN BAUTISTA', NULL, NULL),
(1003, 99, 'SANTIAGO', NULL, NULL),
(1004, 99, 'SUBTANJALLA', NULL, NULL),
(1005, 99, 'TATE', NULL, NULL),
(1006, 99, 'YAUCA DEL ROSARIO', NULL, NULL),
(1007, 100, 'CHINCHA ALTA', NULL, NULL),
(1008, 100, 'ALTO LARAN', NULL, NULL),
(1009, 100, 'CHAVIN', NULL, NULL),
(1010, 100, 'CHINCHA BAJA', NULL, NULL),
(1011, 100, 'EL CARMEN', NULL, NULL),
(1012, 100, 'GROCIO PRADO', NULL, NULL),
(1013, 100, 'PUEBLO NUEVO', NULL, NULL),
(1014, 100, 'SAN JUAN DE YANAC', NULL, NULL),
(1015, 100, 'SAN PEDRO DE HUACARPANA', NULL, NULL),
(1016, 100, 'SUNAMPE', NULL, NULL),
(1017, 100, 'TAMBO DE MORA', NULL, NULL),
(1018, 101, 'NASCA', NULL, NULL),
(1019, 101, 'CHANGUILLO', NULL, NULL),
(1020, 101, 'EL INGENIO', NULL, NULL),
(1021, 101, 'MARCONA', NULL, NULL),
(1022, 101, 'VISTA ALEGRE', NULL, NULL),
(1023, 102, 'PALPA', NULL, NULL),
(1024, 102, 'LLIPATA', NULL, NULL),
(1025, 102, 'RIO GRANDE', NULL, NULL),
(1026, 102, 'SANTA CRUZ', NULL, NULL),
(1027, 102, 'TIBILLO', NULL, NULL),
(1028, 103, 'PISCO', NULL, NULL),
(1029, 103, 'HUANCANO', NULL, NULL),
(1030, 103, 'HUMAY', NULL, NULL),
(1031, 103, 'INDEPENDENCIA', NULL, NULL),
(1032, 103, 'PARACAS', NULL, NULL),
(1033, 103, 'SAN ANDRES', NULL, NULL),
(1034, 103, 'SAN CLEMENTE', NULL, NULL),
(1035, 103, 'TUPAC AMARU INCA', NULL, NULL),
(1036, 104, 'HUANCAYO', NULL, NULL),
(1037, 104, 'CARHUACALLANGA', NULL, NULL),
(1038, 104, 'CHACAPAMPA', NULL, NULL),
(1039, 104, 'CHICCHE', NULL, NULL),
(1040, 104, 'CHILCA', NULL, NULL),
(1041, 104, 'CHONGOS ALTO', NULL, NULL),
(1042, 104, 'CHUPURO', NULL, NULL),
(1043, 104, 'COLCA', NULL, NULL),
(1044, 104, 'CULLHUAS', NULL, NULL),
(1045, 104, 'EL TAMBO', NULL, NULL),
(1046, 104, 'HUACRAPUQUIO', NULL, NULL),
(1047, 104, 'HUALHUAS', NULL, NULL),
(1048, 104, 'HUANCAN', NULL, NULL),
(1049, 104, 'HUASICANCHA', NULL, NULL),
(1050, 104, 'HUAYUCACHI', NULL, NULL),
(1051, 104, 'INGENIO', NULL, NULL),
(1052, 104, 'PARIAHUANCA', NULL, NULL),
(1053, 104, 'PILCOMAYO', NULL, NULL),
(1054, 104, 'PUCARA', NULL, NULL),
(1055, 104, 'QUICHUAY', NULL, NULL),
(1056, 104, 'QUILCAS', NULL, NULL),
(1057, 104, 'SAN AGUSTIN', NULL, NULL),
(1058, 104, 'SAN JERONIMO DE TUNAN', NULL, NULL),
(1059, 104, 'SAÑO', NULL, NULL),
(1060, 104, 'SAPALLANGA', NULL, NULL),
(1061, 104, 'SICAYA', NULL, NULL),
(1062, 104, 'SANTO DOMINGO DE ACOBAMBA', NULL, NULL),
(1063, 104, 'VIQUES', NULL, NULL),
(1064, 105, 'CONCEPCION', NULL, NULL),
(1065, 105, 'ACO', NULL, NULL),
(1066, 105, 'ANDAMARCA', NULL, NULL),
(1067, 105, 'CHAMBARA', NULL, NULL),
(1068, 105, 'COCHAS', NULL, NULL),
(1069, 105, 'COMAS', NULL, NULL),
(1070, 105, 'HEROINAS TOLEDO', NULL, NULL),
(1071, 105, 'MANZANARES', NULL, NULL),
(1072, 105, 'MARISCAL CASTILLA', NULL, NULL),
(1073, 105, 'MATAHUASI', NULL, NULL),
(1074, 105, 'MITO', NULL, NULL),
(1075, 105, 'NUEVE DE JULIO', NULL, NULL),
(1076, 105, 'ORCOTUNA', NULL, NULL),
(1077, 105, 'SAN JOSE DE QUERO', NULL, NULL),
(1078, 105, 'SANTA ROSA DE OCOPA', NULL, NULL),
(1079, 106, 'CHANCHAMAYO', NULL, NULL),
(1080, 106, 'PERENE', NULL, NULL),
(1081, 106, 'PICHANAQUI', NULL, NULL),
(1082, 106, 'SAN LUIS DE SHUARO', NULL, NULL),
(1083, 106, 'SAN RAMON', NULL, NULL),
(1084, 106, 'VITOC', NULL, NULL),
(1085, 107, 'JAUJA', NULL, NULL),
(1086, 107, 'ACOLLA', NULL, NULL),
(1087, 107, 'APATA', NULL, NULL),
(1088, 107, 'ATAURA', NULL, NULL),
(1089, 107, 'CANCHAYLLO', NULL, NULL),
(1090, 107, 'CURICACA', NULL, NULL),
(1091, 107, 'EL MANTARO', NULL, NULL),
(1092, 107, 'HUAMALI', NULL, NULL),
(1093, 107, 'HUARIPAMPA', NULL, NULL),
(1094, 107, 'HUERTAS', NULL, NULL),
(1095, 107, 'JANJAILLO', NULL, NULL),
(1096, 107, 'JULCAN', NULL, NULL),
(1097, 107, 'LEONOR ORDOÑEZ', NULL, NULL),
(1098, 107, 'LLOCLLAPAMPA', NULL, NULL),
(1099, 107, 'MARCO', NULL, NULL),
(1100, 107, 'MASMA', NULL, NULL),
(1101, 107, 'MASMA CHICCHE', NULL, NULL),
(1102, 107, 'MOLINOS', NULL, NULL),
(1103, 107, 'MONOBAMBA', NULL, NULL),
(1104, 107, 'MUQUI', NULL, NULL),
(1105, 107, 'MUQUIYAUYO', NULL, NULL),
(1106, 107, 'PACA', NULL, NULL),
(1107, 107, 'PACCHA', NULL, NULL),
(1108, 107, 'PANCAN', NULL, NULL),
(1109, 107, 'PARCO', NULL, NULL),
(1110, 107, 'POMACANCHA', NULL, NULL),
(1111, 107, 'RICRAN', NULL, NULL),
(1112, 107, 'SAN LORENZO', NULL, NULL),
(1113, 107, 'SAN PEDRO DE CHUNAN', NULL, NULL),
(1114, 107, 'SAUSA', NULL, NULL),
(1115, 107, 'SINCOS', NULL, NULL),
(1116, 107, 'TUNAN MARCA', NULL, NULL),
(1117, 107, 'YAULI', NULL, NULL),
(1118, 107, 'YAUYOS', NULL, NULL),
(1119, 108, 'JUNIN', NULL, NULL),
(1120, 108, 'CARHUAMAYO', NULL, NULL),
(1121, 108, 'ONDORES', NULL, NULL),
(1122, 108, 'ULCUMAYO', NULL, NULL),
(1123, 109, 'SATIPO', NULL, NULL),
(1124, 109, 'COVIRIALI', NULL, NULL),
(1125, 109, 'LLAYLLA', NULL, NULL),
(1126, 109, 'MAZAMARI', NULL, NULL),
(1127, 109, 'PAMPA HERMOSA', NULL, NULL),
(1128, 109, 'PANGOA', NULL, NULL),
(1129, 109, 'RIO NEGRO', NULL, NULL),
(1130, 109, 'RIO TAMBO', NULL, NULL),
(1131, 109, 'VIZCATAN DEL ENE', NULL, NULL),
(1132, 110, 'TARMA', NULL, NULL),
(1133, 110, 'ACOBAMBA', NULL, NULL),
(1134, 110, 'HUARICOLCA', NULL, NULL),
(1135, 110, 'HUASAHUASI', NULL, NULL),
(1136, 110, 'LA UNION', NULL, NULL),
(1137, 110, 'PALCA', NULL, NULL),
(1138, 110, 'PALCAMAYO', NULL, NULL),
(1139, 110, 'SAN PEDRO DE CAJAS', NULL, NULL),
(1140, 110, 'TAPO', NULL, NULL),
(1141, 111, 'LA OROYA', NULL, NULL),
(1142, 111, 'CHACAPALPA', NULL, NULL),
(1143, 111, 'HUAY-HUAY', NULL, NULL),
(1144, 111, 'MARCAPOMACOCHA', NULL, NULL),
(1145, 111, 'MOROCOCHA', NULL, NULL),
(1146, 111, 'PACCHA', NULL, NULL),
(1147, 111, 'SANTA BARBARA DE CARHUACAYAN', NULL, NULL),
(1148, 111, 'SANTA ROSA DE SACCO', NULL, NULL),
(1149, 111, 'SUITUCANCHA', NULL, NULL),
(1150, 111, 'YAULI', NULL, NULL),
(1151, 112, 'CHUPACA', NULL, NULL),
(1152, 112, 'AHUAC', NULL, NULL),
(1153, 112, 'CHONGOS BAJO', NULL, NULL),
(1154, 112, 'HUACHAC', NULL, NULL),
(1155, 112, 'HUAMANCACA CHICO', NULL, NULL),
(1156, 112, 'SAN JUAN DE ISCOS', NULL, NULL),
(1157, 112, 'SAN JUAN DE JARPA', NULL, NULL),
(1158, 112, 'TRES DE DICIEMBRE', NULL, NULL),
(1159, 112, 'YANACANCHA', NULL, NULL),
(1160, 113, 'TRUJILLO', NULL, NULL),
(1161, 113, 'EL PORVENIR', NULL, NULL),
(1162, 113, 'FLORENCIA DE MORA', NULL, NULL),
(1163, 113, 'HUANCHACO', NULL, NULL),
(1164, 113, 'LA ESPERANZA', NULL, NULL),
(1165, 113, 'LAREDO', NULL, NULL),
(1166, 113, 'MOCHE', NULL, NULL),
(1167, 113, 'POROTO', NULL, NULL),
(1168, 113, 'SALAVERRY', NULL, NULL),
(1169, 113, 'SIMBAL', NULL, NULL),
(1170, 113, 'VICTOR LARCO HERRERA', NULL, NULL),
(1171, 114, 'ASCOPE', NULL, NULL),
(1172, 114, 'CHICAMA', NULL, NULL),
(1173, 114, 'CHOCOPE', NULL, NULL),
(1174, 114, 'MAGDALENA DE CAO', NULL, NULL),
(1175, 114, 'PAIJAN', NULL, NULL),
(1176, 114, 'RAZURI', NULL, NULL),
(1177, 114, 'SANTIAGO DE CAO', NULL, NULL),
(1178, 114, 'CASA GRANDE', NULL, NULL),
(1179, 115, 'BOLIVAR', NULL, NULL),
(1180, 115, 'BAMBAMARCA', NULL, NULL),
(1181, 115, 'CONDORMARCA', NULL, NULL),
(1182, 115, 'LONGOTEA', NULL, NULL),
(1183, 115, 'UCHUMARCA', NULL, NULL),
(1184, 115, 'UCUNCHA', NULL, NULL),
(1185, 116, 'CHEPEN', NULL, NULL),
(1186, 116, 'PACANGA', NULL, NULL),
(1187, 116, 'PUEBLO NUEVO', NULL, NULL),
(1188, 117, 'JULCAN', NULL, NULL),
(1189, 117, 'CALAMARCA', NULL, NULL),
(1190, 117, 'CARABAMBA', NULL, NULL),
(1191, 117, 'HUASO', NULL, NULL),
(1192, 118, 'OTUZCO', NULL, NULL),
(1193, 118, 'AGALLPAMPA', NULL, NULL),
(1194, 118, 'CHARAT', NULL, NULL),
(1195, 118, 'HUARANCHAL', NULL, NULL),
(1196, 118, 'LA CUESTA', NULL, NULL),
(1197, 118, 'MACHE', NULL, NULL),
(1198, 118, 'PARANDAY', NULL, NULL),
(1199, 118, 'SALPO', NULL, NULL),
(1200, 118, 'SINSICAP', NULL, NULL),
(1201, 118, 'USQUIL', NULL, NULL),
(1202, 119, 'SAN PEDRO DE LLOC', NULL, NULL),
(1203, 119, 'GUADALUPE', NULL, NULL),
(1204, 119, 'JEQUETEPEQUE', NULL, NULL),
(1205, 119, 'PACASMAYO', NULL, NULL),
(1206, 119, 'SAN JOSE', NULL, NULL),
(1207, 120, 'TAYABAMBA', NULL, NULL),
(1208, 120, 'BULDIBUYO', NULL, NULL),
(1209, 120, 'CHILLIA', NULL, NULL),
(1210, 120, 'HUANCASPATA', NULL, NULL),
(1211, 120, 'HUAYLILLAS', NULL, NULL),
(1212, 120, 'HUAYO', NULL, NULL),
(1213, 120, 'ONGON', NULL, NULL),
(1214, 120, 'PARCOY', NULL, NULL),
(1215, 120, 'PATAZ', NULL, NULL),
(1216, 120, 'PIAS', NULL, NULL),
(1217, 120, 'SANTIAGO DE CHALLAS', NULL, NULL),
(1218, 120, 'TAURIJA', NULL, NULL),
(1219, 120, 'URPAY', NULL, NULL),
(1220, 121, 'HUAMACHUCO', NULL, NULL),
(1221, 121, 'CHUGAY', NULL, NULL),
(1222, 121, 'COCHORCO', NULL, NULL),
(1223, 121, 'CURGOS', NULL, NULL),
(1224, 121, 'MARCABAL', NULL, NULL),
(1225, 121, 'SANAGORAN', NULL, NULL),
(1226, 121, 'SARIN', NULL, NULL),
(1227, 121, 'SARTIMBAMBA', NULL, NULL),
(1228, 122, 'SANTIAGO DE CHUCO', NULL, NULL),
(1229, 122, 'ANGASMARCA', NULL, NULL),
(1230, 122, 'CACHICADAN', NULL, NULL),
(1231, 122, 'MOLLEBAMBA', NULL, NULL),
(1232, 122, 'MOLLEPATA', NULL, NULL),
(1233, 122, 'QUIRUVILCA', NULL, NULL),
(1234, 122, 'SANTA CRUZ DE CHUCA', NULL, NULL),
(1235, 122, 'SITABAMBA', NULL, NULL),
(1236, 123, 'CASCAS', NULL, NULL),
(1237, 123, 'LUCMA', NULL, NULL),
(1238, 123, 'MARMOT', NULL, NULL),
(1239, 123, 'SAYAPULLO', NULL, NULL),
(1240, 124, 'VIRU', NULL, NULL),
(1241, 124, 'CHAO', NULL, NULL),
(1242, 124, 'GUADALUPITO', NULL, NULL),
(1243, 125, 'CHICLAYO', NULL, NULL),
(1244, 125, 'CHONGOYAPE', NULL, NULL),
(1245, 125, 'ETEN', NULL, NULL),
(1246, 125, 'ETEN PUERTO', NULL, NULL),
(1247, 125, 'JOSE LEONARDO ORTIZ', NULL, NULL),
(1248, 125, 'LA VICTORIA', NULL, NULL),
(1249, 125, 'LAGUNAS', NULL, NULL),
(1250, 125, 'MONSEFU', NULL, NULL),
(1251, 125, 'NUEVA ARICA', NULL, NULL),
(1252, 125, 'OYOTUN', NULL, NULL),
(1253, 125, 'PICSI', NULL, NULL),
(1254, 125, 'PIMENTEL', NULL, NULL),
(1255, 125, 'REQUE', NULL, NULL),
(1256, 125, 'SANTA ROSA', NULL, NULL),
(1257, 125, 'SAÑA', NULL, NULL),
(1258, 125, 'CAYALTI', NULL, NULL),
(1259, 125, 'PATAPO', NULL, NULL),
(1260, 125, 'POMALCA', NULL, NULL),
(1261, 125, 'PUCALA', NULL, NULL),
(1262, 125, 'TUMAN', NULL, NULL),
(1263, 126, 'FERREÑAFE', NULL, NULL),
(1264, 126, 'CAÑARIS', NULL, NULL),
(1265, 126, 'INCAHUASI', NULL, NULL),
(1266, 126, 'MANUEL ANTONIO MESONES MURO', NULL, NULL),
(1267, 126, 'PITIPO', NULL, NULL),
(1268, 126, 'PUEBLO NUEVO', NULL, NULL),
(1269, 127, 'LAMBAYEQUE', NULL, NULL),
(1270, 127, 'CHOCHOPE', NULL, NULL),
(1271, 127, 'ILLIMO', NULL, NULL),
(1272, 127, 'JAYANCA', NULL, NULL),
(1273, 127, 'MOCHUMI', NULL, NULL),
(1274, 127, 'MORROPE', NULL, NULL),
(1275, 127, 'MOTUPE', NULL, NULL),
(1276, 127, 'OLMOS', NULL, NULL),
(1277, 127, 'PACORA', NULL, NULL),
(1278, 127, 'SALAS', NULL, NULL),
(1279, 127, 'SAN JOSE', NULL, NULL),
(1280, 127, 'TUCUME', NULL, NULL),
(1281, 128, 'LIMA', NULL, NULL),
(1282, 128, 'ANCON', NULL, NULL),
(1283, 128, 'ATE', NULL, NULL),
(1284, 128, 'BARRANCO', NULL, NULL),
(1285, 128, 'BREÑA', NULL, NULL),
(1286, 128, 'CARABAYLLO', NULL, NULL),
(1287, 128, 'CHACLACAYO', NULL, NULL),
(1288, 128, 'CHORRILLOS', NULL, NULL),
(1289, 128, 'CIENEGUILLA', NULL, NULL),
(1290, 128, 'COMAS', NULL, NULL),
(1291, 128, 'EL AGUSTINO', NULL, NULL),
(1292, 128, 'INDEPENDENCIA', NULL, NULL),
(1293, 128, 'JESUS MARIA', NULL, NULL),
(1294, 128, 'LA MOLINA', NULL, NULL),
(1295, 128, 'LA VICTORIA', NULL, NULL),
(1296, 128, 'LINCE', NULL, NULL),
(1297, 128, 'LOS OLIVOS', NULL, NULL),
(1298, 128, 'LURIGANCHO', NULL, NULL),
(1299, 128, 'LURIN', NULL, NULL),
(1300, 128, 'MAGDALENA DEL MAR', NULL, NULL),
(1301, 128, 'PUEBLO LIBRE', NULL, NULL),
(1302, 128, 'MIRAFLORES', NULL, NULL),
(1303, 128, 'PACHACAMAC', NULL, NULL),
(1304, 128, 'PUCUSANA', NULL, NULL),
(1305, 128, 'PUENTE PIEDRA', NULL, NULL),
(1306, 128, 'PUNTA HERMOSA', NULL, NULL),
(1307, 128, 'PUNTA NEGRA', NULL, NULL),
(1308, 128, 'RIMAC', NULL, NULL),
(1309, 128, 'SAN BARTOLO', NULL, NULL),
(1310, 128, 'SAN BORJA', NULL, NULL),
(1311, 128, 'SAN ISIDRO', NULL, NULL),
(1312, 128, 'SAN JUAN DE LURIGANCHO', NULL, NULL),
(1313, 128, 'SAN JUAN DE MIRAFLORES', NULL, NULL),
(1314, 128, 'SAN LUIS', NULL, NULL),
(1315, 128, 'SAN MARTIN DE PORRES', NULL, NULL),
(1316, 128, 'SAN MIGUEL', NULL, NULL),
(1317, 128, 'SANTA ANITA', NULL, NULL),
(1318, 128, 'SANTA MARIA DEL MAR', NULL, NULL),
(1319, 128, 'SANTA ROSA', NULL, NULL),
(1320, 128, 'SANTIAGO DE SURCO', NULL, NULL),
(1321, 128, 'SURQUILLO', NULL, NULL),
(1322, 128, 'VILLA EL SALVADOR', NULL, NULL),
(1323, 128, 'VILLA MARIA DEL TRIUNFO', NULL, NULL),
(1324, 128, 'SANTA MARIA DE HUACHIPA /1', NULL, NULL),
(1325, 129, 'BARRANCA', NULL, NULL),
(1326, 129, 'PARAMONGA', NULL, NULL),
(1327, 129, 'PATIVILCA', NULL, NULL),
(1328, 129, 'SUPE', NULL, NULL),
(1329, 129, 'SUPE PUERTO', NULL, NULL),
(1330, 130, 'CAJATAMBO', NULL, NULL),
(1331, 130, 'COPA', NULL, NULL),
(1332, 130, 'GORGOR', NULL, NULL),
(1333, 130, 'HUANCAPON', NULL, NULL),
(1334, 130, 'MANAS', NULL, NULL),
(1335, 131, 'CANTA', NULL, NULL),
(1336, 131, 'ARAHUAY', NULL, NULL),
(1337, 131, 'HUAMANTANGA', NULL, NULL),
(1338, 131, 'HUAROS', NULL, NULL),
(1339, 131, 'LACHAQUI', NULL, NULL),
(1340, 131, 'SAN BUENAVENTURA', NULL, NULL),
(1341, 131, 'SANTA ROSA DE QUIVES', NULL, NULL),
(1342, 132, 'SAN VICENTE DE CAÑETE', NULL, NULL),
(1343, 132, 'ASIA', NULL, NULL),
(1344, 132, 'CALANGO', NULL, NULL),
(1345, 132, 'CERRO AZUL', NULL, NULL),
(1346, 132, 'CHILCA', NULL, NULL),
(1347, 132, 'COAYLLO', NULL, NULL),
(1348, 132, 'IMPERIAL', NULL, NULL),
(1349, 132, 'LUNAHUANA', NULL, NULL),
(1350, 132, 'MALA', NULL, NULL),
(1351, 132, 'NUEVO IMPERIAL', NULL, NULL),
(1352, 132, 'PACARAN', NULL, NULL),
(1353, 132, 'QUILMANA', NULL, NULL),
(1354, 132, 'SAN ANTONIO', NULL, NULL),
(1355, 132, 'SAN LUIS', NULL, NULL),
(1356, 132, 'SANTA CRUZ DE FLORES', NULL, NULL),
(1357, 132, 'ZUÑIGA', NULL, NULL),
(1358, 133, 'HUARAL', NULL, NULL),
(1359, 133, 'ATAVILLOS ALTO', NULL, NULL),
(1360, 133, 'ATAVILLOS BAJO', NULL, NULL),
(1361, 133, 'AUCALLAMA', NULL, NULL),
(1362, 133, 'CHANCAY', NULL, NULL),
(1363, 133, 'IHUARI', NULL, NULL),
(1364, 133, 'LAMPIAN', NULL, NULL),
(1365, 133, 'PACARAOS', NULL, NULL),
(1366, 133, 'SAN MIGUEL DE ACOS', NULL, NULL),
(1367, 133, 'SANTA CRUZ DE ANDAMARCA', NULL, NULL),
(1368, 133, 'SUMBILCA', NULL, NULL),
(1369, 133, 'VEINTISIETE DE NOVIEMBRE', NULL, NULL),
(1370, 134, 'MATUCANA', NULL, NULL),
(1371, 134, 'ANTIOQUIA', NULL, NULL),
(1372, 134, 'CALLAHUANCA', NULL, NULL),
(1373, 134, 'CARAMPOMA', NULL, NULL),
(1374, 134, 'CHICLA', NULL, NULL),
(1375, 134, 'CUENCA', NULL, NULL),
(1376, 134, 'HUACHUPAMPA', NULL, NULL),
(1377, 134, 'HUANZA', NULL, NULL),
(1378, 134, 'HUAROCHIRI', NULL, NULL),
(1379, 134, 'LAHUAYTAMBO', NULL, NULL),
(1380, 134, 'LANGA', NULL, NULL),
(1381, 134, 'LARAOS', NULL, NULL),
(1382, 134, 'MARIATANA', NULL, NULL),
(1383, 134, 'RICARDO PALMA', NULL, NULL),
(1384, 134, 'SAN ANDRES DE TUPICOCHA', NULL, NULL),
(1385, 134, 'SAN ANTONIO', NULL, NULL),
(1386, 134, 'SAN BARTOLOME', NULL, NULL),
(1387, 134, 'SAN DAMIAN', NULL, NULL),
(1388, 134, 'SAN JUAN DE IRIS', NULL, NULL),
(1389, 134, 'SAN JUAN DE TANTARANCHE', NULL, NULL),
(1390, 134, 'SAN LORENZO DE QUINTI', NULL, NULL),
(1391, 134, 'SAN MATEO', NULL, NULL),
(1392, 134, 'SAN MATEO DE OTAO', NULL, NULL),
(1393, 134, 'SAN PEDRO DE CASTA', NULL, NULL),
(1394, 134, 'SAN PEDRO DE HUANCAYRE', NULL, NULL),
(1395, 134, 'SANGALLAYA', NULL, NULL),
(1396, 134, 'SANTA CRUZ DE COCACHACRA', NULL, NULL),
(1397, 134, 'SANTA EULALIA', NULL, NULL),
(1398, 134, 'SANTIAGO DE ANCHUCAYA', NULL, NULL),
(1399, 134, 'SANTIAGO DE TUNA', NULL, NULL),
(1400, 134, 'SANTO DOMINGO DE LOS OLLEROS', NULL, NULL),
(1401, 134, 'SURCO', NULL, NULL),
(1402, 135, 'HUACHO', NULL, NULL),
(1403, 135, 'AMBAR', NULL, NULL),
(1404, 135, 'CALETA DE CARQUIN', NULL, NULL),
(1405, 135, 'CHECRAS', NULL, NULL),
(1406, 135, 'HUALMAY', NULL, NULL),
(1407, 135, 'HUAURA', NULL, NULL),
(1408, 135, 'LEONCIO PRADO', NULL, NULL),
(1409, 135, 'PACCHO', NULL, NULL),
(1410, 135, 'SANTA LEONOR', NULL, NULL),
(1411, 135, 'SANTA MARIA', NULL, NULL),
(1412, 135, 'SAYAN', NULL, NULL),
(1413, 135, 'VEGUETA', NULL, NULL),
(1414, 136, 'OYON', NULL, NULL),
(1415, 136, 'ANDAJES', NULL, NULL),
(1416, 136, 'CAUJUL', NULL, NULL),
(1417, 136, 'COCHAMARCA', NULL, NULL),
(1418, 136, 'NAVAN', NULL, NULL),
(1419, 136, 'PACHANGARA', NULL, NULL),
(1420, 137, 'YAUYOS', NULL, NULL),
(1421, 137, 'ALIS', NULL, NULL),
(1422, 137, 'ALLAUCA', NULL, NULL),
(1423, 137, 'AYAVIRI', NULL, NULL),
(1424, 137, 'AZANGARO', NULL, NULL),
(1425, 137, 'CACRA', NULL, NULL),
(1426, 137, 'CARANIA', NULL, NULL),
(1427, 137, 'CATAHUASI', NULL, NULL),
(1428, 137, 'CHOCOS', NULL, NULL),
(1429, 137, 'COCHAS', NULL, NULL),
(1430, 137, 'COLONIA', NULL, NULL),
(1431, 137, 'HONGOS', NULL, NULL),
(1432, 137, 'HUAMPARA', NULL, NULL),
(1433, 137, 'HUANCAYA', NULL, NULL),
(1434, 137, 'HUANGASCAR', NULL, NULL),
(1435, 137, 'HUANTAN', NULL, NULL);
INSERT INTO `distritos` (`id`, `idProvincia`, `Distrito`, `created_at`, `updated_at`) VALUES
(1436, 137, 'HUAÑEC', NULL, NULL),
(1437, 137, 'LARAOS', NULL, NULL),
(1438, 137, 'LINCHA', NULL, NULL),
(1439, 137, 'MADEAN', NULL, NULL),
(1440, 137, 'MIRAFLORES', NULL, NULL),
(1441, 137, 'OMAS', NULL, NULL),
(1442, 137, 'PUTINZA', NULL, NULL),
(1443, 137, 'QUINCHES', NULL, NULL),
(1444, 137, 'QUINOCAY', NULL, NULL),
(1445, 137, 'SAN JOAQUIN', NULL, NULL),
(1446, 137, 'SAN PEDRO DE PILAS', NULL, NULL),
(1447, 137, 'TANTA', NULL, NULL),
(1448, 137, 'TAURIPAMPA', NULL, NULL),
(1449, 137, 'TOMAS', NULL, NULL),
(1450, 137, 'TUPE', NULL, NULL),
(1451, 137, 'VIÑAC', NULL, NULL),
(1452, 137, 'VITIS', NULL, NULL),
(1453, 138, 'IQUITOS', NULL, NULL),
(1454, 138, 'ALTO NANAY', NULL, NULL),
(1455, 138, 'FERNANDO LORES', NULL, NULL),
(1456, 138, 'INDIANA', NULL, NULL),
(1457, 138, 'LAS AMAZONAS', NULL, NULL),
(1458, 138, 'MAZAN', NULL, NULL),
(1459, 138, 'NAPO', NULL, NULL),
(1460, 138, 'PUNCHANA', NULL, NULL),
(1461, 138, 'TORRES CAUSANA', NULL, NULL),
(1462, 138, 'BELEN', NULL, NULL),
(1463, 138, 'SAN JUAN BAUTISTA', NULL, NULL),
(1464, 139, 'YURIMAGUAS', NULL, NULL),
(1465, 139, 'BALSAPUERTO', NULL, NULL),
(1466, 139, 'JEBEROS', NULL, NULL),
(1467, 139, 'LAGUNAS', NULL, NULL),
(1468, 139, 'SANTA CRUZ', NULL, NULL),
(1469, 139, 'TENIENTE CESAR LOPEZ ROJAS', NULL, NULL),
(1470, 140, 'NAUTA', NULL, NULL),
(1471, 140, 'PARINARI', NULL, NULL),
(1472, 140, 'TIGRE', NULL, NULL),
(1473, 140, 'TROMPETEROS', NULL, NULL),
(1474, 140, 'URARINAS', NULL, NULL),
(1475, 141, 'RAMON CASTILLA', NULL, NULL),
(1476, 141, 'PEBAS', NULL, NULL),
(1477, 141, 'YAVARI', NULL, NULL),
(1478, 141, 'SAN PABLO', NULL, NULL),
(1479, 142, 'REQUENA', NULL, NULL),
(1480, 142, 'ALTO TAPICHE', NULL, NULL),
(1481, 142, 'CAPELO', NULL, NULL),
(1482, 142, 'EMILIO SAN MARTIN', NULL, NULL),
(1483, 142, 'MAQUIA', NULL, NULL),
(1484, 142, 'PUINAHUA', NULL, NULL),
(1485, 142, 'SAQUENA', NULL, NULL),
(1486, 142, 'SOPLIN', NULL, NULL),
(1487, 142, 'TAPICHE', NULL, NULL),
(1488, 142, 'JENARO HERRERA', NULL, NULL),
(1489, 142, 'YAQUERANA', NULL, NULL),
(1490, 143, 'CONTAMANA', NULL, NULL),
(1491, 143, 'INAHUAYA', NULL, NULL),
(1492, 143, 'PADRE MARQUEZ', NULL, NULL),
(1493, 143, 'PAMPA HERMOSA', NULL, NULL),
(1494, 143, 'SARAYACU', NULL, NULL),
(1495, 143, 'VARGAS GUERRA', NULL, NULL),
(1496, 144, 'BARRANCA', NULL, NULL),
(1497, 144, 'CAHUAPANAS', NULL, NULL),
(1498, 144, 'MANSERICHE', NULL, NULL),
(1499, 144, 'MORONA', NULL, NULL),
(1500, 144, 'PASTAZA', NULL, NULL),
(1501, 144, 'ANDOAS', NULL, NULL),
(1502, 145, 'PUTUMAYO', NULL, NULL),
(1503, 145, 'ROSA PANDURO', NULL, NULL),
(1504, 145, 'TENIENTE MANUEL CLAVERO', NULL, NULL),
(1505, 145, 'YAGUAS', NULL, NULL),
(1506, 146, 'TAMBOPATA', NULL, NULL),
(1507, 146, 'INAMBARI', NULL, NULL),
(1508, 146, 'LAS PIEDRAS', NULL, NULL),
(1509, 146, 'LABERINTO', NULL, NULL),
(1510, 147, 'MANU', NULL, NULL),
(1511, 147, 'FITZCARRALD', NULL, NULL),
(1512, 147, 'MADRE DE DIOS', NULL, NULL),
(1513, 147, 'HUEPETUHE', NULL, NULL),
(1514, 148, 'IÑAPARI', NULL, NULL),
(1515, 148, 'IBERIA', NULL, NULL),
(1516, 148, 'TAHUAMANU', NULL, NULL),
(1517, 149, 'MOQUEGUA', NULL, NULL),
(1518, 149, 'CARUMAS', NULL, NULL),
(1519, 149, 'CUCHUMBAYA', NULL, NULL),
(1520, 149, 'SAMEGUA', NULL, NULL),
(1521, 149, 'SAN CRISTOBAL', NULL, NULL),
(1522, 149, 'TORATA', NULL, NULL),
(1523, 150, 'OMATE', NULL, NULL),
(1524, 150, 'CHOJATA', NULL, NULL),
(1525, 150, 'COALAQUE', NULL, NULL),
(1526, 150, 'ICHUÑA', NULL, NULL),
(1527, 150, 'LA CAPILLA', NULL, NULL),
(1528, 150, 'LLOQUE', NULL, NULL),
(1529, 150, 'MATALAQUE', NULL, NULL),
(1530, 150, 'PUQUINA', NULL, NULL),
(1531, 150, 'QUINISTAQUILLAS', NULL, NULL),
(1532, 150, 'UBINAS', NULL, NULL),
(1533, 150, 'YUNGA', NULL, NULL),
(1534, 151, 'ILO', NULL, NULL),
(1535, 151, 'EL ALGARROBAL', NULL, NULL),
(1536, 151, 'PACOCHA', NULL, NULL),
(1537, 152, 'CHAUPIMARCA', NULL, NULL),
(1538, 152, 'HUACHON', NULL, NULL),
(1539, 152, 'HUARIACA', NULL, NULL),
(1540, 152, 'HUAYLLAY', NULL, NULL),
(1541, 152, 'NINACACA', NULL, NULL),
(1542, 152, 'PALLANCHACRA', NULL, NULL),
(1543, 152, 'PAUCARTAMBO', NULL, NULL),
(1544, 152, 'SAN FRANCISCO DE ASIS DE YARUSYACAN', NULL, NULL),
(1545, 152, 'SIMON BOLIVAR', NULL, NULL),
(1546, 152, 'TICLACAYAN', NULL, NULL),
(1547, 152, 'TINYAHUARCO', NULL, NULL),
(1548, 152, 'VICCO', NULL, NULL),
(1549, 152, 'YANACANCHA', NULL, NULL),
(1550, 153, 'YANAHUANCA', NULL, NULL),
(1551, 153, 'CHACAYAN', NULL, NULL),
(1552, 153, 'GOYLLARISQUIZGA', NULL, NULL),
(1553, 153, 'PAUCAR', NULL, NULL),
(1554, 153, 'SAN PEDRO DE PILLAO', NULL, NULL),
(1555, 153, 'SANTA ANA DE TUSI', NULL, NULL),
(1556, 153, 'TAPUC', NULL, NULL),
(1557, 153, 'VILCABAMBA', NULL, NULL),
(1558, 154, 'OXAPAMPA', NULL, NULL),
(1559, 154, 'CHONTABAMBA', NULL, NULL),
(1560, 154, 'HUANCABAMBA', NULL, NULL),
(1561, 154, 'PALCAZU', NULL, NULL),
(1562, 154, 'POZUZO', NULL, NULL),
(1563, 154, 'PUERTO BERMUDEZ', NULL, NULL),
(1564, 154, 'VILLA RICA', NULL, NULL),
(1565, 154, 'CONSTITUCION', NULL, NULL),
(1566, 155, 'PIURA', NULL, NULL),
(1567, 155, 'CASTILLA', NULL, NULL),
(1568, 155, 'CATACAOS', NULL, NULL),
(1569, 155, 'CURA MORI', NULL, NULL),
(1570, 155, 'EL TALLAN', NULL, NULL),
(1571, 155, 'LA ARENA', NULL, NULL),
(1572, 155, 'LA UNION', NULL, NULL),
(1573, 155, 'LAS LOMAS', NULL, NULL),
(1574, 155, 'TAMBO GRANDE', NULL, NULL),
(1575, 155, 'VEINTISEIS DE OCTUBRE', NULL, NULL),
(1576, 156, 'AYABACA', NULL, NULL),
(1577, 156, 'FRIAS', NULL, NULL),
(1578, 156, 'JILILI', NULL, NULL),
(1579, 156, 'LAGUNAS', NULL, NULL),
(1580, 156, 'MONTERO', NULL, NULL),
(1581, 156, 'PACAIPAMPA', NULL, NULL),
(1582, 156, 'PAIMAS', NULL, NULL),
(1583, 156, 'SAPILLICA', NULL, NULL),
(1584, 156, 'SICCHEZ', NULL, NULL),
(1585, 156, 'SUYO', NULL, NULL),
(1586, 157, 'HUANCABAMBA', NULL, NULL),
(1587, 157, 'CANCHAQUE', NULL, NULL),
(1588, 157, 'EL CARMEN DE LA FRONTERA', NULL, NULL),
(1589, 157, 'HUARMACA', NULL, NULL),
(1590, 157, 'LALAQUIZ', NULL, NULL),
(1591, 157, 'SAN MIGUEL DE EL FAIQUE', NULL, NULL),
(1592, 157, 'SONDOR', NULL, NULL),
(1593, 157, 'SONDORILLO', NULL, NULL),
(1594, 158, 'CHULUCANAS', NULL, NULL),
(1595, 158, 'BUENOS AIRES', NULL, NULL),
(1596, 158, 'CHALACO', NULL, NULL),
(1597, 158, 'LA MATANZA', NULL, NULL),
(1598, 158, 'MORROPON', NULL, NULL),
(1599, 158, 'SALITRAL', NULL, NULL),
(1600, 158, 'SAN JUAN DE BIGOTE', NULL, NULL),
(1601, 158, 'SANTA CATALINA DE MOSSA', NULL, NULL),
(1602, 158, 'SANTO DOMINGO', NULL, NULL),
(1603, 158, 'YAMANGO', NULL, NULL),
(1604, 159, 'PAITA', NULL, NULL),
(1605, 159, 'AMOTAPE', NULL, NULL),
(1606, 159, 'ARENAL', NULL, NULL),
(1607, 159, 'COLAN', NULL, NULL),
(1608, 159, 'LA HUACA', NULL, NULL),
(1609, 159, 'TAMARINDO', NULL, NULL),
(1610, 159, 'VICHAYAL', NULL, NULL),
(1611, 160, 'SULLANA', NULL, NULL),
(1612, 160, 'BELLAVISTA', NULL, NULL),
(1613, 160, 'IGNACIO ESCUDERO', NULL, NULL),
(1614, 160, 'LANCONES', NULL, NULL),
(1615, 160, 'MARCAVELICA', NULL, NULL),
(1616, 160, 'MIGUEL CHECA', NULL, NULL),
(1617, 160, 'QUERECOTILLO', NULL, NULL),
(1618, 160, 'SALITRAL', NULL, NULL),
(1619, 161, 'PARIÑAS', NULL, NULL),
(1620, 161, 'EL ALTO', NULL, NULL),
(1621, 161, 'LA BREA', NULL, NULL),
(1622, 161, 'LOBITOS', NULL, NULL),
(1623, 161, 'LOS ORGANOS', NULL, NULL),
(1624, 161, 'MANCORA', NULL, NULL),
(1625, 162, 'SECHURA', NULL, NULL),
(1626, 162, 'BELLAVISTA DE LA UNION', NULL, NULL),
(1627, 162, 'BERNAL', NULL, NULL),
(1628, 162, 'CRISTO NOS VALGA', NULL, NULL),
(1629, 162, 'VICE', NULL, NULL),
(1630, 162, 'RINCONADA LLICUAR', NULL, NULL),
(1631, 163, 'PUNO', NULL, NULL),
(1632, 163, 'ACORA', NULL, NULL),
(1633, 163, 'AMANTANI', NULL, NULL),
(1634, 163, 'ATUNCOLLA', NULL, NULL),
(1635, 163, 'CAPACHICA', NULL, NULL),
(1636, 163, 'CHUCUITO', NULL, NULL),
(1637, 163, 'COATA', NULL, NULL),
(1638, 163, 'HUATA', NULL, NULL),
(1639, 163, 'MAÑAZO', NULL, NULL),
(1640, 163, 'PAUCARCOLLA', NULL, NULL),
(1641, 163, 'PICHACANI', NULL, NULL),
(1642, 163, 'PLATERIA', NULL, NULL),
(1643, 163, 'SAN ANTONIO', NULL, NULL),
(1644, 163, 'TIQUILLACA', NULL, NULL),
(1645, 163, 'VILQUE', NULL, NULL),
(1646, 164, 'AZANGARO', NULL, NULL),
(1647, 164, 'ACHAYA', NULL, NULL),
(1648, 164, 'ARAPA', NULL, NULL),
(1649, 164, 'ASILLO', NULL, NULL),
(1650, 164, 'CAMINACA', NULL, NULL),
(1651, 164, 'CHUPA', NULL, NULL),
(1652, 164, 'JOSE DOMINGO CHOQUEHUANCA', NULL, NULL),
(1653, 164, 'MUÑANI', NULL, NULL),
(1654, 164, 'POTONI', NULL, NULL),
(1655, 164, 'SAMAN', NULL, NULL),
(1656, 164, 'SAN ANTON', NULL, NULL),
(1657, 164, 'SAN JOSE', NULL, NULL),
(1658, 164, 'SAN JUAN DE SALINAS', NULL, NULL),
(1659, 164, 'SANTIAGO DE PUPUJA', NULL, NULL),
(1660, 164, 'TIRAPATA', NULL, NULL),
(1661, 165, 'MACUSANI', NULL, NULL),
(1662, 165, 'AJOYANI', NULL, NULL),
(1663, 165, 'AYAPATA', NULL, NULL),
(1664, 165, 'COASA', NULL, NULL),
(1665, 165, 'CORANI', NULL, NULL),
(1666, 165, 'CRUCERO', NULL, NULL),
(1667, 165, 'ITUATA', NULL, NULL),
(1668, 165, 'OLLACHEA', NULL, NULL),
(1669, 165, 'SAN GABAN', NULL, NULL),
(1670, 165, 'USICAYOS', NULL, NULL),
(1671, 166, 'JULI', NULL, NULL),
(1672, 166, 'DESAGUADERO', NULL, NULL),
(1673, 166, 'HUACULLANI', NULL, NULL),
(1674, 166, 'KELLUYO', NULL, NULL),
(1675, 166, 'PISACOMA', NULL, NULL),
(1676, 166, 'POMATA', NULL, NULL),
(1677, 166, 'ZEPITA', NULL, NULL),
(1678, 167, 'ILAVE', NULL, NULL),
(1679, 167, 'CAPAZO', NULL, NULL),
(1680, 167, 'PILCUYO', NULL, NULL),
(1681, 167, 'SANTA ROSA', NULL, NULL),
(1682, 167, 'CONDURIRI', NULL, NULL),
(1683, 168, 'HUANCANE', NULL, NULL),
(1684, 168, 'COJATA', NULL, NULL),
(1685, 168, 'HUATASANI', NULL, NULL),
(1686, 168, 'INCHUPALLA', NULL, NULL),
(1687, 168, 'PUSI', NULL, NULL),
(1688, 168, 'ROSASPATA', NULL, NULL),
(1689, 168, 'TARACO', NULL, NULL),
(1690, 168, 'VILQUE CHICO', NULL, NULL),
(1691, 169, 'LAMPA', NULL, NULL),
(1692, 169, 'CABANILLA', NULL, NULL),
(1693, 169, 'CALAPUJA', NULL, NULL),
(1694, 169, 'NICASIO', NULL, NULL),
(1695, 169, 'OCUVIRI', NULL, NULL),
(1696, 169, 'PALCA', NULL, NULL),
(1697, 169, 'PARATIA', NULL, NULL),
(1698, 169, 'PUCARA', NULL, NULL),
(1699, 169, 'SANTA LUCIA', NULL, NULL),
(1700, 169, 'VILAVILA', NULL, NULL),
(1701, 170, 'AYAVIRI', NULL, NULL),
(1702, 170, 'ANTAUTA', NULL, NULL),
(1703, 170, 'CUPI', NULL, NULL),
(1704, 170, 'LLALLI', NULL, NULL),
(1705, 170, 'MACARI', NULL, NULL),
(1706, 170, 'NUÑOA', NULL, NULL),
(1707, 170, 'ORURILLO', NULL, NULL),
(1708, 170, 'SANTA ROSA', NULL, NULL),
(1709, 170, 'UMACHIRI', NULL, NULL),
(1710, 171, 'MOHO', NULL, NULL),
(1711, 171, 'CONIMA', NULL, NULL),
(1712, 171, 'HUAYRAPATA', NULL, NULL),
(1713, 171, 'TILALI', NULL, NULL),
(1714, 172, 'PUTINA', NULL, NULL),
(1715, 172, 'ANANEA', NULL, NULL),
(1716, 172, 'PEDRO VILCA APAZA', NULL, NULL),
(1717, 172, 'QUILCAPUNCU', NULL, NULL),
(1718, 172, 'SINA', NULL, NULL),
(1719, 173, 'JULIACA', NULL, NULL),
(1720, 173, 'CABANA', NULL, NULL),
(1721, 173, 'CABANILLAS', NULL, NULL),
(1722, 173, 'SAN MIGUEL', NULL, NULL),
(1723, 173, 'CARACOTO', NULL, NULL),
(1724, 174, 'SANDIA', NULL, NULL),
(1725, 174, 'CUYOCUYO', NULL, NULL),
(1726, 174, 'LIMBANI', NULL, NULL),
(1727, 174, 'PATAMBUCO', NULL, NULL),
(1728, 174, 'PHARA', NULL, NULL),
(1729, 174, 'QUIACA', NULL, NULL),
(1730, 174, 'SAN JUAN DEL ORO', NULL, NULL),
(1731, 174, 'YANAHUAYA', NULL, NULL),
(1732, 174, 'ALTO INAMBARI', NULL, NULL),
(1733, 174, 'SAN PEDRO DE PUTINA PUNCO', NULL, NULL),
(1734, 175, 'YUNGUYO', NULL, NULL),
(1735, 175, 'ANAPIA', NULL, NULL),
(1736, 175, 'COPANI', NULL, NULL),
(1737, 175, 'CUTURAPI', NULL, NULL),
(1738, 175, 'OLLARAYA', NULL, NULL),
(1739, 175, 'TINICACHI', NULL, NULL),
(1740, 175, 'UNICACHI', NULL, NULL),
(1741, 176, 'MOYOBAMBA', NULL, NULL),
(1742, 176, 'CALZADA', NULL, NULL),
(1743, 176, 'HABANA', NULL, NULL),
(1744, 176, 'JEPELACIO', NULL, NULL),
(1745, 176, 'SORITOR', NULL, NULL),
(1746, 176, 'YANTALO', NULL, NULL),
(1747, 177, 'BELLAVISTA', NULL, NULL),
(1748, 177, 'ALTO BIAVO', NULL, NULL),
(1749, 177, 'BAJO BIAVO', NULL, NULL),
(1750, 177, 'HUALLAGA', NULL, NULL),
(1751, 177, 'SAN PABLO', NULL, NULL),
(1752, 177, 'SAN RAFAEL', NULL, NULL),
(1753, 178, 'SAN JOSE DE SISA', NULL, NULL),
(1754, 178, 'AGUA BLANCA', NULL, NULL),
(1755, 178, 'SAN MARTIN', NULL, NULL),
(1756, 178, 'SANTA ROSA', NULL, NULL),
(1757, 178, 'SHATOJA', NULL, NULL),
(1758, 179, 'SAPOSOA', NULL, NULL),
(1759, 179, 'ALTO SAPOSOA', NULL, NULL),
(1760, 179, 'EL ESLABON', NULL, NULL),
(1761, 179, 'PISCOYACU', NULL, NULL),
(1762, 179, 'SACANCHE', NULL, NULL),
(1763, 179, 'TINGO DE SAPOSOA', NULL, NULL),
(1764, 180, 'LAMAS', NULL, NULL),
(1765, 180, 'ALONSO DE ALVARADO', NULL, NULL),
(1766, 180, 'BARRANQUITA', NULL, NULL),
(1767, 180, 'CAYNARACHI', NULL, NULL),
(1768, 180, 'CUÑUMBUQUI', NULL, NULL),
(1769, 180, 'PINTO RECODO', NULL, NULL),
(1770, 180, 'RUMISAPA', NULL, NULL),
(1771, 180, 'SAN ROQUE DE CUMBAZA', NULL, NULL),
(1772, 180, 'SHANAO', NULL, NULL),
(1773, 180, 'TABALOSOS', NULL, NULL),
(1774, 180, 'ZAPATERO', NULL, NULL),
(1775, 181, 'JUANJUI', NULL, NULL),
(1776, 181, 'CAMPANILLA', NULL, NULL),
(1777, 181, 'HUICUNGO', NULL, NULL),
(1778, 181, 'PACHIZA', NULL, NULL),
(1779, 181, 'PAJARILLO', NULL, NULL),
(1780, 182, 'PICOTA', NULL, NULL),
(1781, 182, 'BUENOS AIRES', NULL, NULL),
(1782, 182, 'CASPISAPA', NULL, NULL),
(1783, 182, 'PILLUANA', NULL, NULL),
(1784, 182, 'PUCACACA', NULL, NULL),
(1785, 182, 'SAN CRISTOBAL', NULL, NULL),
(1786, 182, 'SAN HILARION', NULL, NULL),
(1787, 182, 'SHAMBOYACU', NULL, NULL),
(1788, 182, 'TINGO DE PONASA', NULL, NULL),
(1789, 182, 'TRES UNIDOS', NULL, NULL),
(1790, 183, 'RIOJA', NULL, NULL),
(1791, 183, 'AWAJUN', NULL, NULL),
(1792, 183, 'ELIAS SOPLIN VARGAS', NULL, NULL),
(1793, 183, 'NUEVA CAJAMARCA', NULL, NULL),
(1794, 183, 'PARDO MIGUEL', NULL, NULL),
(1795, 183, 'POSIC', NULL, NULL),
(1796, 183, 'SAN FERNANDO', NULL, NULL),
(1797, 183, 'YORONGOS', NULL, NULL),
(1798, 183, 'YURACYACU', NULL, NULL),
(1799, 184, 'TARAPOTO', NULL, NULL),
(1800, 184, 'ALBERTO LEVEAU', NULL, NULL),
(1801, 184, 'CACATACHI', NULL, NULL),
(1802, 184, 'CHAZUTA', NULL, NULL),
(1803, 184, 'CHIPURANA', NULL, NULL),
(1804, 184, 'EL PORVENIR', NULL, NULL),
(1805, 184, 'HUIMBAYOC', NULL, NULL),
(1806, 184, 'JUAN GUERRA', NULL, NULL),
(1807, 184, 'LA BANDA DE SHILCAYO', NULL, NULL),
(1808, 184, 'MORALES', NULL, NULL),
(1809, 184, 'PAPAPLAYA', NULL, NULL),
(1810, 184, 'SAN ANTONIO', NULL, NULL),
(1811, 184, 'SAUCE', NULL, NULL),
(1812, 184, 'SHAPAJA', NULL, NULL),
(1813, 185, 'TOCACHE', NULL, NULL),
(1814, 185, 'NUEVO PROGRESO', NULL, NULL),
(1815, 185, 'POLVORA', NULL, NULL),
(1816, 185, 'SHUNTE', NULL, NULL),
(1817, 185, 'UCHIZA', NULL, NULL),
(1818, 186, 'TACNA', NULL, NULL),
(1819, 186, 'ALTO DE LA ALIANZA', NULL, NULL),
(1820, 186, 'CALANA', NULL, NULL),
(1821, 186, 'CIUDAD NUEVA', NULL, NULL),
(1822, 186, 'INCLAN', NULL, NULL),
(1823, 186, 'PACHIA', NULL, NULL),
(1824, 186, 'PALCA', NULL, NULL),
(1825, 186, 'POCOLLAY', NULL, NULL),
(1826, 186, 'SAMA', NULL, NULL),
(1827, 186, 'CORONEL GREGORIO ALBARRACIN LANCHIPA', NULL, NULL),
(1828, 186, 'LA YARADA LOS PALOS', NULL, NULL),
(1829, 187, 'CANDARAVE', NULL, NULL),
(1830, 187, 'CAIRANI', NULL, NULL),
(1831, 187, 'CAMILACA', NULL, NULL),
(1832, 187, 'CURIBAYA', NULL, NULL),
(1833, 187, 'HUANUARA', NULL, NULL),
(1834, 187, 'QUILAHUANI', NULL, NULL),
(1835, 188, 'LOCUMBA', NULL, NULL),
(1836, 188, 'ILABAYA', NULL, NULL),
(1837, 188, 'ITE', NULL, NULL),
(1838, 189, 'TARATA', NULL, NULL),
(1839, 189, 'HEROES ALBARRACIN', NULL, NULL),
(1840, 189, 'ESTIQUE', NULL, NULL),
(1841, 189, 'ESTIQUE-PAMPA', NULL, NULL),
(1842, 189, 'SITAJARA', NULL, NULL),
(1843, 189, 'SUSAPAYA', NULL, NULL),
(1844, 189, 'TARUCACHI', NULL, NULL),
(1845, 189, 'TICACO', NULL, NULL),
(1846, 190, 'TUMBES', NULL, NULL),
(1847, 190, 'CORRALES', NULL, NULL),
(1848, 190, 'LA CRUZ', NULL, NULL),
(1849, 190, 'PAMPAS DE HOSPITAL', NULL, NULL),
(1850, 190, 'SAN JACINTO', NULL, NULL),
(1851, 190, 'SAN JUAN DE LA VIRGEN', NULL, NULL),
(1852, 191, 'ZORRITOS', NULL, NULL),
(1853, 191, 'CASITAS', NULL, NULL),
(1854, 191, 'CANOAS DE PUNTA SAL', NULL, NULL),
(1855, 192, 'ZARUMILLA', NULL, NULL),
(1856, 192, 'AGUAS VERDES', NULL, NULL),
(1857, 192, 'MATAPALO', NULL, NULL),
(1858, 192, 'PAPAYAL', NULL, NULL),
(1859, 193, 'CALLERIA', NULL, NULL),
(1860, 193, 'CAMPOVERDE', NULL, NULL),
(1861, 193, 'IPARIA', NULL, NULL),
(1862, 193, 'MASISEA', NULL, NULL),
(1863, 193, 'YARINACOCHA', NULL, NULL),
(1864, 193, 'NUEVA REQUENA', NULL, NULL),
(1865, 193, 'MANANTAY', NULL, NULL),
(1866, 194, 'RAYMONDI', NULL, NULL),
(1867, 194, 'SEPAHUA', NULL, NULL),
(1868, 194, 'TAHUANIA', NULL, NULL),
(1869, 194, 'YURUA', NULL, NULL),
(1870, 195, 'PADRE ABAD', NULL, NULL),
(1871, 195, 'IRAZOLA', NULL, NULL),
(1872, 195, 'CURIMANA', NULL, NULL),
(1873, 195, 'NESHUYA', NULL, NULL),
(1874, 195, 'ALEXANDER VON HUMBOLDT', NULL, NULL),
(1875, 196, 'PURUS', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especies`
--

CREATE TABLE `especies` (
  `id` bigint UNSIGNED NOT NULL,
  `Especie` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `especies`
--

INSERT INTO `especies` (`id`, `Especie`, `created_at`, `updated_at`) VALUES
(1, 'Perro', NULL, NULL),
(2, 'Gato', NULL, NULL),
(3, 'Aves', NULL, NULL),
(4, 'Roedor', '2024-06-15 14:58:43', '2024-06-15 14:58:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_eventos`
--

CREATE TABLE `estados_eventos` (
  `id` bigint UNSIGNED NOT NULL,
  `EstadoEvento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estados_eventos`
--

INSERT INTO `estados_eventos` (`id`, `EstadoEvento`, `created_at`, `updated_at`) VALUES
(1, 'Pendiente', NULL, NULL),
(2, 'En Proceso', NULL, NULL),
(3, 'Finalizado', NULL, NULL),
(4, 'Cancelado', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_ventas`
--

CREATE TABLE `estados_ventas` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estados_ventas`
--

INSERT INTO `estados_ventas` (`id`, `nombre`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'PAGADA', 'pagada', NULL, NULL),
(2, 'PENDIENTE', 'pendiente', NULL, NULL),
(3, 'ANULADA', 'anulada', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` bigint UNSIGNED NOT NULL,
  `idCliente` bigint UNSIGNED NOT NULL,
  `idMascota` bigint UNSIGNED NOT NULL,
  `idTipoEvento` bigint UNSIGNED NOT NULL,
  `idEstadoEvento` bigint UNSIGNED NOT NULL,
  `idUsuario` bigint UNSIGNED NOT NULL,
  `idNotificacion` bigint UNSIGNED NOT NULL,
  `Evento` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FechaInicio` datetime NOT NULL,
  `FechaFin` datetime NOT NULL,
  `Observacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Notificacion` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `idCliente`, `idMascota`, `idTipoEvento`, `idEstadoEvento`, `idUsuario`, `idNotificacion`, `Evento`, `FechaInicio`, `FechaFin`, `Observacion`, `Color`, `Notificacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 4, 1, 1, 1, 1, 'corte de pelo', '2024-04-28 00:00:00', '2024-04-28 00:00:00', 'nada', '', 0, NULL, NULL, NULL),
(2, 3, 5, 1, 1, 1, 1, 'baño de mascota', '2024-04-28 00:00:00', '2024-04-28 00:00:00', 'nada', '', 0, NULL, NULL, NULL),
(3, 2, 1, 1, 1, 1, 1, 'Control', '2024-04-28 00:00:00', '2024-04-28 00:00:00', 'ninguna', '', 0, NULL, NULL, NULL),
(4, 1, 4, 1, 1, 1, 1, '', '2024-04-29 00:00:00', '0000-00-00 00:00:00', 'ninguna', 'Notificacion', 127, NULL, NULL, NULL),
(5, 3, 5, 1, 1, 2, 1, 'corte de pelo', '2024-06-15 23:28:00', '2024-06-16 00:29:00', NULL, NULL, 0, '2024-06-15 08:24:15', '2024-06-15 08:24:15', NULL),
(6, 2, 1, 1, 1, 1, 1, 'baño de mascota', '2024-06-17 09:00:00', '2024-06-17 11:00:00', 'ninguna', NULL, 0, '2024-06-15 15:33:48', '2024-06-15 15:33:48', NULL),
(7, 6, 6, 1, 1, 1, 1, 'Control', '2024-06-17 12:30:00', '2024-06-17 13:00:00', 'ninguna', NULL, 0, '2024-06-15 15:35:14', '2024-06-15 15:35:14', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenes_auxiliares`
--

CREATE TABLE `examenes_auxiliares` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `examenes_auxiliares`
--

INSERT INTO `examenes_auxiliares` (`id`, `nombre`) VALUES
(1, 'Hemograma Completo'),
(2, 'Bioquímica Sanguínea'),
(3, 'Análisis de Orina'),
(4, 'Radiografías (Rayos X)'),
(5, 'Ecografía'),
(6, 'Electrocardiograma (ECG)'),
(7, 'Endoscopia'),
(8, 'Citología'),
(9, 'Cultivo Bacteriano y Sensibilidad'),
(10, 'Pruebas Serológicas'),
(11, 'Pruebas de Hormonas Tiroideas'),
(12, 'Pruebas de Alergia'),
(13, 'Análisis de Heces'),
(14, 'Tomografía Computarizada (CT)'),
(15, 'Resonancia Magnética (MRI)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenes_auxiliares_mascotas`
--

CREATE TABLE `examenes_auxiliares_mascotas` (
  `id` bigint UNSIGNED NOT NULL,
  `mascota_id` bigint UNSIGNED NOT NULL,
  `examen_auxiliar_id` bigint UNSIGNED NOT NULL,
  `historia_clinica_id` bigint UNSIGNED NOT NULL,
  `observacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `examenes_auxiliares_mascotas`
--

INSERT INTO `examenes_auxiliares_mascotas` (`id`, `mascota_id`, `examen_auxiliar_id`, `historia_clinica_id`, `observacion`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formas_pagos`
--

CREATE TABLE `formas_pagos` (
  `id` bigint UNSIGNED NOT NULL,
  `FormaDePago` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `formas_pagos`
--

INSERT INTO `formas_pagos` (`id`, `FormaDePago`, `created_at`, `updated_at`) VALUES
(1, 'Efectivo', NULL, NULL),
(2, 'Transferencia', NULL, NULL),
(3, 'YAPE', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frecuencias`
--

CREATE TABLE `frecuencias` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historias_clinicas`
--

CREATE TABLE `historias_clinicas` (
  `id` bigint UNSIGNED NOT NULL,
  `idMascota` bigint UNSIGNED NOT NULL,
  `descripcion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `temperatura` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `peso` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `presion_arterial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuencia_cardiaca` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `porcentaje_deshidratacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `examen_tacto_rectal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frecuencia_respiratoria` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiempo_llenado_capilar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `examen_clinico` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `conformidad_pago` tinyint(1) DEFAULT NULL,
  `documentacion_firmada` tinyint(1) DEFAULT NULL,
  `riesgo_quirurgico` tinyint(1) DEFAULT NULL,
  `nombre_cirugia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motivo_atencion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `miccion` tinyint(1) DEFAULT '0',
  `deposicion` tinyint(1) DEFAULT '0',
  `ayuno_previo` tinyint(1) DEFAULT '0',
  `tratamiento` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `fecha_atencion` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipo_historia_clinica_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historias_clinicas`
--

INSERT INTO `historias_clinicas` (`id`, `idMascota`, `descripcion`, `temperatura`, `peso`, `presion_arterial`, `frecuencia_cardiaca`, `porcentaje_deshidratacion`, `examen_tacto_rectal`, `frecuencia_respiratoria`, `tiempo_llenado_capilar`, `examen_clinico`, `conformidad_pago`, `documentacion_firmada`, `riesgo_quirurgico`, `nombre_cirugia`, `motivo_atencion`, `miccion`, `deposicion`, `ayuno_previo`, `tratamiento`, `created_at`, `fecha_atencion`, `updated_at`, `tipo_historia_clinica_id`) VALUES
(1, 1, 'perro no quiere comer', '20', '20', '20', '20', '20', '20', '20', '20', 'necesita examen general', NULL, NULL, NULL, NULL, 'consulta', NULL, NULL, NULL, NULL, '2024-05-26 10:12:11', '2024-05-26 18:11:00', '2024-05-26 10:12:11', 1),
(2, 1, 'perro tiene fiebre, necesita una vacuna', '30', '30', '30', '30', '30', '30', '30', '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-26 10:19:23', '2024-05-26 18:18:00', '2024-05-26 10:19:23', 4),
(3, 1, NULL, '20', NULL, NULL, '20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-26 10:57:16', '2024-05-26 18:56:00', '2024-05-26 10:57:16', 6),
(4, 2, 'tiene gripe, necesita una vacuna', '20', '5', '40', '30', '40', '40', '40', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-26 16:48:25', '2024-05-27 00:47:00', '2024-05-26 16:48:25', 4),
(5, 1, 'perro con gripe', '30', '30', '30', '30', '30', '3.', '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-26 18:13:47', '2024-05-27 02:13:00', '2024-05-26 18:13:47', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia_clinica_adjuntos`
--

CREATE TABLE `historia_clinica_adjuntos` (
  `historia_clinica_id` int NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE `inventarios` (
  `id` bigint UNSIGNED NOT NULL,
  `idUsuario` bigint UNSIGNED NOT NULL,
  `idAlmacen` bigint UNSIGNED NOT NULL,
  `idProducto` bigint UNSIGNED NOT NULL,
  `idTipoOperacion` bigint UNSIGNED NOT NULL,
  `Motivo` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cantidad` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas`
--

CREATE TABLE `lineas` (
  `id` bigint UNSIGNED NOT NULL,
  `Linea` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `lineas`
--

INSERT INTO `lineas` (`id`, `Linea`, `created_at`, `updated_at`) VALUES
(1, 'Medicina', NULL, NULL),
(2, 'Clinica', NULL, NULL),
(3, 'Peluqueria', NULL, NULL),
(4, 'Farmacia', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotes`
--

CREATE TABLE `lotes` (
  `id` bigint UNSIGNED NOT NULL,
  `idAlmacen` bigint UNSIGNED NOT NULL,
  `idProducto` bigint UNSIGNED NOT NULL,
  `idLote` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Lote` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FechaVencimineto` date NOT NULL,
  `CantidadEntrada` int NOT NULL,
  `Saldo` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id` bigint UNSIGNED NOT NULL,
  `idCliente` bigint UNSIGNED NOT NULL,
  `idEspecie` bigint UNSIGNED NOT NULL,
  `idRaza` bigint UNSIGNED NOT NULL,
  `idFrecuencia` bigint UNSIGNED DEFAULT NULL,
  `idDiaPreferido` bigint UNSIGNED DEFAULT NULL,
  `Mascota` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Microchip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sexo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Esterilizado` tinyint(1) DEFAULT NULL,
  `Asegurado` tinyint(1) DEFAULT NULL,
  `Notas` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Grooming` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NumeroHistoria` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id`, `idCliente`, `idEspecie`, `idRaza`, `idFrecuencia`, `idDiaPreferido`, `Mascota`, `FechaNacimiento`, `Microchip`, `Sexo`, `Esterilizado`, `Asegurado`, `Notas`, `Grooming`, `NumeroHistoria`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 1, NULL, NULL, 'Fido', '2012-02-22', NULL, '1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, NULL, NULL, 'Cazador', '2020-02-10', NULL, '1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, 3, 3, NULL, NULL, 'Flor', '2000-02-20', NULL, '2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, 1, 1, NULL, NULL, 'Nena', '1999-02-20', NULL, '2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 3, 1, 1, NULL, NULL, 'Perla', '2000-02-02', NULL, '2', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, 4, 4, NULL, NULL, 'Mochi', '2020-10-01', NULL, '1', 2, 2, NULL, NULL, NULL, '2024-06-15 15:02:46', '2024-06-15 15:02:46', NULL),
(7, 7, 1, 1, NULL, NULL, 'blanca', '2015-02-20', NULL, '2', NULL, NULL, NULL, NULL, NULL, '2024-06-18 19:37:29', '2024-06-18 19:37:29', NULL),
(8, 1, 1, 1, NULL, NULL, 'Candy', '2015-02-20', NULL, '2', 2, NULL, NULL, NULL, '5', '2024-06-22 09:48:34', '2024-06-22 09:51:46', NULL),
(12, 6, 1, 1, NULL, NULL, '333', '2000-05-05', NULL, '2', NULL, NULL, NULL, NULL, NULL, '2024-07-12 05:30:09', '2024-07-12 05:30:09', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota_galeria`
--

CREATE TABLE `mascota_galeria` (
  `id` bigint UNSIGNED NOT NULL,
  `mascota_id` bigint UNSIGNED NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mascota_galeria`
--

INSERT INTO `mascota_galeria` (`id`, `mascota_id`, `path`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 1, 'mascota_galeria/prueba_1.PNG', '2024-06-15 08:20:34', '2024-06-15 08:20:34', NULL),
(6, 4, 'mascota_galeria/mascota_4.png', '2024-06-26 20:09:18', '2024-06-26 20:09:18', NULL),
(7, 4, 'mascota_galeria/prueba_4.PNG', '2024-06-26 20:09:26', '2024-06-26 20:09:26', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_12_180051_create_forma_pagos_table', 1),
(5, '2024_03_12_180648_create_unidad_medidas_table', 1),
(6, '2024_03_12_180804_create_presentacions_table', 1),
(7, '2024_03_12_180913_create_lineas_table', 1),
(8, '2024_03_12_181013_create_categorias_table', 1),
(9, '2024_03_12_181021_create_sub_categorias_table', 1),
(10, '2024_03_12_181140_create_especies_table', 1),
(11, '2024_03_12_181146_create_razas_table', 1),
(12, '2024_03_12_181200_create_departamentos_table', 1),
(13, '2024_03_12_181218_create_provincias_table', 1),
(14, '2024_03_12_181247_create_distritos_table', 1),
(15, '2024_03_12_184301_create_proveedors_table', 1),
(16, '2024_03_12_185658_create_productos_table', 1),
(17, '2024_03_12_191910_create_frecuencias_table', 1),
(18, '2024_03_12_191915_create_dia_preferidos_table', 1),
(19, '2024_03_12_192227_create_clientes_table', 1),
(20, '2024_03_12_202828_create_servicios_table', 1),
(21, '2024_03_12_224417_create_mascotas_table', 1),
(22, '2024_03_29_104151_create_tipo_eventos_table', 1),
(23, '2024_03_29_104805_create_estado_eventos_table', 1),
(24, '2024_03_29_112615_create_notificacions_table', 1),
(25, '2024_03_29_112703_create_eventos_table', 1),
(26, '2024_03_29_155040_create_tipo_almacens_table', 1),
(27, '2024_03_29_160132_create_almacens_table', 1),
(28, '2024_03_29_162803_create_lotes_table', 1),
(29, '2024_03_29_165928_create_tipo_operacions_table', 1),
(30, '2024_03_29_182705_create_inventarios_table', 1),
(31, '2024_03_29_212432_create_historia_clinicas_table', 1),
(32, '2024_03_29_212808_create_tipo_historia_clinicas_table', 1),
(33, '2024_03_29_213434_create_detalle_historia_clinicas_table', 1),
(34, '2024_05_16_160413_create_ventas_table', 1),
(35, '2024_05_16_160418_create_ventas_items_table', 1),
(36, '2024_05_19_120826_add_impuestos_column_ventas_items_table', 1),
(37, '2024_05_21_101319_create_tipos_movimientos_table', 1),
(38, '2024_05_21_101522_create_comprobantes_table', 1),
(39, '2024_05_21_105607_create_cajas_table', 1),
(40, '2024_05_21_112858_create_comprobantes_pagos_table', 1),
(41, '2024_05_21_114109_create_notas_credito_table', 1),
(42, '2024_05_22_121443_create_estados_ventas_table', 1),
(43, '2024_05_22_121905_update_ventas_table', 1),
(44, '2024_05_23_100452_add_historia_clinica_data', 1),
(45, '2024_05_23_131823_add_fecha_atencion_historial_clinico_table', 1),
(46, '2024_05_23_134007_update_comprobantes_pagos_table', 1),
(47, '2024_05_24_073954_add_tipos_movimientos_table', 1),
(48, '2024_05_24_080355_historia_clinica_adjuntos', 1),
(49, '2024_05_24_083442_create_personal_access_tokens_table', 1),
(50, '2024_05_24_084738_add_tipo_historia_clinica', 1),
(51, '2024_05_24_090922_add_galeria_historial', 1),
(52, '2024_05_24_103751_add__numero_historia_mascota_table', 1),
(53, '2024_05_24_124853_add_tipos_movimientos', 1),
(54, '2024_05_24_125210_create_movimientos_table', 1),
(55, '2024_05_24_132917_add_seccion_movimientos_table', 1),
(56, '2024_05_25_151813_rename_column_historial_clinico', 2),
(57, '2024_05_25_161323_modify_column_historial_clinico', 2),
(58, '2024_05_25_162054_modify_tipo_historias_clinicas', 2),
(59, '2024_05_25_164012_modify_observacion_type_historias_clinicas', 2),
(60, '2024_05_26_125648_update_almacenes_table', 3),
(61, '2024_05_26_190606_diagnosticos_exames_timestamt', 3),
(62, '2024_05_27_135005_galeria_productos_table', 3),
(63, '2024_05_27_151618_create_productos_stocks_table', 3),
(64, '2024_06_08_100017_create_roles_table', 4),
(65, '2024_06_08_110854_update_users_table', 4),
(66, '2024_06_08_215746_update_eventos_table', 4),
(67, '2024_06_10_155114_update2_almacenes_table', 4),
(68, '2024_06_12_163209_add_softdelete_columns', 4),
(69, '2024_06_20_111503_create_tipos_comprobantes_table', 5),
(70, '2024_06_20_111528_update_comprobantes_table', 5),
(71, '2024_06_20_112659_update2_comprobantes_table', 5),
(72, '2024_06_20_112853_update3_comprobantes_table', 5),
(73, '2024_06_22_093417_ventas_add_usuario_id', 6),
(74, '2024_06_22_095610_correr_seder_comprobantes', 6),
(75, '2024_06_22_104135_update_cliente_table', 6),
(76, '2024_06_22_105100_agregar_eliminacion_movimientos', 6),
(77, '2024_06_22_105710_nullable_valor_nuevo_movimientos', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id` bigint UNSIGNED NOT NULL,
  `tipo_movimiento_id` bigint UNSIGNED NOT NULL,
  `valor_anterior` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `valor_nuevo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `usuario_id` bigint UNSIGNED NOT NULL,
  `modulo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id`, `tipo_movimiento_id`, `valor_anterior`, `valor_nuevo`, `usuario_id`, `modulo`, `created_at`, `updated_at`) VALUES
(1, 9, '{\"StockMinimo\":100}', '{\"StockMinimo\":\"120\"}', 2, 'producto', '2024-05-30 20:58:58', '2024-05-30 20:58:58'),
(2, 5, '{\"Nombre\":\"alvaro\",\"FechaNacimiento\":\"1986-11-04\",\"Direccion\":\"\"}', '{\"Nombre\":\"alvaroS\",\"FechaNacimiento\":\"1986-11-05T05:05:00.000000Z\",\"Direccion\":\"av\"}', 2, 'cliente', '2024-05-30 21:05:00', '2024-05-30 21:05:00'),
(3, 5, '{\"FechaNacimiento\":\"2000-10-10\",\"Direccion\":\"\",\"ReferenciaDireccion\":null}', '{\"FechaNacimiento\":\"2000-10-11T05:16:14.000000Z\",\"Direccion\":\"aaaaaaaaaaaaa\",\"ReferenciaDireccion\":\"a\"}', 2, 'cliente', '2024-05-30 21:16:14', '2024-05-30 21:16:14'),
(4, 5, '{\"idProvincia\":67,\"idDistrito\":691,\"FechaNacimiento\":\"1990-02-02\",\"Email\":\"cristiano@gmail.com\",\"TelefonoFijo\":null,\"Direccion\":\"\",\"ReferenciaDireccion\":null}', '{\"idProvincia\":\"135\",\"idDistrito\":\"1403\",\"FechaNacimiento\":\"1990-02-02T22:06:17.000000Z\",\"Email\":\"cristiano1@gmail.com\",\"TelefonoFijo\":\"672354\",\"Direccion\":\"av siempre viva 123\",\"ReferenciaDireccion\":\"av siempre viva 123\"}', 2, 'cliente', '2024-06-07 14:06:17', '2024-06-07 14:06:17'),
(5, 8, '{\"PrecioServicio\":150}', '{\"PrecioServicio\":\"155\"}', 2, 'servicio', '2024-06-07 14:15:02', '2024-06-07 14:15:02'),
(6, 8, '{\"PrecioServicio\":155}', '{\"PrecioServicio\":\"180\"}', 2, 'servicio', '2024-06-07 14:39:47', '2024-06-07 14:39:47'),
(7, 6, NULL, '{\"idDepartamento\":\"2\",\"idProvincia\":\"8\",\"idDistrito\":\"85\",\"Nombre\":\"elizabeth\",\"Apellido\":\"lopez\",\"DocumentoIdentidad\":\"78457852\",\"FechaNacimiento\":\"1998-03-21T03:34:33.000000Z\",\"Direccion\":\"calle los girasoles 123\",\"id\":7}', 2, 'cliente', '2024-06-18 19:34:33', '2024-06-18 19:34:33'),
(8, 11, NULL, '{\"idCliente\":\"7\",\"idEspecie\":\"1\",\"idRaza\":\"1\",\"Mascota\":\"blanca\",\"FechaNacimiento\":\"2015-02-21T03:37:29.000000Z\",\"Sexo\":\"2\",\"id\":7}', 2, 'mascota', '2024-06-18 19:37:30', '2024-06-18 19:37:30'),
(9, 11, NULL, '{\"idCliente\":\"1\",\"idEspecie\":\"1\",\"idRaza\":\"1\",\"Mascota\":\"Candy\",\"FechaNacimiento\":\"2015-02-20T17:48:34.000000Z\",\"Sexo\":\"2\",\"Esterilizado\":\"2\",\"id\":8}', 2, 'mascota', '2024-06-22 09:48:34', '2024-06-22 09:48:34'),
(10, 12, '{\"FechaNacimiento\":\"2015-02-20\",\"NumeroHistoria\":null}', '{\"FechaNacimiento\":\"2015-02-20T17:51:46.000000Z\",\"NumeroHistoria\":\"5\"}', 2, 'mascota', '2024-06-22 09:51:46', '2024-06-22 09:51:46'),
(11, 6, NULL, '{\"idDepartamento\":\"15\",\"idProvincia\":\"135\",\"idDistrito\":\"1402\",\"Nombre\":\"Pedro\",\"Apellido\":\"Palacios\",\"DocumentoIdentidad\":\"47777587\",\"Email\":\"aplicaciones-tablet@hotmail.com\",\"TelefonoFijo\":\"2632179\",\"Direccion\":\"av siempre viva 123\",\"ReferenciaDireccion\":\"av siempre viva 123\",\"id\":8}', 2, 'cliente', '2024-06-22 09:53:29', '2024-06-22 09:53:29'),
(12, 5, '{\"DocumentoIdentidad\":\"47777587\"}', '{\"DocumentoIdentidad\":\"48588888\"}', 2, 'cliente', '2024-06-22 09:55:33', '2024-06-22 09:55:33'),
(13, 13, '{\"id\":8,\"idDepartamento\":15,\"idProvincia\":135,\"idDistrito\":1402,\"Nombre\":\"Pedro\",\"Apellido\":\"Palacios\",\"DocumentoIdentidad\":\"48588888\",\"FechaNacimiento\":null,\"Email\":\"aplicaciones-tablet@hotmail.com\",\"TelefonoFijo\":\"2632179\",\"TelefonoMovil\":null,\"TelefonoTrabajo\":null,\"Direccion\":\"av siempre viva 123\",\"ZonaResidencia\":null,\"ClienteReferido\":0,\"Observaciones\":null,\"NombreEmpresa\":null,\"RegistroTributario\":null,\"DireccionEmpresa\":null,\"Facebook\":null,\"Instagram\":null,\"ReferenciaDireccion\":\"av siempre viva 123\",\"created_at\":\"2024-06-22T17:53:29.000000Z\",\"updated_at\":\"2024-06-22T17:55:33.000000Z\",\"deleted_at\":null}', NULL, 2, 'cliente', '2024-06-22 09:57:38', '2024-06-22 09:57:38'),
(14, 6, NULL, '{\"idDepartamento\":\"2\",\"idProvincia\":\"9\",\"idDistrito\":\"98\",\"Nombre\":\"Carlos\",\"Apellido\":\"Zambrano\",\"DocumentoIdentidad\":\"47475858\",\"Direccion\":\"calle los girasoles 123\",\"ReferenciaDireccion\":\"calle los girasoles 123\",\"id\":9}', 2, 'cliente', '2024-06-22 15:23:49', '2024-06-22 15:23:49'),
(15, 11, NULL, '{\"idCliente\":\"6\",\"idEspecie\":\"1\",\"idRaza\":\"1\",\"Mascota\":\"333\",\"FechaNacimiento\":\"2000-05-05T06:30:09.000000Z\",\"Sexo\":\"2\",\"id\":12}', 1, 'mascota', '2024-07-12 05:30:09', '2024-07-12 05:30:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_credito`
--

CREATE TABLE `notas_credito` (
  `id` bigint UNSIGNED NOT NULL,
  `comprobante_id` bigint UNSIGNED DEFAULT NULL,
  `cliente_id` bigint UNSIGNED DEFAULT NULL,
  `serie` int DEFAULT NULL,
  `comprobante` int DEFAULT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'nota-de-credito',
  `motivo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` bigint UNSIGNED NOT NULL,
  `notificacion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `notificacion`, `created_at`, `updated_at`) VALUES
(1, 'Alerta', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`) VALUES
(1, 'cliente_ver_modulo'),
(2, 'cliente_crear'),
(3, 'cliente_editar'),
(4, 'cliente_eliminar'),
(5, 'cliente_ver_auditoria'),
(6, 'venta_ver_modulo'),
(7, 'venta_crear'),
(8, 'venta_eliminar'),
(9, 'mascota_ver_modulo'),
(10, 'mascota_crear'),
(11, 'mascota_editar'),
(12, 'mascota_eliminar'),
(13, 'producto_ver_modulo'),
(14, 'producto_crear'),
(15, 'producto_editar'),
(16, 'producto_eliminar'),
(17, 'producto_ver_auditoria'),
(18, 'evento_ver_modulo'),
(19, 'evento_crear'),
(20, 'evento_editar'),
(21, 'evento_eliminar'),
(22, 'servicio_ver_modulo'),
(23, 'servicio_crear'),
(24, 'servicio_editar'),
(25, 'servicio_eliminar'),
(26, 'proveedor_ver_modulo'),
(27, 'proveedor_crear'),
(28, 'proveedor_editar'),
(29, 'proveedor_eliminar'),
(30, 'inventario_ver_modulo'),
(31, 'inventario_modificar'),
(32, 'usuario_ver_modulo'),
(33, 'usuario_crear'),
(34, 'usuario_editar'),
(35, 'usuario_eliminar'),
(36, 'rol_ver_modulo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_roles`
--

CREATE TABLE `permisos_roles` (
  `id` bigint UNSIGNED NOT NULL,
  `permiso_id` bigint UNSIGNED NOT NULL,
  `rol_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permisos_roles`
--

INSERT INTO `permisos_roles` (`id`, `permiso_id`, `rol_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 2),
(6, 3, 1),
(7, 3, 2),
(8, 4, 1),
(9, 5, 1),
(10, 6, 1),
(11, 6, 2),
(12, 7, 1),
(13, 7, 2),
(14, 8, 1),
(15, 9, 1),
(16, 9, 2),
(17, 9, 3),
(18, 10, 1),
(19, 10, 3),
(20, 11, 1),
(21, 11, 3),
(22, 12, 1),
(23, 12, 3),
(24, 13, 1),
(25, 13, 2),
(26, 14, 1),
(27, 14, 2),
(28, 15, 1),
(29, 15, 2),
(30, 16, 1),
(31, 17, 1),
(32, 18, 1),
(33, 18, 3),
(34, 19, 1),
(35, 19, 3),
(36, 20, 1),
(37, 20, 3),
(38, 21, 1),
(39, 21, 3),
(40, 22, 1),
(41, 22, 2),
(42, 22, 3),
(43, 23, 1),
(44, 23, 2),
(45, 23, 3),
(46, 24, 1),
(47, 24, 2),
(48, 24, 3),
(49, 25, 1),
(50, 25, 3),
(51, 26, 1),
(52, 26, 2),
(53, 27, 1),
(54, 27, 2),
(55, 28, 1),
(56, 28, 2),
(57, 29, 1),
(58, 30, 1),
(59, 30, 2),
(60, 31, 1),
(61, 31, 2),
(62, 32, 1),
(63, 33, 1),
(64, 34, 1),
(65, 35, 1),
(66, 36, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentaciones`
--

CREATE TABLE `presentaciones` (
  `id` bigint UNSIGNED NOT NULL,
  `Presentacion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `presentaciones`
--

INSERT INTO `presentaciones` (`id`, `Presentacion`, `created_at`, `updated_at`) VALUES
(1, 'Caja', NULL, NULL),
(2, 'Tubo', NULL, NULL),
(3, 'Frasco', '2024-05-26 16:43:22', '2024-05-26 16:43:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint UNSIGNED NOT NULL,
  `idProveedor` bigint UNSIGNED NOT NULL,
  `idUnidadMedida` bigint UNSIGNED NOT NULL,
  `idPresentacion` bigint UNSIGNED NOT NULL,
  `idLinea` bigint UNSIGNED NOT NULL,
  `idCategoria` bigint UNSIGNED NOT NULL,
  `idSubCategoria` bigint UNSIGNED DEFAULT NULL,
  `Producto` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Marca` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Contenido` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CodigoDeBarra` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StockMinimo` int NOT NULL,
  `StockMaximo` int NOT NULL,
  `PrecioReferencialCompra` double DEFAULT NULL,
  `PrecioVenta` double DEFAULT NULL,
  `ExoneradoCompra` tinyint(1) NOT NULL,
  `ExoneradoVenta` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `idProveedor`, `idUnidadMedida`, `idPresentacion`, `idLinea`, `idCategoria`, `idSubCategoria`, `Producto`, `Marca`, `Contenido`, `CodigoDeBarra`, `StockMinimo`, `StockMaximo`, `PrecioReferencialCompra`, `PrecioVenta`, `ExoneradoCompra`, `ExoneradoVenta`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, 'MELOSIXAN', 'BAYER', '5', NULL, 5, 10, 20, 30, 0, 0, NULL, NULL, NULL),
(2, 1, 2, 2, 4, 5, NULL, 'Potenza Gel Oral x 120.5 gr', 'BIOMONT', 'gel oral', NULL, 1, 1000, 35.29, 48, 0, 0, NULL, NULL, NULL),
(3, 1, 1, 3, 2, 6, NULL, 'VACUNA HIPRA PV ( PAROVIRUS)', NULL, NULL, NULL, 120, 1, 15, 18, 0, 0, '2024-05-26 16:44:36', '2024-05-30 20:58:58', NULL),
(4, 1, 1, 3, 2, 6, NULL, 'VACUNA HIPRA PV ( PAROVIRUS)', 'VACUNA HIPRA PV ( PAROVIRUS)', 'VACUNA HIPRA PV ( PAROVIRUS)', NULL, 100, 1, 15, 18, 0, 0, '2024-05-26 16:45:22', '2024-05-26 16:45:22', NULL),
(5, 1, 1, 3, 2, 6, NULL, 'VACUNA HIPRA PV ( PAROVIRUS)', 'VACUNA HIPRA PV ( PAROVIRUS)', 'VACUNA HIPRA PV ( PAROVIRUS)', NULL, 100, 1, 18, 15, 0, 0, '2024-05-26 16:45:43', '2024-05-26 16:45:43', NULL),
(6, 1, 1, 3, 2, 6, NULL, 'VACUNA HIPRA PV ( PAROVIRUS)', 'VACUNA HIPRA PV ( PAROVIRUS)', 'VACUNA HIPRA PV ( PAROVIRUS)', '101010', 100, 1, 18, 15, 0, 0, '2024-05-26 16:45:50', '2024-05-26 16:45:50', NULL),
(7, 1, 1, 3, 2, 6, NULL, 'VACUNA HIPRA PV ( PAROVIRUS)', 'VACUNA HIPRA PV ( PAROVIRUS)', 'VACUNA HIPRA PV ( PAROVIRUS)', '101010', 100, 1, 18, 15, 1, 1, '2024-05-26 16:45:59', '2024-05-26 16:45:59', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_galeria`
--

CREATE TABLE `productos_galeria` (
  `id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos_galeria`
--

INSERT INTO `productos_galeria` (`id`, `producto_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 3, 'producto_galeria/prueba_3PNG', '2024-06-07 14:13:31', '2024-06-07 14:13:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_stocks`
--

CREATE TABLE `productos_stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED DEFAULT NULL,
  `almacen_id` bigint UNSIGNED DEFAULT NULL,
  `cantidad` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos_stocks`
--

INSERT INTO `productos_stocks` (`id`, `producto_id`, `almacen_id`, `cantidad`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '2024-05-30 21:01:56', '2024-07-12 04:57:11'),
(2, 2, 1, 160, '2024-06-01 08:58:24', '2024-06-29 08:22:35'),
(3, 4, 1, 100, '2024-06-07 14:08:53', '2024-06-07 14:08:53'),
(4, 3, 1, 5, '2024-06-07 14:12:35', '2024-07-12 04:52:57'),
(5, 6, 1, 20, '2024-06-07 14:12:51', '2024-06-07 14:12:51'),
(6, 5, 2, 150, '2024-07-12 04:53:20', '2024-07-12 04:53:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` bigint UNSIGNED NOT NULL,
  `idFormaDePago` bigint UNSIGNED NOT NULL,
  `Proveedor` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumeroTributario` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TelefonoFijo` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TelefonoMovil` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Web` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Direccion` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CuentaBancaria` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Contacto` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Observacion` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `idFormaDePago`, `Proveedor`, `NumeroTributario`, `TelefonoFijo`, `TelefonoMovil`, `Email`, `Web`, `Direccion`, `CuentaBancaria`, `Contacto`, `Observacion`, `created_at`, `updated_at`) VALUES
(1, 1, 'CANSHOP SAC', '1010101010', '672354', NULL, 'admin@admin.com', NULL, 'av siempre viva 123', NULL, NULL, NULL, '2024-04-20 05:47:02', '2024-04-20 05:47:02'),
(2, 1, 'SERVINSUMOS DE LOS ANDES', '1234567890', '2632179', NULL, 'grz.palacios@gmail.com', NULL, NULL, '23423443534', NULL, NULL, '2024-06-22 15:26:42', '2024-06-22 15:26:42'),
(3, 2, 'aaaaa', '22', '33', '33', 'leivatrigoso@hotmail.com', NULL, '051 calle piura 329', '2222222', 'a333', NULL, '2024-07-12 04:54:33', '2024-07-12 04:54:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id` bigint UNSIGNED NOT NULL,
  `idDepartamento` bigint UNSIGNED NOT NULL,
  `Provincia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id`, `idDepartamento`, `Provincia`, `created_at`, `updated_at`) VALUES
(1, 1, 'BAGUA', NULL, NULL),
(2, 1, 'BONGARA', NULL, NULL),
(3, 1, 'CHACHAPOYAS', NULL, NULL),
(4, 1, 'CONDORCANQUI', NULL, NULL),
(5, 1, 'LUYA', NULL, NULL),
(6, 1, 'RODRIGUEZ DE MENDOZA', NULL, NULL),
(7, 1, 'UTCUBAMBA', NULL, NULL),
(8, 2, 'AIJA', NULL, NULL),
(9, 2, 'ANTONIO RAYMONDI', NULL, NULL),
(10, 2, 'ASUNCION', NULL, NULL),
(11, 2, 'BOLOGNESI', NULL, NULL),
(12, 2, 'CARHUAZ', NULL, NULL),
(13, 2, 'CARLOS FERMIN FITZCARRALD', NULL, NULL),
(14, 2, 'CASMA', NULL, NULL),
(15, 2, 'CORONGO', NULL, NULL),
(16, 2, 'HUARAZ', NULL, NULL),
(17, 2, 'HUARI', NULL, NULL),
(18, 2, 'HUARMEY', NULL, NULL),
(19, 2, 'HUAYLAS', NULL, NULL),
(20, 2, 'MARISCAL LUZURIAGA', NULL, NULL),
(21, 2, 'OCROS', NULL, NULL),
(22, 2, 'PALLASCA', NULL, NULL),
(23, 2, 'POMABAMBA', NULL, NULL),
(24, 2, 'RECUAY', NULL, NULL),
(25, 2, 'SANTA', NULL, NULL),
(26, 2, 'SIHUAS', NULL, NULL),
(27, 2, 'YUNGAY', NULL, NULL),
(28, 3, 'ABANCAY', NULL, NULL),
(29, 3, 'ANDAHUAYLAS', NULL, NULL),
(30, 3, 'ANTABAMBA', NULL, NULL),
(31, 3, 'AYMARAES', NULL, NULL),
(32, 3, 'CHINCHEROS', NULL, NULL),
(33, 3, 'COTABAMBAS', NULL, NULL),
(34, 3, 'GRAU', NULL, NULL),
(35, 4, 'AREQUIPA', NULL, NULL),
(36, 4, 'CAMANA', NULL, NULL),
(37, 4, 'CARAVELI', NULL, NULL),
(38, 4, 'CASTILLA', NULL, NULL),
(39, 4, 'CAYLLOMA', NULL, NULL),
(40, 4, 'CONDESUYOS', NULL, NULL),
(41, 4, 'ISLAY', NULL, NULL),
(42, 4, 'LA UNION', NULL, NULL),
(43, 5, 'CANGALLO', NULL, NULL),
(44, 5, 'HUAMANGA', NULL, NULL),
(45, 5, 'HUANCA SANCOS', NULL, NULL),
(46, 5, 'HUANTA', NULL, NULL),
(47, 5, 'LA MAR', NULL, NULL),
(48, 5, 'LUCANAS', NULL, NULL),
(49, 5, 'PARINACOCHAS', NULL, NULL),
(50, 5, 'PAUCAR DEL SARA SARA', NULL, NULL),
(51, 5, 'SUCRE', NULL, NULL),
(52, 5, 'VICTOR FAJARDO', NULL, NULL),
(53, 5, 'VILCAS HUAMAN', NULL, NULL),
(54, 6, 'CAJABAMBA', NULL, NULL),
(55, 6, 'CAJAMARCA', NULL, NULL),
(56, 6, 'CELENDIN', NULL, NULL),
(57, 6, 'CHOTA', NULL, NULL),
(58, 6, 'CONTUMAZA', NULL, NULL),
(59, 6, 'CUTERVO', NULL, NULL),
(60, 6, 'HUALGAYOC', NULL, NULL),
(61, 6, 'JAEN', NULL, NULL),
(62, 6, 'SAN IGNACIO', NULL, NULL),
(63, 6, 'SAN MARCOS', NULL, NULL),
(64, 6, 'SAN MIGUEL', NULL, NULL),
(65, 6, 'SAN PABLO', NULL, NULL),
(66, 6, 'SANTA CRUZ', NULL, NULL),
(67, 7, 'CALLAO', NULL, NULL),
(68, 8, 'ACOMAYO', NULL, NULL),
(69, 8, 'ANTA', NULL, NULL),
(70, 8, 'CALCA', NULL, NULL),
(71, 8, 'CANAS', NULL, NULL),
(72, 8, 'CANCHIS', NULL, NULL),
(73, 8, 'CHUMBIVILCAS', NULL, NULL),
(74, 8, 'CUSCO', NULL, NULL),
(75, 8, 'ESPINAR', NULL, NULL),
(76, 8, 'LA CONVENCION', NULL, NULL),
(77, 8, 'PARURO', NULL, NULL),
(78, 8, 'PAUCARTAMBO', NULL, NULL),
(79, 8, 'QUISPICANCHI', NULL, NULL),
(80, 8, 'URUBAMBA', NULL, NULL),
(81, 9, 'ACOBAMBA', NULL, NULL),
(82, 9, 'ANGARAES', NULL, NULL),
(83, 9, 'CASTROVIRREYNA', NULL, NULL),
(84, 9, 'CHURCAMPA', NULL, NULL),
(85, 9, 'HUANCAVELICA', NULL, NULL),
(86, 9, 'HUAYTARA', NULL, NULL),
(87, 9, 'TAYACAJA', NULL, NULL),
(88, 10, 'AMBO', NULL, NULL),
(89, 10, 'DOS DE MAYO', NULL, NULL),
(90, 10, 'HUACAYBAMBA', NULL, NULL),
(91, 10, 'HUAMALIES', NULL, NULL),
(92, 10, 'HUANUCO', NULL, NULL),
(93, 10, 'LAURICOCHA', NULL, NULL),
(94, 10, 'LEONCIO PRADO', NULL, NULL),
(95, 10, 'MARAÑON', NULL, NULL),
(96, 10, 'PACHITEA', NULL, NULL),
(97, 10, 'PUERTO INCA', NULL, NULL),
(98, 10, 'YAROWILCA', NULL, NULL),
(99, 11, 'CHINCHA', NULL, NULL),
(100, 11, 'ICA', NULL, NULL),
(101, 11, 'NASCA', NULL, NULL),
(102, 11, 'PALPA', NULL, NULL),
(103, 11, 'PISCO', NULL, NULL),
(104, 12, 'CHANCHAMAYO', NULL, NULL),
(105, 12, 'CHUPACA', NULL, NULL),
(106, 12, 'CONCEPCION', NULL, NULL),
(107, 12, 'HUANCAYO', NULL, NULL),
(108, 12, 'JAUJA', NULL, NULL),
(109, 12, 'JUNIN', NULL, NULL),
(110, 12, 'SATIPO', NULL, NULL),
(111, 12, 'TARMA', NULL, NULL),
(112, 12, 'YAULI', NULL, NULL),
(113, 13, 'ASCOPE', NULL, NULL),
(114, 13, 'BOLIVAR', NULL, NULL),
(115, 13, 'CHEPEN', NULL, NULL),
(116, 13, 'GRAN CHIMU', NULL, NULL),
(117, 13, 'JULCAN', NULL, NULL),
(118, 13, 'OTUZCO', NULL, NULL),
(119, 13, 'PACASMAYO', NULL, NULL),
(120, 13, 'PATAZ', NULL, NULL),
(121, 13, 'SANCHEZ CARRION', NULL, NULL),
(122, 13, 'SANTIAGO DE CHUCO', NULL, NULL),
(123, 13, 'TRUJILLO', NULL, NULL),
(124, 13, 'VIRU', NULL, NULL),
(125, 14, 'CHICLAYO', NULL, NULL),
(126, 14, 'FERREÑAFE', NULL, NULL),
(127, 14, 'LAMBAYEQUE', NULL, NULL),
(128, 15, 'BARRANCA', NULL, NULL),
(129, 15, 'CAJATAMBO', NULL, NULL),
(130, 15, 'CANTA', NULL, NULL),
(131, 15, 'CAÑETE', NULL, NULL),
(132, 15, 'HUARAL', NULL, NULL),
(133, 15, 'HUAROCHIRI', NULL, NULL),
(134, 15, 'HUAURA', NULL, NULL),
(135, 15, 'LIMA', NULL, NULL),
(136, 15, 'OYON', NULL, NULL),
(137, 15, 'YAUYOS', NULL, NULL),
(138, 16, 'ALTO AMAZONAS', NULL, NULL),
(139, 16, 'DATEM DEL MARAÑON', NULL, NULL),
(140, 16, 'LORETO', NULL, NULL),
(141, 16, 'MARISCAL RAMON CASTILLA', NULL, NULL),
(142, 16, 'MAYNAS', NULL, NULL),
(143, 16, 'PUTUMAYO', NULL, NULL),
(144, 16, 'REQUENA', NULL, NULL),
(145, 16, 'UCAYALI', NULL, NULL),
(146, 17, 'MANU', NULL, NULL),
(147, 17, 'TAHUAMANU', NULL, NULL),
(148, 17, 'TAMBOPATA', NULL, NULL),
(149, 18, 'GENERAL SANCHEZ CERRO', NULL, NULL),
(150, 18, 'ILO', NULL, NULL),
(151, 18, 'MARISCAL NIETO', NULL, NULL),
(152, 19, 'DANIEL ALCIDES CARRION', NULL, NULL),
(153, 19, 'OXAPAMPA', NULL, NULL),
(154, 19, 'PASCO', NULL, NULL),
(155, 20, 'AYABACA', NULL, NULL),
(156, 20, 'HUANCABAMBA', NULL, NULL),
(157, 20, 'MORROPON', NULL, NULL),
(158, 20, 'PAITA', NULL, NULL),
(159, 20, 'PIURA', NULL, NULL),
(160, 20, 'SECHURA', NULL, NULL),
(161, 20, 'SULLANA', NULL, NULL),
(162, 20, 'TALARA', NULL, NULL),
(163, 21, 'AZANGARO', NULL, NULL),
(164, 21, 'CARABAYA', NULL, NULL),
(165, 21, 'CHUCUITO', NULL, NULL),
(166, 21, 'EL COLLAO', NULL, NULL),
(167, 21, 'HUANCANE', NULL, NULL),
(168, 21, 'LAMPA', NULL, NULL),
(169, 21, 'MELGAR', NULL, NULL),
(170, 21, 'MOHO', NULL, NULL),
(171, 21, 'PUNO', NULL, NULL),
(172, 21, 'SAN ANTONIO DE PUTINA', NULL, NULL),
(173, 21, 'SAN ROMAN', NULL, NULL),
(174, 21, 'SANDIA', NULL, NULL),
(175, 21, 'YUNGUYO', NULL, NULL),
(176, 22, 'BELLAVISTA', NULL, NULL),
(177, 22, 'EL DORADO', NULL, NULL),
(178, 22, 'HUALLAGA', NULL, NULL),
(179, 22, 'LAMAS', NULL, NULL),
(180, 22, 'MARISCAL CACERES', NULL, NULL),
(181, 22, 'MOYOBAMBA', NULL, NULL),
(182, 22, 'PICOTA', NULL, NULL),
(183, 22, 'RIOJA', NULL, NULL),
(184, 22, 'SAN MARTIN', NULL, NULL),
(185, 22, 'TOCACHE', NULL, NULL),
(186, 23, 'CANDARAVE', NULL, NULL),
(187, 23, 'JORGE BASADRE', NULL, NULL),
(188, 23, 'TACNA', NULL, NULL),
(189, 23, 'TARATA', NULL, NULL),
(190, 24, 'CONTRALMIRANTE VILLAR', NULL, NULL),
(191, 24, 'TUMBES', NULL, NULL),
(192, 24, 'ZARUMILLA', NULL, NULL),
(193, 25, 'ATALAYA', NULL, NULL),
(194, 25, 'CORONEL PORTILLO', NULL, NULL),
(195, 25, 'PADRE ABAD', NULL, NULL),
(196, 25, 'PURUS', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razas`
--

CREATE TABLE `razas` (
  `id` bigint UNSIGNED NOT NULL,
  `idEspecie` bigint UNSIGNED NOT NULL,
  `Raza` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `razas`
--

INSERT INTO `razas` (`id`, `idEspecie`, `Raza`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pekines', NULL, NULL),
(2, 2, 'Criollo', NULL, NULL),
(3, 3, 'Loro', NULL, NULL),
(4, 4, 'Hamster', '2024-06-15 15:00:22', '2024-06-15 15:00:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `codigo`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'administrador', NULL, NULL),
(2, 'Vendedor', 'vendedor', NULL, NULL),
(3, 'Doctor', 'doctor', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id`, `nombre`) VALUES
(1, 'Sede Chorrillos'),
(2, 'Sede Lurin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` bigint UNSIGNED NOT NULL,
  `idLinea` bigint UNSIGNED NOT NULL,
  `idCategoria` bigint UNSIGNED NOT NULL,
  `idSubCategoria` bigint UNSIGNED DEFAULT NULL,
  `Servicio` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CostoServicio` double NOT NULL,
  `PrecioServicio` double NOT NULL,
  `ExoneradoImpuestos` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `idLinea`, `idCategoria`, `idSubCategoria`, `Servicio`, `CostoServicio`, `PrecioServicio`, `ExoneradoImpuestos`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 4, NULL, 'Baño perro grande', 100, 180, 0, NULL, '2024-06-07 14:39:47', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('cuOHqaGQgjNndYGYC0cDGAWFY9TdvSqqymJ4bHU8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidGhCWExjYVFXRDliam43VG1xcUROWHlNdm5wemt6eWdzNFRWNmM2TyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO319', 1720765993);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_categorias`
--

CREATE TABLE `sub_categorias` (
  `id` bigint UNSIGNED NOT NULL,
  `idCategoria` bigint UNSIGNED NOT NULL,
  `SubCategoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sub_categorias`
--

INSERT INTO `sub_categorias` (`id`, `idCategoria`, `SubCategoria`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pastilla', NULL, NULL),
(2, 3, 'Neurologica', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_almacenes`
--

CREATE TABLE `tipos_almacenes` (
  `id` bigint UNSIGNED NOT NULL,
  `TipoAlmacen` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_almacenes`
--

INSERT INTO `tipos_almacenes` (`id`, `TipoAlmacen`, `created_at`, `updated_at`) VALUES
(1, 'Sede Chorrillos', NULL, NULL),
(2, 'Sede Lurirn', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_comprobantes`
--

CREATE TABLE `tipos_comprobantes` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_comprobantes`
--

INSERT INTO `tipos_comprobantes` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'BOLETA', NULL, NULL),
(2, 'FACTURA', NULL, NULL),
(3, 'NOTA_VENTA', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_eventos`
--

CREATE TABLE `tipos_eventos` (
  `id` bigint UNSIGNED NOT NULL,
  `TipoEvento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_eventos`
--

INSERT INTO `tipos_eventos` (`id`, `TipoEvento`, `created_at`, `updated_at`) VALUES
(1, 'Consulta', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_historias_clinicas`
--

CREATE TABLE `tipos_historias_clinicas` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_historias_clinicas`
--

INSERT INTO `tipos_historias_clinicas` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Consulta', NULL, NULL),
(2, 'Control', NULL, NULL),
(3, 'Cirugia', NULL, NULL),
(4, 'Vacuna', NULL, NULL),
(5, 'Antiparasitario', NULL, NULL),
(6, 'Antipulgas', NULL, NULL),
(7, 'Tratamiento', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_movimientos`
--

CREATE TABLE `tipos_movimientos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_movimientos`
--

INSERT INTO `tipos_movimientos` (`id`, `nombre`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Venta', 'venta', '2024-05-26 09:57:40', '2024-05-26 09:57:40'),
(2, 'Compra', 'compra', '2024-05-26 09:57:40', '2024-05-26 09:57:40'),
(3, 'Anulación', 'anulacion', '2024-05-26 09:57:40', '2024-05-26 09:57:40'),
(4, 'Directo', 'directo', '2024-05-26 09:57:40', '2024-05-26 09:57:40'),
(5, 'Cliente Edicion', 'cliente-edicion', '2024-05-26 09:57:41', '2024-05-26 09:57:41'),
(6, 'Cliente Creacion', 'cliente-creacion', '2024-05-26 09:57:41', '2024-05-26 09:57:41'),
(7, 'Servicio Creacion', 'servicio-creacion', '2024-05-26 09:57:41', '2024-05-26 09:57:41'),
(8, 'Servicio Edicion', 'servicio-edicion', '2024-05-26 09:57:41', '2024-05-26 09:57:41'),
(9, 'Producto Edicion', 'producto-edicion', '2024-05-26 09:57:41', '2024-05-26 09:57:41'),
(10, 'Producto Creacion', 'producto-creacion', '2024-05-26 09:57:41', '2024-05-26 09:57:41'),
(11, 'Mascota Creacion', 'mascota-creacion', '2024-05-26 09:57:41', '2024-05-26 09:57:41'),
(12, 'Mascota Edicion', 'mascota-edicion', '2024-05-26 09:57:41', '2024-05-26 09:57:41'),
(13, 'Cliente Eliminacion', 'cliente-eliminacion', '2024-06-22 09:23:22', '2024-06-22 09:23:22'),
(14, 'Servicio Eliminacion', 'servicio-eliminacion', '2024-06-22 09:23:22', '2024-06-22 09:23:22'),
(15, 'Producto Eliminacion', 'producto-eliminacion', '2024-06-22 09:23:22', '2024-06-22 09:23:22'),
(16, 'Mascota Eliminacion', 'mascota-eliminacion', '2024-06-22 09:23:22', '2024-06-22 09:23:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_operaciones`
--

CREATE TABLE `tipos_operaciones` (
  `id` bigint UNSIGNED NOT NULL,
  `TipoMovimiento` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TipoOperacion` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos_mascotas`
--

CREATE TABLE `tratamientos_mascotas` (
  `id` bigint UNSIGNED NOT NULL,
  `mascota_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` int DEFAULT NULL,
  `historia_clinica_id` bigint UNSIGNED NOT NULL,
  `observacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipo_historia_clinica_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tratamientos_mascotas`
--

INSERT INTO `tratamientos_mascotas` (`id`, `mascota_id`, `producto_id`, `cantidad`, `historia_clinica_id`, `observacion`, `created_at`, `updated_at`, `tipo_historia_clinica_id`) VALUES
(1, 1, 2, NULL, 1, NULL, NULL, NULL, 7),
(2, 1, 1, NULL, 2, NULL, NULL, NULL, 4),
(3, 1, 2, NULL, 3, 'cada 12 dias', NULL, NULL, 6),
(4, 2, 4, NULL, 4, '1 x 7 dias', NULL, NULL, 4),
(5, 1, 3, NULL, 5, '1 cada 7 dias', NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_medidas`
--

CREATE TABLE `unidades_medidas` (
  `id` bigint UNSIGNED NOT NULL,
  `UnidadMedida` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidades_medidas`
--

INSERT INTO `unidades_medidas` (`id`, `UnidadMedida`, `created_at`, `updated_at`) VALUES
(1, 'ML', NULL, NULL),
(2, 'GR', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rol_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `sede_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `rol_id`, `sede_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$3z6.iST.Vye0DtzCvew/5esg0dSgP5he4UENDvFngQnI4EdCzm11S', NULL, 1, 2, NULL, '2024-07-12 05:23:32', NULL),
(2, 'dennis', 'jose@gmail.com', NULL, '$2y$12$3E.cqjxs/R/cXFieM8y0qOC7.FH9KDkUJG5dEaYkumul.QWaw6sem', NULL, 1, 2, '2024-05-26 09:59:29', '2024-07-12 05:23:21', NULL),
(3, 'Paolo', 'doctor@gmail.com', NULL, '$2y$12$DruJlgmYEAMV7FYSfCPLfenJWyvDE6yY7vGXIZdbkXc3y2ap9f/GS', NULL, 3, 2, '2024-06-15 15:48:25', '2024-07-12 05:24:21', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED NOT NULL,
  `estado_id` bigint UNSIGNED DEFAULT NULL,
  `medio_pago_id` bigint UNSIGNED DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `impuestos` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `facturada` tinyint(1) DEFAULT NULL,
  `notificada` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `cliente_id`, `usuario_id`, `estado_id`, `medio_pago_id`, `subtotal`, `impuestos`, `total`, `facturada`, `notificada`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, NULL, 198.00, 42.00, 240.00, NULL, NULL, '2024-05-26 10:14:11', '2024-05-26 10:15:34'),
(2, 3, 1, 1, NULL, 150.00, 21.00, 171.00, NULL, NULL, '2024-05-26 10:16:13', '2024-05-26 10:16:32'),
(3, 1, 1, 1, NULL, 48.00, 21.00, 69.00, NULL, NULL, '2024-05-26 10:17:17', '2024-05-26 14:24:03'),
(4, 3, 1, 1, NULL, 150.00, 21.00, 171.00, NULL, NULL, '2024-05-26 10:53:51', '2024-05-26 10:54:18'),
(5, 1, 1, 1, NULL, 198.00, 42.00, 240.00, NULL, NULL, '2024-05-26 10:55:12', '2024-05-26 10:55:29'),
(6, 3, 1, 1, NULL, 150.00, 21.00, 171.00, NULL, NULL, '2024-05-26 14:24:49', '2024-05-26 14:25:12'),
(7, 1, 1, 1, NULL, 48.00, 21.00, 69.00, NULL, NULL, '2024-05-26 14:26:08', '2024-05-26 14:26:36'),
(8, 3, 1, 1, NULL, 150.00, 21.00, 171.00, NULL, NULL, '2024-05-26 16:35:20', '2024-05-26 16:35:52'),
(9, 2, 1, 1, NULL, 48.00, 21.00, 69.00, NULL, NULL, '2024-05-26 16:49:53', '2024-05-26 16:50:20'),
(10, 3, 1, 1, NULL, 48.00, 21.00, 69.00, NULL, NULL, '2024-05-26 16:54:49', '2024-05-26 16:55:32'),
(11, 2, 1, 2, NULL, 216.00, 63.00, 279.00, NULL, NULL, '2024-05-26 16:59:50', '2024-05-26 16:59:50'),
(12, 2, 1, 1, NULL, 48.00, 21.00, 69.00, NULL, NULL, '2024-05-26 17:00:27', '2024-05-26 17:01:02'),
(13, 1, 1, 1, NULL, 150.00, 21.00, 171.00, NULL, NULL, '2024-05-26 17:03:03', '2024-05-26 17:04:02'),
(14, 1, 1, 1, NULL, 66.00, 42.00, 108.00, NULL, NULL, '2024-05-26 18:07:48', '2024-05-26 18:09:50'),
(15, 2, 1, 2, NULL, 216.00, 63.00, 279.00, NULL, NULL, '2024-05-26 18:15:17', '2024-05-26 18:15:17'),
(16, 3, 1, 1, NULL, 48.00, 21.00, 69.00, NULL, NULL, '2024-05-30 21:03:13', '2024-05-30 21:03:30'),
(17, 1, 1, 1, NULL, 30.00, 21.00, 51.00, NULL, NULL, '2024-06-01 08:33:18', '2024-06-01 08:33:41'),
(18, 3, 1, 1, NULL, 30.00, 21.00, 51.00, NULL, NULL, '2024-06-01 08:39:12', '2024-06-01 08:40:31'),
(19, 3, 1, 1, NULL, 30.00, 21.00, 51.00, NULL, NULL, '2024-06-01 09:25:35', '2024-06-01 09:26:27'),
(20, 3, 1, 1, NULL, 78.00, 42.00, 120.00, NULL, NULL, '2024-06-07 14:16:47', '2024-06-07 14:17:04'),
(21, 3, 1, 1, NULL, 18.00, 3.24, 21.24, NULL, NULL, '2024-06-15 08:15:03', '2024-06-15 08:15:15'),
(22, 1, 1, 1, NULL, 180.00, 32.40, 212.40, NULL, NULL, '2024-06-15 08:40:06', '2024-06-15 08:40:59'),
(23, 2, 1, 2, NULL, 6000.00, 1080.00, 6108.00, NULL, NULL, '2024-06-15 09:38:23', '2024-06-15 09:38:23'),
(24, 4, 1, 2, NULL, 0.00, 0.00, 0.00, NULL, NULL, '2024-06-15 09:38:59', '2024-06-15 09:38:59'),
(25, 3, 1, 1, NULL, 14940.00, 2689.20, 15204.60, NULL, NULL, '2024-06-15 09:39:28', '2024-06-15 09:39:43'),
(26, 1, 1, 1, NULL, 48.00, 8.64, 56.64, NULL, NULL, '2024-06-15 09:50:23', '2024-06-15 09:50:35'),
(27, 6, 1, 1, NULL, 30.00, 5.40, 35.40, NULL, NULL, '2024-06-15 15:27:37', '2024-06-15 15:28:04'),
(28, 2, 1, 1, NULL, 48.00, 8.64, 56.64, NULL, NULL, '2024-06-15 16:10:22', '2024-06-15 16:10:58'),
(29, 1, 1, 1, NULL, 48.00, 8.64, 56.64, NULL, NULL, '2024-06-18 17:55:45', '2024-06-18 17:56:00'),
(30, 3, 1, 1, NULL, 18.00, 3.24, 21.24, NULL, NULL, '2024-06-18 17:59:03', '2024-06-18 17:59:14'),
(31, 7, 1, 2, NULL, 0.00, 0.00, 0.00, NULL, NULL, '2024-06-18 19:35:32', '2024-06-18 19:35:32'),
(32, 7, 1, 1, NULL, 96.00, 17.28, 104.64, NULL, NULL, '2024-06-18 19:41:45', '2024-06-18 19:41:58'),
(33, 3, 2, 1, NULL, 48.00, 8.64, 56.64, NULL, NULL, '2024-06-22 09:29:27', '2024-06-22 09:29:44'),
(35, 3, 2, 1, NULL, 192.00, 34.56, 192.00, NULL, NULL, '2024-06-22 15:18:03', '2024-06-22 15:19:03'),
(36, 2, 2, 1, NULL, 1620.00, 291.60, 1649.16, NULL, NULL, '2024-06-22 15:20:50', '2024-06-22 15:21:06'),
(37, 9, 2, 1, NULL, 480.00, 86.40, 488.64, NULL, NULL, '2024-06-22 15:24:38', '2024-06-22 15:24:47'),
(38, 1, 2, 1, NULL, 480.00, 86.40, 488.64, NULL, NULL, '2024-06-24 20:10:54', '2024-06-24 20:11:05'),
(39, 1, 2, 1, NULL, 96.00, 17.28, 147.84, NULL, NULL, '2024-06-24 20:12:03', '2024-06-24 20:12:12'),
(40, 1, 2, 1, NULL, 96.00, 17.28, 104.64, NULL, NULL, '2024-06-24 20:16:53', '2024-06-24 20:17:04'),
(41, 6, 2, 1, NULL, 288.00, 51.84, 339.84, NULL, NULL, '2024-06-29 08:22:35', '2024-06-29 08:24:06'),
(42, 2, 2, 2, NULL, 30.00, 5.40, 35.40, NULL, NULL, '2024-07-12 04:57:11', '2024-07-12 04:57:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_items`
--

CREATE TABLE `ventas_items` (
  `id` bigint UNSIGNED NOT NULL,
  `venta_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED DEFAULT NULL,
  `servicio_id` bigint UNSIGNED DEFAULT NULL,
  `mascota_id` bigint UNSIGNED DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `impuestos` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas_items`
--

INSERT INTO `ventas_items` (`id`, `venta_id`, `producto_id`, `servicio_id`, `mascota_id`, `subtotal`, `cantidad`, `impuestos`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, 1, 48.00, 1.00, 21.00, 69.00, '2024-05-26 10:14:11', NULL),
(2, 1, NULL, 1, 1, 150.00, 1.00, 21.00, 171.00, '2024-05-26 10:14:11', NULL),
(3, 2, 1, NULL, 5, 150.00, 5.00, 21.00, 171.00, '2024-05-26 10:16:13', NULL),
(4, 3, 2, NULL, 4, 48.00, 1.00, 21.00, 69.00, '2024-05-26 10:17:17', NULL),
(5, 4, NULL, 1, 5, 150.00, 1.00, 21.00, 171.00, '2024-05-26 10:53:51', NULL),
(6, 5, 2, NULL, 4, 48.00, 1.00, 21.00, 69.00, '2024-05-26 10:55:12', NULL),
(7, 5, NULL, 1, 4, 150.00, 1.00, 21.00, 171.00, '2024-05-26 10:55:12', NULL),
(8, 6, NULL, 1, 5, 150.00, 1.00, 21.00, 171.00, '2024-05-26 14:24:49', NULL),
(9, 7, 2, NULL, 4, 48.00, 1.00, 21.00, 69.00, '2024-05-26 14:26:08', NULL),
(10, 8, NULL, 1, 5, 150.00, 1.00, 21.00, 171.00, '2024-05-26 16:35:20', NULL),
(11, 9, 2, NULL, 1, 48.00, 1.00, 21.00, 69.00, '2024-05-26 16:49:53', NULL),
(12, 10, 2, NULL, 5, 48.00, 1.00, 21.00, 69.00, '2024-05-26 16:54:49', NULL),
(13, 11, 3, NULL, 1, 18.00, 1.00, 21.00, 39.00, '2024-05-26 16:59:50', NULL),
(14, 11, 2, NULL, 1, 48.00, 1.00, 21.00, 69.00, '2024-05-26 16:59:50', NULL),
(15, 11, NULL, 1, 1, 150.00, 1.00, 21.00, 171.00, '2024-05-26 16:59:50', NULL),
(16, 12, 2, NULL, 1, 48.00, 1.00, 21.00, 69.00, '2024-05-26 17:00:27', NULL),
(17, 13, NULL, 1, 4, 150.00, 1.00, 21.00, 171.00, '2024-05-26 17:03:03', NULL),
(18, 14, 2, NULL, 4, 48.00, 1.00, 21.00, 69.00, '2024-05-26 18:07:48', NULL),
(19, 14, 3, NULL, 4, 18.00, 1.00, 21.00, 39.00, '2024-05-26 18:07:48', NULL),
(20, 15, 2, NULL, 1, 48.00, 1.00, 21.00, 69.00, '2024-05-26 18:15:17', NULL),
(21, 15, 4, NULL, 1, 18.00, 1.00, 21.00, 39.00, '2024-05-26 18:15:17', NULL),
(22, 15, NULL, 1, 1, 150.00, 1.00, 21.00, 171.00, '2024-05-26 18:15:17', NULL),
(23, 16, 2, NULL, 5, 48.00, 1.00, 21.00, 69.00, '2024-05-30 21:03:13', NULL),
(24, 17, 1, NULL, 4, 30.00, 1.00, 21.00, 51.00, '2024-06-01 08:33:18', NULL),
(25, 18, 1, NULL, 5, 30.00, 1.00, 21.00, 51.00, '2024-06-01 08:39:12', NULL),
(26, 19, 1, NULL, 5, 30.00, 1.00, 21.00, 51.00, '2024-06-01 09:25:35', NULL),
(27, 20, 1, NULL, 5, 30.00, 1.00, 21.00, 51.00, '2024-06-07 14:16:47', NULL),
(28, 20, 2, NULL, 5, 48.00, 1.00, 21.00, 69.00, '2024-06-07 14:16:47', NULL),
(29, 21, 3, NULL, 5, 18.00, 1.00, 3.24, 21.24, '2024-06-15 08:15:03', NULL),
(30, 22, NULL, 1, 4, 180.00, 1.00, 32.40, 212.40, '2024-06-15 08:40:06', NULL),
(31, 23, 1, NULL, 1, 6000.00, 200.00, 1080.00, 6108.00, '2024-06-15 09:38:23', NULL),
(33, 25, 1, NULL, 5, 14940.00, 498.00, 2689.20, 15204.60, '2024-06-15 09:39:28', NULL),
(34, 26, 2, NULL, 4, 48.00, 1.00, 8.64, 56.64, '2024-06-15 09:50:23', NULL),
(35, 27, 1, NULL, 6, 30.00, 1.00, 5.40, 35.40, '2024-06-15 15:27:37', NULL),
(36, 28, 2, NULL, 1, 48.00, 1.00, 8.64, 56.64, '2024-06-15 16:10:22', NULL),
(37, 29, 2, NULL, 4, 48.00, 1.00, 8.64, 56.64, '2024-06-18 17:55:46', NULL),
(38, 30, 3, NULL, 5, 18.00, 1.00, 3.24, 21.24, '2024-06-18 17:59:03', NULL),
(40, 32, 2, NULL, 7, 96.00, 2.00, 17.28, 104.64, '2024-06-18 19:41:45', NULL),
(41, 33, 2, NULL, 5, 48.00, 1.00, 8.64, 56.64, '2024-06-22 09:29:27', NULL),
(43, 35, 2, NULL, NULL, 192.00, 4.00, 34.56, 192.00, '2024-06-22 15:18:03', NULL),
(44, 36, 3, NULL, 1, 1620.00, 90.00, 291.60, 1649.16, '2024-06-22 15:20:50', NULL),
(45, 37, 2, NULL, NULL, 480.00, 10.00, 86.40, 488.64, '2024-06-22 15:24:38', NULL),
(46, 38, 2, NULL, 8, 480.00, 10.00, 86.40, 488.64, '2024-06-24 20:10:54', NULL),
(47, 39, 2, NULL, 8, 96.00, 2.00, 17.28, 147.84, '2024-06-24 20:12:03', NULL),
(48, 40, 2, NULL, 8, 96.00, 2.00, 17.28, 104.64, '2024-06-24 20:16:53', NULL),
(49, 41, 2, NULL, 6, 288.00, 6.00, 51.84, 339.84, '2024-06-29 08:22:35', NULL),
(50, 42, 1, NULL, 1, 30.00, 1.00, 5.40, 35.40, '2024-07-12 04:57:11', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `almacenes_sede_id_foreign` (`sede_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cajas_comprobante_id_foreign` (`comprobante_id`),
  ADD KEY `cajas_tipo_movimiento_id_foreign` (`tipo_movimiento_id`),
  ADD KEY `cajas_medio_pago_id_foreign` (`medio_pago_id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorias_idlinea_foreign` (`IdLinea`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_iddepartamento_foreign` (`idDepartamento`),
  ADD KEY `clientes_idprovincia_foreign` (`idProvincia`),
  ADD KEY `clientes_iddistrito_foreign` (`idDistrito`);

--
-- Indices de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comprobantes_venta_id_foreign` (`venta_id`),
  ADD KEY `comprobantes_cliente_id_foreign` (`cliente_id`),
  ADD KEY `comprobantes_tipo_id_foreign` (`tipo_id`);

--
-- Indices de la tabla `comprobantes_pagos`
--
ALTER TABLE `comprobantes_pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comprobantes_pagos_comprobante_id_foreign` (`comprobante_id`),
  ADD KEY `comprobantes_pagos_medio_pago_id_foreign` (`medio_pago_id`),
  ADD KEY `comprobantes_pagos_tipo_movimiento_id_foreign` (`tipo_movimiento_id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_historia_clinicas`
--
ALTER TABLE `detalle_historia_clinicas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_historia_clinicas_idhistoriaclinica_foreign` (`idHistoriaClinica`),
  ADD KEY `detalle_historia_clinicas_idtipohistoriaclinica_foreign` (`idTipoHistoriaClinica`);

--
-- Indices de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `diagnosticos_mascotas`
--
ALTER TABLE `diagnosticos_mascotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diagnosticos_mascotas_diagnostico_id_foreign` (`diagnostico_id`),
  ADD KEY `diagnosticos_mascotas_mascota_id_foreign` (`mascota_id`),
  ADD KEY `diagnosticos_mascotas_historia_clinica_id_foreign` (`historia_clinica_id`);

--
-- Indices de la tabla `dias_preferidos`
--
ALTER TABLE `dias_preferidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distritos_idprovincia_foreign` (`idProvincia`);

--
-- Indices de la tabla `especies`
--
ALTER TABLE `especies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estados_eventos`
--
ALTER TABLE `estados_eventos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estados_ventas`
--
ALTER TABLE `estados_ventas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eventos_idcliente_foreign` (`idCliente`),
  ADD KEY `eventos_idmascota_foreign` (`idMascota`),
  ADD KEY `eventos_idtipoevento_foreign` (`idTipoEvento`),
  ADD KEY `eventos_idestadoevento_foreign` (`idEstadoEvento`),
  ADD KEY `eventos_idusuario_foreign` (`idUsuario`),
  ADD KEY `eventos_idnotificacion_foreign` (`idNotificacion`);

--
-- Indices de la tabla `examenes_auxiliares`
--
ALTER TABLE `examenes_auxiliares`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `examenes_auxiliares_mascotas`
--
ALTER TABLE `examenes_auxiliares_mascotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examenes_auxiliares_mascotas_mascota_id_foreign` (`mascota_id`),
  ADD KEY `examenes_auxiliares_mascotas_examen_auxiliar_id_foreign` (`examen_auxiliar_id`),
  ADD KEY `examenes_auxiliares_mascotas_historia_clinica_id_foreign` (`historia_clinica_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `formas_pagos`
--
ALTER TABLE `formas_pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `frecuencias`
--
ALTER TABLE `frecuencias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historias_clinicas_idmascota_foreign` (`idMascota`),
  ADD KEY `historias_clinicas_tipo_historia_clinica_id_foreign` (`tipo_historia_clinica_id`);

--
-- Indices de la tabla `historia_clinica_adjuntos`
--
ALTER TABLE `historia_clinica_adjuntos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventarios_idusuario_foreign` (`idUsuario`),
  ADD KEY `inventarios_idalmacen_foreign` (`idAlmacen`),
  ADD KEY `inventarios_idtipooperacion_foreign` (`idTipoOperacion`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lineas`
--
ALTER TABLE `lineas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lotes_idalmacen_foreign` (`idAlmacen`),
  ADD KEY `lotes_idproducto_foreign` (`idProducto`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mascotas_idcliente_foreign` (`idCliente`),
  ADD KEY `mascotas_idespecie_foreign` (`idEspecie`),
  ADD KEY `mascotas_idraza_foreign` (`idRaza`),
  ADD KEY `mascotas_idfrecuencia_foreign` (`idFrecuencia`),
  ADD KEY `mascotas_iddiapreferido_foreign` (`idDiaPreferido`);

--
-- Indices de la tabla `mascota_galeria`
--
ALTER TABLE `mascota_galeria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mascota_galeria_mascota_id_foreign` (`mascota_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movimientos_tipo_movimiento_id_foreign` (`tipo_movimiento_id`),
  ADD KEY `movimientos_usuario_id_foreign` (`usuario_id`);

--
-- Indices de la tabla `notas_credito`
--
ALTER TABLE `notas_credito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notas_credito_comprobante_id_foreign` (`comprobante_id`),
  ADD KEY `notas_credito_cliente_id_foreign` (`cliente_id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos_roles`
--
ALTER TABLE `permisos_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permisos_roles_permiso_id_foreign` (`permiso_id`),
  ADD KEY `permisos_roles_rol_id_foreign` (`rol_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `presentaciones`
--
ALTER TABLE `presentaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_idproveedor_foreign` (`idProveedor`),
  ADD KEY `productos_idunidadmedida_foreign` (`idUnidadMedida`),
  ADD KEY `productos_idpresentacion_foreign` (`idPresentacion`),
  ADD KEY `productos_idlinea_foreign` (`idLinea`),
  ADD KEY `productos_idcategoria_foreign` (`idCategoria`),
  ADD KEY `productos_idsubcategoria_foreign` (`idSubCategoria`);

--
-- Indices de la tabla `productos_galeria`
--
ALTER TABLE `productos_galeria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_galeria_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `productos_stocks`
--
ALTER TABLE `productos_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_stocks_producto_id_foreign` (`producto_id`),
  ADD KEY `productos_stocks_almacen_id_foreign` (`almacen_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveedores_idformadepago_foreign` (`idFormaDePago`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provincias_iddepartamento_foreign` (`idDepartamento`);

--
-- Indices de la tabla `razas`
--
ALTER TABLE `razas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `razas_idespecie_foreign` (`idEspecie`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicios_idlinea_foreign` (`idLinea`),
  ADD KEY `servicios_idcategoria_foreign` (`idCategoria`),
  ADD KEY `servicios_idsubcategoria_foreign` (`idSubCategoria`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `sub_categorias`
--
ALTER TABLE `sub_categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categorias_idcategoria_foreign` (`idCategoria`);

--
-- Indices de la tabla `tipos_almacenes`
--
ALTER TABLE `tipos_almacenes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_comprobantes`
--
ALTER TABLE `tipos_comprobantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_eventos`
--
ALTER TABLE `tipos_eventos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_historias_clinicas`
--
ALTER TABLE `tipos_historias_clinicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_movimientos`
--
ALTER TABLE `tipos_movimientos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_operaciones`
--
ALTER TABLE `tipos_operaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tratamientos_mascotas`
--
ALTER TABLE `tratamientos_mascotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tratamientos_mascotas_mascota_id_foreign` (`mascota_id`),
  ADD KEY `tratamientos_mascotas_producto_id_foreign` (`producto_id`),
  ADD KEY `tratamientos_mascotas_historia_clinica_id_foreign` (`historia_clinica_id`),
  ADD KEY `tratamientos_mascotas_tipo_historia_clinica_id_foreign` (`tipo_historia_clinica_id`);

--
-- Indices de la tabla `unidades_medidas`
--
ALTER TABLE `unidades_medidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_rol_id_foreign` (`rol_id`),
  ADD KEY `users_sede_id_foreign` (`sede_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_cliente_id_foreign` (`cliente_id`),
  ADD KEY `ventas_estado_id_foreign` (`estado_id`),
  ADD KEY `ventas_usuario_id_foreign` (`usuario_id`);

--
-- Indices de la tabla `ventas_items`
--
ALTER TABLE `ventas_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_items_venta_id_foreign` (`venta_id`),
  ADD KEY `ventas_items_producto_id_foreign` (`producto_id`),
  ADD KEY `ventas_items_servicio_id_foreign` (`servicio_id`),
  ADD KEY `ventas_items_mascota_id_foreign` (`mascota_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `comprobantes_pagos`
--
ALTER TABLE `comprobantes_pagos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `detalle_historia_clinicas`
--
ALTER TABLE `detalle_historia_clinicas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `diagnosticos_mascotas`
--
ALTER TABLE `diagnosticos_mascotas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `dias_preferidos`
--
ALTER TABLE `dias_preferidos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `distritos`
--
ALTER TABLE `distritos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1876;

--
-- AUTO_INCREMENT de la tabla `especies`
--
ALTER TABLE `especies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estados_eventos`
--
ALTER TABLE `estados_eventos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estados_ventas`
--
ALTER TABLE `estados_ventas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `examenes_auxiliares`
--
ALTER TABLE `examenes_auxiliares`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `examenes_auxiliares_mascotas`
--
ALTER TABLE `examenes_auxiliares_mascotas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formas_pagos`
--
ALTER TABLE `formas_pagos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `frecuencias`
--
ALTER TABLE `frecuencias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `historia_clinica_adjuntos`
--
ALTER TABLE `historia_clinica_adjuntos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lineas`
--
ALTER TABLE `lineas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `lotes`
--
ALTER TABLE `lotes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `mascota_galeria`
--
ALTER TABLE `mascota_galeria`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `notas_credito`
--
ALTER TABLE `notas_credito`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `permisos_roles`
--
ALTER TABLE `permisos_roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presentaciones`
--
ALTER TABLE `presentaciones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productos_galeria`
--
ALTER TABLE `productos_galeria`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos_stocks`
--
ALTER TABLE `productos_stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT de la tabla `razas`
--
ALTER TABLE `razas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sub_categorias`
--
ALTER TABLE `sub_categorias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipos_almacenes`
--
ALTER TABLE `tipos_almacenes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipos_comprobantes`
--
ALTER TABLE `tipos_comprobantes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipos_eventos`
--
ALTER TABLE `tipos_eventos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipos_historias_clinicas`
--
ALTER TABLE `tipos_historias_clinicas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipos_movimientos`
--
ALTER TABLE `tipos_movimientos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tipos_operaciones`
--
ALTER TABLE `tipos_operaciones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tratamientos_mascotas`
--
ALTER TABLE `tratamientos_mascotas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `unidades_medidas`
--
ALTER TABLE `unidades_medidas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `ventas_items`
--
ALTER TABLE `ventas_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD CONSTRAINT `almacenes_sede_id_foreign` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD CONSTRAINT `cajas_comprobante_id_foreign` FOREIGN KEY (`comprobante_id`) REFERENCES `comprobantes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cajas_medio_pago_id_foreign` FOREIGN KEY (`medio_pago_id`) REFERENCES `formas_pagos` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cajas_tipo_movimiento_id_foreign` FOREIGN KEY (`tipo_movimiento_id`) REFERENCES `tipos_movimientos` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_idlinea_foreign` FOREIGN KEY (`IdLinea`) REFERENCES `lineas` (`id`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_iddepartamento_foreign` FOREIGN KEY (`idDepartamento`) REFERENCES `departamentos` (`id`),
  ADD CONSTRAINT `clientes_iddistrito_foreign` FOREIGN KEY (`idDistrito`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `clientes_idprovincia_foreign` FOREIGN KEY (`idProvincia`) REFERENCES `provincias` (`id`);

--
-- Filtros para la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD CONSTRAINT `comprobantes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `comprobantes_tipo_id_foreign` FOREIGN KEY (`tipo_id`) REFERENCES `tipos_comprobantes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `comprobantes_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `comprobantes_pagos`
--
ALTER TABLE `comprobantes_pagos`
  ADD CONSTRAINT `comprobantes_pagos_comprobante_id_foreign` FOREIGN KEY (`comprobante_id`) REFERENCES `comprobantes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `comprobantes_pagos_medio_pago_id_foreign` FOREIGN KEY (`medio_pago_id`) REFERENCES `formas_pagos` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `comprobantes_pagos_tipo_movimiento_id_foreign` FOREIGN KEY (`tipo_movimiento_id`) REFERENCES `tipos_movimientos` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `detalle_historia_clinicas`
--
ALTER TABLE `detalle_historia_clinicas`
  ADD CONSTRAINT `detalle_historia_clinicas_idhistoriaclinica_foreign` FOREIGN KEY (`idHistoriaClinica`) REFERENCES `historias_clinicas` (`id`),
  ADD CONSTRAINT `detalle_historia_clinicas_idtipohistoriaclinica_foreign` FOREIGN KEY (`idTipoHistoriaClinica`) REFERENCES `tipos_historias_clinicas` (`id`);

--
-- Filtros para la tabla `diagnosticos_mascotas`
--
ALTER TABLE `diagnosticos_mascotas`
  ADD CONSTRAINT `diagnosticos_mascotas_diagnostico_id_foreign` FOREIGN KEY (`diagnostico_id`) REFERENCES `diagnosticos` (`id`),
  ADD CONSTRAINT `diagnosticos_mascotas_historia_clinica_id_foreign` FOREIGN KEY (`historia_clinica_id`) REFERENCES `historias_clinicas` (`id`),
  ADD CONSTRAINT `diagnosticos_mascotas_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`);

--
-- Filtros para la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD CONSTRAINT `distritos_idprovincia_foreign` FOREIGN KEY (`idProvincia`) REFERENCES `provincias` (`id`);

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_idcliente_foreign` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `eventos_idestadoevento_foreign` FOREIGN KEY (`idEstadoEvento`) REFERENCES `estados_eventos` (`id`),
  ADD CONSTRAINT `eventos_idmascota_foreign` FOREIGN KEY (`idMascota`) REFERENCES `mascotas` (`id`),
  ADD CONSTRAINT `eventos_idnotificacion_foreign` FOREIGN KEY (`idNotificacion`) REFERENCES `notificaciones` (`id`),
  ADD CONSTRAINT `eventos_idtipoevento_foreign` FOREIGN KEY (`idTipoEvento`) REFERENCES `tipos_eventos` (`id`),
  ADD CONSTRAINT `eventos_idusuario_foreign` FOREIGN KEY (`idUsuario`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `examenes_auxiliares_mascotas`
--
ALTER TABLE `examenes_auxiliares_mascotas`
  ADD CONSTRAINT `examenes_auxiliares_mascotas_examen_auxiliar_id_foreign` FOREIGN KEY (`examen_auxiliar_id`) REFERENCES `examenes_auxiliares` (`id`),
  ADD CONSTRAINT `examenes_auxiliares_mascotas_historia_clinica_id_foreign` FOREIGN KEY (`historia_clinica_id`) REFERENCES `historias_clinicas` (`id`),
  ADD CONSTRAINT `examenes_auxiliares_mascotas_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`);

--
-- Filtros para la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  ADD CONSTRAINT `historias_clinicas_idmascota_foreign` FOREIGN KEY (`idMascota`) REFERENCES `mascotas` (`id`),
  ADD CONSTRAINT `historias_clinicas_tipo_historia_clinica_id_foreign` FOREIGN KEY (`tipo_historia_clinica_id`) REFERENCES `tipos_historias_clinicas` (`id`);

--
-- Filtros para la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD CONSTRAINT `inventarios_idalmacen_foreign` FOREIGN KEY (`idAlmacen`) REFERENCES `almacenes` (`id`),
  ADD CONSTRAINT `inventarios_idtipooperacion_foreign` FOREIGN KEY (`idTipoOperacion`) REFERENCES `tipos_operaciones` (`id`),
  ADD CONSTRAINT `inventarios_idusuario_foreign` FOREIGN KEY (`idUsuario`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD CONSTRAINT `lotes_idalmacen_foreign` FOREIGN KEY (`idAlmacen`) REFERENCES `almacenes` (`id`),
  ADD CONSTRAINT `lotes_idproducto_foreign` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_idcliente_foreign` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `mascotas_iddiapreferido_foreign` FOREIGN KEY (`idDiaPreferido`) REFERENCES `dias_preferidos` (`id`),
  ADD CONSTRAINT `mascotas_idespecie_foreign` FOREIGN KEY (`idEspecie`) REFERENCES `especies` (`id`),
  ADD CONSTRAINT `mascotas_idfrecuencia_foreign` FOREIGN KEY (`idFrecuencia`) REFERENCES `frecuencias` (`id`),
  ADD CONSTRAINT `mascotas_idraza_foreign` FOREIGN KEY (`idRaza`) REFERENCES `razas` (`id`);

--
-- Filtros para la tabla `mascota_galeria`
--
ALTER TABLE `mascota_galeria`
  ADD CONSTRAINT `mascota_galeria_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`);

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_tipo_movimiento_id_foreign` FOREIGN KEY (`tipo_movimiento_id`) REFERENCES `tipos_movimientos` (`id`),
  ADD CONSTRAINT `movimientos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `notas_credito`
--
ALTER TABLE `notas_credito`
  ADD CONSTRAINT `notas_credito_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `notas_credito_comprobante_id_foreign` FOREIGN KEY (`comprobante_id`) REFERENCES `comprobantes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permisos_roles`
--
ALTER TABLE `permisos_roles`
  ADD CONSTRAINT `permisos_roles_permiso_id_foreign` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`),
  ADD CONSTRAINT `permisos_roles_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_idcategoria_foreign` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `productos_idlinea_foreign` FOREIGN KEY (`idLinea`) REFERENCES `lineas` (`id`),
  ADD CONSTRAINT `productos_idpresentacion_foreign` FOREIGN KEY (`idPresentacion`) REFERENCES `presentaciones` (`id`),
  ADD CONSTRAINT `productos_idproveedor_foreign` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`id`),
  ADD CONSTRAINT `productos_idsubcategoria_foreign` FOREIGN KEY (`idSubCategoria`) REFERENCES `sub_categorias` (`id`),
  ADD CONSTRAINT `productos_idunidadmedida_foreign` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidades_medidas` (`id`);

--
-- Filtros para la tabla `productos_galeria`
--
ALTER TABLE `productos_galeria`
  ADD CONSTRAINT `productos_galeria_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `productos_stocks`
--
ALTER TABLE `productos_stocks`
  ADD CONSTRAINT `productos_stocks_almacen_id_foreign` FOREIGN KEY (`almacen_id`) REFERENCES `almacenes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `productos_stocks_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_idformadepago_foreign` FOREIGN KEY (`idFormaDePago`) REFERENCES `formas_pagos` (`id`);

--
-- Filtros para la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD CONSTRAINT `provincias_iddepartamento_foreign` FOREIGN KEY (`idDepartamento`) REFERENCES `departamentos` (`id`);

--
-- Filtros para la tabla `razas`
--
ALTER TABLE `razas`
  ADD CONSTRAINT `razas_idespecie_foreign` FOREIGN KEY (`idEspecie`) REFERENCES `especies` (`id`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_idcategoria_foreign` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `servicios_idlinea_foreign` FOREIGN KEY (`idLinea`) REFERENCES `lineas` (`id`),
  ADD CONSTRAINT `servicios_idsubcategoria_foreign` FOREIGN KEY (`idSubCategoria`) REFERENCES `sub_categorias` (`id`);

--
-- Filtros para la tabla `sub_categorias`
--
ALTER TABLE `sub_categorias`
  ADD CONSTRAINT `sub_categorias_idcategoria_foreign` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `tratamientos_mascotas`
--
ALTER TABLE `tratamientos_mascotas`
  ADD CONSTRAINT `tratamientos_mascotas_historia_clinica_id_foreign` FOREIGN KEY (`historia_clinica_id`) REFERENCES `historias_clinicas` (`id`),
  ADD CONSTRAINT `tratamientos_mascotas_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`),
  ADD CONSTRAINT `tratamientos_mascotas_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `tratamientos_mascotas_tipo_historia_clinica_id_foreign` FOREIGN KEY (`tipo_historia_clinica_id`) REFERENCES `tipos_historias_clinicas` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_sede_id_foreign` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ventas_estado_id_foreign` FOREIGN KEY (`estado_id`) REFERENCES `estados_ventas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ventas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `ventas_items`
--
ALTER TABLE `ventas_items`
  ADD CONSTRAINT `ventas_items_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ventas_items_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ventas_items_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ventas_items_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
