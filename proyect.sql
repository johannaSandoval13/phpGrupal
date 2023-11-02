-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2023 a las 18:50:23
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `talentallk`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administadores`
--

CREATE TABLE `administadores` (
  `id_admin` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int(10) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administadores`
--

INSERT INTO `administadores` (`id_admin`, `nombre`, `apellido`, `email`, `telefono`, `password`) VALUES
(1, 'Pepe ', 'Cifuentes', 'Cifuentes@gimail.com', 13846541, '123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aspirantes`
--

CREATE TABLE `aspirantes` (
  `id_aprendiz` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int(10) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `id_experincia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aspirantes`
--

INSERT INTO `aspirantes` (`id_aprendiz`, `id_admin`, `nombre`, `apellido`, `email`, `telefono`, `password`, `id_experincia`) VALUES
(1, 1, 'PEDRO ', 'LOPEZ', 'LOPEZ@hotmail.com', 1343154, '123456', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id_cuoc` int(11) DEFAULT NULL,
  `nombre_cargo` varchar(100) NOT NULL,
  `decriccion` varchar(500) DEFAULT NULL,
  `manual_funciones` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id_empresa` int(11) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `nombre_em` varchar(50) NOT NULL,
  `ubicacion` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefono` int(10) DEFAULT NULL,
  `PASSWORD` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudioas`
--

CREATE TABLE `estudioas` (
  `institucion` varchar(50) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `tipo_estu` varchar(30) DEFAULT NULL,
  `certificado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudioas`
--

INSERT INTO `estudioas` (`institucion`, `fecha_inicio`, `fecha_fin`, `tipo_estu`, `certificado`) VALUES
('MONIQUIRA', '2002-01-23', '2004-10-22', 'TECNICO', 'c//.........');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencias`
--

CREATE TABLE `experiencias` (
  `id_experincia` int(11) NOT NULL,
  `nombre_empresa` varchar(30) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  `funciones` varchar(50) DEFAULT NULL,
  `institucion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `experiencias`
--

INSERT INTO `experiencias` (`id_experincia`, `nombre_empresa`, `fecha_inicio`, `fecha_fin`, `cargo`, `funciones`, `institucion`) VALUES
(1, 'LAVA SER ', '2023-01-23', '2024-10-22', 'EMPACADOR', 'EMPACAR EL PROCUCTO EN CAJAS Y TRASPORTAR A BODEGA', 'MONIQUIRA');

--
-- Disparadores `experiencias`
--
DELIMITER $$
CREATE TRIGGER `control_aspitantes` BEFORE INSERT ON `experiencias` FOR EACH ROW BEGIN
INSERT INTO control_aspirantes(nombre) VALUE (NUW.id_aprendiz,NUW.nombre,NUW.id_experincia,NUW.nombre_empresa,NUW.fecha_inicio,NUW.fecha_fin,NUW.cargo,NUW.funciones,NUW.institucion);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupaciones`
--

CREATE TABLE `ocupaciones` (
  `id_cuoc` int(11) NOT NULL,
  `nombre_cuoc` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ocupaciones`
--

INSERT INTO `ocupaciones` (`id_cuoc`, `nombre_cuoc`) VALUES
(1100, 'Oficiales de las fuerzas militares'),
(2100, 'Suboficiales de las fuerzas militares'),
(3100, 'Otros miembros de las fuerzas militares'),
(11110, 'Directores formuladores y ejecutores de pol?ticas y normas'),
(11120, 'Directores del gobierno'),
(11130, 'Jefes de comunidades ?tnicas'),
(11140, 'Dirigentes de organizaciones con un inter?s espec?fico (partidos pol?ticos, sindicatos y organizaciones sociales)'),
(11200, 'Directores y gerentes generales'),
(12111, 'Directores y gerentes financieros'),
(12112, 'Directores y gerentes de seguros, bienes ra?ces y corretaje financiero'),
(12113, 'Directores y gerentes de banca, cr?dito e inversiones'),
(12120, 'Directores y gerentes de gesti?n de talento humano'),
(12130, 'Directores y gerentes de pol?ticas y planeaci?n'),
(12191, 'Directores y gerentes de limpieza y mantenimiento'),
(12199, 'Directores y gerentes de administraci?n y servicios no clasificados en otras ocupaciones'),
(12211, 'Directores y gerentes de ventas y mercadeo'),
(12212, 'Directores y gerentes de comercio exterior'),
(12220, 'Directores y gerentes de publicidad y relaciones p?blicas'),
(12230, 'Directores y gerentes de ingenier?a, investigaci?n y desarrollo'),
(13110, 'Directores y gerentes de producci?n agropecuaria y silvicultura'),
(13120, 'Directores y gerentes de producci?n acu?cola, pisc?cola y de pesca'),
(13210, 'Directores y gerentes de industrias manufactureras'),
(13220, 'Directores y gerentes de producci?n primaria (excepto agricultura)'),
(13230, 'Directores y gerentes de empresas de construcci?n'),
(13241, 'Directores y gerentes de compras y adquisiciones'),
(13242, 'Directores y gerentes de servicios de correo y mensajer?a'),
(13243, 'Directores y gerentes de transporte, distribuci?n y log?stica'),
(13244, 'Directores y gerentes de cadena de suministro'),
(13301, 'Directores y gerentes de telecomunicaciones'),
(13302, 'Directores y gerentes de sistemas de informaci?n y procesamiento de datos'),
(13303, 'Directores y gerentes de comunicaciones y audiovisuales'),
(13410, 'Directores y gerentes de servicios de cuidados infantiles'),
(13420, 'Directores y gerentes de servicios de salud'),
(13430, 'Directores y gerentes de servicios de atenci?n a personas mayores'),
(13440, 'Directores y gerentes de servicios de bienestar social, comunitario y correccional'),
(13451, 'Directores y gerentes de programas de pol?tica educativa'),
(13452, 'Directores y administradores de educaci?n superior y formaci?n para el trabajo'),
(13453, 'Directores y administradores de educaci?n b?sica y media'),
(13460, 'Directores y gerentes de sucursales de bancos, de servicios financieros y de seguros'),
(13491, 'Directores y gerentes de archivo, biblioteca, museo y galer?a de arte'),
(13492, 'Directores y gerentes de servicios y procesos de negocio'),
(13499, 'Directores y gerentes de servicios profesionales no clasificados en otras ocupaciones'),
(14110, 'Directores y gerentes de servicios hoteleros y hospedaje'),
(14120, 'Gerentes y administradores de servicios de alimentos y restaurantes'),
(14200, 'Gerentes de comercios al por mayor y al por menor'),
(14311, 'Directores y gerentes de empresas de m?sica, artes esc?nicas y cultura'),
(14312, 'Directores y gerentes de esparcimiento y deportes'),
(14391, 'Gerentes y administradores de propiedad horizontal'),
(14399, 'Otros gerentes y administradores de servicios no clasificados en otras ocupaciones'),
(21110, 'F?sicos y astr?nomos'),
(21120, 'Meteor?logos'),
(21130, 'Qu?micos'),
(21141, 'Ge?logos, geof?sicos y geoqu?micos'),
(21142, 'Gem?logos'),
(21143, 'Ocean?grafos'),
(21200, 'Matem?ticos, actuarios y estad?sticos'),
(21310, 'Bi?logos, bot?nicos, zo?logos y afines'),
(21321, 'Agr?nomos, agr?colas, pecuarios y zootecnistas'),
(21322, 'Silvicultores y forestales'),
(21323, 'Extensionistas agropecuarios'),
(21331, 'Profesionales ambientales y ecologistas'),
(21332, 'Profesionales en gesti?n de riesgo de desastres'),
(21410, 'Ingenieros industriales y de producci?n'),
(21420, 'Ingenieros civiles'),
(21430, 'Ingenieros medioambientales'),
(21441, 'Ingenieros mec?nicos'),
(21442, 'Ingenieros navales'),
(21443, 'Ingenieros aeron?uticos'),
(21450, 'Ingenieros qu?micos'),
(21461, 'Ingenieros de minas'),
(21462, 'Ingenieros metal?rgicos'),
(21463, 'Ingenieros de petr?leo y gas'),
(21491, 'Ingenieros de materiales'),
(21492, 'Ingenieros biom?dicos'),
(21499, 'Ingenieros no clasificados en otras ocupaciones'),
(21510, 'Ingenieros electricistas'),
(21521, 'Ingenieros electr?nicos'),
(21522, 'Ingenieros de automatizaci?n e instrumentaci?n'),
(21531, 'Ingenieros de telecomunicaciones'),
(21532, 'Ingenieros y productores de audio y sonido'),
(21610, 'Arquitectos'),
(21620, 'Arquitectos paisajistas'),
(21631, 'Dise?adores industriales y de productos'),
(21632, 'Dise?adores de vestuario y moda'),
(21633, 'Dise?adores de espacios'),
(21634, 'Dise?adores de servicios'),
(21635, 'Dise?adores de iluminaci?n'),
(21640, 'Planificadores urbanos, regionales y de tr?nsito'),
(21650, 'Cart?grafos e ingenieros topogr?ficos y catastrales'),
(21661, 'Dise?adores gr?ficos'),
(21662, 'Dise?adores de im?genes computarizadas e interacci?n digital'),
(22110, 'M?dicos generales'),
(22120, 'M?dicos especialistas'),
(22210, 'Profesionales de enfermer?a'),
(22220, 'Profesionales de parter?a'),
(22300, 'Profesionales de medicina tradicional y alternativa'),
(22401, 'Param?dicos'),
(22402, 'Instrumentadores quir?rgicos'),
(22500, 'Veterinarios'),
(22610, 'Odont?logos'),
(22620, 'Farmac?uticos y qu?micos farmac?uticos'),
(22630, 'Profesionales de la salud y la higiene laboral y ambiental'),
(22640, 'Fisioterapeutas'),
(22650, 'Dietistas y nutricionistas'),
(22660, 'Fonoaudi?logos y terapeutas del lenguaje'),
(22670, 'Opt?metras'),
(22691, 'Terapeutas ocupacionales'),
(22692, 'Profesionales en terapia respiratoria'),
(22693, 'Otros profesionales de terapia'),
(22699, 'Profesionales de la salud no clasificados en otras ocupaciones'),
(23100, 'Profesores de instituciones de educaci?n superior'),
(23200, 'Profesores de formaci?n profesional'),
(23300, 'Profesores de educaci?n secundaria'),
(23410, 'Profesores de educaci?n b?sica primaria'),
(23420, 'Profesores de primera infancia y preescolar'),
(23510, 'Especialistas en m?todos y procesos pedag?gicos'),
(23521, 'Profesores e instructores de educaci?n especial e inclusiva'),
(23522, 'Pedagogos reeducadores'),
(23530, 'Otros profesores de idiomas'),
(23540, 'Otros profesores de m?sica'),
(23550, 'Otros profesores de artes'),
(23560, 'Instructores de tecnolog?a de la informaci?n'),
(23591, 'Orientadores educativos'),
(23599, 'Otros profesionales de la educaci?n no clasificados en otras ocupaciones'),
(24111, 'Contadores'),
(24112, 'Auditores financieros y contables'),
(24120, 'Asesores financieros y de inversiones'),
(24130, 'Analistas financieros'),
(24210, 'Profesionales y analistas de gesti?n y organizaci?n'),
(24220, 'Profesionales en pol?ticas sociales y de administraci?n'),
(24231, 'Profesionales de talento humano'),
(24232, 'Consejeros de servicios de empleo'),
(24241, 'Profesionales de formaci?n y desarrollo de personal'),
(24242, 'Evaluadores de competencias laborales'),
(24311, 'Publicistas y consultores de desarrollo comercial'),
(24312, 'Administradores de comunidades virtuales'),
(24313, 'Profesionales en negocios internacionales'),
(24320, 'Profesionales de relaciones p?blicas y comunicaciones'),
(24330, 'Profesionales de ventas t?cnicas y m?dicas (excluyendo las TIC)'),
(24340, 'Profesionales de ventas de tecnolog?a de la informaci?n y las comunicaciones'),
(25110, 'Analistas de sistemas'),
(25120, 'Desarrolladores de software'),
(25130, 'Desarrolladores Web y multimedia'),
(25140, 'Programadores de aplicaciones'),
(25190, 'Desarrolladores y analistas de software y multimedia no clasificados en otras ocupaciones'),
(25210, 'Dise?adores y administradores de bases de datos'),
(25220, 'Administradores de sistemas'),
(25230, 'Profesionales en redes de computadores'),
(25290, 'Profesionales en bases de datos y en redes de computadores no clasificados en otras ocupaciones'),
(26110, 'Abogados'),
(26120, 'Jueces'),
(26191, 'Profesionales en ciencias forenses'),
(26199, 'Profesionales en derecho no clasificados en otras ocupaciones'),
(26211, 'Archivistas'),
(26212, 'Curadores de arte y patrimonio cultural'),
(26213, 'Curadores y supervisores musicales'),
(26214, 'Muse?logos y muse?grafos'),
(26215, 'Restauradores y conservadores de patrimonio cultural mueble'),
(26216, 'Restauradores y conservadores del patrimonio cultural construido'),
(26220, 'Bibliotec?logos, documentalistas y afines'),
(26310, 'Economistas'),
(26320, 'Soci?logos, antrop?logos y afines'),
(26330, 'Fil?sofos, historiadores y especialistas en ciencias pol?ticas'),
(26340, 'Psic?logos'),
(26351, 'Profesionales del trabajo social y consejeros'),
(26352, 'Gestores de recursos y donaciones'),
(26360, 'Profesionales religiosos y ministros de culto'),
(26410, 'Autores y otros escritores'),
(26421, 'Periodistas'),
(26422, 'Editores y redactores'),
(26431, 'Traductores, int?rpretes y ling?istas'),
(26432, 'Traductores e int?rpretes de lenguas nativas'),
(26433, 'Int?rpretes de lengua de se?as'),
(26434, 'Gu?as-int?rpretes'),
(26511, 'Artistas pl?sticos y visuales'),
(26512, 'Ilustradores art?sticos'),
(26521, 'Int?rpretes musicales'),
(26522, 'Directores e investigadores musicales'),
(26523, 'Autores y compositores musicales'),
(26524, 'Ejecutantes musicales'),
(26531, 'Compositores coreogr?ficos e int?rpretes de danza'),
(26532, 'Bailarines y otros ejecutantes de la danza'),
(26541, 'Productores, directores y editores de cine, teatro y afines'),
(26542, 'Productores de campo para cine y televisi?n'),
(26543, 'Realizadores y coordinadores de las artes esc?nicas, audiovisuales y afines'),
(26550, 'Actores'),
(26560, 'Locutores y presentadores de radio, televisi?n y otros medios de comunicaci?n'),
(26590, 'Artistas creativos e interpretativos no clasificados en otras ocupaciones'),
(31111, 'T?cnicos en f?sica y qu?mica'),
(31112, 'T?cnicos en geolog?a'),
(31113, 'T?cnicos en meteorolog?a'),
(31114, 'T?cnicos en metrolog?a'),
(31115, 'Auxiliares de laboratorio'),
(31121, 'T?cnicos en construcci?n y arquitectura'),
(31122, 'T?cnicos en topograf?a'),
(31123, 'T?cnicos en cartograf?a'),
(31130, 'T?cnicos en electricidad'),
(31141, 'T?cnicos en electr?nica'),
(31142, 'T?cnicos en automatizaci?n e instrumentaci?n'),
(31150, 'T?cnicos en ingenier?a mec?nica'),
(31160, 'T?cnicos en qu?mica industrial'),
(31171, 'T?cnicos de minas y metalurgia'),
(31172, 'Operarios de exploraci?n geof?sica y geol?gica'),
(31181, 'Delineantes y dibujantes t?cnicos'),
(31182, 'Auxiliares de producci?n gr?fica'),
(31183, 'Graficadores de im?genes computarizadas'),
(31191, 'T?cnicos en fabricaci?n industrial'),
(31199, 'T?cnicos en ciencias f?sicas y en ingenier?a no clasificados en otras ocupaciones'),
(31211, 'Supervisores de miner?a y canteras'),
(31212, 'Supervisores de perforaci?n y servicio a pozos de petr?leo y gas'),
(31213, 'Supervisores y analistas de producci?n de hidrocarburos'),
(31221, 'Supervisores de procesamiento de alimentos y bebidas'),
(31222, 'Supervisores de fabricaci?n de productos de pl?stico y caucho'),
(31223, 'Supervisores de procesamiento de la madera y producci?n de pulpa y papel'),
(31224, 'Supervisores de ensamble de veh?culos de motor'),
(31225, 'Supervisores de impresi?n y ocupaciones relacionadas'),
(31226, 'Supervisores de fabricaci?n y tratamiento de productos mec?nicos, met?licos y minerales'),
(31227, 'Supervisores de fabricaci?n y procesamiento de productos textiles, cuero y piel'),
(31228, 'Supervisores de fabricaci?n de productos el?ctricos y electr?nicos'),
(31229, 'Supervisores de industrias manufactureras no clasificadas en otras ocupaciones'),
(31231, 'Supervisores de la construcci?n, maestros generales de obra, instalaci?n y reparaci?n'),
(31232, 'Inspectores de sistemas e instalaciones de gas'),
(31310, 'Operadores de plantas de generaci?n y distribuci?n de energ?a'),
(31321, 'Operadores de plantas de tratamiento de agua'),
(31322, 'Operadores de incineradores y de rellenos sanitarios'),
(31330, 'Controladores de instalaciones de procesamiento de productos qu?micos'),
(31341, 'Operadores de instalaciones de refinaci?n de petr?leo y gas natural'),
(31342, 'Inspectores de oleoductos y gasoductos'),
(31350, 'Controladores de procesos de producci?n y tratamiento de metales'),
(31390, 'T?cnicos en control de procesos no clasificados en otras ocupaciones'),
(31410, 'T?cnicos en ciencias biol?gicas (excluyendo la medicina)'),
(31421, 'T?cnicos agropecuarios'),
(31422, 'Inspectores de productos agr?cola, pecuarios y de pesca'),
(31423, 'Inspectores de riego agr?cola'),
(31424, 'Supervisores de producci?n agr?cola'),
(31425, 'Supervisores de producci?n pecuaria'),
(31426, 'Promotores de servicios agr?colas y relacionados'),
(31431, 'T?cnicos forestales y recursos naturales'),
(31432, 'Supervisores de explotaci?n forestal y silvicultura'),
(31510, 'Oficiales maquinistas en navegaci?n'),
(31520, 'Capitanes y oficiales de cubierta'),
(31530, 'Pilotos, ingenieros e instructores de vuelo'),
(31540, 'Controladores de tr?fico a?reo, mar?timo y ferroviario'),
(31550, 'T?cnicos en seguridad aeron?utica e instrumentos de aeronavegaci?n'),
(32111, 'T?cnicos y tecn?logos en im?genes diagn?sticas'),
(32112, 'T?cnicos en radioterapia'),
(32113, 'T?cnicos en medicina nuclear'),
(32119, 'Otros t?cnicos en aparatos de diagn?stico y tratamiento m?dico no clasificados en otras ocupaciones'),
(32120, 'T?cnicos de laboratorios m?dicos'),
(32130, 'T?cnicos y asistentes farmac?uticos'),
(32141, 'T?cnicos dentales'),
(32142, 'T?cnicos de ?rtesis y pr?tesis m?dicas'),
(32210, 'T?cnicos y profesionales del nivel medio en enfermer?a'),
(32220, 'T?cnicos y profesionales del nivel medio en parter?a'),
(32301, 'T?cnicos y profesionales del nivel medio en medicina alternativa'),
(32302, 'Practicantes de medicina tradicional ancestral'),
(32400, 'T?cnicos y asistentes veterinarios'),
(32510, 'Higienistas y asistentes odontol?gicos'),
(32520, 'T?cnicos en documentaci?n sanitaria'),
(32530, 'Trabajadores comunitarios de la salud'),
(32540, 'T?cnicos en ?ptica'),
(32550, 'T?cnicos y asistentes terapeutas'),
(32560, 'Asistentes m?dicos'),
(32571, 'Inspectores de sanidad, seguridad y salud ocupacional'),
(32572, 'Coordinadores de sistemas integrados de gesti?n'),
(32573, 'T?cnicos en prevenci?n, gesti?n y control ambiental'),
(32574, 'Asistentes en saneamiento ambiental'),
(32580, 'T?cnicos en atenci?n prehospitalaria'),
(32590, 'Otros t?cnicos y profesionales del nivel medio de la salud no clasificados en no clasificados en otras ocupaciones'),
(33110, 'Agentes de bolsa, cambio y otros servicios financieros'),
(33120, 'Analistas y asistentes financieros pr?stamos y cr?ditos'),
(33131, 'Asistentes contables'),
(33132, 'Asistentes financieros'),
(33133, 'Asistentes tesorer?a'),
(33134, 'T?cnicos de contabilidad y afines'),
(33140, 'T?cnicos y profesionales del nivel medio de servicios estad?sticos, matem?ticos y afines'),
(33150, 'Tasadores, avaluadores y liquidadores de seguros'),
(33210, 'Agentes y corredores de seguros'),
(33220, 'Representantes comerciales'),
(33230, 'Agentes de compras'),
(33240, 'Agentes de operaciones comerciales y consignatarios'),
(33311, 'Asistentes de comercio exterior'),
(33312, 'Gestores y agentes de servicios de aduana'),
(33320, 'Coordinadores y productores de conferencias, eventos y espect?culos'),
(33330, 'Agentes de empleo y contratistas de mano de obra'),
(33340, 'Agentes inmobiliarios'),
(33391, 'Agentes y promotores art?sticos y deportivos'),
(33392, 'Asistentes de mercadeo, publicidad y comunicaciones'),
(33393, 'Auxiliares de promoci?n art?stica'),
(33399, 'Agentes de servicios comerciales no clasificados en otras ocupaciones'),
(33411, 'Supervisores administrativos'),
(33412, 'Supervisores de entidades financieras'),
(33413, 'Supervisores y coordinadores de procesos de negocio, empleados de informaci?n y servicio al cliente'),
(33414, 'Supervisores de empleados de correo y mensajer?a'),
(33415, 'Supervisores de almacenamiento, inventario y distribuci?n'),
(33416, 'Supervisores de operaci?n de transporte ferroviario'),
(33417, 'Supervisores de operaci?n de transporte terrestre (no ferroviario)'),
(33420, 'Secretarios jur?dicos'),
(33431, 'Asistentes administrativos'),
(33432, 'Asistentes de talento humano'),
(33433, 'T?cnicos en archiv?stica'),
(33440, 'Secretarios m?dicos'),
(33510, 'Inspectores de aduana y fronteras'),
(33520, 'Agentes de administraci?n tributaria'),
(33530, 'Funcionarios e inspectores de servicios de seguridad social'),
(33540, 'Funcionarios e inspectores gubernamentales de expedici?n de licencias'),
(33551, 'Inspectores y detectives de polic?a'),
(33552, 'T?cnicos investigadores criminal?sticos y judiciales'),
(33553, 'Investigadores criminal?sticos y judiciales'),
(33590, 'Agentes de gobierno y profesionales del nivel medio para la aplicaci?n de regulaciones no clasificados en otros grupos primarios'),
(34111, 'Asistentes de juzgados, tribunales y afines'),
(34112, 'Auxiliares de tribunales'),
(34113, 'Asistentes legales y afines'),
(34120, 'Trabajadores y asistentes sociales y comunitarios'),
(34130, 'Auxiliares laicos de las religiones'),
(34210, 'Atletas y deportistas'),
(34221, 'Entrenadores y preparadores f?sicos'),
(34222, '?rbitros'),
(34231, 'Instructores de educaci?n f?sica y recreaci?n'),
(34232, 'Recreadores'),
(34310, 'Fot?grafos'),
(34320, 'Decoradores de interiores'),
(34331, 'Ocupaciones t?cnicas relacionadas con museos y galer?as'),
(34332, 'T?cnicos en biblioteca'),
(34333, 'T?cnicos en promoci?n y animaci?n a la lectura y la escritura'),
(34340, 'Chefs'),
(34351, 'Otros t?cnicos de actividades art?sticas'),
(34352, 'Artistas corporales'),
(34353, 'Auxiliares de producci?n de eventos y espect?culos'),
(34354, 'Asistentes de direcci?n y producci?n en las artes esc?nicas y audiovisuales'),
(34355, 'T?cnicos y profesionales de nivel medio en ?producci?n de arte para actividades audiovisuales y esc?nicas'),
(35110, 'T?cnicos en operaciones de tecnolog?a de la informaci?n y las comunicaciones'),
(35121, 'T?cnicos en asistencia y soporte de tecnolog?as de la informaci?n'),
(35122, 'Representantes de servicios especializados BPO (business process outsourcing)'),
(35130, 'T?cnicos en redes y tecnolog?as de la informaci?n'),
(35140, 'T?cnicos de la Web'),
(35211, 'Operadores de c?mara de cine y televisi?n'),
(35212, 'T?cnicos en transmisi?n audiovisual'),
(35213, 'Asistentes en cine, televisi?n y artes esc?nicas'),
(35214, 'Operadores de audio y sonido'),
(35215, 'Asistentes de producci?n de audio y sonido'),
(35221, 'T?cnicos en telecomunicaciones'),
(35222, 'Supervisores de telecomunicaciones'),
(35223, 'Operadores de radio'),
(41101, 'Oficinistas generales'),
(41102, 'Auxiliares de aduana'),
(41200, 'Secretarios generales'),
(41310, 'Operadores de m?quinas de procesamiento de texto y mecan?grafos'),
(41321, 'Grabadores de datos'),
(41322, 'Digitadores'),
(42110, 'Cajeros de bancos y afines'),
(42120, 'Receptores de apuestas y afines'),
(42130, 'Prestamistas'),
(42140, 'Cobradores, auxiliares de cartera y afines'),
(42210, 'Empleados de ventas y servicios de viajes'),
(42220, 'Empleados de centros de llamadas'),
(42230, 'Telefonistas'),
(42240, 'Recepcionistas de hoteles'),
(42251, 'Auxiliares de informaci?n y servicio al cliente'),
(42252, 'Informadores tur?sticos'),
(42260, 'Recepcionistas generales'),
(42270, 'Entrevistadores de encuestas y de investigaciones de mercados'),
(42291, 'Auxiliares administrativos en salud'),
(42299, 'Otros empleados de servicios de informaci?n al cliente no clasificados en otras ocupaciones'),
(43110, 'Auxiliares de contabilidad, costos y tesorer?a'),
(43121, 'Auxiliares de servicios estad?sticos y financieros'),
(43122, 'Auxiliares de aval?os'),
(43130, 'Auxiliares de n?mina y prestaciones'),
(43211, 'Auxiliares de almac?n y pesaje'),
(43212, 'Auxiliares de compras e inventarios'),
(43220, 'Empleados de servicios de apoyo a la producci?n'),
(43231, 'Empleados y operarios de servicios de transporte'),
(43232, 'Inspectores y controladores de transporte'),
(44110, 'Empleados de bibliotecas'),
(44120, 'Empleados de servicios de correos'),
(44130, 'Codificadores de datos, correctores de pruebas de imprenta y afines'),
(44140, 'Escribientes p?blicos y afines'),
(44150, 'Empleados de archivos'),
(44161, 'Auxiliares de talento humano'),
(44162, 'Auxiliares de seguridad en el trabajo'),
(44191, 'Auxiliares de publicaci?n y afines'),
(44199, 'Otro personal de apoyo administrativo no clasificados en otras ocupaciones'),
(51110, 'Personal de servicio a pasajeros'),
(51120, 'Revisores y cobradores de los transportes p?blicos'),
(51131, 'Gu?as de turismo'),
(51132, 'Anfitriones tur?sticos locales'),
(51201, 'Cocineros'),
(51202, 'Sabedores de la cocina tradicional'),
(51310, 'Meseros y capitanes de meseros'),
(51321, 'Bartenders'),
(51322, 'Baristas'),
(51410, 'Peluqueros'),
(51421, 'Manicuristas y pedicuristas'),
(51422, 'Cosmet?logos esteticistas'),
(51423, 'Maquilladores'),
(51424, 'Asesores de imagen'),
(51429, 'Otras ocupaciones elementales de los servicios no clasificados en otras ocupaciones'),
(51510, 'Supervisores de mantenimiento y limpieza en oficinas, hoteles y otros establecimientos'),
(51520, 'Ec?nomos y mayordomos dom?sticos'),
(51530, 'Conserjes y afines'),
(51610, 'Astr?logos, adivinos y afines'),
(51620, 'Acompa?antes'),
(51631, 'Tanatopractores'),
(51632, 'Coordinadores de servicios funerarios'),
(51633, 'Personal de servicios funerarios'),
(51640, 'Cuidadores de animales'),
(51650, 'Instructores de conducci?n'),
(51690, 'Otros trabajadores de servicios personales no clasificados en otras ocupaciones'),
(52110, 'Vendedores en quioscos y puestos de mercado'),
(52120, 'Vendedores ambulantes de alimentos preparados para consumo inmediato'),
(52210, 'Comerciantes de tiendas'),
(52220, 'Supervisores de tiendas y almacenes'),
(52230, 'Vendedores y auxiliares de venta en tiendas, almacenes y afines'),
(52300, 'Cajeros de comercio, taquilleros y expendedores de boletas'),
(52410, 'Modelos de moda, arte y publicidad'),
(52420, 'Demostradores de tiendas, almacenes y afines'),
(52430, 'Vendedores puerta a puerta'),
(52440, 'Vendedores a trav?s de medios tecnol?gicos'),
(52450, 'Expendedores de combustibles para veh?culos'),
(52460, 'Vendedores de comidas en mostrador'),
(52490, 'Otros vendedores no clasificados en otras ocupaciones'),
(53110, 'Cuidadores de ni?os'),
(53120, 'Auxiliares de maestros y primera infancia'),
(53210, 'Trabajadores de los cuidados personales en instituciones'),
(53220, 'Trabajadores de los cuidados personales a domicilio'),
(53291, 'Auxiliares en enfermer?a'),
(53292, 'Auxiliares de salud oral'),
(53293, 'Auxiliares en salud p?blica'),
(53294, 'Auxiliares de laboratorio cl?nico'),
(53295, 'Auxiliares de droguer?a y farmacia'),
(53299, 'Trabajadores de los cuidados personales en servicios de salud no clasificados en otras ocupaciones'),
(54111, 'Oficiales de bomberos'),
(54112, 'Suboficiales de bomberos'),
(54113, 'Bomberos'),
(54114, 'Rescatistas'),
(54121, 'Oficiales de polic?a'),
(54122, 'Suboficiales y nivel ejecutivo de la polic?a'),
(54123, 'Patrulleros y agentes de polic?a'),
(54124, 'Auxiliares de polic?a'),
(54131, 'Oficiales del cuerpo de custodia y vigilancia'),
(54132, 'Suboficiales del cuerpo de custodia y vigilancia'),
(54133, 'Guardianes de prisi?n'),
(54141, 'Supervisores de vigilantes'),
(54142, 'Vigilantes y guardias de seguridad'),
(54191, 'Guardavidas y salvavidas'),
(54192, 'Agentes de tr?nsito'),
(54193, 'T?cnicos operativos de tr?nsito'),
(54199, 'Personal de los servicios de protecci?n no clasificadas en otras ocupaciones'),
(61111, 'Agricultores de cultivos extensivos'),
(61112, 'Trabajadores agr?colas calificados de cultivos extensivos'),
(61113, 'Trabajadores calificados de riego agr?cola'),
(61121, 'Agricultores de plantaciones de ?rboles y arbustos'),
(61122, 'Trabajadores agr?colas calificados de plantaciones de ?rboles y arbustos'),
(61131, 'Agricultores de huertas, invernaderos, viveros y jardines'),
(61132, 'Trabajadores agr?colas calificados de huertas, invernaderos, viveros y jardines'),
(61140, 'Agricultores y trabajadores calificados de cultivos mixtos'),
(61211, 'Criadores de animales (excepto aves de corral)'),
(61212, 'Trabajadores calificados de la cr?a de animales (excepto aves de corral)'),
(61221, 'Avicultores'),
(61222, 'Trabajadores calificados de la avicultura'),
(61230, 'Criadores y trabajadores calificados de la apicultura y la sericicultura'),
(61290, 'Criadores y trabajadores pecuarios calificados, avicultores y criadores de insectos no clasificados en otras ocupaciones'),
(61300, 'Productores y trabajadores calificados de explotaciones agropecuarias mixtas cuya producci?n se destina al mercado'),
(62101, 'Trabajadores calificados de explotaci?n forestal'),
(62102, 'Trabajadores de silvicultura y forestaci?n'),
(62211, 'Productores de acuicultura'),
(62212, 'Trabajadores acu?colas calificados'),
(62221, 'Capitanes y patrones de pesca de aguas dulces y costeras'),
(62222, 'Pescadores de aguas dulces y costeras'),
(62231, 'Capitanes y patrones de pesca de alta mar'),
(62232, 'Pescadores de alta mar'),
(62240, 'Cazadores y tramperos'),
(63100, 'Trabajadores agr?colas de subsistencia'),
(63200, 'Trabajadores pecuarios de subsistencia'),
(63300, 'Trabajadores agropecuarios de subsistencia'),
(63400, 'Pescadores, cazadores, tramperos y recolectores de subsistencia'),
(71110, 'Constructores de casas'),
(71120, 'Alba?iles y oficiales de construcci?n'),
(71130, 'Labrantes, tronzadores y grabadores de piedra'),
(71140, 'Operarios en cemento armado, enfoscadores y afines'),
(71150, 'Carpinteros de armar y de obra blanca'),
(71190, 'Oficiales y operarios de la construcci?n de obra gruesa y afines no clasificados en otras ocupaciones'),
(71210, 'Techadores'),
(71221, 'Enchapadores'),
(71222, 'Instaladores de pisos'),
(71230, 'Revocadores'),
(71240, 'Instaladores de material aislante y de insonorizaci?n'),
(71250, 'Cristaleros y vidrieros'),
(71261, 'Fontaneros y plomeros'),
(71262, 'Instaladores de tuber?as para sistemas de extinci?n de incendios'),
(71263, 'Instaladores de redes y equipos a gas'),
(71264, 'Operarios de mantenimiento de redes de abastecimiento de agua y gas'),
(71270, 'Mec?nicos montadores de aire acondicionado y refrigeraci?n'),
(71310, 'Pintores y empapeladores'),
(71320, 'Barnizadores y afines'),
(71330, 'Limpiadores de fachadas y deshollinadores'),
(72110, 'Operarios de fundici?n, moldeadores y macheros'),
(72120, 'Soldadores y oxicortadores'),
(72131, 'Chapistas y caldereros'),
(72132, 'Latoneros'),
(72140, 'Montadores de estructuras met?licas'),
(72151, 'Aparejadores'),
(72152, 'Instaladores y empalmadores de cables'),
(72210, 'Herreros y forjadores'),
(72220, 'Herramentistas y afines'),
(72230, 'Ajustadores y operadores de m?quinas herramientas'),
(72240, 'Pulidores de metales y afiladores de herramientas'),
(72310, 'Mec?nicos y reparadores de veh?culos de motor'),
(72320, 'Mec?nicos y reparadores de sistemas y motores de aeronaves'),
(72331, 'Mec?nicos industriales'),
(72332, 'Mec?nicos de equipo pesado'),
(72333, 'Mec?nicos de maquinaria textil, confecci?n, cuero, calzado y marroquiner?a'),
(72334, 'Marineros de sala de m?quinas'),
(72335, 'Auxiliares en automatizaci?n e instrumentaci?n industrial'),
(72340, 'Reparadores de bicicletas y afines'),
(73110, 'Mec?nicos y reparadores de instrumentos de precisi?n'),
(73120, 'Fabricantes y afinadores de instrumentos musicales'),
(73140, 'Alfareros y ceramistas (barro y arcilla)'),
(73151, 'Operarios de fabricaci?n, moldeo y acabado del vidrio'),
(73152, 'Artesanos trabajos en vidrio'),
(73160, 'Rotulistas, pintores decorativos y grabadores'),
(73211, 'Pre-impresores y pre-prensistas de artes gr?ficas'),
(73212, 'Tip?grafos'),
(73220, 'Impresores de artes gr?ficas'),
(73230, 'Encuadernadores y afines'),
(73310, 'Tejedores con telares'),
(73320, 'Tejedores con agujas'),
(73330, 'Otros tejedores'),
(73410, 'Cesteros y mimbreros'),
(73420, 'Sombrereros artesanales'),
(73510, 'Talladores de piezas artesanales de madera'),
(73520, 'Decoradores de piezas artesanales en madera'),
(73610, 'Joyeros'),
(73620, 'Orfebres y plateros'),
(73630, 'Bisuteros'),
(73700, 'Artesanos del cuero'),
(73910, 'Artesanos de papel'),
(73920, 'Artesanos del hierro y otros metales'),
(73930, 'Artesanos de las semillas y cortezas vegetales'),
(73991, 'Artesanos trabajos en materiales l?ticos'),
(73999, 'Artesanos de otros materiales no clasificados en otras ocupaciones'),
(74111, 'Electricistas de obra, residenciales y afines'),
(74112, 'Ayudantes electricistas'),
(74121, 'Electricistas industriales'),
(74122, 'Reparadores de aparatos electrodom?sticos'),
(74123, 'Mec?nicos electricistas'),
(74130, 'Instaladores y reparadores de l?neas el?ctricas'),
(74210, 'Ajustadores, reparadores e instaladores en electr?nica'),
(74221, 'T?cnicos instaladores de redes y l?neas de telecomunicaciones'),
(74222, 'Auxiliares t?cnicos de instalaci?n, mantenimiento y reparaci?n de sistemas de telecomunicaciones'),
(74223, 'Operarios de mantenimiento y servicio de televisi?n por cable'),
(75110, 'Carniceros, pescaderos y afines'),
(75121, 'Panaderos, pasteleros y confiteros'),
(75122, 'Transformadores de ca?a panelera'),
(75130, 'Operarios de la elaboraci?n de productos l?cteos'),
(75140, 'Operarios de la conservaci?n de frutas, legumbres, verduras y afines'),
(75150, 'Catadores y clasificadores de alimentos y bebidas'),
(75160, 'Preparadores y elaboradores de cigarros y productos del tabaco'),
(75210, 'Operarios del tratamiento de la madera'),
(75220, 'Ebanistas y carpinteros (excluye carpinteros de armar y de obra blanca)'),
(75230, 'Ajustadores y operadores de m?quinas para trabajar madera'),
(75310, 'Sastres, modistos, peleteros y sombrereros'),
(75321, 'Patronistas de productos de tela, cuero y piel'),
(75322, 'Cortadores de tela, cuero y piel'),
(75330, 'Costureros, bordadores y afines'),
(75340, 'Tapiceros, colchoneros y afines'),
(75350, 'Apelambradores, pellejeros y curtidores'),
(75360, 'Zapateros y afines'),
(75410, 'Buzos'),
(75420, 'Dinamiteros y pegadores'),
(75431, 'Analistas de calidad de textiles'),
(75432, 'Inspectores de control de calidad, fabricaci?n de productos de tela, piel y cuero'),
(75433, 'Inspectores de control de calidad, procesamiento de la madera'),
(75439, 'Clasificadores y probadores de productos (excluyendo alimentos y bebidas) no clasificados en otras ocupaciones'),
(75440, 'Fumigadores y otros controladores de plagas y malas hierbas'),
(75490, 'Otros oficiales, operarios y oficios relacionados no clasificados en otros grupos primarios'),
(81111, 'Mineros y canteros'),
(81112, 'Operadores de servicios e instalaciones mineras'),
(81113, 'Operadores de equipo pesado de miner?a'),
(81120, 'Operadores de instalaciones de procesamiento de minerales y rocas'),
(81131, 'Perforadores de pozos de gas y petr?leo'),
(81132, 'Perforadores de pozos de agua'),
(81133, 'Operadores de servicios en perforaci?n de petr?leo y gas'),
(81134, 'Operadores de producci?n de hidrocarburos'),
(81135, 'Operadores de servicios a pozos de hidrocarburos'),
(81136, 'Operadores torres de perforaci?n de pozos hidrocarburos'),
(81140, 'Operadores de m?quinas para fabricar cemento y otros productos minerales'),
(81210, 'Operadores de instalaciones de procesamiento de metales'),
(81220, 'Operadores de m?quinas pulidoras, galvanizadoras y recubridoras de metales'),
(81311, 'Operadores de m?quinas de planta qu?mica'),
(81312, 'Operadores de planta de gas'),
(81320, 'Operadores de m?quinas y procesadores fotogr?ficos y de pel?culas'),
(81410, 'Operadores de m?quinas para fabricar productos de caucho'),
(81420, 'Operadores de m?quinas para fabricar productos de material pl?stico'),
(81430, 'Operadores de m?quinas para fabricar productos de papel'),
(81510, 'Operadores de m?quinas de preparaci?n de fibras, hilado y devanado'),
(81520, 'Operadores de telares y otras m?quinas tejedoras'),
(81530, 'Operadores de m?quinas de coser y bordar'),
(81540, 'Operadores de m?quinas de blanqueamiento, te?ido y limpieza de tejidos'),
(81550, 'Operadores de m?quinas de tratamiento de pieles y cueros'),
(81560, 'Operadores de m?quinas para la fabricaci?n de calzado y afines'),
(81570, 'Operadores de m?quinas de lavander?a'),
(81590, 'Operadores de m?quinas para fabricar productos textiles y art?culos de piel y cuero no clasificadas en otras ocupaciones'),
(81600, 'Operadores de m?quinas para elaborar alimentos y productos afines'),
(81711, 'Operadores de m?quinas para la fabricaci?n de papel'),
(81712, 'Operadores de m?quinas para la producci?n de pulpa'),
(81720, 'Operadores de instalaciones de procesamiento de la madera'),
(81811, 'Operadores de fabricaci?n, moldeo y acabado del vidrio'),
(81812, 'Operadores de moldeo de arcilla y piedra'),
(81820, 'Operadores de m?quinas de vapor y calderas'),
(81830, 'Operadores de m?quinas de embalaje, embotellamiento y etiquetado'),
(81891, 'Operadores portuarios'),
(81899, 'Otros operadores de m?quinas y de instalaciones fijas no clasificados en otras ocupaciones'),
(82110, 'Ensambladores de maquinaria mec?nica'),
(82121, 'Ensambladores de productos electr?nicos'),
(82122, 'Ensambladores de aparatos y equipo el?ctrico'),
(82123, 'Ensambladores de transformadores y motores el?ctricos industriales'),
(82124, 'Operadores de m?quinas para la fabricaci?n de productos y componentes el?ctricos'),
(82190, 'Ensambladores no clasificados en otras ocupaciones'),
(83110, 'Maquinistas de transporte ferroviario'),
(83120, 'Guardafrenos, guardagujas y agentes de maniobras'),
(83210, 'Conductores de motocicletas'),
(83230, 'Conductores de camionetas y veh?culos livianos'),
(83240, 'Conductores de taxis'),
(83310, 'Conductores de buses, microbuses y tranv?as'),
(83320, 'Conductores de camiones y veh?culos pesados'),
(83410, 'Operadores de maquinaria agr?cola y forestal m?vil'),
(83420, 'Operadores de m?quinas de movimiento de tierras, construcci?n de v?as y afines'),
(83430, 'Operadores de gr?as, aparatos elevadores y afines'),
(83440, 'Operadores de montacargas'),
(83501, 'Marineros de cubierta y de apoyo'),
(83502, 'Operadores de embarcaciones menores'),
(91110, 'Personal de servicio dom?stico'),
(91120, 'Aseadores de oficinas, hoteles y otros establecimientos'),
(91210, 'Lavanderos y planchadores manuales'),
(91220, 'Lavadores de veh?culos'),
(91230, 'Limpiadores de ventanas y vitrinas'),
(91290, 'Otro personal de limpieza no clasificados en otras ocupaciones'),
(92110, 'Obreros y peones de explotaciones agr?colas'),
(92120, 'Obreros y peones de explotaciones ganaderas'),
(92130, 'Obreros y peones de explotaciones agropecuarias'),
(92140, 'Obreros y peones de jardiner?a y horticultura'),
(92150, 'Obreros y peones forestales y de silvicultura'),
(92160, 'Obreros y peones de pesca y acuicultura'),
(93111, 'Obreros y peones de minas y canteras'),
(93112, 'Obreros y ayudantes de producci?n en pozos de petr?leo y gas'),
(93121, 'Obreros y peones de obras p?blicas y mantenimiento'),
(93122, 'Obreros y operarios de cementerios'),
(93130, 'Obreros y peones de la construcci?n'),
(93210, 'Empacadores manuales'),
(93291, 'Obreros y ayudantes en el procesamiento de la madera y producci?n de pulpa y papel'),
(93292, 'Obreros y ayudantes en el tratamiento de metales y minerales'),
(93293, 'Obreros y ayudantes de planta qu?mica'),
(93294, 'Obreros y ayudantes en la elaboraci?n de alimentos y bebidas'),
(93299, 'Obreros y peones de la industria manufacturera no clasificados en otras ocupaciones'),
(93310, 'Conductores de veh?culos accionados a pedal o a brazo'),
(93320, 'Conductores de veh?culos y maquinaria de tracci?n animal'),
(93331, 'Obreros y peones de carga y descarga'),
(93332, 'Obreros y peones portuarios'),
(93333, 'Operarios y auxiliares de rampa de transporte a?reo'),
(93334, 'Ayudantes de transporte automotor'),
(93340, 'Surtidores de estanter?as'),
(94110, 'Cocineros de comidas r?pidas'),
(94120, 'Ayudantes de cocina'),
(95100, 'Trabajadores ambulantes de servicios y afines'),
(95200, 'Vendedores ambulantes (excluyendo comidas de preparaci?n inmediata)'),
(96110, 'Recolectores de basura y material reciclable'),
(96120, 'Clasificadores de desechos'),
(96130, 'Barrenderos y afines'),
(96211, 'Mandaderos, maleteros y repartidores'),
(96212, 'Mensajeros'),
(96220, 'Personas que realizan trabajos varios'),
(96240, 'Acarreadores de agua y recolectores de le?a'),
(96250, 'Recolectores de dinero y surtidores de m?quinas de venta autom?tica'),
(96260, 'Lectores de medidores'),
(96291, 'Auxiliares de servicios de recreaci?n y deporte'),
(96292, 'Ayudantes de mec?nica y servicio automotriz'),
(96299, 'Otras ocupaciones elementales no clasificadas en otras ocupaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas`
--

CREATE TABLE `ofertas` (
  `nombre_em` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `tipo_contrato` varchar(50) DEFAULT NULL,
  `tipo_empleo` varchar(50) DEFAULT NULL,
  `salario` decimal(50,0) DEFAULT NULL,
  `num_vacante` int(200) DEFAULT NULL,
  `nombre_cargo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_estudios`
--

CREATE TABLE `tipos_estudios` (
  `tipo_estu` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_estudios`
--

INSERT INTO `tipos_estudios` (`tipo_estu`) VALUES
('BACHILLER'),
('DOCTORADO'),
('MAGISTER'),
('POSDOCTORADO'),
('POSGRADO'),
('PRIMARIA'),
('PROFECIONAL'),
('SECUNDARIA'),
('TECNICO'),
('TECNOLOGO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_contratos`
--

CREATE TABLE `tipo_contratos` (
  `tipo_contrato` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_contratos`
--

INSERT INTO `tipo_contratos` (`tipo_contrato`) VALUES
('APRENDIZAJE'),
('OBRA O LABOR '),
('OCACIONAL'),
('PRESTACION DE SERVICIOS'),
('TERMINO FIJO'),
('TERMINO INDEFINIDO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleos`
--

CREATE TABLE `tipo_empleos` (
  `tipo_empleo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_empleos`
--

INSERT INTO `tipo_empleos` (`tipo_empleo`) VALUES
('A DISTANCIA '),
('POR HORAS '),
('PRECENCIAL');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_aspirante_admin`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_aspirante_admin` (
`id_aprendiz` int(11)
,`id_admin` int(11)
,`nombre` varchar(20)
,`apellido` varchar(20)
,`email` varchar(50)
,`telefono` int(10)
,`password` varchar(250)
,`id_experincia` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_experiencia_estudio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_experiencia_estudio` (
`id_experincia` int(11)
,`nombre_empresa` varchar(30)
,`fecha_inicio` date
,`fecha_fin` date
,`cargo` varchar(30)
,`funciones` varchar(50)
,`institucion` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_oferta_empresa`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_oferta_empresa` (
`nombre_em` varchar(50)
,`nombre` varchar(100)
,`tipo_contrato` varchar(50)
,`tipo_empleo` varchar(50)
,`salario` decimal(50,0)
,`num_vacante` int(200)
,`nombre_cargo` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_aspirante_admin`
--
DROP TABLE IF EXISTS `vista_aspirante_admin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_aspirante_admin`  AS SELECT `aspirantes`.`id_aprendiz` AS `id_aprendiz`, `aspirantes`.`id_admin` AS `id_admin`, `aspirantes`.`nombre` AS `nombre`, `aspirantes`.`apellido` AS `apellido`, `aspirantes`.`email` AS `email`, `aspirantes`.`telefono` AS `telefono`, `aspirantes`.`password` AS `password`, `aspirantes`.`id_experincia` AS `id_experincia` FROM `aspirantes` WHERE `aspirantes`.`id_admin` = `aspirantes`.`id_admin` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_experiencia_estudio`
--
DROP TABLE IF EXISTS `vista_experiencia_estudio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_experiencia_estudio`  AS SELECT `experiencias`.`id_experincia` AS `id_experincia`, `experiencias`.`nombre_empresa` AS `nombre_empresa`, `experiencias`.`fecha_inicio` AS `fecha_inicio`, `experiencias`.`fecha_fin` AS `fecha_fin`, `experiencias`.`cargo` AS `cargo`, `experiencias`.`funciones` AS `funciones`, `experiencias`.`institucion` AS `institucion` FROM `experiencias` WHERE `experiencias`.`id_experincia` = `experiencias`.`id_experincia` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_oferta_empresa`
--
DROP TABLE IF EXISTS `vista_oferta_empresa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_oferta_empresa`  AS SELECT `ofertas`.`nombre_em` AS `nombre_em`, `ofertas`.`nombre` AS `nombre`, `ofertas`.`tipo_contrato` AS `tipo_contrato`, `ofertas`.`tipo_empleo` AS `tipo_empleo`, `ofertas`.`salario` AS `salario`, `ofertas`.`num_vacante` AS `num_vacante`, `ofertas`.`nombre_cargo` AS `nombre_cargo` FROM `ofertas` WHERE `ofertas`.`nombre_em` = `ofertas`.`nombre_em` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administadores`
--
ALTER TABLE `administadores`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `aspirantes`
--
ALTER TABLE `aspirantes`
  ADD PRIMARY KEY (`id_aprendiz`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_experincia` (`id_experincia`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`nombre_cargo`),
  ADD KEY `id_cuoc` (`id_cuoc`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`nombre_em`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indices de la tabla `estudioas`
--
ALTER TABLE `estudioas`
  ADD PRIMARY KEY (`institucion`),
  ADD KEY `tipo_estu` (`tipo_estu`);

--
-- Indices de la tabla `experiencias`
--
ALTER TABLE `experiencias`
  ADD PRIMARY KEY (`id_experincia`),
  ADD KEY `institucion` (`institucion`);

--
-- Indices de la tabla `ocupaciones`
--
ALTER TABLE `ocupaciones`
  ADD PRIMARY KEY (`id_cuoc`);

--
-- Indices de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD KEY `nombre_em` (`nombre_em`),
  ADD KEY `tipo_contrato` (`tipo_contrato`),
  ADD KEY `tipo_empleo` (`tipo_empleo`),
  ADD KEY `nombre_cargo` (`nombre_cargo`);

--
-- Indices de la tabla `tipos_estudios`
--
ALTER TABLE `tipos_estudios`
  ADD PRIMARY KEY (`tipo_estu`);

--
-- Indices de la tabla `tipo_contratos`
--
ALTER TABLE `tipo_contratos`
  ADD PRIMARY KEY (`tipo_contrato`);

--
-- Indices de la tabla `tipo_empleos`
--
ALTER TABLE `tipo_empleos`
  ADD PRIMARY KEY (`tipo_empleo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administadores`
--
ALTER TABLE `administadores`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aspirantes`
--
ALTER TABLE `aspirantes`
  ADD CONSTRAINT `aspirantes_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administadores` (`id_admin`),
  ADD CONSTRAINT `aspirantes_ibfk_2` FOREIGN KEY (`id_experincia`) REFERENCES `experiencias` (`id_experincia`);

--
-- Filtros para la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD CONSTRAINT `cargos_ibfk_1` FOREIGN KEY (`id_cuoc`) REFERENCES `ocupaciones` (`id_cuoc`);

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administadores` (`id_admin`);

--
-- Filtros para la tabla `estudioas`
--
ALTER TABLE `estudioas`
  ADD CONSTRAINT `estudioas_ibfk_1` FOREIGN KEY (`tipo_estu`) REFERENCES `tipos_estudios` (`tipo_estu`);

--
-- Filtros para la tabla `experiencias`
--
ALTER TABLE `experiencias`
  ADD CONSTRAINT `experiencias_ibfk_1` FOREIGN KEY (`institucion`) REFERENCES `estudioas` (`institucion`);

--
-- Filtros para la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD CONSTRAINT `ofertas_ibfk_1` FOREIGN KEY (`nombre_em`) REFERENCES `empresas` (`nombre_em`),
  ADD CONSTRAINT `ofertas_ibfk_2` FOREIGN KEY (`tipo_contrato`) REFERENCES `tipo_contratos` (`tipo_contrato`),
  ADD CONSTRAINT `ofertas_ibfk_3` FOREIGN KEY (`tipo_empleo`) REFERENCES `tipo_empleos` (`tipo_empleo`),
  ADD CONSTRAINT `ofertas_ibfk_4` FOREIGN KEY (`nombre_cargo`) REFERENCES `cargos` (`nombre_cargo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
