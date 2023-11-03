-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2023 a las 23:31:07
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `simulator`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `occupations`
--

CREATE TABLE `occupations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `occupation_code` varchar(10) NOT NULL,
  `occupation_name` varchar(200) NOT NULL,
  `occupation_description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `occupations`
--

INSERT INTO `occupations` (`id`, `occupation_code`, `occupation_name`, `occupation_description`, `created_at`, `updated_at`) VALUES
(1, '0011', 'Miembros del poder ejecutivo y legislativo', 'Definen, formulan y orientan la politica del poder publico en todos sus niveles; promulgan, modifican o derogan leyes y normas. Por lo general son elegidos por voto popular.', '2023-11-04 01:46:39', '2023-11-04 01:46:39'),
(2, '0012', 'Personal directivo de la administracion publica', 'Planean, organizan, dirigen y controlan a traves de otros directores, las principales actividades gubernamentales del orden nacional, departamental, municipal, entidades territoriales, consejos y comisiones; establecen directrices; vigilan la interpretacion y aplicacion de politicas y leyes; actuan en nombre y representacion del pais en el extranjero.', '2023-11-04 01:50:54', '2023-11-04 01:50:54'),
(3, '0013', 'Directores y gerentes generales de servicios financieros, de telecomunicaciones y otros servicios a las empresas', 'Planean, organizan, dirigen y controlan, con la asistencia de otros directores, organizaciones financieras, de comunicación y otros servicios a las empresas. Formulan y definen políticas de estas empresas u organizaciones; generalmente, siguen orientación de un órgano directivo.', '2023-11-04 01:53:53', '2023-11-04 01:53:53'),
(4, '0014', 'Directores y gerentes generales de salud, educación, servicio social, comunitario y organizaciones de membresía', 'Planean, organizan, dirigen y controlan, a través de otros directores, organizaciones de membresía y otras instituciones que prestan servicios de salud, educación, servicios comunitarios y sociales. Formulan y definen políticas de estas organizaciones; generalmente, siguen orientación de un órgano directivo', '2023-11-04 02:17:43', '2023-11-04 02:17:43');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `occupations`
--
ALTER TABLE `occupations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `occupations_occupation_code_unique` (`occupation_code`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `occupations`
--
ALTER TABLE `occupations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
