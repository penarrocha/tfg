-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 08-07-2024 a las 15:43:42
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.3.8

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tfg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albums`
--

DROP TABLE IF EXISTS `albums`;
CREATE TABLE IF NOT EXISTS `albums` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `label_id` mediumint UNSIGNED NOT NULL,
  `album` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `album_clean` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `alias` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `views` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `released_year` year NOT NULL,
  `released_at` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_album_label` (`label_id`,`album`) USING BTREE,
  KEY `uq_album_album` (`alias`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `albums`
--

INSERT INTO `albums` (`id`, `label_id`, `album`, `album_clean`, `alias`, `views`, `released_year`, `released_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Synaesthesia', 'synaesthesia', 'synaesthesia', 5, '1999', NULL, '2024-03-02 19:33:28', '2024-07-03 19:49:34'),
(2, 2, 'Never Stop', 'never stop', 'never-stop', 5, '2002', NULL, '2024-03-03 00:26:29', '2024-06-23 20:20:39'),
(3, 2, 'Dancer', 'dancer', 'dancer', 2, '2001', NULL, '2024-03-03 11:27:16', '2024-06-23 20:14:26'),
(4, 2, 'Into Your Own', 'into your own', 'into-your-own', 16, '2003', NULL, '2024-03-03 11:48:24', '2024-07-03 20:18:45'),
(5, 2, 'Flying', 'flying', 'flying', 4, '2003', NULL, '2024-03-03 11:51:01', '2024-07-02 22:43:17'),
(6, 3, 'Fantasy', 'fantasy', 'fantasy', 3, '2001', NULL, '2024-03-07 21:43:19', '2024-07-03 19:48:26'),
(7, 4, 'The dark side of the moon', 'the dark side of the moon', 'the-dark-side-of-the-moon', 13, '1973', '1973-03-01', '2024-03-15 17:53:24', '2024-07-03 19:49:05'),
(8, 5, 'Use Your Illusion I', 'use your illusion i', 'use-you-illusion-i', 17, '1991', NULL, '2024-03-15 17:59:18', '2024-07-03 19:48:14'),
(9, 4, 'Atom heart mother', 'atom heart mother', 'atom-heart-mother', 1, '1970', NULL, '2024-03-17 20:42:16', '2024-07-04 19:05:51'),
(10, 4, 'Meddle', 'meddle', 'meddle', 2, '1971', NULL, '2024-03-17 20:42:34', '2024-07-03 19:48:45'),
(11, 4, 'Wish you were here', 'wish you were here', 'wish-you-were-here', 7, '1975', NULL, '2024-03-17 20:42:52', '2024-07-03 19:46:51'),
(12, 4, 'Animals', 'animals', 'animals', 4, '1977', NULL, '2024-03-17 20:43:01', '2024-06-23 19:43:29'),
(13, 4, 'The Wall', 'the wall', 'the-wall', 1, '1979', NULL, '2024-03-17 20:43:08', '2024-06-23 19:43:31'),
(14, 4, 'The final cut', 'the final cut', 'the-final-cut', 6, '1983', NULL, '2024-03-17 20:43:19', '2024-07-03 19:48:49'),
(15, 4, 'A momentary lapse of reason', 'a momentary lapse of reason', 'a-momentary-lapse-of-reason', 1105, '1987', NULL, '2024-03-17 20:43:42', '2024-07-07 20:26:39'),
(16, 4, 'The division bell', 'the division bell', 'the-division-bell', 4, '1994', NULL, '2024-03-17 20:43:54', '2024-07-03 19:48:56'),
(17, 4, 'The endless river', 'the endless river', 'the-endless-river', 4, '2014', NULL, '2024-03-17 20:44:07', '2024-07-03 19:48:53'),
(18, 5, 'Use Your Illusion II', 'use your illusion ii', 'use-you-illusion-ii', 3, '1991', NULL, '2024-04-02 20:59:31', '2024-07-03 19:48:17'),
(19, 6, 'Ecuador', 'ecuador', 'ecuador', 5, '1997', NULL, '2024-04-09 17:16:30', '2024-07-04 18:23:34'),
(20, 7, 'Juez y parte', 'juez y parte', 'juez-parte', 4, '1985', NULL, '2024-04-09 18:25:28', '2024-07-03 19:49:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `album_artist`
--

DROP TABLE IF EXISTS `album_artist`;
CREATE TABLE IF NOT EXISTS `album_artist` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `album_id` mediumint UNSIGNED NOT NULL,
  `artist_id` mediumint UNSIGNED NOT NULL,
  `relationship_id` smallint UNSIGNED NOT NULL,
  `ordering` tinyint UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_album_artist-artist` (`artist_id`) USING BTREE,
  KEY `uq_album-artist` (`album_id`,`artist_id`) USING BTREE,
  KEY `fk_album_artist_relationship` (`relationship_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `album_artist`
--

INSERT INTO `album_artist` (`id`, `album_id`, `artist_id`, `relationship_id`, `ordering`) VALUES
(1, 1, 1, 1, 0),
(2, 3, 2, 2, 0),
(3, 3, 3, 3, 1),
(4, 3, 4, 1, 2),
(5, 2, 2, 2, 0),
(6, 2, 3, 1, 1),
(7, 4, 2, 2, 0),
(8, 4, 3, 3, 1),
(9, 4, 4, 1, 2),
(10, 5, 2, 2, 0),
(11, 5, 3, 3, 1),
(12, 5, 4, 1, 2),
(13, 6, 5, 1, 0),
(14, 7, 6, 1, 0),
(15, 8, 7, 1, 0),
(16, 9, 6, 1, 0),
(17, 10, 6, 1, 0),
(18, 11, 6, 1, 0),
(19, 12, 6, 1, 0),
(20, 13, 6, 1, 0),
(21, 14, 6, 1, 0),
(22, 15, 6, 1, 0),
(23, 16, 6, 1, 0),
(24, 17, 6, 1, 0),
(25, 18, 7, 1, 0),
(26, 19, 8, 2, 0),
(27, 19, 9, 1, 1),
(28, 20, 10, 7, 0),
(29, 20, 11, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `album_song`
--

DROP TABLE IF EXISTS `album_song`;
CREATE TABLE IF NOT EXISTS `album_song` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `album_id` mediumint UNSIGNED NOT NULL,
  `song_id` mediumint UNSIGNED NOT NULL,
  `ordering` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `ordering_text` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_album-song` (`album_id`,`song_id`) USING BTREE,
  KEY `fk_album_song_song` (`song_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `album_song`
--

INSERT INTO `album_song` (`id`, `album_id`, `song_id`, `ordering`, `ordering_text`) VALUES
(1, 1, 1, 0, 'A1'),
(3, 1, 2, 1, 'B1'),
(4, 2, 3, 0, 'A'),
(5, 2, 4, 1, 'B1'),
(6, 2, 5, 2, 'B2'),
(7, 3, 6, 0, 'A'),
(8, 3, 7, 1, 'B1'),
(9, 3, 8, 2, 'B2'),
(10, 4, 9, 0, 'A'),
(11, 4, 10, 1, 'B'),
(12, 5, 11, 0, 'A'),
(13, 5, 12, 1, 'B'),
(14, 6, 13, 0, 'A'),
(15, 6, 14, 1, 'B1'),
(16, 6, 15, 2, 'B2'),
(17, 7, 16, 0, NULL),
(18, 7, 17, 2, NULL),
(19, 7, 18, 3, NULL),
(20, 7, 19, 4, NULL),
(21, 7, 20, 5, NULL),
(22, 7, 21, 6, NULL),
(23, 7, 22, 7, NULL),
(24, 7, 23, 8, NULL),
(28, 8, 24, 0, NULL),
(30, 8, 25, 1, NULL),
(31, 8, 26, 2, NULL),
(32, 8, 27, 3, NULL),
(33, 8, 28, 4, NULL),
(34, 8, 29, 5, NULL),
(35, 8, 30, 6, NULL),
(36, 8, 31, 7, NULL),
(37, 8, 32, 8, NULL),
(38, 8, 33, 9, NULL),
(39, 8, 34, 10, NULL),
(40, 8, 35, 11, NULL),
(41, 8, 36, 12, NULL),
(42, 8, 37, 13, NULL),
(43, 8, 38, 14, NULL),
(44, 8, 39, 15, NULL),
(45, 9, 40, 0, NULL),
(46, 9, 41, 1, NULL),
(47, 9, 42, 2, NULL),
(48, 9, 43, 3, NULL),
(49, 9, 44, 4, NULL),
(51, 10, 45, 0, NULL),
(52, 10, 46, 1, NULL),
(53, 10, 47, 2, NULL),
(54, 10, 48, 3, NULL),
(55, 10, 49, 4, NULL),
(56, 10, 50, 5, NULL),
(58, 11, 51, 0, NULL),
(59, 11, 52, 1, NULL),
(60, 11, 53, 2, NULL),
(61, 11, 54, 3, NULL),
(62, 11, 55, 4, NULL),
(63, 12, 56, 0, NULL),
(64, 12, 57, 1, NULL),
(65, 12, 58, 2, NULL),
(66, 12, 59, 3, NULL),
(67, 12, 60, 4, NULL),
(68, 13, 61, 0, '1-1'),
(69, 13, 62, 1, '1-2'),
(70, 13, 63, 2, '1-3'),
(71, 13, 64, 3, '1-4'),
(72, 13, 65, 4, '1-5'),
(73, 13, 66, 5, '1-6'),
(74, 13, 67, 6, '1-7'),
(75, 13, 68, 7, '1-8'),
(76, 13, 69, 8, '1-9'),
(77, 13, 70, 9, '1-10'),
(78, 13, 71, 10, '1-11'),
(79, 13, 86, 11, '1-12'),
(80, 13, 72, 12, '1-13'),
(82, 13, 73, 13, '2-1'),
(83, 13, 74, 14, '2-2'),
(84, 13, 75, 15, '2-3'),
(85, 13, 76, 16, '2-4'),
(86, 13, 77, 17, '2-5'),
(87, 13, 78, 18, '2-6'),
(88, 13, 79, 19, '2-7'),
(89, 13, 80, 20, '2-8'),
(90, 13, 81, 21, '2-9'),
(91, 13, 82, 22, '2-10'),
(92, 13, 83, 23, '2-11'),
(93, 13, 84, 24, '2-12'),
(95, 13, 85, 25, '2-13'),
(96, 14, 87, 0, NULL),
(97, 14, 88, 1, NULL),
(98, 14, 89, 2, NULL),
(99, 14, 90, 3, NULL),
(100, 14, 91, 4, NULL),
(101, 14, 92, 5, NULL),
(102, 14, 93, 6, NULL),
(103, 14, 94, 7, NULL),
(104, 14, 95, 8, NULL),
(105, 14, 96, 9, NULL),
(106, 14, 97, 10, NULL),
(107, 14, 98, 11, NULL),
(110, 15, 99, 0, NULL),
(111, 15, 100, 1, NULL),
(112, 15, 101, 2, NULL),
(113, 15, 102, 3, NULL),
(114, 15, 103, 4, NULL),
(115, 15, 104, 5, NULL),
(116, 15, 105, 6, NULL),
(117, 15, 106, 7, NULL),
(118, 15, 107, 8, NULL),
(119, 15, 108, 9, NULL),
(120, 16, 109, 0, NULL),
(121, 16, 110, 1, NULL),
(122, 16, 111, 2, NULL),
(123, 16, 112, 4, NULL),
(124, 16, 113, 4, NULL),
(125, 16, 114, 5, NULL),
(126, 16, 115, 6, NULL),
(127, 16, 116, 7, NULL),
(128, 16, 117, 8, NULL),
(129, 16, 118, 9, NULL),
(130, 16, 119, 10, NULL),
(132, 17, 120, 0, '1-01'),
(133, 17, 121, 1, '1-02'),
(134, 17, 122, 2, '1-03'),
(135, 17, 123, 3, '2-01'),
(136, 17, 124, 4, '2-02'),
(137, 17, 125, 5, '2-03'),
(138, 17, 126, 6, '2-04'),
(139, 17, 127, 7, '3-01'),
(140, 17, 128, 8, '3-02'),
(141, 17, 129, 9, '3-03'),
(142, 17, 130, 10, '3-04'),
(143, 17, 131, 11, '3-05'),
(144, 17, 132, 12, '3-06'),
(145, 17, 133, 13, '3-07'),
(148, 17, 134, 14, '4-01'),
(149, 17, 135, 15, '4-02'),
(150, 17, 136, 16, '4-03'),
(151, 17, 137, 17, '4-04'),
(152, 18, 138, 0, NULL),
(153, 18, 139, 1, NULL),
(154, 18, 140, 2, NULL),
(155, 18, 141, 3, NULL),
(156, 18, 142, 4, NULL),
(157, 18, 143, 5, NULL),
(158, 18, 144, 6, NULL),
(159, 18, 145, 7, NULL),
(160, 18, 146, 8, NULL),
(161, 18, 147, 9, NULL),
(162, 18, 148, 10, NULL),
(163, 18, 149, 11, NULL),
(164, 18, 150, 12, NULL),
(165, 18, 151, 13, NULL),
(166, 7, 152, 8, NULL),
(167, 7, 153, 1, NULL),
(168, 19, 154, 0, 'A1'),
(169, 19, 155, 1, 'A2'),
(170, 19, 156, 2, 'A3'),
(171, 19, 157, 3, 'B1'),
(172, 19, 158, 4, 'B2'),
(173, 19, 159, 5, 'B3'),
(174, 20, 160, 0, NULL),
(175, 20, 161, 1, NULL),
(176, 20, 162, 2, NULL),
(177, 20, 163, 3, NULL),
(178, 20, 164, 4, NULL),
(179, 20, 165, 5, NULL),
(180, 20, 166, 6, NULL),
(181, 20, 167, 7, NULL),
(182, 20, 168, 8, NULL),
(183, 20, 169, 9, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `album_style`
--

DROP TABLE IF EXISTS `album_style`;
CREATE TABLE IF NOT EXISTS `album_style` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `album_id` mediumint UNSIGNED NOT NULL,
  `style_id` smallint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_album_style` (`album_id`,`style_id`) USING BTREE,
  KEY `fk_album_style_style` (`style_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `album_style`
--

INSERT INTO `album_style` (`id`, `album_id`, `style_id`) VALUES
(49, 1, 1),
(1, 1, 3),
(2, 2, 1),
(3, 2, 3),
(4, 3, 1),
(5, 3, 3),
(48, 4, 1),
(6, 4, 4),
(7, 5, 1),
(8, 5, 3),
(9, 6, 1),
(10, 6, 3),
(11, 7, 7),
(12, 7, 8),
(13, 7, 9),
(14, 8, 7),
(15, 8, 10),
(16, 9, 8),
(17, 10, 7),
(18, 10, 8),
(19, 10, 9),
(20, 11, 7),
(21, 11, 8),
(22, 11, 9),
(23, 12, 7),
(24, 12, 8),
(25, 12, 9),
(26, 13, 7),
(27, 13, 8),
(28, 13, 9),
(29, 14, 7),
(30, 14, 8),
(31, 15, 7),
(32, 15, 8),
(33, 15, 9),
(34, 16, 7),
(35, 16, 8),
(36, 16, 9),
(39, 17, 7),
(40, 17, 8),
(41, 17, 9),
(42, 18, 7),
(43, 18, 10),
(44, 19, 1),
(45, 19, 2),
(46, 19, 3),
(47, 20, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artists`
--

DROP TABLE IF EXISTS `artists`;
CREATE TABLE IF NOT EXISTS `artists` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `artist` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `artist_clean` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alias` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `views` mediumint UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_artist` (`artist`) USING BTREE,
  UNIQUE KEY `uq_alias` (`alias`) USING BTREE,
  UNIQUE KEY `uq_artist_clean` (`artist_clean`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `artists`
--

INSERT INTO `artists` (`id`, `artist`, `artist_clean`, `alias`, `url`, `views`, `description`, `created_at`, `updated_at`) VALUES
(1, 'The Thrillseekers', 'the thrillseekers', 'the-thrillseekers', NULL, 27, NULL, '2024-03-02 19:34:19', '2024-07-03 20:03:24'),
(2, 'Spacio', 'spacio', 'spacio', NULL, 3, NULL, '2024-03-03 00:29:14', '2024-07-03 20:05:31'),
(3, 'Rafa Ruiz', 'rafa ruiz', 'rafa-ruiz', NULL, 0, NULL, '2024-03-03 00:29:20', '2024-04-17 22:49:52'),
(4, 'Freeman', 'freeman', 'freeman', NULL, 0, NULL, '2024-03-03 00:29:24', '2024-04-17 22:49:53'),
(5, 'Empyre', 'empyre', 'empyre', NULL, 24, NULL, '2024-03-07 21:42:04', '2024-07-03 19:48:24'),
(6, 'Pink Floyd', 'pink floyd', 'pink-floyd', NULL, 1657, '<p>Pink Floyd se formó en 1965 en Londres, Inglaterra. Los miembros fundadores fueron Syd Barrett (guitarra y voz), Roger Waters (bajo y voz), Nick Mason (batería) y Richard Wright (teclados y voz). El grupo inicialmente se llamaba <code class=\"artist-name\">The Tea Set</code>. pero cambiaron su nombre a <code class=\"artist-name\">The Pink Floyd Sound</code> inspirado en dos músicos de blues: Pink Anderson y Floyd Council. Posteriormente, el nombre se simplificó a <code class=\"artist-name\">Pink Floyd</code>.</p>\r\n<h3>Miembros</h3>\r\n<ul>\r\n	<li><span class=\"artist-name\">Syd Barrett</span> (1946-2006): Guitarrista y vocalista original, dejó la banda en 1968.</li>\r\n	<li><span class=\"artist-name\">Roger Waters</span> (1943): Bajista y principal letrista desde finales de los 60 hasta su salida en 1985.</li>\r\n	<li><span class=\"artist-name\">David Gilmour</span> (1946): Guitarrista y vocalista, se unió en 1968 y lideró la banda después de la salida de Waters.</li>\r\n	<li><span class=\"artist-name\">Nick Mason (1944)</span>: Baterista, el único miembro constante en toda la historia de la banda.</li>\r\n	<li><span class=\"artist-name\">Richard Wright</span> (1943-2008): Tecladista y vocalista, dejó la banda en 1979 pero regresó en 1987.</li>\r\n</ul>\r\n\r\n<h3>Primeros Éxitos y Cambio de Dirección (1967-1968)</h3>\r\n<dl>\r\n	<dt>1967</dt>\r\n	<dd>Su primer sencillo, <span class=\"song-title\">Arnold Layne</span>, alcanzó el éxito en las listas del Reino Unido. Poco después, lanzaron <span class=\"song-title\">See Emily Play</span>, que resultó otro éxito. En agosto, su álbum debut, <code class=\"album-name\">The Piper at the Gates of Dawn</code>, fue lanzado y se convirtió en un <strong>hito del rock psicodélico</strong>, destacando las composiciones de <span class=\"artist-name\">Syd Barrett</span>.</dd>\r\n	<dt>1968</dt>\r\n	<dd>La creciente inestabilidad de Barrett debido al uso de drogas y problemas de salud mental llevó a la incorporación de <span class=\"artist-name\">David Gilmour</span> como guitarrista en enero. Barrett dejó el grupo en abril de 1968, y Gilmour asumió un papel más prominente junto a Roger Waters.</dd>\r\n</dl>\r\n<h3>Evolución y Éxito Comercial (1968-1975)</h3>\r\n<dl>\r\n	<dt>1968</dt>\r\n	<dd>Pink Floyd lanzó <code class=\"album-name\">A Saucerful of Secrets</code>, el único álbum en el que participaron los cinco miembros (Barrett, aunque presente en una sola canción).</dd>\r\n	<dt>1970</dt>\r\n	<dd><code class=\"album-name\">Atom Heart Mother</code> llegó al número uno en el Reino Unido.\r\n	<dt>1971</dt>\r\n	<dd><code class=\"album-name\">Meddle</code>, que incluye la épica <span class=\"song-title\">Echoes</span>, consolidó su sonido distintivo.</dd>\r\n	<dt>1973</dt>\r\n	<dd><code class=\"album-name\">The Dark Side of the Moon</code> fue un éxito monumental, permaneciendo en las <strong>listas de Billboard durante más de 14 años</strong>. El álbum exploró temas universales como el paso del tiempo, la muerte y la locura, y <strong>es considerado uno de los mejores álbumes de todos los tiempos</strong>.</dd>\r\n	<dt>1975</dt>\r\n	<dd><code class=\"album-name\">Wish You Were Here</code> fue lanzado, dedicado en gran parte a Syd Barrett. El álbum incluye las canciones <span class=\"song-title\">Shine On You Crazy Diamond</span> y <span class=\"song-title\">Wish You Were Here</span>, cuyas letras hacen clara referencia al delicado estado mental de Syd Barrett.</dd>\r\n</dl>\r\n<h3>Periodo de Conceptos Ambiciosos (1977-1985)</h3>\r\n<dl>\r\n	<dt>1977</dt>\r\n	<dd><code class=\"album-name\">Animals</code>, una crítica a la sociedad capitalista, demostró una dirección más oscura y política.</dd>\r\n	<dt>1979</dt>\r\n	<dd><code class=\"album-name\">The Wall</code> fue otro gran éxito, un <strong>álbum conceptual</strong> que explora la alienación y el aislamiento personal. La gira y la película basada en el álbum (1982) fueron igualmente ambiciosas.</dd>\r\n	<dt>1983</dt>\r\n	<dd><code class=\"album-name\">The Final Cut</code>, el <strong>último álbum con Roger Waters</strong>, es visto como una continuación de The Wall y trata temas de guerra y pérdida.</dd>\r\n	<dt>1985</dt>\r\n	<dd><span class=\"artist-name\">Roger Waters</span> dejó la banda debido a diferencias creativas y personales. Intentó disolver la banda legalmente, pero Gilmour y Mason continuaron bajo el nombre de Pink Floyd.</dd>\r\n</dl>\r\n<h3>Era de Gilmour y Reuniones (1987-2014)</h3>\r\n<dl>\r\n	<dt>1987</dt>\r\n	<dd>Pink Floyd, liderado por Gilmour, lanzó <code class=\"album-name\">A Momentary Lapse of Reason</code>, que fue un éxito comercial.</dd>\r\n	<dt>1994</dt>\r\n	<dd><code class=\"album-name\">The Division Bell</code> abordó temas de comunicación y fue seguido por una exitosa gira mundial.</dd>\r\n	<dt>2005</dt>\r\n	<dd>Los miembros originales, incluyendo Waters, se reunieron para el concierto benéfico Live 8 en Londres, marcando su primera actuación juntos en 24 años.</dd>\r\n	<dt>2014</dt>\r\n	<dd>Se lanzó <code class=\"album-name\">The Endless River</code>, basado en material inédito de las sesiones de The Division Bell, considerado un <strong>tributo a Richard Wright</strong>, quien falleció en 2008.</dd>\r\n</dl>\r\n<h3>Legado</h3>\r\n<p>Pink Floyd es conocido por sus innovadores álbumes conceptuales, sus espectaculares conciertos en vivo y su influencia duradera en la música rock. <strong<Han vendido más de 250 millones de discos</strong> en todo el mundo, convirtiéndose en una de las bandas más exitosas y respetadas de la historia del rock.</p>', '2024-03-15 17:51:16', '2024-07-07 20:27:59'),
(7, 'Guns N\' Roses', 'guns n roses', 'guns-n-roses', NULL, 68, NULL, '2024-03-15 17:51:23', '2024-07-03 19:48:22'),
(8, 'Sash!', 'sash', 'sash', NULL, 15, NULL, '2024-04-09 17:00:27', '2024-06-19 00:26:21'),
(9, 'Rodriguez', 'rodriguez', 'rodriguez', NULL, 1, NULL, '2024-04-09 17:00:45', '2024-07-03 23:21:10'),
(10, 'Joaquín Sabina', 'joaquin sabina', 'joaquin-sabina', NULL, 41, NULL, '2024-04-09 18:24:04', '2024-06-19 00:26:28'),
(11, 'Viceversa', 'viceversa', 'viceversa', NULL, 1, NULL, '2024-04-09 18:24:08', '2024-06-19 00:25:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artist_song`
--

DROP TABLE IF EXISTS `artist_song`;
CREATE TABLE IF NOT EXISTS `artist_song` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `artist_id` mediumint UNSIGNED NOT NULL,
  `song_id` mediumint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_artist_song_artist` (`artist_id`) USING BTREE,
  KEY `fk_artist_song-song` (`song_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` mediumint UNSIGNED NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `commentable_id` mediumint UNSIGNED NOT NULL,
  `commentable_type` enum('album','artist','band','song') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_comment_user` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `format` enum('jpeg','webp','png') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `imageable_id` mediumint UNSIGNED NOT NULL,
  `imageable_type` enum('App\\Models\\Album','App\\Models\\Artist') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ordering` tinyint UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`id`, `src`, `format`, `description`, `imageable_id`, `imageable_type`, `ordering`) VALUES
(1, 'assets/images/artists/pink-floyd/pink-floyd-1.webp', 'webp', 'Foto del grupo en 1971', 6, 'App\\Models\\Artist', 0),
(2, 'assets/images/artists/pink-floyd/pink-floyd-2.webp', 'webp', 'Foto del grupo en 1972', 6, 'App\\Models\\Artist', 1),
(3, 'assets/images/artists/pink-floyd/pink-floyd-3.webp', 'jpeg', 'Foto del grupo en 1968', 6, 'App\\Models\\Artist', 2),
(4, 'assets/images/artists/pink-floyd/pink-floyd-4.jpeg', 'jpeg', 'Foto del grupo en 1973', 6, 'App\\Models\\Artist', 3),
(5, 'assets/images/artists/pink-floyd/pink-floyd-5.jpg', 'jpeg', 'Foto del grupo en 1970', 6, 'App\\Models\\Artist', 4),
(6, 'assets/images/artists/pink-floyd/pink-floyd-6.jpg', 'jpeg', 'Foto de un concierto de Pink Floyd', 6, 'App\\Models\\Artist', 5),
(7, 'assets/images/albums/pink-floyd/7/the-dark-side-of-the-moon-1.jpg', 'jpeg', NULL, 7, 'App\\Models\\Album', 0),
(8, 'assets/images/albums/pink-floyd/7/the-dark-side-of-the-moon-2.jpg', 'jpeg', NULL, 7, 'App\\Models\\Album', 1),
(9, 'assets/images/albums/pink-floyd/7/the-dark-side-of-the-moon-3.jpg', 'jpeg', NULL, 7, 'App\\Models\\Album', 2),
(10, 'assets/images/albums/pink-floyd/7/the-dark-side-of-the-moon-4.jpg', 'jpeg', NULL, 7, 'App\\Models\\Album', 3),
(11, 'assets/images/albums/sash-feat-rodriguez/19/ecuador-1.jpg', 'jpeg', NULL, 19, 'App\\Models\\Album', 0),
(12, 'assets/images/albums/sash-feat-rodriguez/19/ecuador-2.jpg', 'jpeg', NULL, 19, 'App\\Models\\Album', 1),
(13, 'assets/images/albums/sash-feat-rodriguez/19/ecuador-3.jpg', 'jpeg', NULL, 19, 'App\\Models\\Album', 2),
(14, 'assets/images/albums/sash-feat-rodriguez/19/ecuador-4.jpg', 'jpeg', NULL, 19, 'App\\Models\\Album', 3),
(15, 'assets/images/albums/joaquin-sabina-viceversa/20/juez-y-parte-1.jpg', 'jpeg', NULL, 20, 'App\\Models\\Album', 0),
(16, 'assets/images/albums/joaquin-sabina-viceversa/20/juez-y-parte-2.jpg', 'jpeg', NULL, 20, 'App\\Models\\Album', 1),
(17, 'assets/images/albums/joaquin-sabina-viceversa/20/juez-y-parte-3.jpg', 'jpeg', NULL, 20, 'App\\Models\\Album', 2),
(18, 'assets/images/albums/joaquin-sabina-viceversa/20/juez-y-parte-4.jpg', 'jpeg', NULL, 20, 'App\\Models\\Album', 3),
(19, 'assets/images/albums/joaquin-sabina-viceversa/20/juez-y-parte-5.jpg', 'jpeg', NULL, 20, 'App\\Models\\Album', 4),
(20, 'assets/images/albums/joaquin-sabina-viceversa/20/juez-y-parte-6.jpg', 'jpeg', NULL, 20, 'App\\Models\\Album', 5),
(21, 'assets/images/albums/spacio-feat-rafa-ruiz-freeman/4/spacio-feat-rafa-ruiz-freeman-never-stop-1.jpg', 'jpeg', NULL, 4, 'App\\Models\\Album', 0),
(22, 'assets/images/albums/spacio-feat-rafa-ruiz-freeman/4/spacio-feat-rafa-ruiz-freeman-never-stop-2.jpg', 'jpeg', NULL, 4, 'App\\Models\\Album', 1),
(23, 'assets/images/albums/pink-floyd/13/the-wall-1.jpg', 'jpeg', 'Portada del álbum Pink Floyd - The Wall (1979)', 13, 'App\\Models\\Album', 0),
(24, 'assets/images/albums/pink-floyd/13/the-wall-movie-1.jpg', 'jpeg', 'Portada de la película The Wall (Pink Floyd)', 13, 'App\\Models\\Album', 1),
(25, 'assets/images/albums/pink-floyd/13/the-wall-movie-2.jpg', 'jpeg', 'Fotograma de la película Pink Floyd - The Wall. La picadora de carne simboliza al sistema educativo', 13, 'App\\Models\\Album', 2),
(26, 'assets/images/albums/pink-floyd/13/the-wall-movie-3.jpg', 'jpeg', 'Fotograma de la película The Wall. Los martillos simbolizan al partido de extrema derecha de Pink', 13, 'App\\Models\\Album', 3),
(27, 'assets/images/albums/pink-floyd/13/the-wall-movie-4.jpg', 'jpeg', 'Fotograma de la película The Wall. Pink es representado como un muñeco de trapo', 13, 'App\\Models\\Album', 4),
(28, 'assets/images/albums/empyre/6/empyre-fantasy-front-cover.jpg', 'jpeg', 'Portada del disco de vinilo', 6, 'App\\Models\\Album', 0),
(29, 'assets/images/albums/empyre/6/empyre-fantasy-vinyl-front.jpg', 'jpeg', 'Empyre - Fantasy. Disco de vinilo, vista frontal', 6, 'App\\Models\\Album', 1),
(30, 'assets/images/albums/empyre/6/empyre-fantasy-vinyl-back.jpg', 'jpeg', 'Empyre - Fantasy. Disco de vinilo, vista trasera', 6, 'App\\Models\\Album', 2),
(31, 'assets/images/albums/pink-floyd/10/Meddle-Pink-Floyd.webp', 'webp', 'Portada del álbum Pink Floyd - Meddle', 10, 'App\\Models\\Album', 0),
(32, 'assets/images/albums/pink-floyd/10/Meddle-Pink-Floyd-interior.webp', 'webp', 'Interior del álbum Pink Floyd - Meddle', 10, 'App\\Models\\Album', 1),
(33, 'assets/images/albums/pink-floyd/9/pink-floyd-atom-heart-mother-lp-front.jpg', 'jpeg', 'Portada del LP Atom Heart Mother', 9, 'App\\Models\\Album', 0),
(34, 'assets/images/albums/pink-floyd/9/pink-floyd-atom-heart-mother-lp-back.jpg', 'jpeg', 'Reverso del LP Atom Heart Mother', 9, 'App\\Models\\Album', 1),
(35, 'assets/images/albums/guns-n-roses/8/use-your-ilusion-i-front.jpg', 'jpeg', 'Portada del álbum User Your Ilusion I', 8, 'App\\Models\\Album', 0),
(36, 'assets/images/albums/pink-floyd/12/pink-floyd-animals-cover-front.jpg', 'jpeg', 'Portada del álbum Pink Floyd - Animals', 12, 'App\\Models\\Album', 0),
(37, 'assets/images/albums/pink-floyd/12/pink-floyd-animals-cover-back.jpg', 'jpeg', 'Contra-portada del disco Pink Floyd - Animals', 12, 'App\\Models\\Album', 1),
(38, 'assets/images/albums/pink-floyd/11/pink-floyd-wish-you-were-here.png', 'png', 'Pink Floyd - Wish You Were Here', 11, 'App\\Models\\Album', 0),
(39, 'assets/images/albums/pink-floyd/11/pink-floyd-wish-you-were-here-portadas.jpg', 'jpeg', 'Portada y contraporta del álbum Wish You Were Here', 11, 'App\\Models\\Album', 1),
(40, 'assets/images/albums/pink-floyd/11/pink-floyd-wish-you-were-here-imagenes-interiores.jpg', 'jpeg', 'Imágenes interiores del álbum Wish You Were Here', 11, 'App\\Models\\Album', 2),
(41, 'assets/images/albums/pink-floyd/14/pink-floyd-the-final-cut-cover-front.jpg', 'jpeg', 'Portada del álbum Pink Floyd - The Final Cut', 14, 'App\\Models\\Album', 0),
(42, 'assets/images/albums/pink-floyd/14/pink-floyd-the-final-cut-cover-back.jpg', 'jpeg', 'Contra-portada del disco Pink Floyd - The Final Cut', 14, 'App\\Models\\Album', 1),
(43, 'assets/images/albums/pink-floyd/15/pink-floyd-a-momentary-lapse-of-reason-cover-front.jpg', 'jpeg', 'Portada del álbum Pink Floyd - A momentary lapse of reason', 15, 'App\\Models\\Album', 0),
(44, 'assets/images/albums/pink-floyd/15/pink-floyd-a-momentary-lapse-of-reason-cover-back.jpg', 'jpeg', 'Contra-portada del disco Pink Floyd - A momentary lapse of reason', 15, 'App\\Models\\Album', 1),
(45, 'assets/images/albums/pink-floyd/16/pink-floyd-the-division-bell-cover-front.jpg', 'jpeg', 'Portada del álbum Pink Floyd - The division bell', 16, 'App\\Models\\Album', 0),
(46, 'assets/images/albums/pink-floyd/16/pink-floyd-the-division-bell-cover-back.jpg', 'jpeg', 'Contra-portada del disco Pink Floyd - The division bell', 16, 'App\\Models\\Album', 1),
(47, 'assets/images/albums/pink-floyd/16/the-division-bell_sculpture.jpg', 'jpeg', 'Escultura realizada en metal para el álbum The Division Bell', 16, 'App\\Models\\Album', 2),
(48, 'assets/images/albums/pink-floyd/17/pink-floyd-the-endless-river-cover-front.jpg', 'jpeg', 'Portada de Pink Floyd - The Endless River', 17, 'App\\Models\\Album', 0),
(49, 'assets/images/albums/pink-floyd/17/pink-floyd-the-endless-river-cover-back.jpg', 'jpeg', 'Contraportada de Pink Floyd - The Endless River', 17, 'App\\Models\\Album', 1),
(50, 'assets/images/albums/pink-floyd/17/pink-floyd-the-endless-river-book.jpg', 'jpeg', 'Libro interior del álbum Pink Floyd - The Endless River', 17, 'App\\Models\\Album', 2),
(51, 'assets/images/albums/guns-n-roses/8/use-your-ilusion-i-back.jpg', 'jpeg', 'Contraportada del álbum User Your Ilusion I', 8, 'App\\Models\\Album', 1),
(52, 'assets/images/albums/guns-n-roses/18/use-your-ilusion-ii-front.jpg', 'jpeg', 'Portada del álbum User Your Ilusion II', 18, 'App\\Models\\Album', 0),
(53, 'assets/images/albums/guns-n-roses/18/use-your-ilusion-ii-back.jpg', 'jpeg', 'Contraportada del álbum User Your Ilusion II', 18, 'App\\Models\\Album', 1),
(54, 'assets/images/albums/guns-n-roses/18/use-your-ilusion-ii-set.jpg', 'jpeg', 'Contenido del álbum User Your Ilusion II (versión CD)', 18, 'App\\Models\\Album', 2),
(55, 'assets/images/albums/spacio-feat-rafa-ruiz-freeman/3/spacio-feat-rafa-ruiz-dancer.jpg', 'jpeg', 'Vinilo Spacio feat. Rafa Ruiz - Dancer', 3, 'App\\Models\\Album', 0),
(56, 'assets/images/albums/spacio-feat-rafa-ruiz-freeman/5/spacio-feat-rafa-ruiz-freeman-flying.jpg', 'jpeg', 'Vinilo Spacio feat. Rafa Ruiz & Freeman - Flying', 5, 'App\\Models\\Album', 0),
(57, 'assets/images/albums/spacio-feat-rafa-ruiz-freeman/2/spacio-feat-rafa-ruiz-freeman-never-stop-front.jpg', 'jpeg', 'Spacio feat. Rafa Ruiz & Freeman - Never stop', 2, 'App\\Models\\Album', 0),
(58, 'assets/images/albums/spacio-feat-rafa-ruiz-freeman/2/spacio-feat-rafa-ruiz-freeman-never-stop-back.jpg', 'jpeg', 'Contraportada de Spacio feat. Rafa Ruiz & Freeman - Never Stop', 2, 'App\\Models\\Album', 1),
(59, 'assets/images/albums/the-thrillseekers/1/the-thrillseekers-synaesthesia.jpg', 'jpeg', 'The Thrillseekers - Synaesthesia', 1, 'App\\Models\\Album', 0),
(60, 'assets/images/albums/the-thrillseekers/1/the-thrillseekers-synaesthesia-back-cover.jpg', 'jpeg', 'Disco The Thrillseekers - Synaesthesia (cara B)', 1, 'App\\Models\\Album', 2),
(61, 'assets/images/albums/the-thrillseekers/1/the-thrillseekers-synaesthesia-front-cover.jpg', 'jpeg', 'Disco The Thrillseekers - Synaesthesia (cara A)', 1, 'App\\Models\\Album', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `labels`
--

DROP TABLE IF EXISTS `labels`;
CREATE TABLE IF NOT EXISTS `labels` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `label` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alias` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_label` (`label`) USING BTREE,
  UNIQUE KEY `uq_alias` (`alias`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `labels`
--

INSERT INTO `labels` (`id`, `label`, `alias`, `description`, `url`, `created_at`, `updated_at`) VALUES
(1, 'Neo', 'neo', NULL, NULL, '2024-03-02 19:33:04', NULL),
(2, '	VB Records', 'vb-records', NULL, NULL, '2024-03-03 00:23:30', NULL),
(3, 'Blanco y Negro', 'blanco-y-negro', NULL, NULL, '2024-03-07 21:42:59', NULL),
(4, 'Capital Records', 'capital-records', NULL, NULL, '2024-03-15 17:52:56', NULL),
(5, 'Emi Records', 'emi-records', NULL, NULL, '2024-03-15 17:57:53', NULL),
(6, '	Boy Records', 'boy-records', NULL, NULL, '2024-04-09 17:16:26', NULL),
(7, 'Ariola', 'ariola', NULL, NULL, '2024-04-09 18:25:03', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relationships`
--

DROP TABLE IF EXISTS `relationships`;
CREATE TABLE IF NOT EXISTS `relationships` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `relationship` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_relationship` (`relationship`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `relationships`
--

INSERT INTO `relationships` (`id`, `relationship`) VALUES
(1, NULL),
(3, ' & '),
(2, ' feat. '),
(5, 'presents'),
(6, 'special guest'),
(4, 'vs'),
(7, 'y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `songs`
--

DROP TABLE IF EXISTS `songs`;
CREATE TABLE IF NOT EXISTS `songs` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `album_id` mediumint UNSIGNED NOT NULL,
  `song` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `song_clean` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `duration` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lyrics` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lyrics_clean` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `views` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_song_album` (`album_id`,`song`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `songs`
--

INSERT INTO `songs` (`id`, `album_id`, `song`, `song_clean`, `duration`, `lyrics`, `lyrics_clean`, `views`, `created_at`, `updated_at`) VALUES
(1, 1, 'Synaesthesia (Ylem Remix Mix)', 'synaesthesia ylem remix mix', '8:47', 'I need to know the reasons why\r\nCan you forsake what you\'ve been given\r\nYou took no time to justify\r\nAll the lies that you were living\r\nI need to know...\r\nIf I give emotion\r\nWill you show devotion\r\nOr will you fly and fly away\r\nIf I give emotion\r\nWill you show devotion\r\nOr will you fly and fly away\r\nFly away...\r\nYou seem to run, you seem to hide\r\nSo are you scared of how you\'re feelin?\r\nThe time has come to live your life\r\nSo come with me and do some dreamin\'\r\nIf I give emotion\r\nWill you show devotion\r\nOr will you fly and fly away\r\nIf I give emotion\r\nWill you show devotion\r\nOr will you fly and fly and fly and fly...\r\nIf I give emotion\r\nWill you show devotion\r\nOr will you fly and fly away\r\nIf I give emotion\r\nWill you show devotion\r\nOr will you fly and fly away\r\nFly away...', NULL, 7, '2024-03-02 22:38:39', '2024-07-03 19:49:43'),
(2, 1, 'Synaesthesia (En Motion Mix)', 'synaesthesia en motion mix', '8:22', NULL, NULL, 8, '2024-03-03 11:45:01', '2024-07-03 19:49:41'),
(3, 2, 'Never Stop (Spacio Mix)', 'never stop spacio mix', '6:57', NULL, NULL, 0, '2024-03-03 11:45:05', '2024-04-17 22:53:24'),
(4, 2, '	Never Stop (Sexy Mix)', 'never stop sexy mix', '4:50', NULL, NULL, 0, '2024-03-03 11:48:32', '2024-04-17 22:53:28'),
(5, 2, 'DJ In Spacio', 'dj in spacio', '6:00', NULL, NULL, 0, '2024-03-03 11:51:21', '2024-04-17 22:53:30'),
(6, 3, 'Dancer (Spacio Mix)', 'dancer spacio mix', '6:12', NULL, NULL, 1, '2024-03-06 17:48:31', '2024-04-17 22:53:32'),
(7, 3, 'Dancer (Sexy Mix)', 'dancer sexy mix', '5:44', NULL, NULL, 0, '2024-03-06 17:49:25', '2024-04-17 22:53:34'),
(8, 3, 'Dancer (Radio Mix)', 'dancer radio mix', '3:26', NULL, NULL, 0, '2024-03-06 17:51:10', '2024-04-17 22:53:36'),
(9, 4, 'Into Your Own', 'into your own', '6:12', NULL, NULL, 21, '2024-03-06 17:51:19', '2024-07-03 20:13:01'),
(10, 4, 'Into Your Own (Remix)', 'into your own remix', '6:40', NULL, NULL, 4, '2024-03-06 17:51:27', '2024-06-19 01:36:10'),
(11, 5, 'Flying', 'flying', '7:03', NULL, NULL, 0, '2024-03-06 17:51:34', '2024-04-17 22:53:45'),
(12, 5, 'Je Vole', 'je vole', '6:59', NULL, NULL, 0, '2024-03-06 17:51:38', '2024-04-17 22:53:47'),
(13, 6, 'Fantasy Trance mix', 'fantasy trance mix', '7:51', 'Body, eh, eh\r\nLove\r\n[2x]\r\n\r\nI look around and what do I see?\r\nSo many times, it\'s the brokenhearted\r\nI wish that I could set them free\r\nBut I don\'t know how\r\n\r\nEveryone\'s so concerned with their lives\r\nThey\'re wasting time never getting started\r\nTo find out what life is about\r\nAnd I don\'t know why\r\n\r\nCan\'t you see\r\nThe way that it\'s meant to be?\r\n\r\nEveryone needs somebody\r\nEveryone\'s looking for a loving heart\r\nLet the fantasy in you\r\nCome out in the blue\r\n\r\nEveryone needs somebody\r\nEveryone\'s looking for a place to be\r\nLet the fantasy in you\r\nCome out in the blue\r\n\r\nBody, eh, eh\r\nLove\r\n[2x]\r\n\r\nI look around on a Saturday night\r\nI\'m calling out to the brokenhearted\r\nDo you believe in the power of love\r\nThe way I do? (The way I do)\r\n\r\nTell me why you\'re concerned with your life\r\nYou\'re wasting time never getting started\r\nTo find out what life is about\r\nI just don\'t know why\r\n\r\nCan\'t you see\r\nThe way that it\'s meant to be?\r\n\r\nEveryone needs somebody\r\nEveryone\'s looking for a loving heart\r\nLet the fantasy in you\r\nCome out in the blue\r\n\r\nEveryone needs somebody\r\nEveryone\'s looking for a place to be\r\nLet the fantasy in you\r\nCome out in the blue\r\n\r\nBody, eh, eh\r\nLove\r\n[2x]\r\n\r\nAnd I wish for the world\r\nThat my voice, my voice will be heard\r\nSo come on, just take my hand\r\nLet me show you the way\r\nThe way of love\r\n\r\nEveryone needs somebody\r\nEveryone\'s looking for a loving heart\r\nLet the fantasy in you\r\nCome out in the blue\r\n\r\nEveryone needs somebody\r\nEveryone\'s looking for a place to be\r\nLet the fantasy in you\r\nCome out in the blue\r\n\r\nBody, eh, eh\r\nLove', NULL, 11, '2024-03-07 21:49:38', '2024-05-19 21:10:43'),
(14, 6, 'Fantasy Extended', 'fantasy extended', '6:35', NULL, NULL, 0, '2024-03-07 21:51:27', '2024-04-17 22:53:52'),
(15, 6, 'Fantasy POP', 'fantasy pop', '3:47', NULL, NULL, 0, '2024-03-07 21:51:39', '2024-04-17 22:53:54'),
(16, 7, 'Speak to me', 'speak to me', '1:08', 'I\'ve been mad for fucking years, absolutely years\r\nBeen over the edge for yonks\r\nBeen working me buns off for bands\r\nI\'ve always been mad, I know I\'ve been mad\r\nLike the most of us, very hard to explain why you\'re mad\r\nEven if you\'re not mad', NULL, 40, '2024-03-15 17:54:28', '2024-06-19 22:22:22'),
(17, 7, 'On the run', 'on the run', '3:35', 'Have your baggage and your passports ready\r\nAnd follow the green line to customs and then to immigration\r\nBA 215 to Rome, Cairo and Lagos\r\nLive for today, gone tomorrow\r\nThat\'s me, hahaha', NULL, 7, '2024-03-15 17:54:41', '2024-06-19 01:38:05'),
(18, 7, 'Time', 'time', '7:05', 'Ticking away the moments that make up a dull day\r\nFritter and waste the hours in an offhand way\r\nKicking around on a piece of ground in your hometown\r\nWaiting for someone or something to show you the way\r\nTired of lying in the sunshine, staying home to watch the rain\r\nYou are young and life is long, and there is time to kill today\r\nAnd then one day you find ten years have got behind you\r\nNo one told you when to run, you missed the starting gun\r\nAnd you run, and you run to catch up with the sun but it\'s sinking\r\nRacing around to come up behind you again\r\nThe sun is the same in a relative way but you\'re older\r\nShorter of breath and one day closer to death\r\nEvery year is getting shorter, never seem to find the time\r\nPlans that either come to naught or half a page of scribbled lines\r\nHanging on in quiet desperation is the English way\r\nThe time is gone, the song is over, thought I\'d something more to say\r\nHome, home again\r\nI like to be here when I can\r\nAnd when I come home cold and tired\r\nIt\'s good to warm my bones beside the fire\r\nFar away across the field\r\nThe tolling of the iron bell\r\nCalls the faithful to their knees\r\nTo hear the softly spoken magic spells', NULL, 1354, '2024-03-15 17:54:54', '2024-05-22 17:45:20'),
(19, 7, 'The great gig in the sky', 'the great gig in the sky', '4:44', 'And I am not frightened of dying\r\nAny time will do, I don\'t mind\r\nWhy should I be frightened of dying?\r\nThere\'s no reason for it, you\'ve gotta go sometime\r\nI never said I was afraid of dying', NULL, 10, '2024-03-15 17:55:10', '2024-06-19 21:51:51'),
(20, 7, 'Money', 'money', '6:23', 'Money\r\nGet away\r\nYou get a good job with more pay and you\'re okay\r\nMoney\r\nIt\'s a gas\r\nGrab that cash with both hands and make a stash\r\nNew car, caviar, four star, daydream\r\nThink I\'ll buy me a football team\r\nMoney\r\nGet back\r\nI\'m alright, Jack, keep your hands off of my stack\r\nMoney\r\nIt\'s a hit\r\nDon\'t give me that do goody good bullshit\r\nI\'m in the high-fidelity first-class traveling section\r\nAnd I think I need a Lear jet\r\nMoney\r\nIt\'s a crime\r\nShare it fairly, but don\'t take a slice of my pie\r\nMoney\r\nSo they say\r\nIs the root of all evil today\r\nBut if you ask for a rise\r\nIt\'s no surprise that they\'re giving none away\r\nAway, away, away\r\nAway, away, away\r\nI was in the right\r\nYes, absolutely in the right\r\nI certainly was in the right\r\nYeah, I was definitely in the right, that geezer was cruisin\' for a bruisin\'\r\nYeah!\r\nWhy does anyone do anything?\r\nI don\'t know, I was really drunk at the time\r\nJust telling him it was in, he could get it in number two\r\nHe was asking why it wasn\'t coming up on freight 11\r\nAnd after, I was yelling and screaming and telling him why\r\nIt wasn\'t coming up on freight eleven', NULL, 14, '2024-03-15 17:55:22', '2024-04-17 22:54:06'),
(21, 7, 'Us and them', 'us and them', '7:50', 'Us (us, us, us, us) and them (them, them, them, them)\r\nAnd after all we\'re only ordinary men\r\nMe\r\nAnd you (you, you, you)\r\nGod only knows\r\nIt\'s not what we would choose (choose, choose) to do (to do, to do)\r\nForward he cried from the rear\r\nAnd the front rank died\r\nAnd the general sat\r\nAnd the lines on the map\r\nMoved from side to side\r\nBlack (black, black, black)\r\nAnd blue (blue, blue)\r\nAnd who knows which is which and who is who\r\nUp (up, up, up, up)\r\nAnd down (down, down, down, down)\r\nAnd in the end it\'s only round \'n round (round, round, round)\r\nHaven\'t you heard it\'s a battle of words\r\nThe poster bearer cried\r\n\"Listen son\", said the man with the gun\r\nThere\'s room for you inside\r\n\"I mean, they\'re not gonna kill ya\r\nSo if you give \'em a quick short, sharp, shock\r\nThey won\'t do it again. Dig it?\r\nI mean he get off lightly, \'cause I would\'ve given him a thrashing\r\nI only hit him once! It was only a difference of opinion, but really\r\nI mean good manners don\'t cost nothing do they, eh?\"\r\nDown (down, down, down, down)\r\nAnd out (out, out, out, out)\r\nIt can\'t be helped that there\'s a lot of it about\r\nWith (with, with, with), without\r\nAnd who\'ll deny it\'s what the fighting\'s all about?\r\nOut of the way\r\nIt\'s a busy day\r\nI\'ve got things on my mind\r\nFor the want of the price\r\nOf tea and a slice\r\nThe old man died', NULL, 0, '2024-03-15 17:55:38', '2024-04-17 22:54:08'),
(22, 7, 'Any colour you like', 'any colour you like', '3:26', NULL, NULL, 4, '2024-03-15 17:55:50', '2024-04-17 22:54:11'),
(23, 7, 'Brain Damage', 'brain damage', '3:48', 'The lunatic is on the grass\r\nThe lunatic is on the grass\r\nRemembering games and daisy chains and laughs\r\nGot to keep the loonies on the path\r\nThe lunatic is in the hall\r\nThe lunatics are in my hall\r\nThe paper holds their folded faces to the floor\r\nAnd every day, the paperboy brings more\r\nAnd if the dam breaks open many years too soon\r\nAnd if there is no room upon the hill\r\nAnd if your head explodes with dark forebodings too\r\nI\'ll see you on the dark side of the moon\r\nThe lunatic is in my head\r\nThe lunatic is in my head\r\nYou raise the blade, you make the change\r\nYou rearrange me \'til I\'m sane\r\nYou lock the door and throw away the key\r\nAnd there\'s someone in my head, but it\'s not me\r\nAnd if the cloud bursts thunder in your ear\r\nYou shout and no one seems to hear\r\nAnd if the band you\'re in starts playing different tunes\r\nI\'ll see you on the dark side of the moon', NULL, 0, '2024-03-15 17:55:57', '2024-04-17 22:54:13'),
(24, 8, 'Right next door to hell', 'right next door to hell', '3:02', 'Yeah\r\nI\'ll take a nicotine, caffeine, sugar fix\r\nJesus, don\'t you get tired of turnin\' tricks?\r\nBut when your innocence dies, you\'ll find the blues\r\nSeems all our heroes were born to lose\r\nJust walkin\' through time, you believe this heat?\r\nAnother empty house, another dead end street\r\nGonna rest my bones, sit for a spell\r\nThis side of heaven is close to hell\r\nRight next door to hell\r\nWhy don\'t you write a letter to me?\r\nI said, \"I\'m right next door to hell\"\r\nAnd so many eyes are on me\r\nRight next door to hell\r\nI got nowhere else to be\r\nRight next door to hell\r\nFeels like the walls are closin\' in on me\r\nMy mama never really said much to me\r\nShe was much too young and scared to be\r\nHell, Freud might say that\'s what I need\r\nBut all I really ever get is greed\r\nAnd most my friends, they feel the same\r\nHell, we don\'t even have ourselves to blame\r\nBut times are hard, and thrills are cheaper\r\nAs your arms get shorter, your pockets get deeper\r\nRight next door to hell\r\nWhy don\'t you write a letter to me?\r\n\'Cause, I\'m right next door to hell\r\nAnd so many eyes are on me\r\nRight next door to hell\r\nI never thought this is where I\'d be\r\nBut I\'m right next door to hell\r\nThinking time \'ill stand still for me\r\nFuck you, bitch!\r\nNot bad kids, just stupid ones, yeah\r\nThought we\'d own the world an\' getting used was havin\' fun\r\nI said we\'re not sad kids, but lucid ones, yeah\r\nFlowin\' through life, not collecting anyone\r\nSo much out there, still so much to see\r\nTime\'s too much to handle, time\'s too much for me\r\nIt drove me up the wall and drove me out of my mind\r\nCan you tell me what this means, huh?', NULL, 20, '2024-03-15 18:00:24', '2024-07-03 19:48:12'),
(25, 8, 'Dust n\' bones', 'dust n bones', '4:58', 'He lost his mind today\r\nHe left it out back on the highway\r\nOn \"65\"\r\nShe loved him yesterday\r\nYesterday\'s over\r\nI said okay\r\nThat\'s all right\r\nTime moves on\r\nThat\'s the way\r\nWe live an hope to see the next day\r\nThat\'s all right\r\nSometimes these things they are so easy\r\nSometimes these things they are so cold\r\nSometimes these things just seem to rip you right in two\r\nOh no man don\'t let \'em get to you, yeah\r\nShe loved him yesterday\r\nHe laid her sister\r\nShe said okay\r\nAn that\'s all right\r\nBuried her things today\r\nWay back out deep\r\nBehind the driveway\r\nAnd that\'s all right\r\nSometimes these women are so easy\r\nSometimes these women are so cold\r\nSometimes these women seem to rip you right in two\r\nOnly if you let \'em get to you\r\nYa get out on your own\r\nAnd you take all that you own\r\nAnd you forget about your home\r\nAnd then you\'re just fuckin\' gone\r\nThere\'s no logic here today\r\nDo as you got to, go your own way\r\nI said that\'s right\r\nTime\'s short your life\'s your own\r\nAnd in the end\r\nWe are just\r\nDust n\' bones\r\nDust n\' bones\r\nDust n\' bones\r\nAn\' that\'s all right\r\n(Dust\'n\'bone)\r\nAn\' that\'s all right\r\n(Dust\'n\'bone)\r\nAn\' that\'s all right\r\n(Dust\'n\'bone)\r\nAn\' that\'s all right\r\n(Dust\'n\'bone)\r\nAn\' that\'s all right\r\n(Dust\'n\'bone)\r\nAn\' that\'s all right\r\n(Dust\'n\'bone)\r\nAn\' that\'s all right\r\n(Dust\'n\'bone)\r\nAn\' that\'s all right\r\n(Dust\'n\'bone)\r\nThat\'s all right\r\n(Dust\'n\'bone)\r\nThat\'s all right\r\nJust dust\'n\'bones, yeah', NULL, 21, '2024-03-15 18:00:35', '2024-05-15 15:57:00'),
(26, 8, 'Live and let die', 'live and let die', '3:04', 'When you were young and your heart\r\nWas an open book\r\nYou used to say live and let live\r\n(You know you did)\r\n(You know you did)\r\n(You know you did)\r\nBut if this ever changin\' world\r\nIn which we live in\r\nMakes you give in and cry\r\nSay live and let die\r\nLive and let die\r\nWhat does it matter to ya\r\nWhen you got a job to do you got to do it well\r\nYou got to give the other fella hell\r\nYou used to say live and let live\r\n(You know you did)\r\n(You know you did)\r\n(You know you did)\r\nBut if this ever changin\' world\r\nIn which we live in\r\nMakes you give in and cry\r\nSay live and let die\r\nLive and let die', NULL, 0, '2024-03-15 18:00:47', '2024-04-17 22:54:22'),
(27, 8, 'Don\'t cry', 'dont cry', '4:45', 'Talk to me softly, there\'s something in your eyes\r\nDon\'t hang your head in sorrow and please don\'t cry\r\nI know how you feel inside, I\'ve, I\'ve been there before\r\nSomething is changing inside you and don\'t you know?\r\n\r\nDon\'t you cry tonight, I still love you, baby\r\nAnd don\'t you cry tonight\r\nDon\'t you cry tonight, there\'s a heaven above you, baby\r\nAnd don\'t you cry tonight\r\n\r\nGive me a whisper and give me a sigh\r\nGive me a kiss before you tell me goodbye\r\nDon\'t you take it so hard now and please don\'t take it so bad\r\nI\'ll still be thinking of you and the times we had, baby\r\n\r\nAnd don\'t you cry tonight\r\nDon\'t you cry tonight\r\nDon\'t you cry tonight, there\'s a heaven above you, baby\r\nAnd don\'t you cry tonight\r\n\r\nAnd please remember that I never lied, oh\r\nAnd please remember how I felt inside now, honey\r\nYou gotta make it your own way but you\'ll be alright now, sugar\r\nYou\'ll feel better tomorrow, come the morning light now, baby\r\n\r\nAnd don\'t you cry tonight\r\nDon\'t you cry tonight\r\nDon\'t you cry tonight, there\'s a heaven above you, baby\r\nAnd don\'t you cry\r\nDon\'t you ever cry\r\nDon\'t you cry tonight, baby, maybe someday\r\nDon\'t you cry, don\'t you ever cry\r\nDon\'t you cry tonight ', NULL, 2, '2024-03-15 18:01:01', '2024-04-17 22:54:29'),
(28, 8, 'Perfect crime', 'perfect crime', '2:24', 'Kickin\' back in the shadows\r\nGot no need for the light\r\nWho\'s sorry now old timer\r\nLook at how you\'ve spent your life\r\nScroungin\' for change\r\nTo put some money in your pocket\r\nMy how scratch does burn\r\nLaughin\' at the fuckers as you piss it away\r\nBut I got the time and I got the muscle\r\nI got the need to lay it all on the line\r\nI ain\'t afraid of your smoke screen hustle\r\nIt\'s a perfect crime\r\nGod dammit it\'s a perfect crime\r\nMother fucker it\'s a perfect crime\r\nI said it\'s perfect\r\nAn keep the demons down\r\nAnd drag the skeletons out\r\nI got a blind man followin\' me in chains\r\nI said he\'s fun to watch\r\nWhen the world has stopped\r\nAn I think he\'s got somethin\' to say\r\n\"You want to fuck with me? Don\'t fuck with me\r\n\'Cause I\'m what you\'ll be, so don\'t fuck with me\r\nIf you had better sense\r\nYou\'d step aside from the bad side of me\r\nDon\'t fuck wit da bad side o\' me\r\nStay way from the bad side o\' me\r\nDon\'t fuck wit da bad side\"\r\nT minus 1:09 and counting\r\nOstracized but that\'s all right\r\nI was thinkin\' about somethin\' myself\r\nOne, two, three, four, five, six, seven, eight\r\nCall on everybody who\'s got last rites\r\nSaid it\'s better\r\nIf you locked \'em away\r\nRunnin\' through the visions\r\nAt the speed of light\r\nWon\'t ya let me be\r\nMother fucker just let me be\r\nGod dammit better let me be\r\nDon\'t ya know ya better let me aaahh!\r\nPerfect crime\r\nGod dammit it\'s a a perfect crime\r\nMother fucker it\'s a perfect crime\r\nDon\'t ya know it\'s a perfect crime', NULL, 0, '2024-03-15 18:01:10', '2024-04-17 22:54:32'),
(29, 8, 'You ain\'t the first', 'you aint the first', '2:36', 'Rollin\'?\r\nOne, two, three\r\nOne, two, three\r\nTwo, three, one and\r\nI tried so hard just to get through to you\r\nBut your head\'s so far from the realness of truth\r\nWas it just a come on in the dark, wasn\'t meant to last long?\r\nI think you\'ve worn your welcome, honey, I\'ll just see you along\r\nAs I sing you this song\r\nOne, two, three, one\r\nTime can pass slowly and things always change\r\nYour day\'s been numbered, and I\'ve read your last page\r\nYou was just a temporary lover, honey, you ain\'t the first\r\nLots of others came before you, woman\r\nSaid, but you\'ve been the worst\r\nSaid you\'ve been the worst\r\nTwo, three and\r\nSo, goodbye to you, girl, so long farewell\r\nI can\'t hear you crying, your jivin\'s been hell\r\nSo, look for me walking down your street at night\r\nI\'ll be in with another, deep down inside\r\n(Deep down inside)\r\nTo the bar\r\nThat was a take', NULL, 0, '2024-03-15 18:01:19', '2024-04-17 22:54:35'),
(30, 8, 'Bad obsession', 'bad obsession', '5:28', 'I can\'t stop thinkin\' thinking \'bout sinkin\'\r\nSinkin\' down into my bed\r\nI call my mother\r\nShe\'s just a cunt now\r\nShe said I\'m sick in the head\r\nShe said you ain\'t special\r\nSo who you foolin\'\r\nDon\'t try ta give me a line\r\nBut I can\'t stop thinkin\' \'bout seein\' ya one more time\r\n(Oh no)\r\nBut I already left you and you\'re better off left behind\r\nIt\'s a bad obsession\r\nIt\'s always messin\'\r\nIt\'s always messin\' my mind\r\nIt\'s a bad obsession\r\nIt\'s always messin\'\r\nIt\'s always messin\' my mind\r\nToo bad you\'re fucked up\r\nI used to be wasted always tried to take it\r\nTake it down into my vein\r\nI call the doctor, he\'s just another\r\nHe said I\'m sick in the brain\r\nHe said you ain\'t special\r\nSo who you foolin\'\r\nDon\'t try ta give me a line\r\nBut I can\'t stop thinkin\' \'bout doin\' it one more time\r\n(Oh no)\r\nBut I already left you and you\'re better off left behind\r\n(Oh yeah)\r\nAw it\'s a bad obsession\r\nIt\'s always messin\'\r\nIt\'s always messin\' my mind\r\nIt\'s a bad obsession\r\nIt\'s always messin\'\r\nIt\'s always messin\' my mind\r\nSo bad, boy\r\nIt\'s a\r\nIt\'s a\r\nHeads up\r\nIt\'s a bad obsession\r\nIt\'s always messin\'\r\nIt\'s always messin\' my mind\r\nNow it\'s a bad obsession\r\nIt\'s always messin\'\r\nIt\'s always messin\' my mind\r\nBut I can\'t stop thinkin\' \'bout doin\' it one more time\r\n(Oh no)\r\nSee I already left you and you\'re better off left behind\r\n(Oh no, oh no)\r\nIt\'s a bad obsession and you\'re always messin\' my mind\r\nSee I already left you and you\'re better off left behind\r\nUh huh no\r\nMaybe you\'ll do better next time\r\nPunk', NULL, 0, '2024-03-15 18:01:27', '2024-04-17 22:54:37'),
(31, 8, 'Back off bitch', 'back off bitch', '5:03', 'Oh, baby\r\nPretty baby\r\nOh, honey\r\nYou let me down, honey\r\nI ain\'t playin\' childhood games no more\r\nI said it\'s time for me to even the score\r\nSo state your claim, your claim to fame\r\nBut baby, call another name\r\nWhen you feel the fire\r\nAnd taste the flame\r\nBack off, back off bitch\r\nDown in the gutter, dyin\' in the ditch\r\nYou better back off, back off bitch\r\nFace of an angel with the love of a witch\r\nBack off, back off bitch\r\nBack off, back off bitch\r\nMakin\' love, cheap heartbreaker\r\nBroken backed, nasty ballbreaker\r\nStay out of my bed, outta my head\r\nIf it\'s lovin\' you, well I\'m better off dead\r\nBack off, back off bitch\r\nDown in the gutter, dyin\' in the ditch\r\nYou better back off, back off bitch\r\nFace of an angel with the love of a witch\r\nBack off, back off bitch\r\nBack off, back off bitch\r\nEmotions ripped, gone on a binge\r\nLife lived, I said you\'re off the hinge\r\nTellin\' lies of such fame and glory\r\nI don\'t even wanna hear your story\r\nBack off, back off bitch\r\nDown in the gutter, dyin\' in the ditch\r\nYou better back off, back off bitch\r\nFace of an angel with the love of a witch\r\nBack off, back off bitch\r\nIt\'s such a pity that you\'re such a bitch\r\nBack off, back off bitch\r\nIt\'s time to burn, burn the witch\r\nBack off, back off bitch\r\nBack off, back off bitch\r\nBack off, back off bitch\r\nBack off, back off bitch\r\nBitch, bitch, bitch, bitch\r\nHey, what do ya think he\'s tryin\' to say there anyway?\r\nI think it\'s\r\nSomething each person\'s supposed to take in their own special way\r\nFucking bitch', NULL, 0, '2024-03-15 18:01:36', '2024-04-17 22:54:39'),
(32, 8, 'Double talkin\' jive', 'double talkin jive', '3:24', 'Found a head and an arm in da garbage can\r\nDon\'t know why I\'m here\r\nLivin\' on the run for oh so long\r\nI gotta go collect\r\nDouble talkin\' jive get the money motherfucker\r\n\'Cause I got no more patience\r\nDouble talkin\' I got (lies)\r\nNo more patience man\r\nBack in town an\'a all new friends\r\nThey sayin\' how ya been?\r\nFucked up and outta place\r\nThat\'s how I felt back then\r\nDouble talkin\' jive get the money motherfucker\r\n\'Cause I got no more patience\r\nDouble talkin\' (lies) no more patience man\r\nYou dig what I\'m sayin\'?', NULL, 0, '2024-03-15 18:01:46', '2024-04-17 22:54:42'),
(33, 8, 'November rain', 'november rain', '8:57', 'When I look into your eyes\r\nI can see a love restrained\r\nBut darlin\' when I hold you\r\nDon\'t you know I feel the same?\r\nNothin\' lasts forever\r\nAnd we both know hearts can change\r\nAnd it\'s hard to hold a candle\r\nIn the cold November rain\r\nWe\'ve been through this such a long long time\r\nJust tryin\' to kill the pain, ooh yeah\r\nLove is always coming, love is always going\r\nNo one\'s really sure who\'s lettin\' go today\r\nWalking away\r\nIf we could take the time to lay it on the line\r\nI could rest my head just knowin\' that you were mine\r\nAll mine\r\nSo if you want to love me then darlin\' don\'t refrain\r\nOr I\'ll just end up walkin\' in the cold November rain\r\nDo you need some time on your own?\r\nDo you need some time all alone?\r\nOoh, everybody needs some time on their own\r\nOoh, don\'t you know you need some time all alone\r\nI know it\'s hard to keep an open heart\r\nWhen even friends seem out to harm you\r\nBut if you could heal a broken heart\r\nWouldn\'t time be out to charm you?\r\nOh, oh, oh\r\nSometimes I need some time on my own\r\nSometimes I need some time all alone\r\nOoh, everybody needs some time on their own\r\nOoh, don\'t you know you need some time all alone\r\nAnd when your fears subside\r\nAnd shadows still remain, oh yeah\r\nI know that you can love me when there\'s no one left to blame\r\nSo never mind the darkness, we still can find a way\r\n\'Cause nothin\' lasts forever, even cold November rain\r\nDon\'t ya think that you need somebody?\r\nDon\'t ya think that you need someone?\r\nEverybody needs somebody\r\nYou\'re not the only one\r\nYou\'re not the only one\r\nDon\'t ya think that you need somebody?\r\nDon\'t ya think that you need someone?\r\nEverybody needs somebody\r\nYou\'re not the only one\r\nYou\'re not the only one\r\nDon\'t ya think that you need somebody?\r\nDon\'t ya think that you need someone?\r\nEverybody needs somebody\r\nYou\'re not the only one\r\nYou\'re not the only one\r\nDon\'t ya think that you need somebody?\r\nDon\'t ya think that you need someone?\r\nEverybody needs somebody', NULL, 0, '2024-03-15 18:01:54', '2024-04-17 22:54:45'),
(34, 8, 'The garden', 'the garden', '5:22', 'You know you\'re all alone\r\nYour friends they aren\'t at home\r\nEverybody\'s gone to the garden\r\nAs you look into the trees\r\nYou can look but you don\'t see\r\nThe flowers seem to tease you at the garden\r\nEverybody\'s there\r\nBut you don\'t seem to care\r\nWhat\'s it with you man and this garden?\r\nTurned into my worst phobia\r\nA crazy man\'s utopia\r\nIf you\'re lost no one can show ya\r\nBut it sure was glad to know ya\r\nOnly poor boys take a chance\r\nOn the garden\'s song and dance\r\nFeel her flowers as they wrap around\r\nBut only smart boys do without\r\nYou can find it all inside\r\nNo need to wrestle with your pride\r\nNo, you ain\'t losin\' your mind\r\nYou\'re just in the garden\r\nThey can lead you to yourself\r\nOr you can throw it on the shelf\r\nBut you know you can look inside for the garden\r\nI wasn\'t really scared\r\nLost my virginity there\r\nTo a gypsy with blond hair\r\nBut now no one seems to care\r\nLike a mouse inside a maze\r\nWandering round for daze\r\nWith a smile upon my face\r\nI never wanna leave this place\r\nOnly poor boys take a chance\r\nOn this garden\'s song and dance\r\nFeel her flowers as they wrap around\r\nBut only smart boys do without\r\nTurned into my worst phobia\r\nIt\'s a crazy man\'s utopia\r\nIf you\'re lost no one can show ya\r\nBut it sure was glad to know ya\r\nBye bye\r\nSo long, bye bye\r\nIt\'s glad to know ya\r\nBye bye\r\nBye\r\nSo long', NULL, 0, '2024-03-15 18:02:04', '2024-04-17 22:54:47'),
(35, 8, 'Garden of Eden', 'garden of eden', '2:42', 'It\'s a critical solution, and the east coast got the blues\r\nIt\'s a mass of confusion, like the lies they sell to you\r\nYou got a glass-jawed toothache of a mental disease\r\nAnd they be running \'round back, see them line up on their knees\r\n\'Cause the kiss-ass sycophants, throwing penance at your feet\r\nWhen they got nowhere to go\r\nWatch them come in off the streets\r\nWhile they\'re banging out front\r\nInside they\'re slamming to the crunch\r\nGo on an throw me to the lions\r\nAnd the whole damn screaming bunch\r\n\'Cause the pissed-off rip-offs, they\'re everywhere you turn\r\nTell me how a generation\'s ever supposed to learn\r\nThis fire is burning, and it\'s out of control\r\nIt\'s not a problem you can stop\r\nIt\'s rock n\' roll\r\nI read it on a wall, it went straight to my head\r\nIt said, \"Dance to the tension of a world on edge\"\r\nWe got racial violence, and who\'ll cast the first stone?\r\nAnd sex is used any way it can be\r\nSometimes, when I look out, it\'s hard to see the day\r\nIt\'s a feeling, you can have it, it\'s not mine to take away\r\nLost in the Garden of Eden\r\nSaid, we\'re lost in the Garden of Eden\r\nAnd there\'s no one who\'s gonna believe this\r\nBut we\'re lost in the Garden of Eden\r\nThis fire is burning, and it\'s out of control\r\nIt\'s not a problem you can stop\r\nIt\'s rock n\' roll\r\nSuck on that\r\nLooking through this point of view\r\nThere\'s no way I\'m gonna fit in\r\nNo, you tell me what my eyes see\r\nDon\'t you tell me who to believe in\r\nI ain\'t superstitious, but I know when something\'s wrong\r\nI\'ve been dragging my heels with a bitch called hope\r\nLet the undercurrent drag me along\r\nLost in the Garden of Eden\r\nSaid, we\'re lost in the Garden of Eden\r\nAnd there\'s no one who\'s gonna believe this\r\nBut we\'re lost in the Garden of Eden, come on\r\nMost organized religions make a mockery of humanity\r\nOur governments are dangerous and out of control\r\nThe Garden of Eden is just another graveyard\r\nSaid, if they had someone to buy it\r\nSaid, I\'m sure they\'d sell my soul\r\nThis fire is burning, and it\'s out of control\r\nIt\'s not a problem you can stop\r\nIt\'s rock n\' roll\r\nLost in the Garden of Eden\r\nSaid, we\'re lost in the Garden of Eden\r\nSaid, there\'s no one who\'s gonna believe this\r\nBut we\'re lost in the Garden of Eden\r\nThis fire is burning, and it\'s out of control\r\nIt\'s not a problem you can stop\r\nIt\'s rock n\' roll', NULL, 0, '2024-03-15 18:02:14', '2024-04-17 22:54:50'),
(36, 8, 'Don\'t damn me', 'dont damn me', '5:19', 'Don\'t damn me when I speak a piece of my mind\r\n\'Cause silence isn\'t golden\r\nWhen I\'m holding it inside\r\n\'Cause I\'ve been where I have been\r\nAn I\'ve seen what I have seen\r\nI put the pen to the paper\r\n\'Cause it\'s all a part of me\r\nBe it a song or a casual conversation\r\nTo hold my tongue speaks of quiet reservations\r\nYour words once heard they can place you in a faction\r\nMy words may disturb but at least there\'s a reaction\r\nSometimes I want to kill\r\nSometimes I want to die\r\nSometimes I want to destroy\r\nSometimes I want to cry\r\nSometimes I could get even\r\nSometimes I could give up\r\nSometimes I could give\r\nSometimes I never give a fuck\r\nIt\'s only for a while\r\nI hope you understand\r\nI never wanted this to happen\r\nDidn\'t want to be a man\r\nSo I hid inside my world\r\nI took what I could find\r\nI cried when I was lonely\r\nI fell down when I was blind\r\nDon\'t damn me when I speak a piece of my mind\r\n\'Cause silence isn\'t golden\r\nWhen I\'m holding it inside\r\n\'Cause I\'ve been where I have been\r\nAn I\'ve seen what I have seen\r\nI put the pen to the paper\r\n\'Cause it\'s all a part of me\r\nHow can I ever satisfy you\r\nAn how can I ever make you see\r\nThat, deep inside we\'re all somebody\r\nAn it don\'t matter who you want to be\r\nBut now I gotta smile I hope you comprehend\r\nFor this man can say it happened\r\n\'Cause this child has been condemned\r\nSo I stepped into your world\r\nI kicked you in the mind\r\nAnd I\'m the only witness\r\nTo the nature of my crime\r\nBut look at what we\'ve done\r\nTo the innocent and young\r\nWhoa listen to who\'s talking\r\n\'Cause we\'re not the only ones\r\nThe trash collected by the eyes\r\nAnd dumped into the brain\r\nSaid it tears into our conscious thoughts\r\nYou tell me who\'s to blame\r\nI know you don\'t want to hear me crying\r\nAn I know you don\'t want to hear me deny\r\nThat your satisfaction lies in your illusions\r\nBut your delusions are yours an not mine\r\nWe take for granted that we know the whole story\r\nWe judge a book by it\'s cover and read what we want\r\nBetween selected lines\r\nDon\'t hail me an don\'t idolize the ink\r\nOr I\'ve failed in my attentions\r\nCan you find the missing link\r\nYour only validation is in living your own life\r\nVicarious existence is a fucking waste of time\r\nSo I send this song to the offended\r\nI said what I meant and I\'ve never pretended\r\nAs so many others do intending just to please\r\nIf I damned your point of view\r\nCould you turn the other cheek\r\nDon\'t damn me when I speak a piece a mind\r\n\'Cause silence isn\'t golden\r\nWhen I\'m holding it inside\r\nI\'ve been where I have been\r\nAn I\'ve seen what I have seen\r\nPut the pen to the paper \'Cause it\'s all a part of me\r\nDon\'t damn me\r\nI said don\'t damn me\r\nI said don\'t hail me\r\nAh, don\'t damn me\r\nSmoke \'em if you got \'em\r\nAlright, that sucked', NULL, 0, '2024-03-15 18:02:23', '2024-04-17 22:54:52'),
(37, 8, 'Bad apples', 'bad apples', '4:28', 'Diamonds and fast cars\r\nMoney to burn I got my head in the clouds\r\nI got these thoughts to churn\r\nGot my feet in the sand\r\nI got a house on the hill\r\nI got a headache like a mother\r\nTwice the price of my thrills\r\nAn it\'s a cold day\r\nIt\'s a continental drift\r\nI said this traffic is hell\r\nCan you give me a lift\r\nAn I\'ll try to paint a story\r\nGot your pictures to tell\r\nYeah you got to make a living\r\nWith what you bring yourself to sell\r\nI got some genuine\r\nImitation, bad Apples\r\nFree sample for your peace o\' mind only $9.95\r\nI got my camera back from customs\r\nGot my law fees up to date\r\nHell they musta seen me comin\'\r\nAin\'t this life so fuckin\' great\r\nWhen the shit hit the fan\r\nIt was all I could stand\r\nYeah, well I\'m a frequent flyer\r\nMy body\'s breathing while it can\r\nBut what I don\'t understand is that\r\nMy world ain\'t gettin\' no brighter\r\nIf I could touch the sky\r\nWell I would float on by\r\nWhile everybody\'s talkin\'\r\nHell I\'m just another guy\r\nIf it were up to me\r\nI\'d say just leave me be\r\nWhy let one bad apple\r\nSpoil the whole damn bunch\r\nGold and caviarnow why\'nt you pour my apathy\r\nI\'d have all my bases covered\r\nIf I could teach my hands to see\r\nBut now we\'re down in the deep end\r\nWhere they\'d love to watch you drown\r\nI said your laundry could use washing\r\nWe\'ll hang it up all over town\r\nI said Hollywood\'s like a dryer\r\nAn we\'re down on Sunset Strip\r\nAn you\'ll be suckin\' down the Clorox\r\n\'Til your life\'s all nice and crisp\r\nWhen the shit hit the fan\r\nIt was all I could stand\r\nYeah, well I\'m a frequent flyer\r\nMy body\'s breathing while it can\r\nBut what I don\'t understand is that\r\nMy world ain\'t gettin\' no brighter\r\nIf I could touch the sky\r\nWell I would float on by\r\nWhile everybody\'s talkin\'\r\nHell I\'m just another guy\r\nIf it were up to me\r\nI\'d say just leave me be\r\nWhy let one bad apple\r\nSpoil the whole damn bunch\r\nWhen the shit hit the fan\r\nIt was all I could stand\r\nYeah, well I\'m a frequent flyer\r\nMy body\'s breathing while it can\r\nBut what I don\'t understand is that\r\nMy world ain\'t gettin\' no brighter\r\nIf I could touch the sky\r\nWell I would float on by\r\nWhile everybody\'s talkin\'\r\nHell I\'m just another guy\r\nIf it were up to me\r\nI\'d say just leave me be\r\nWhy let one bad apple\r\nSpoil the whole damn bunch\r\nWhy let one bad apple\r\nSpoil the whole damn bunch\r\nBoy', NULL, 0, '2024-03-15 18:02:31', '2024-04-17 22:54:54'),
(38, 8, 'Dead horse', 'dead horse', '4:17', 'Sick of this life\r\nNot that you\'d care\r\nI\'m not the only one\r\nWith whom these feelings I share\r\nNobody understands\r\nQuite why we\'re here\r\nWe\'re searchin\' for answers\r\nThat never appear\r\nBut maybe if I looked real hard I\'d\r\nI\'d see your tryin\' too\r\nTo understand this life\r\nThat we\'re all goin\' through\r\n(Then when she said she was gonna like wreck my car\r\nI didn\'t know what to do)\r\nSometimes I feel like I\'m beatin\' a dead horse\r\nAnd I don\'t know why you\'d be bringin\' me down\r\nI\'d like to think that our love\'s worth a tad more\r\nIt may sound funny but you\'d think by now\r\nI\'d be smilin\'\r\nI guess some things never change\r\nNever change\r\nI met an old cowboy\r\nI saw the look in his eyes\r\nSomethin\' tells me he\'s been here before\r\n\'Cause experience makes you wise\r\nI was only a small child\r\nWhen the thought first came to me\r\nThat I\'m a son of a gun and the gun of a son\r\nThat brought back the devil in me\r\nBut sometimes I feel like I\'m beatin\' a dead horse\r\nI don\'t know why you\'d be bringin\' me down\r\nI\'d like to think that our love\'s worth a tad more\r\nIt may sound funny but you\'d think by now\r\nI\'d be smilin\'\r\nI guess some things never change\r\nNever change\r\nI ain\'t quite what you\'d call an old soul\r\nStill wet behind the ears\r\nI been around this track a couple o\' times\r\nBut now the dust is startin\' to clear\r\nOh yeah\r\nSometimes I feel like I\'m beatin\' a dead horse\r\nI don\'t know why you\'d be bringin\' me down\r\nI\'d like to think that our love\'s worth a tad more\r\nIt may sound funny but you\'d think by now\r\nI\'d be smilin\'\r\nOoh yeah, I\'d be smilin\'\r\nNo way I\'d be smilin\'\r\nOoh smilin\'\r\nSick of this life\r\nNot that you\'d care\r\nI\'m not the only one\r\nWith whom these feelings I share', NULL, 0, '2024-03-15 18:02:38', '2024-04-17 22:54:56'),
(39, 8, 'Coma', 'coma', '10:14', 'Hey, you caught me in a coma\r\nAnd I don\'t think I wanna\r\nEver come back to this world again\r\nKinda like it in a coma\r\n\'Cause no one\'s ever gonna\r\nOh, make me come back to this world again\r\nNow I feel as if I\'m floating away\r\nI can\'t feel all the pressure and I like it this way\r\nBut my body\'s callin\', my body\'s callin\'\r\nWon\'t ya come back to this world again?\r\nSuspended deep in a sea of black\r\nI\'ve got the light at the end\r\nI\'ve got the bones on the mast\r\nWell, I\'ve gone sailin\', I\'ve gone sailin\'\r\nI could leave so easily\r\nWhile friends are calling back to me\r\nI said there, \"They\'re leaving it all up to me\r\nWhen all I needed was clarity\r\nAnd someone to tell me what the fuck is going on\"\r\nGoddamn it!\r\nSlippin\' farther and farther away\r\nIt\'s a miracle how long we can stay\r\nIn a world our minds created\r\nIn a world that\'s full of shit\r\nHelp me\r\nOkay, let\'s get this guy in the program please, we\'re losing him (start an IV, please)\r\nHelp me\r\nSomeone\'s got to protect his airways (where\'s the defibrillator?)\r\nTwo IV\'s over here, please. That\'s two more now (let\'s go)\r\nWe\'ll lose this guy\r\nHelp me\r\nSlow-motion here. This guy\'s going\r\nLet\'s get him in ER (it\'s going out on us)\r\nWho\'s got the defibrillator?\r\nPlease, understand me\r\nI\'m climbin\' through the wreckage of all my twisted dreams\r\nBut this cheap investigation just can\'t stifle all my screams\r\nAnd I\'m waitin\' at the crossroads, waiting for you\r\nWaiting for you (where are you?)\r\nNo one\'s gonna bother me anymore\r\nNo one\'s gonna mess with my head no more\r\nI can\'t understand what all the fighting\'s for\r\nBut it\'s so nice here down off the shore\r\nI wish you could see this \'cause there\'s nothing to see\r\nIt\'s peaceful here and it\'s fine with me\r\nNot like the world where I used to live\r\nI never really wanted to live\r\nI know\r\nOkay, we\'re starting to lose this guy. I want that IV and his airway protected\r\nLet\'s get some people in here\r\nGet the crash cart please, we\'re losing this guy\r\nGive me an airway, please (what\'s going on here?)\r\nClear\r\nZap him again\r\nHow about an IV, stat?\r\nOkay, you better protect the airway, you\'re starting to lose him (clear)\r\nZap the son of a bitch again\r\nListen to me, Axl, are you listening to me?\r\nNo, don\'t walk away from me\r\nYou are such a fucking prick, I am so pissed with you\r\nAll I hear is bullshit, all the time\r\nAll you ever wanna do is have sex, sex, sex\r\nI just don\'t give a shit anymore\r\nI love you\r\nYou live your life like it\'s a coma, won\'t you tell me why we\'d wanna?\r\nWith all the reasons you give, it\'s, it\'s kinda hard to believe\r\nBut who am I to tell you that I\'ve seen any reason why you should stay\r\nMaybe we\'d be better off without you anyway\r\nYou got a one way ticket on your last chance ride\r\nGotta one way ticket to your suicide\r\nGotta one way ticket and there\'s no way out alive\r\nAnd all this crass communication that has left you in the cold\r\nIsn\'t much for consolation when you feel so weak and old\r\nBut if home is where the heart is, then there\'s stories to be told\r\nNo, you don\'t need a doctor, no one else can heal your soul\r\nGot your mind in submission, got your life on the line\r\nBut nobody pulled the trigger, they just stepped aside\r\nThey be down by the water while you watch \'em waving goodbye\r\nThey be callin\' in the morning, they be hangin\' on the phone\r\nThey be waiting for an answer but you know nobody\'s home\r\nAnd when the bell\'s stopped ringing, it was nobody\'s fault but your own\r\nThere were always ample warnings, there were always subtle signs\r\nAnd you would have seen it comin\' but we gave you too much time\r\nAnd when you said that no one\'s listening\r\nWhy\'d your best friend drop a dime?\r\nSometimes we get so tired of waiting for a way to spend our time\r\nAnd it\'s so easy to be social, it\'s so easy to be cool\r\nYeah, it\'s easy to be hungry when you ain\'t got shit to lose\r\nAnd I wish that I could help you with what you hope to find\r\nBut I\'m still out here waiting, watching reruns of my life\r\nWhen you reach the point of breaking, know it\'s gonna take some time\r\nTo heal the broken memories that another man would need\r\nJust to survive', NULL, 0, '2024-03-15 18:02:44', '2024-04-17 22:54:57'),
(40, 9, 'Atom heart mother', 'atom heart mother', '23:41', NULL, NULL, 2, '2024-03-17 20:58:14', '2024-05-19 23:36:22'),
(41, 9, 'If', 'if', '4:30', 'If I were a swan, I\'d be gone\r\nIf I were a train, I\'d be late\r\nAnd if I were a good man, I\'d talk with you more often than I do\r\nIf I were asleep, I could dream\r\nIf I were afraid, I could hide\r\nIf I go insane, please don\'t put your wires in my brain\r\nIf I were the moon, I\'d be cool\r\nIf I were a rule, I would bend\r\nIf I were a good man, I\'d understand the spaces between friends\r\nIf I were alone, I would cry\r\nAnd if I were with you, I\'d be home and dry\r\nIf I go insane, will you still let me join in with the game?\r\nIf I were a swan, I\'d be gone\r\nIf I were a train, I\'d be late again\r\nIf I were a good man, I\'d talk with you more often than I do\r\nAnd that was another Roger Waters composition\r\nCalled \"If\"\r\nAnd next week on this program\r\nWe\'ve got rather a lot of people actually\r\nWe have Mungo Jerry, Jo Ann Kelly with Bob Hall\r\nSimon And Steve, and Brett Marvin and the Thunderbolts\r\nAnd this program has been produced by Jeff Griffin\r\nSound balanced by Chris Lycett\r\nAnd leaping about this week by Bob Conduct\r\nAnd now we\'re going to hear the music\r\nThat was the high point of the recent and much-discussed Bath Festival\r\nAnd it\'s working title is \"The Atom Heart Mother\"\r\nAnd it will appear under some title on the next Pink Floyd LP\r\nDue in September or thereabouts\r\nAnd Pink Floyd will be accompanied by the Philip Jones Brass Ensemble\r\nAnd the John Alldis Choir\r\nAnd the arrangements are written by the Floyd\r\nIn conjunction with Ron Geesin\r\nSo, \"The Atom Heart Mother\"', NULL, 0, '2024-03-17 20:58:19', '2024-04-17 22:55:05'),
(42, 9, 'Summer \'68', 'summer 68', '5:28', 'Would you like to say something before you leave\r\nPerhaps you\'d care to state exactly how you feel\r\nWe said goodbye before we said hello\r\nI hardly even like you, I shouldn\'t care at all\r\nWe met just six hours ago, the music was too loud\r\nFrom your bed I gained a day and lost a bloody year\r\nAnd I would like to know\r\nHow do you feel, how do you feel?\r\nHow do you feel, how do you feel?\r\nNot a single word was said, the night still hid our fears\r\nOccasionally you showed a smile but what was the need\r\nI felt the cold far too soon, in a room of 95\r\nMy friends are lying in the sun, I wish that I was there\r\nTomorrow brings another town and another girl like you\r\nHave you time before you leave to greet another man\r\nJust you let me know\r\nHow do you feel, how do you feel?\r\nHow do you feel, how do you feel?\r\nGoodbye to you\r\nCharlotte Pringle\'s due\r\nI\'ve had enough for one day', NULL, 0, '2024-03-17 20:58:36', '2024-04-17 22:55:08'),
(43, 9, 'Fat old sun', 'fat old sun', '5:23', 'When that fat old sun in the sky is falling\r\nSummer evening birds are calling\r\nSummer Sunday and a year\r\nThe sound of music in my ears\r\nDistant bells, new mown grass smells so sweet\r\nBy the river holding hands\r\nRoll me up and lay me down\r\nAnd if you see, don\'t make a sound\r\nPick your feet up off the ground\r\nAnd if you hear as the warm night falls\r\nThe silver sound from a tongue so strange\r\nSing to me, sing to me\r\nWhen that fat old sun in the sky is falling\r\nSummer evening birds are calling\r\nChildren\'s laughter in my ears\r\nThe last sunlight disappears\r\nAnd if you see, don\'t make a sound\r\nPick your feet up off the ground\r\nAnd if you hear as the warm night falls\r\nThe silver sound from a tongue so strange\r\nSing to me, sing to me', NULL, 0, '2024-03-17 20:58:46', '2024-04-17 22:55:12'),
(44, 9, 'Alan\'s psychodelic breakfast', 'alans psychodelic breakfast', '12:58', 'Oh, uh, me flakes, then uh, scrambled\r\nEggs, bacon, sausages, tomatoes toast\r\nCoffee marmalade, I like marmalade yes\r\nPorridge is nice any cereal\r\nI like all cereals oh God kickoff is 10am\r\nBreakfast in Los Angeles, macrobiotic stuff\r\nI don\'t mind a barrow\r\nI like barrowing the stuff in\r\nI\'ve got a terrible back when I work\r\nIt hurts me d\'you know what I mean, John?\r\nWell he\'s sort of, err… when driving on\r\nThe road he has a sleep\r\nGets ready for the gig i don\'t know\r\nHe does all the electrical stuff i\r\nCan\'t be bothered with that, it\'s so fiddly\r\nAll my head\'s a blank', NULL, 0, '2024-03-17 20:58:59', '2024-04-17 22:55:17'),
(45, 10, 'One of these days', 'one of these days', '5:56', 'One of these days, I\'m going to cut you into little pieces', NULL, 0, '2024-03-17 22:04:24', '2024-06-17 23:21:07'),
(46, 10, 'A pillow of winds', 'a pillow of winds', '5:12', 'A cloud of eiderdown\r\nDraws around me\r\nSoftening a sound\r\nSleepy time, when I lie\r\nWith my love by my side\r\nAnd she\'s breathing low\r\nAnd the candle dies\r\nWhen night comes down, you lock the door\r\nThe book falls to the floor\r\nAs darkness falls, the waves roll by\r\nThe seasons change, the wind is warm\r\nNow wakes the owl, now sleeps the swan\r\nBehold a dream, the dream is gone\r\nGreen fields, a cold rain is falling\r\nIn a golden dawn\r\nAnd deep beneath the ground\r\nThe early morning sounds\r\nAnd I go down\r\nSleepy time in my life\r\nWith my love by my side\r\nAnd she\'s breathing low\r\nAnd I rise like a bird\r\nIn the haze when the first rays touch the sky\r\nAnd the night winds die', NULL, 0, '2024-03-17 22:04:55', '2024-04-17 22:55:23'),
(47, 10, 'Fearless', 'fearless', '6:08', 'You say the hill\'s too steep to climb, chiding\r\nYou say you\'d like to see me try climbing\r\nYou pick the place and I\'ll choose the time\r\nAnd I\'ll climb the hill in my own way\r\nJust wait awhile for the right day\r\nAnd as I rise above the tree line and the clouds\r\nI look down, hear the sound of the things you said today\r\nFearlessly, the idiot faced the crowd, smiling\r\nMerciless, the magistrate turns \'round, frowning\r\nAnd who\'s the fool who wears the crown?\r\nGo down in your own way\r\nAnd every day is the right day\r\nAnd as you rise above the fear lines in his brow\r\nYou look down, hear the sound of the faces in the crowd\r\nWalk on, walk on with hope in your heart\r\nAnd you\'ll never walk alone\r\nYou\'ll never walk alone\r\nWalk on, walk on with hope in your heart\r\nAnd you\'ll never walk alone\r\nYou\'ll never walk alone\r\nLiverpool! Liverpool! Liverpool!', NULL, 0, '2024-03-17 22:05:22', '2024-04-17 22:55:25'),
(48, 10, 'San Tropez', 'san tropez', '3:43', 'As I reach for a peach, slide a rind down behind\r\nThe sofa in San Tropez\r\nBreakin\' a stick with a brick on the sand\r\nRidin\' a wave in the wake of an old sedan\r\nSleepin\' alone in the drone of the darkness\r\nScratched by the sand that fell from my love\r\nDeep in my dreams and I still hear her callin\'\r\n\"If you\'re alone, I\'ll come ho-ho-home\"\r\nBackward and home bound, the pigeon, the dove\r\nGone with the wind and the rain on an airplane\r\nBorn in a home with no silver spoon\r\nI\'m drinking champagne like a good tycoon\r\nSooner than wait for a break in the weather\r\nI\'ll gather my far-flung thoughts together\r\nSpeeding away on the wind to a new day\r\nIf you\'re alone, I\'ll come ho-ho-home\r\nAnd I pause for a while by a country stile\r\nAnd listen to the things they say\r\nDiggin\' for gold in a hold in my hand\r\nOpen a book, take a look at the way things stand\r\nAnd you\'re leading me down to the place by the sea\r\nI hear your soft voice calling to me\r\nMaking a date for later by phone\r\nAnd if you\'re alone, I\'ll come ho-ho-home', NULL, 0, '2024-03-17 22:05:48', '2024-04-17 22:55:26'),
(49, 10, 'Seamus', 'seamus', '2:15', 'I was in the kitchen\r\nSeamus, that\'s the dog, was outside\r\nWell, I was in the kitchen\r\nSeamus, my old hound, was outside\r\nWell, you know, the sun sinks slowly\r\nBut my old hound just sat right down, and cried', NULL, 0, '2024-03-17 22:06:05', '2024-04-17 22:55:28');
INSERT INTO `songs` (`id`, `album_id`, `song`, `song_clean`, `duration`, `lyrics`, `lyrics_clean`, `views`, `created_at`, `updated_at`) VALUES
(50, 10, 'Echoes', 'echoes', '23:32', 'Overhead the albatross\r\nHangs motionless upon the air\r\nAnd deep beneath the rolling waves\r\nIn labyrinths of coral caves\r\nThe echo of a distant time\r\nComes willowing across the sand\r\nAnd everything is green and submarine\r\nAnd no one showed us to the land\r\nAnd no one knows the where\'s or why\'s\r\nBut something stirs and something tries\r\nAnd starts to climb toward the light\r\nStrangers passing in the street\r\nBy chance, two separate glances meet\r\nAnd I am you and what I see is me\r\nAnd do I take you by the hand\r\nAnd lead you through the land\r\nAnd help me understand the best I can?\r\nAnd no one calls us to move on\r\nAnd no one forces down our eyes\r\nNo one speaks and no one tries\r\nNo one flies around the sun\r\nCloudless everyday\r\nYou fall upon my waking eyes\r\nInviting and inciting me to rise\r\nAnd through the window in the wall\r\nCome streaming in on sunlight wings\r\nA million bright ambassadors of morning\r\nAnd no one sings me lullabies\r\nAnd no one makes me close my eyes\r\nSo I throw the windows wide\r\nAnd call to you across the sky', NULL, 0, '2024-03-17 22:06:25', '2024-04-17 22:55:29'),
(51, 11, 'Shine on you crazy diamonds, parts I-V', 'shine on you crazy diamonds parts i-v', '13:19', 'Remember when you were young\r\nyou shone like the sun\r\n\r\nShine on you crazy diamond\r\n\r\nNow there\'s a look in your eyes\r\nlike black holes in the sky\r\n\r\nShine on you crazy diamond\r\n\r\nYou were caught on the crossfire of childhood and stardom\r\nBlown on the steel breeze.\r\nCome on you target for faraway laughter,\r\nCome on you stranger, you legend, you martyr, and shine\r\n\r\nYou reached for the secret too soon\r\nyou cried for the moon\r\n\r\nShine on you crazy diamond\r\n\r\nThreatened by shadows at night\r\nand exposed in the light\r\n\r\nShine on you crazy diamond\r\n\r\nWell, you wore out your welcome with random precision\r\nRode on the steel breeze\r\nCome on, you raver, you seer of visions\r\nCome on, you painter, you piper, you prisoner, and shine', NULL, 35, '2024-03-17 22:08:13', '2024-05-22 17:46:50'),
(52, 11, 'Welcome to the machine', 'welcome to the machine', '7:27', 'Welcome my son\r\nWelcome to the machine\r\nWhere have you been?\r\n\r\nIt\'s alright we know where you\'ve been\r\nYou\'ve been in the pipeline\r\nFilling in time\r\nProvided with toys and scouting for boys\r\nYou brought a guitar to punish your ma\r\n\r\nAnd you didn\'t like school\r\nAnd you know you\'re nobody\'s fool\r\nSo welcome to the machine\r\n\r\nWelcome my son\r\nWelcome to the machine\r\nWhat did you dream?\r\nIt\'s alright we told you what to dream\r\n\r\nYou dreamed of a big star\r\nHe played a mean guitar\r\nHe always ate in the Steak Bar\r\nHe loved to drive in his Jaguar\r\nSo welcome to the machine', NULL, 0, '2024-03-17 22:08:20', '2024-04-17 22:55:44'),
(53, 11, 'Have a cigar', 'have a cigar', '5:08', 'Come in here, dear boy, have a cigar, you\'re gonna go far\r\nYou\'re gonna fly, you\'re never gonna die\r\nYou\'re gonna make it if you try, they\'re gonna love you\r\nWell, I\'ve always had a deep respect and I mean that most sincere\r\nThe band is just fantastic, that is really what I think\r\nOh, by the way, which one\'s pink?\r\nAnd did we tell you the name of the game, boy?\r\nWe call it riding the gravy train\r\nWe\'re just knocked out, we heard about the sell-out\r\nYou gotta get an album out, you owe it to the people\r\nWe\'re so happy we can hardly count\r\nEverybody else is just green, have you seen the chart?\r\nIt\'s a hell of a start, it could be made into a monster\r\nIf we all pull together as a team\r\nAnd did we tell you the name of the game, boy?\r\nWe call it riding the gravy train', NULL, 0, '2024-03-17 22:08:29', '2024-04-17 22:55:45'),
(54, 11, 'Wish you were here', 'wish you were here', '5:40', 'And disciplinary remains mercifully\r\nYes and um, I\'m with you Derek, this star nonsense\r\nYes, yes\r\nNow which is it?\r\nI am sure of it\r\nSo, so you think you can tell\r\nHeaven from hell?\r\nBlue skies from pain?\r\nCan you tell a green field\r\nFrom a cold steel rail?\r\nA smile from a veil?\r\nDo you think you can tell?\r\nDid they get you to trade\r\nYour heroes for ghosts?\r\nHot ashes for trees?\r\nHot air for a cool breeze?\r\nCold comfort for change?\r\nDid you exchange\r\nA walk-on part in the war\r\nFor a lead role in a cage?\r\nHow I wish, how I wish you were here\r\nWe\'re just two lost souls\r\nSwimming in a fish bowl\r\nYear after year\r\nRunning over the same old ground\r\nWhat have we found?\r\nThe same old fears\r\nWish you were here', NULL, 2, '2024-03-17 22:08:38', '2024-05-22 17:46:12'),
(55, 11, 'Shine on you crazy diamonds, parts VI-IX', 'shine on you crazy diamonds part vi-ix', '12:23', 'Nobody knows where you are, how near or how far.\r\nShine on you crazy diamond.\r\nPile on many more layers and I\'ll be joining you there.\r\nShine on you crazy diamond.\r\nAnd we\'ll bask in the shadow of yesterday\'s triumph,\r\nSail on the steel breeze.\r\nCome on you boy child, you winner and loser,\r\nCome on you miner for truth and delusion, and shine', NULL, 0, '2024-03-17 22:09:28', '2024-04-17 22:55:56'),
(56, 12, 'Pigs on the wing, part 1', 'pigs on the wing part 1', '1:25', 'You know that I care\r\nWhat happens to you\r\nAnd I know that you care\r\nFor me too\r\n\r\nSo, I don\'t feel alone on the weight of the stone\r\nNow that I\'ve found somewhere safe to bury my bone\r\nAnd any fool knows a dog needs a home\r\nA shelter from pigs on the wing', NULL, 0, '2024-04-01 20:00:27', '2024-04-17 22:56:26'),
(57, 12, 'Dogs', 'dogs', '17:05', 'You gotta be crazy, you gotta have a real need\r\nYou gotta sleep on your toes, and when you\'re on the street\r\nYou gotta be able to pick out the easy meat with your eyes closed\r\nAnd then moving in silently, down wind and out of sight\r\nYou gotta strike when the moment is right without thinking\r\n\r\nAnd after a while, you can work on points for style\r\nLike the club tie, and the firm handshake\r\nA certain look in the eye and an easy smile\r\nYou have to be trusted by the people that you lie to\r\nSo that when they turn their backs on you,\r\nYou\'ll get the chance to put the knife in\r\n\r\nYou gotta keep one eye looking over your shoulder\r\nYou know it\'s going to get harder, and harder, and harder as you get older\r\nAnd in the end you\'ll pack up and fly down south\r\nHide your head in the sand,\r\nJust another sad old man\r\nAll alone and dying of cancer\r\n\r\nAnd when you loose control, you\'ll reap the harvest you have sown\r\nAnd as the fear grows, the bad blood slows and turns to stone\r\nAnd it\'s too late to lose the weight you used to need to throw around\r\nSo have a good drown, as you go down, all alone\r\nDragged down by the stone (stone, stone, stone, stone, stone)\r\n\r\nI gotta admit that I\'m a little bit confused\r\nSometimes it seems to me as if I\'m just being used\r\nGotta stay awake, gotta try and shake off this creeping malaise\r\nIf I don\'t stand my own ground, how can I find my way out of this maze?\r\n\r\nDeaf, dumb, and blind, you just keep on pretending\r\nThat everyone\'s expendable and no-one has a real friend\r\nAnd it seems to you the thing to do would be to isolate the winner\r\nAnd everything\'s done under the sun\r\nAnd you believe at heart, everyone\'s a killer\r\n\r\nWho was born in a house full of pain\r\nWho was trained not to spit in the fan\r\nWho was told what to do by the man\r\nWho was broken by trained personnel\r\n\r\nWho was fitted with collar and chain\r\nWho was given a pat on the back\r\nWho was breaking away from the pack\r\nWho was only a stranger at home\r\n\r\nWho was ground down in the end\r\nWho was found dead on the phone\r\nWho was dragged down by the stone', NULL, 7, '2024-04-01 20:00:34', '2024-06-17 22:54:25'),
(58, 12, 'Pigs (Trhee different ones)', 'pigs three different ones', '11:26', 'Big man, pig man\r\nHa, ha, charade you are\r\nYou well heeled big wheel\r\nHa, ha, charade you are\r\nAnd when your hand is on your heart\r\nYou\'re nearly a good laugh\r\nAlmost a joker\r\nWith your head down in the pig bin\r\nSaying \'Keep on digging\'\r\nPig stain on your fat chin\r\nWhat do you hope to find\r\nDown in the pig mine?\r\nYou\'re nearly a laugh\r\nYou\'re nearly a laugh\r\nBut you\'re really a cry\r\n\r\nBus stop rat bag\r\nHa, ha, charade you are\r\nYou fucked up old hag\r\nHa, ha, charade you are\r\nYou radiate cold shafts of broken glass\r\nYou\'re nearly a good laugh\r\nAlmost worth a quick grin\r\nYou like the feel of steel\r\nYou\'re hot stuff with a hatpin\r\nAnd good fun with a hand gun\r\nYou\'re nearly a laugh\r\nYou\'re nearly a laugh\r\nBut you\'re really a cry\r\nHey you, Whitehouse\r\nHa, ha, charade you are\r\nYou house proud town mouse\r\nHa, ha, charade you are\r\nYou\'re trying to keep our feelings off the street\r\nYou\'re nearly a real treat\r\nAll tight lips and cold feet\r\nAnd do you feel abused?\r\nYou got to stem the evil tide\r\nAnd keep it all on the inside\r\nMary you\'re nearly a treat\r\nMary you\'re nearly a treat\r\nBut you\'re really a cry\r\n', NULL, 0, '2024-04-01 20:00:51', '2024-04-17 22:56:15'),
(59, 12, 'Sheep', 'sheep', '10:20', 'Hopelessly passing your time in the grassland away\r\nOnly dimly aware of a certain unease in the air\r\nYou better watch out\r\nThere may be dogs about\r\nI\'ve looked over Jordan, and I have seen\r\nThings are not what they seem\r\n\r\nWhat do you get for pretending the danger\'s not real\r\nMeek and obedient you follow the leader\r\nDown well trodden corridors into the valley of steel\r\nWhat a surprise\r\n\r\nThe look of terminal shock in your eyes\r\nNow things are really what they seem\r\nNo, this is no bad dream\r\n\r\nThe Lord is my shepherd, I shall not want\r\nHe makes me down to lie\r\nThrough pastures green He leadeth me the silent waters by\r\nWith bright knives he releaseth my soul\r\n\r\nHe maketh me to hang on hooks in high places\r\nHe converteth me to lamb cutlets\r\nFor lo, He hath great power, and great hunger\r\nWhen cometh the day we lowly ones\r\n\r\nThrough quiet reflection, and great dedication\r\nMaster the art of karate\r\nLo, we shall rise up\r\nAnd then we\'ll make the bugger\'s eyes water\r\n\r\nBleating and babbling we fell on his neck with a scream\r\nWave upon wave of demented avengers\r\nMarch cheerfully out of obscurity into the dream\r\n\r\nHave you heard the news?\r\nThe dogs are dead\r\nYou better stay home\r\nAnd do as you\'re told\r\nGet out of the road if you want to grow old', NULL, 0, '2024-04-01 20:01:03', '2024-04-17 22:56:17'),
(60, 12, 'Pigs on the wing, part 2', 'pigs on the wing part 2', '1:26', 'You know that I care\r\nWhat happens to you\r\nAnd I know that you care\r\nFor me too\r\n\r\nSo, I don\'t feel alone on the weight of the stone\r\nNow that I\'ve found somewhere safe to bury my bone\r\nAnd any fool knows a dog needs a home\r\nA shelter from pigs on the wing', NULL, 0, '2024-04-01 20:01:13', '2024-04-17 22:56:22'),
(61, 13, 'In the flesh?', 'in the flesh', '3:16', 'We came in?\r\n\r\nSo ya thought ya might\r\nLike to go to the show\r\nTo feel the warm thrill of confusion\r\nThat space cadet glow\r\n\r\nTell me, is something eluding you, sunshine?\r\nIs this not what you expected to see?\r\nIf you wanna find out\r\nWhat\'s behind these cold eyes\r\nYou\'ll just have to\r\nClaw your way through this disguise\r\n\r\nLights!\r\nRoll the sound effects!\r\nAction!\r\nDrop it, drop it on \'em\r\nDrop it, drop it on them!', NULL, 5, '2024-04-01 20:06:49', '2024-04-17 22:56:31'),
(62, 13, 'The thin ice', 'the thin ice', '2:27', 'Momma loves her baby\r\nAnd daddy loves you too.\r\nAnd the sea may look warm to you babe\r\nAnd the sky may look blue\r\nBut ooooh Baby\r\nOoooh baby blue\r\nOooooh babe.\r\n\r\nIf you should go skating\r\nOn the thin ice of modern life\r\nDragging behind you the silent reproach\r\nOf a million tear-stained eyes\r\nDon\'t be surprised when a crack in the ice\r\nAppears under your feet.\r\nYou slip out of your depth and out of your mind\r\nWith your fear flowing out behind you\r\nAs you claw the thin ice.', NULL, 41, '2024-04-01 20:07:00', '2024-04-17 22:56:33'),
(63, 13, 'Another brick in the wall part 1', 'another brick in the wall part 1', '3:10', 'Daddy\'s flown across the ocean\r\nLeaving just a memory\r\nA snapshot in the family album\r\nDaddy, what else did you leave for me?\r\nDaddy, what\'d ya leave behind for me?\r\n\r\nAll in all, it was just a brick in the wall\r\nAll in all, it was all just bricks in the wall\r\n\r\nHey!', NULL, 0, '2024-04-01 20:07:14', '2024-04-17 22:56:38'),
(64, 13, 'The happiest days of our lives', 'the happiest days of our lives', '1:46', 'When we grew up and went to school\r\nThere were certain teachers who would\r\nHurt the children any way they could\r\nBy pouring their derision\r\nUpon anything we did\r\nAnd exposing every weakness\r\nHowever carefully hidden by the kids\r\nBut in the town it was well known\r\nWhen they got home at night, their fat and\r\nPsycopathic wives would thrash them\r\nWithin inches of their lives', NULL, 0, '2024-04-01 20:07:23', '2024-04-17 22:56:42'),
(65, 13, 'Another brick in the wall part 2', 'another brick in the wall part 2', '3:59', 'We don\'t need no education\r\nWe don\'t need no thought control\r\nNo dark sarcasm in the classroom\r\nTeacher, leave them kids alone\r\n\r\nHey, teacher, leave them kids alone\r\nAll in all, it\'s just another brick in the wall\r\nAll in all, you\'re just another brick in the wall\r\n\r\nWe don\'t need no education\r\nWe don\'t need no thought control\r\nNo dark sarcasm in the classroom\r\nTeachers, leave them kids alone\r\n\r\nHey, teacher, leave us kids alone\r\nAll in all, you\'re just another brick in the wall\r\nAll in all, you\'re just another brick in the wall\r\n\r\nIf you don\'t eat yer meat, you can\'t have any pudding\r\nHow can you have any pudding if you don\'t eat yer meat?\r\nYou! Yes, you behind the bike stands\r\nStand still, laddy!', NULL, 0, '2024-04-01 20:07:36', '2024-04-17 22:56:46'),
(66, 13, 'Mother', 'mother', '5:32', 'Mother do you think they\'ll drop the bomb\r\n\r\nMother do you think they\'ll like the song\r\n\r\nMother do you think they\'ll try to break my balls\r\n\r\nOoooh aah, Mother should I build a wall\r\n\r\nMother should I run for president\r\n\r\nMother should I trust the government\r\n\r\nMother will they put me in the firing line\r\n\r\nOoooh aah, is it just a waste of time\r\n\r\nHush now baby don\'t you cry\r\n\r\nMama\'s gonna make all of your\r\nNightmares come true\r\nMama\'s gonna put all of her fears into you\r\nMama\'s gonna keep you right here\r\nUnder her wing\r\nShe won\'t let you fly but she might let you sing\r\nMama will keep baby cosy and warm\r\n\r\nOoooh Babe Ooooh Babe Ooooh Babe\r\nOf course Mama\'s gonna help build the wall\r\n\r\nMother do think she\'s good enough for me\r\n\r\nMother do think she\'s dangerous to me\r\n\r\nMother will she tear your little boy apart\r\n\r\nOooh aah, mother will she break my heart\r\n\r\nHush now baby, baby don\'t you cry\r\n\r\nMama\'s gonna check out all your girl friends for you\r\nMama won\'t let anyone dirty get through\r\nMama\'s gonna wait up till you come in\r\nMama will always find out where\r\nYou\'ve been\r\nMamma\'s gonna keep baby healthy and clean\r\nOoooh Babe Ooooh Babe Ooooh Babe\r\nYou\'ll always be a baby to me\r\n\r\nMother, did it need to be so high', NULL, 0, '2024-04-01 20:07:42', '2024-04-17 22:56:48'),
(67, 13, 'Goodbye blue sky', 'goodbye blue sky', '2:45', 'Look mummy, there\'s an aeroplane up in the sky\r\n\r\nOoh\r\nDid you see the frightened ones?\r\nDid you hear the falling bombs?\r\nDid you ever wonder why we had to run for shelter when the\r\nPromise of a brave new world unfurled beneath a clear blue\r\nSky?\r\n\r\nOoh\r\nDid you see the frightened ones?\r\nDid you hear the falling bombs?\r\nThe flames are all long gone, but the pain lingers on\r\n\r\nGoodbye, blue sky\r\nGoodbye, blue sky\r\nGoodbye\r\nGoodbye\r\n\r\nThe eleven fifteen from Newcastle is now approaching\r\nThe eleven eighteen arrival', NULL, 0, '2024-04-01 20:07:50', '2024-04-17 22:56:51'),
(68, 13, 'Empty spaces', 'empty spaces', '2:10', 'What shall we use\r\nTo fill the empty spaces\r\nWhere we used to talk?\r\nHow shall I fill\r\nThe final places?\r\nHow should I complete the wall', NULL, 11, '2024-04-01 20:08:02', '2024-04-17 22:56:53'),
(69, 13, 'Young lust', 'young lust', '3:31', 'I am just a new boy\r\nStranger in this town\r\nWhere are all the good times?\r\nWho\'s gonna show this stranger around?\r\nOoh, I need a dirty woman\r\nOoh, I need a dirty girl\r\n\r\nWill some woman in this desert land\r\nMake me feel like a real man?\r\nTake this rock and roll refugee\r\nOoh, baby set me free\r\n\r\nOoh, I need a dirty woman\r\nOoh, I need a dirty girl\r\n\r\nOoh, I need a dirty woman\r\nOoh, I need a dirty girl\r\n\r\nHello?\r\nYes, a collect call for Mrs. Floyd from Mister Floyd\r\nWill you accept the charges from United States?\r\n\r\nOh, he hung up, that\'s your residence, right? I wonder why he hung up?\r\nIs there supposed to be someone else there besides your wife there to answer?\r\n\r\nHello?\r\nThis is United States calling, are we reaching\r\nSee he keeps hanging up, and it\'s a man answering', NULL, 0, '2024-04-01 20:08:12', '2024-04-17 22:56:57'),
(70, 13, 'One of my turns', 'one of my turns', '3:41', '\"Oh, my God! What a fabulous room! Are all these your guitars?\"\r\n(\"I\'m sorry sir, I didn\'t mean to startle you\")\r\n\"God! This place is bigger than our apartment!\"\r\n(\"Let me know when you\'re entering a room, yes, sir?\")\r\n\"Um, can I get a drink of water?\" (\"I was wondering about\")\r\n\"You want some, huh?\" (\"Yes\")\r\n\"Oh, wow! Hey, look at this tub! Wanna take a bath?\"\r\n(\"I\'ll have to find out from Mrs. Bancroft what time she wants to meet us, for her main\")\r\n\"What are you watching?\"\r\n(\"If you\'ll just let me know as soon as you can, Mrs. Bancroft... Mrs. Bancroft\")\r\n\"Hello?\" (\"I don\'t understand\")\r\n\"Are you feeling okay?\"\r\n\r\nDay after day, the love turns gray\r\nLike the skin of the dying man\r\nAnd night after night, we pretend it\'s all right\r\nBut I have grown older, and you have grown colder\r\nAnd nothing is very much fun anymore\r\nAnd I can feel one of my turns coming on\r\nI feel cold as a razor blade, tight as a tourniquet\r\nDry as a funeral drum\r\n\r\nRun to the bedroom, in the suitcase on the left\r\nYou\'ll find my favorite axe\r\nDon\'t look so frightened, this is just a passing phase\r\nOne of my bad days\r\nWould you like to watch TV? Or get between the sheets?\r\nOr contemplate the silent freeway?\r\nWould you like something to eat? Would you like to learn to fly?\r\nWould ya? Would you like to see me try?\r\nAh, no!\r\n\r\nWould you like to call the cops?\r\nDo you think it\'s time I stopped?\r\nWhy are you running away?', NULL, 0, '2024-04-01 20:08:22', '2024-04-17 22:57:01'),
(71, 13, 'Don\'t leave me now', 'dont leave me now', '4:17', 'Ooh, babe\r\nDon\'t leave me now\r\n\r\nDon\'t say it\'s the end of the road\r\nRemember the flowers I sent\r\nI need you, babe\r\nTo put through the shredder in front of my friends\r\n\r\nOh, babe\r\nDon\'t leave me now\r\n\r\nHow could you go?\r\nWhen you know how I need you\r\n(Need you, need you, need you, need you, need you, need you)\r\nTo beat to a pulp on a Saturday night\r\n\r\nOh, babe\r\nDon\'t leave me now\r\n\r\nHow can you treat me this way?\r\nRunning away\r\n\r\nOoh, babe\r\nWhy are ya running away?\r\n\r\nOoh, babe\r\n\r\nOoh, babe\r\n\r\nOoh, babe\r\n\r\nAah!', NULL, 0, '2024-04-01 20:08:32', '2024-04-17 22:57:03'),
(72, 13, 'Goodbye cruel world', 'goodbye cruel world', '1:17', 'Goodbye cruel world\r\nI\'m leaving you today\r\nGoodbye\r\nGoodbye\r\nGoodbye\r\n\r\nGoodbye all you people\r\nThere\'s nothing you can say\r\nTo make me change my mind\r\nGoodbye', NULL, 0, '2024-04-01 20:08:47', '2024-04-17 22:57:09'),
(73, 13, 'Hey you', 'hey you', '4:40', 'Hey you, out there in the cold\r\nGetting lonely, getting old\r\nCan you feel me?\r\nHey you, standing in the aisles\r\nWith itchy feet and fading smiles\r\nCan you feel me?\r\nHey you, don\'t help them to bury the light\r\nDon\'t give in without a fight\r\n\r\nHey you out there on your own\r\nSitting naked by the phone\r\nWould you touch me?\r\nHey you with you ear against the wall\r\nWaiting for someone to call out\r\nWould you touch me?\r\nHey you, would you help me to carry the stone?\r\nOpen your heart, I\'m coming home\r\n\r\nBut it was only fantasy\r\nThe wall was too high\r\nAs you can see\r\nNo matter how he tried\r\nHe could not break free\r\nAnd the worms ate into his brain\r\n\r\nHey you, out there on the road\r\nAlways doing what you\'re told\r\nCan you help me?\r\nHey you, out there beyond the wall\r\nBreaking bottles in the hall\r\nCan you help me?\r\nHey you, don\'t tell me there\'s no hope at all\r\nTogether we stand, divided we fall\r\n', NULL, 0, '2024-04-01 20:08:56', '2024-04-17 22:57:11'),
(74, 13, 'Is there anybody out there?', 'is there anybody out there', '2:44', '\"Well, only got an hour of daylight left. Better get started\"\r\n\"Isn\'t it unsafe to travel at night?\"\r\n\"It\'ll be a lot less safe to stay here, your father\'s gunna pick up our trail before long\"\r\n\"Can Loca ride?\"\r\n\"Yeah, I can ride, Margaret, time to go! Maigret, thank you for everything\"\r\n\"Goodbye Chenga\"\r\n\"Goodbye miss\"\r\n\"I\'ll be back\"\r\n\r\nIs there anybody out there?', NULL, 0, '2024-04-01 20:09:05', '2024-04-17 22:57:15'),
(75, 13, 'Nobody home', 'nobody home', '3:26', 'I\'ve got a little black book with my poems in\r\nGot a bag with a toothbrush and a comb in\r\nWhen I\'m a good dog, they sometimes throw me a bone in\r\n\r\nI got elastic bands keepin\' my shoes on\r\nGot those swollen-hand blues\r\nI got thirteen channels of shit on the T.V. to choose from\r\nI\'ve got electric light\r\nAnd I\'ve got second sight\r\nI got amazing powers of observation\r\nAnd that is how I know\r\nWhen I try to get through\r\nOn the telephone to you\r\nThere\'ll be nobody home\r\n\r\nI\'ve got the obligatory Hendrix perm\r\nAnd the inevitable pinhole burns\r\nAll down the front of my favorite satin shirt\r\nI\'ve got nicotine stains on my fingers\r\nI\'ve got a silver spoon on a chain\r\nGot a grand piano to prop up my mortal remains\r\n\r\nI\'ve got wild staring eyes\r\nAnd I\'ve got a strong urge to fly\r\nBut I got nowhere to fly to\r\nOoh, babe when I pick up the phone\r\n\r\nthere\'s still nobody home\r\n\r\nI\'ve got a pair of Gohills boots\r\nBut I got fading roots', NULL, 1, '2024-04-01 20:09:14', '2024-04-17 22:57:18'),
(76, 13, 'Vera', 'vera', '1:35', 'Does anybody here remember Vera Lynn?\r\nRemember how she said that\r\nWe would meet again\r\nSome sunny day?\r\nVera, Vera\r\nWhat has become of you\r\nDoes anybody else in here\r\nFeel the way I do?', NULL, 0, '2024-04-01 20:09:21', '2024-04-17 22:57:19'),
(77, 13, 'Bring the boys back home', 'bring the boys back home', '1:27', 'Bring the boys back home\r\nBring the boys back home\r\nDon\'t leave the children on their own, no, no\r\nBring the boys back home\r\n\r\nWrong, do it again\r\nTime to go\r\nAre you feeling okay?\r\nThere\'s a man answering, but he keeps hanging up\r\n\r\nIs there anybody out there?', NULL, 0, '2024-04-01 20:09:32', '2024-04-17 22:57:23'),
(78, 13, 'Comfortably numb', 'comfortably numb', '6:23', 'Hello? (Hello? Hello? Hello?)\r\n\r\nIs there anybody in there?\r\nJust nod if you can hear me\r\nIs there anyone home?\r\nCome on now\r\nI hear you\'re feeling down\r\nWell I can ease your pain\r\nGet you on your feet again\r\nRelax\r\nI\'ll need some information first\r\nJust the basic facts\r\nCan you show me where it hurts?\r\n\r\nThere is no pain you are receding\r\nA distant ship smoke on the horizon\r\nYou are only coming through in waves\r\nYour lips move but I can\'t hear what you\'re saying\r\nWhen I was a child I had a fever\r\nMy hands felt just like two balloons\r\nNow I\'ve got that feeling once again\r\nI can\'t explain you would not understand\r\nThis is not how I am\r\nI have become comfortably numb\r\n\r\nI have become comfortably numb\r\n\r\nOkay (okay, okay, okay)\r\nJust a little pinprick\r\nThere\'ll be no more, ah\r\nBut you may feel a little sick\r\nCan you stand up?\r\nI do believe it\'s working, good\r\nThat\'ll keep you going through the show\r\nCome on it\'s time to go\r\n\r\nThere is no pain you are receding\r\nA distant ship, smoke on the horizon\r\nYou are only coming through in waves\r\nYour lips move but I can\'t hear what you\'re saying\r\nWhen I was a child\r\nI caught a fleeting glimpse\r\nOut of the corner of my eye\r\nI turned to look but it was gone\r\nI cannot put my finger on it now\r\nThe child is grown\r\nThe dream is gone\r\nI have become comfortably numb', NULL, 34, '2024-04-01 20:09:43', '2024-04-17 22:57:29'),
(79, 13, 'The show must go on', 'the show must go on', '1:36', 'Ooh, ooh-hoo, ooh, ooh\r\n(Ah-ah)\r\n(Ah-ah)\r\n(Ooh-ma, ah, ooh-pa) Must the show go on?\r\n\r\nThere must be some mistake, I didn\'t mean to let them\r\nTake away my soul, am I too old, is it too late?\r\n\r\nWhere has the feeling gone?\r\n(Ooh-ma, ooh-pa) Will I remember the song?\r\n\r\nThe show must go on', NULL, 0, '2024-04-01 20:09:53', '2024-04-17 22:57:33'),
(80, 13, 'In the flesh', 'in the flesh', '4:15', 'So ya thought ya might like to\r\nGo to the show\r\nTo feel the warm thrill of confusion\r\nThat space cadet glow\r\n\r\nI\'ve got some bad news for you, sunshine\r\nPink isn\'t well, he stayed back at the hotel\r\nAnd they sent us along as a surrogate band\r\nAnd we\'re going to find out where you fans really stand\r\n\r\nAre there any queers in the theatre tonight?\r\nGet \'em up against the wall (against the wall)\r\nNow that one in the spotlight, he don\'t look right to me\r\nGet him up against the wall (against the)\r\n\r\nThat one looks jewish\r\nAnd that one\'s a coon\r\nWho let all this riff-raff into the room?\r\n\r\nThere\'s one smoking a joint\r\nAnd another with spots\r\nIf I had my way I\'d have all of you shot', NULL, 0, '2024-04-01 20:10:04', '2024-04-17 22:57:39'),
(81, 13, 'Run like hell', 'run like hell', '4:20', 'Run, run, run, run\r\nRun, run, run, run\r\nRun, run, run, run\r\nRun, run, run, run\r\n\r\nYou better make your face up with your favorite disguise\r\nWith your button down lips and your roller blind eyes\r\nWith your empty smile and your hungry heart\r\nFeel the bile rising from your guilty past\r\nWith your nerves in tatters as the cockleshell shatters\r\nAnd the hammers batter down your door\r\nYou better run\r\n\r\nRun, run, run, run\r\nRun, run, run, run\r\nRun, run, run, run\r\nRun, run, run, run\r\n\r\nYou better run all day and run all night\r\nKeep your dirty feelings deep inside\r\nAnd if you\'re taking your girlfriend out tonight\r\nYou\'d better park the car well out of sight\r\n\'Cause if they catch you in the back seat trying to pick her locks\r\nThey\'re gonna send you back to mother in a cardboard box\r\nYou better run', NULL, 0, '2024-04-01 20:10:13', '2024-04-17 22:57:41'),
(82, 13, 'Waiting for the worms', 'waiting for the worms', '3:58', '\"Eins, zwei, drei, alle!\"\r\nOoh-ooh, you cannot reach me now (oh-oh)\r\nOoh-ooh, no matter how you try (oh-oh)\r\nGoodbye, cruel world, it\'s over\r\nWalk on by\r\n\r\nSitting in a bunker here behind my wall\r\nWaiting for the worms to come (worms to come)\r\nIn perfect isolation here behind my wall\r\nWaiting for the worms to come (worms to come)\r\n\r\n\"The worms will convene at 1:15 outside Brixton Town Hall where \r\nwe will be going in force!\"\r\nto cut out the deadwood\r\n(Waiting) to clean up the city\r\n(Waiting) to follow the worms\r\n(Waiting) to put on a black shirt\r\n(Waiting) to weed out the weaklings\r\n(Waiting) to smash in their windows and kick in their doors\r\n\r\nfor the final solution to strengthen the strain\r\n(Waiting) to follow the worms\r\n(Waiting) to turn on the showers and fire the ovens\r\n(Waiting) for the queers and the coons and the reds and the Jews\r\n(Waiting) to follow the worms\r\n\r\nWould you like to see Britannia rule again (Would you like to see us rule again)\r\nMy friend?\r\nAll you have to do is follow the worms\r\n\r\nWould you like to send our coloured cousins home again (would you like to send them home again)\r\nMy friend?\r\nAll you need to do is follow the worms\r\n\r\n\"The Worms will convene outside Brixton Bus Station\r\nWhere we\'ll be moving along at about 12 o\'clock down Stockwell Road\r\nAt that point, we\'ll be heading towards Lambeth Road\r\nWhere we will walk calmly with resistance\r\nLeaving 12 minutes to three as we move along Lambeth Road towards Vauxhall Bridge\"\r\nNow when we get to the other side of Vauxhall Bridge\r\nWe\'re in the Westminster Borough area, it\'s quite possible that we may encounter\r\nSome Jew boys all the way from four, five, and six on the way as we go\" (hammer! Hammer! Hammer)\r\n\r\nNow is the time to clean up the city, for this is the beginning (hammer! Hammer! Hammer!)\r\nWe need to secure our people! (Hammer! Hammer! Hammer)\r\nWe can\'t stand around and let ourselves be robbed, maimed, and killed!\" (Hammer! Hammer! Hammer!)\r\nAnd when we make it to the Highclock Corner (hammer! Hammer! Hammer)\r\nCorner, I want you to spread it out and find them!\" (hammer! Hammer! Hammer!)\r\nStorm the halls, and then tear the walls and the doors! (Hammer! Hammer! Hammer)\r\n(Hammer! Hammer! Hammer! Hammer!)\r\nStop!', NULL, 0, '2024-04-01 20:10:21', '2024-04-17 22:57:45'),
(83, 13, 'Stop', 'stop', '0:30', 'I want to go home\r\nTake off this uniform and leave the show\r\nAnd I\'m waiting in this cell because I have to know\r\nHave I been guilty all this time?', NULL, 0, '2024-04-01 20:10:25', '2024-04-17 22:57:46'),
(84, 13, 'The trial', 'the trial', '5:20', 'Good morning, Worm your honor\r\nThe crown will plainly show\r\nThe prisoner who now stands before you\r\nWas caught red-handed showing feelings\r\nShowing feelings of an almost human nature\r\nThis will not do\r\nCall the schoolmaster\r\n\r\nI always said he\'d come to no good\r\nIn the end your honor\r\nIf they\'d let me have my way I could\r\nHave flayed him into shape\r\nBut my hands were tied\r\nThe bleeding hearts and artists\r\nLet him get away with murder\r\nLet me hammer him today?\r\n\r\nCrazy\r\nToys in the attic, I am crazy\r\nTruly gone fishing\r\nThey must have taken my marbles away\r\nCrazy, toys in the attic he is crazy\r\n\r\nYou little shit you\'re in it now\r\nI hope they throw away the key\r\nYou should have talked to me more often\r\nThan you did, but no\r\nYou had to go\r\nYour own way, have you broken any\r\nHomes up lately?\r\nJust five minutes, worm your honor\r\nHim and me, alone\r\n\r\nBabe\r\nCome to mother baby, let me hold you\r\nIn my arms\r\nM\'lud I never wanted him to\r\nGet in any trouble\r\nWhy\'d he ever have to leave me?\r\nWorm, your honor, let me take him home\r\n\r\nCrazy\r\nOver the rainbow, I am crazy\r\nBars in the window\r\nThere must have been a door there in the wall\r\nWhen I came in\r\nCrazy, over the rainbow, he is crazy\r\n\r\nThe evidence before the court is\r\nIncontrovertible, there\'s no need for\r\nThe jury to retire\r\nIn all my years of judging\r\nI have never heard before\r\nOf someone more deserving\r\nOf the full penalty of law\r\nThe way you made them suffer\r\nYour exquisite wife and mother\r\nFills me with the urge to defecate\r\n\r\nSince, my friend, you have revealed your\r\nDeepest fear\r\nI sentence you to be exposed before\r\nYour peers\r\nTear down the wall', NULL, 1, '2024-04-01 20:10:33', '2024-05-19 11:58:29'),
(85, 13, 'Outside the wall', 'outside the wall', '1:41', 'All alone or in twos, the ones who really love you\r\nWalk up and down outside the wall\r\n\r\nSome hand in hand, some gather together in bands\r\nThe bleeding hearts and the artists make their stand\r\nAnd when they\'ve given you their all\r\nSome stagger and fall, after all it\'s not easy\r\nBanging your heart against some mad bugger\'s wall\r\n\r\nIsn\'t this where-', NULL, 1, '2024-04-01 20:10:38', '2024-05-19 11:58:15'),
(86, 13, 'Another brick in the wall part 3', 'another brick in the wall part 3', '1:15', 'I don\'t need no arms around me\r\nAnd I don\'t need no drugs to calm me\r\nI have seen the writing on the wall\r\nDon\'t think I need anything at all\r\nNo, don\'t think I\'ll need anything at all\r\n\r\nAll in all, it was all just bricks in the wall\r\nAll in all, you were all just bricks in the wall', NULL, 0, '2024-04-01 20:19:30', '2024-04-17 22:57:58'),
(87, 14, 'The post war dream', 'the post war dream', '3:01', 'Announced plans to build a nuclear fallout shelter\r\nAt Peterborough in Cambridge\r\nThree high court judges have cleared the way for-\r\nIt was announced today, that the replacement for the Atlantic Conveyor\r\nThe container ship lost in the falklands conflict would be built in Japan\r\nA spokesman for moving in\r\nThey say the third world countries, like Bolivia\r\nWhich produce the drug are suffering from rising violence...\r\n\r\nTell me true, tell me why, was Jesus crucified?\r\nWas it for this that Daddy died?\r\nWas it you, was it me?\r\nDid I watch too much TV?\r\nIs that a hint of accusation in your eyes?\r\n\r\nIf it wasn\'t for the Nips\r\nBeing so good at building ships\r\nThe yards would still be open on the clyde\r\nAnd that can\'t be much fun for them\r\nBeneath the rising sun\r\nWith all their kids committing suicide\r\n\r\nWhat have we done?\r\nMaggie, what have we done?\r\nWhat have we done to England?\r\n\r\nShould we shout? Should we scream?\r\nWhat happened to the post war dream?\r\nOh Maggie, Maggie, what did we do?', NULL, 0, '2024-04-02 19:48:51', '2024-04-17 22:58:01'),
(88, 14, 'Your possible pasts', 'your possible pasts', '4:26', 'They flutter behind you your possible pasts\r\nSome bright-eyed and crazy, some frightened and lost\r\nA warning to anyone still in command\r\n\"Ranks! Fire\"\r\nOf their possible future to take care\r\nIn derelict sidings, the poppies entwine\r\nWith cattle trucks lying in wait for the next time\r\n\r\nDo you remember me? How we used to be?\r\nDo you think we should be closer? (Closer, closer, closer)\r\n\r\nShe stood in the doorway, the ghost of a smile\r\nHaunting her face like a cheap hotel sign\r\nHer cold eyes imploring the men in their macs\r\nFor the gold in their bags or the knives in their backs\r\nStepping up boldly, one put out his hand\r\nHe said, \"i was just a child then, now I\'m only a man\"\r\n\r\nDo you remember me? How we used to be?\r\nDo you think we should be closer? (Closer, closer, closer)\r\n\r\nBy the cold and religious, we were taken in hand\r\nShown how to feel good and told to feel bad\r\nStrung out behind us, the banners and flags\r\nOf our possible pasts lie in tatters and rags\r\n\r\nDo you remember me? How we used to be?\r\nDo you think we should be closer? (Closer, closer, closer)', NULL, 0, '2024-04-02 19:49:01', '2024-04-17 22:58:06'),
(89, 14, 'One of few', 'one of few', '1:22', 'When you\'re one of the few,\r\nTo land on your feet.\r\nWhat do you do to make ends meet?\r\n(Teach)\r\n\r\nMake \'em mad\r\nMake \'em sad\r\nMake \'em add two and two\r\n\r\nMake \'em me\r\nMake \'em you\r\nMake \'em do what you want them to\r\n\r\nMake \'em laugh\r\nMake \'em cry\r\nMake \'em lay down and die', NULL, 0, '2024-04-02 19:49:07', '2024-04-17 22:58:08'),
(90, 14, 'The hero\'s return', 'the here\'s return', '2:58', 'Jesus, Jesus, what\'s it all about?\r\nTrying to clout these little ingrates into shape\r\nWhen I was their age, all the lights went out\r\nThere was no time to whine and mope about\r\nAnd even now part of me flies over Dresden at angels one five\r\nThough they\'ll never fathom it behind my sarcasm\r\nDesperate memories lie\r\n\r\nSweetheart, sweetheart, are you fast asleep? Good\r\nThat\'s the only time that I can really speak to you\r\nThere is something that I\'ve locked away\r\nA memory that is too painful\r\nTo withstand the light of day\r\n\r\nWhen we came back from the war\r\nThe banners and flags hung on everyone\'s door\r\nWe danced and we sang in the street\r\nAnd the church bells rang\r\nBut burning in my heart\r\nThe memory smolders on\r\nOf the gunner\'s dying words on the intercom', NULL, 0, '2024-04-02 19:49:16', '2024-04-17 22:58:10'),
(91, 14, 'The gunner\'s dream', 'the gunner\'s dream', '5:06', 'Floating down, through the clouds\r\nMemories come rushing up to meet me now\r\nBut in the space between the heavens\r\nAnd the corner of some foreign field\r\nI had a dream\r\nI had a dream\r\n\r\nGoodbye Max, goodbye Ma\r\nAfter the service, when you\'re walking slowly to the car\r\nAnd the silver in her hair shines in the cold November air\r\nYou hear the tolling bell and touch the silk in your lapel\r\nAnd as the teardrops rise to meet the comfort of the band\r\nYou take her frail hand\r\nAnd hold on to the dream\r\n\r\nA place to stay, enough to eat\r\nSomewhere, old heroes shuffle safely down the street\r\nWhere you can speak out loud about your doubts and fears\r\nAnd what\'s more, no one ever disappears\r\nYou never hear their standard issue kicking in your door\r\nYou can relax on both sides of the tracks\r\nAnd maniacs don\'t blow holes in bandsmen by remote control\r\nAnd everyone has recourse to the law\r\nAnd no one kills the children anymore\r\nNo one kills the children anymore\r\n\r\nNight after night, going \'round and \'round my brain\r\nHis dream is driving me insane\r\n\r\nIn the corner of some foreign field\r\nThe gunner sleeps tonight\r\nWhat\'s done is done\r\nWe cannot just write off his final scene\r\nTake heed of the dream\r\nTake heed', NULL, 1, '2024-04-02 19:49:25', '2024-04-17 22:58:15'),
(92, 14, 'Paranoid eyes', 'paranoid eyes', '3:42', 'Button your lip and don\'t let the shield slip\r\nTake a fresh grip on your bullet proof mask\r\nAnd if they try to break down your disguise with their questions\r\nYou can hide, hide, hide behind paranoid eyes\r\n\r\nYou put on our brave face and slip over the road for a jar\r\nFixing your grin as you casually lean on the bar\r\nLaughing too loud at the rest of the world\r\nWith the boys in the crowd\r\nYou can hide, hide, hide\r\nBehind petrified eyes\r\n\r\nYou believed in their stories of fame, fortune and glory\r\nNow you\'re lost in a haze of alcohol soft middle age\r\nThe pie in the sky turned out to be miles too high\r\nAnd you hide, hide, hide\r\n\r\nBehind brown and mild eyes', NULL, 0, '2024-04-02 19:49:36', '2024-04-17 22:58:17'),
(93, 14, 'Get your filthy hands off my desert', 'get your filthy hands off my desert', '1:17', '\"Oi, get your filthy hands off my desert!\"\r\n\"What \'e say?\"\r\n\r\nBrezhnev took Afghanistan.\r\nBegin took Beirut.\r\nGaltieri took the Union Jack.\r\nAnd Maggie, over lunch one day,\r\nTook a cruiser with all hands.\r\nApparently, to make him give it back', NULL, 0, '2024-04-02 19:50:00', '2024-04-17 22:58:23'),
(94, 14, 'The Fletcher memorial home', 'the fletcher memorial home', '4:11', 'Take all your overgrown infants away somewhere\r\nAnd build them a home, a little place of their own.\r\nThe Fletcher Memorial\r\nHome for Incurable Tyrants and Kings.\r\n\r\nAnd they can appear to themselves every day\r\nOn closed circuit T.V.\r\nTo make sure they\'re still real.\r\nIt\'s the only connection they feel.\r\n\"Ladies and gentlemen, please welcome, Reagan and Haig,\r\nMr. Begin and friend, Mrs. Thatcher, and Paisly,\r\n\"Hello Maggie!\"\r\nMr. Brezhnev and party.\r\n\"Who\'s the bald chap?\"\r\nThe ghost of McCarthy,\r\nThe memories of Nixon.\r\n\"Good-bye!\"\r\nAnd now, adding color, a group of anonymous latin-\r\nAmerican Meat packing glitterati.\r\n\r\nDid they expect us to treat them with any respect?\r\nThey can polish their medals and sharpen their\r\nSmiles, and amuse themselves playing games for awhile.\r\nBoom boom, bang bang, lie down you\'re dead.\r\n\r\nSafe in the permanent gaze of a cold glass eye\r\nWith their favorite toys\r\nThey\'ll be good girls and boys\r\nIn the Fletcher Memorial Home for colonial\r\nWasters of life and limb.\r\n\r\nIs everyone in?\r\nAre you having a nice time?\r\nNow the final solution can be applied.', NULL, 0, '2024-04-02 19:50:09', '2024-04-17 22:58:28'),
(95, 14, 'Southampton Dock', 'southampton dock', '2:11', 'They disembarked in 45\r\nAnd no-one spoke and no-one smiled\r\nThere were to many spaces in the line.\r\nGathered at the cenotaph\r\nAll agreed with the hand on heart\r\nTo sheath the sacrificial Knifes.\r\nBut now\r\nShe stands upon Southampton dock\r\nWith her handkerchief\r\nAnd her summer frock clings\r\nTo her wet body in the rain.\r\nIn quiet desperation knuckles\r\nWhite upon the slippery reins\r\nShe bravely waves the boys Goodbye again.\r\n\r\nAnd still the dark stain spreads between\r\nHis shoulder blades.\r\nA mute reminder of the poppy fields and graves.\r\nAnd when the fight was over\r\nWe spent what they had made.\r\nBut in the bottom of our hearts\r\nWe felt the final cut.', NULL, 0, '2024-04-02 19:50:16', '2024-04-17 22:58:33'),
(96, 14, 'The final cut', 'the final cut', '4:46', 'Through the fish-eyed lens of tear stained eyes\r\nI can barely define the shape of this moment in time\r\nAnd far from flying high in clear blue skies\r\nI\'m spiralling down to the hole in the ground where I hide\r\n\r\nIf you negotiate the minefield in the drive\r\nAnd beat the dogs and cheat the cold electronic eyes\r\nAnd if you make it past the shotguns in the hall\r\nDial the combination, open the priest hole\r\nAnd if I\'m in, I\'ll tell you\r\n\r\nThere\'s a kid who had a big hallucination\r\nMaking love to girls in magazines\r\nHe wonders if you\'re sleeping with your new-found faith\r\nCould anybody love him, or is it just a crazy dream?\r\n\r\nAnd if I show you my dark side\r\nWill you still hold me tonight?\r\nAnd if I open my heart to you, show you my weak side\r\nWhat would you do?\r\n\r\nWould you sell your story to Rolling Stone?\r\nWould you take the children away and leave me alone\r\nAnd smile in reassurance, as you whisper down the phone?\r\nWould you send me packing\r\nOr would you take me home?\r\n\r\nThought I oughta bare my naked feelings\r\nThought I oughta tear the curtain down\r\nI held the blade in trembling hands\r\nPrepared to make it, but\r\nJust then the phone rang\r\nI never had the nerve to make the final cut', NULL, 0, '2024-04-02 19:50:24', '2024-04-17 22:58:35'),
(97, 14, 'Not now John', 'not now john', '5:01', 'Fuck all that, we\'ve got to get on with these\r\n(Fuck all that, fuck all that)\r\nGot to compete with the wily Japanese\r\nThere\'s too many home fires burning and not enough trees\r\n(Fuck all that)\r\nSo fuck all that, we\'ve gotta get on with these\r\n(Gotta get on with these)\r\n\r\nCan\'t stop, lose job\r\nMind gone, silicon\r\nStroll on what bomb?\r\nGet away, payday\r\nMake hay, break down\r\nNeed fix, big six\r\nClick, click\r\nHold on, oh no\r\nBingo (bingo)\r\n\r\nMake \'em laugh, make \'em cry\r\nMake \'em dance in the aisles\r\nMake \'em pay, make \'em stay\r\nMake them feel okay\r\n\r\nNot now John, we\'ve got to get on with the film show\r\n(Gotta get on, gotta get on)\r\nHollywood waits at the end of the rainbow\r\n(End of the rainbow)\r\nWho cares what it\'s about as long as the kids go\r\n(As long as the kids go)\r\nSo, not now John, we\'ve gotta get on with the show\r\n(Gotta get on, gotta get on)\r\n\r\nHang on John I\'ve gotta get on with this\r\n(Gotta get on, gotta get on)\r\nDon\'t know what it is, but it fits on here like, sss\r\nCome at the end of the shift, we\'ll go and get pissed\r\nBut not now John, I\'ve gotta get on with this\r\n(Gotta get on with this, gotta get on)\r\n\r\nHold on John, I think there\'s something good on\r\nI used to read books but\r\nCould be the news or some other abuse\r\nCould be reusable shows\r\n\r\nFuck all that, we\'ve gotta get on with these\r\nGota compete with the wily Japanese\r\n(Gotta get on, gotta get on)\r\nNo need to worry about the Vietnapeace\r\nGota bring Russian Bear to his knees\r\n(Gotta get on)\r\nWell, maybe not the Russian Bear, maybe the Swedes\r\nWe showed Argentina, now let\'s go and show these\r\n(Gotta get on, gotta get on)\r\nMake us feel tough and wouldn\'t Maggie be pleased?\r\n\r\nNa, na, na, na, na, na, na\r\n(Na, na, na, na, na, na, na)\r\n(One, two, Free Four)\r\n(One, two, Free Four)\r\n\r\nS\'cusi, dov\'è il bar? (What?) (gotta get on)\r\nSe parakalo, pou einai to bar?\r\nS\'il vous plaît, où est le bar? (Say it in English, fairy)\r\nOi, where\'s the fucking bar John? (Oh, now you\'re talking)\r\n(Rule Britannia, Britannia rules the day) (gotta get on, gotta get on)\r\nDown (gotta get on)\r\nGo, Maggie\r\n(Gotta get on, gotta get on)\r\nHammer, Hammer, Hammer, Hammer, now', NULL, 0, '2024-04-02 19:50:31', '2024-04-17 22:58:37'),
(98, 14, 'Two suns in the sunset', 'two suns in the sunset', '5:19', 'In my rear view mirror the sun is going down\r\nSinking behind bridges in the road\r\nAnd I think of all the good things\r\nThat we have left undone\r\nAnd I suffer premonitions\r\nConfirm suspicions\r\nOf the holocaust to come.\r\n\r\nThe wire that holds the cork\r\nThat keeps the anger in\r\nGives way\r\nAnd suddenly it\'s day again.\r\nThe sun is in the east\r\nEven though the day is done.\r\nTwo suns in the sunset\r\nHmm\r\nCould be the human race is run.\r\n\r\nLike the moment when the brakes lock\r\nAnd you slide towards the big truck\r\n\"Oh no!\"\r\n\"Daddy, Daddy!\"\r\nYou stretch the frozen moments with your fear.\r\nAnd you\'ll never hear their voices\r\nAnd you\'ll never see their faces\r\nYou have no recourse to the law anymore.\r\n\r\nAnd as the windshield melts\r\nMy tears evaporate\r\nLeaving only charcoal to defend.\r\nFinally I understand the feelings of the few.\r\nAshes and diamonds\r\nFoe and friend\r\nWe were all equal in the end.\r\n\r\n\"And now the weather. Tomorrow will be cloudy with scattered showers\r\nSpreading from the east with an expected high of 4000 degrees\r\nCelsius\"', NULL, 0, '2024-04-02 19:50:39', '2024-04-17 22:58:42'),
(99, 15, 'Signs of life', 'signs of life', '4:24', 'When the child like view of the world went, nothing replaced it...nothing replaced it...nothing replaced it...\r\nI do not like being asked to.....I do not like being asked to... I do not like being asked to....\r\n\r\nOther people replaced it\r\nSomeone who knows', NULL, 0, '2024-04-02 20:00:01', '2024-04-17 22:58:45'),
(100, 15, 'Learning to fly', 'learning to fly', '4:52', 'Into the distance, a ribbon of black\r\nStretched to the point of no turning back\r\nA flight of fancy on a wind swept field\r\nStanding alone my senses reeled\r\nA fatal attraction is holding me fast\r\nHow can I escape this irresistible grasp?\r\n\r\nCan\'t keep my eyes from the circling sky\r\nTongue-tied and twisted, just an earth-bound misfit, I\r\n\r\nIce is forming on the tips of my wings\r\nUnheeded warnings, I thought I thought of everything\r\nNo navigator to find my way home\r\nUnladened, empty and turned to stone\r\n\r\nA soul in tension that\'s learning to fly\r\nCondition grounded but determined to try\r\nCan\'t keep my eyes from the circling skies\r\nTongue-tied and twisted, just an earth-bound misfit, I\r\n\r\nFriction lock, set\r\nMixtures, rich\r\nPropellers, fully forward\r\nFlaps, set - 10 degrees\r\nEngine gauges and suction, check\r\n\r\nAbove the planet on a wing and a prayer\r\nMy grubby halo, a vapor trail in the empty air\r\nAcross the clouds I see my shadow fly\r\nOut of the corner of my watering eye\r\nA dream unthreatened by the morning light\r\nCould blow this soul right through the roof of the night\r\n\r\nThere\'s no sensation to compare with this\r\nSuspended animation, a state of bliss\r\nCan\'t keep my mind from the circling sky\r\nTongue-tied and twisted, just an earth-bound misfit, I', NULL, 1, '2024-04-02 20:00:30', '2024-04-17 22:58:48'),
(101, 15, 'Dogs of war', 'dogs of war', '6:06', 'Dogs of war and men of hate\r\nWith no cause, we don\'t discriminate\r\nDiscovery is to be disowned\r\nOur currency is flesh and bone\r\nHell opened up and put on sale\r\nGather \'round and haggle\r\nFor hard cash, we will lie and deceive\r\nEven our masters don\'t know the web we weave\r\n\r\nOne world, it\'s a battleground\r\nOne world, and we will smash it down\r\nOne world, one world\r\n\r\nInvisible transfers, long distance calls,\r\nHollow laughter in marble halls\r\nSteps have been taken, a silent uproar\r\nHas unleashed the dogs of war\r\nYou can\'t stop what has begun\r\nSigned, sealed, they deliver oblivion\r\nWe all have a dark side, to say the least\r\nAnd dealing in death is the nature of the beast\r\n\r\nOne world, it\'s a battleground\r\nOne world, and we will smash it down\r\nOne world, one world\r\n\r\nThe dogs of war don\'t negotiate\r\nThe dogs of war won\'t capitulate,\r\nThey will take and you will give,\r\nAnd you must die so that they may live\r\nYou can knock at any door,\r\nBut wherever you go, you know they\'ve been there before\r\nWell winners can lose and things can get strained\r\nBut whatever you change, you know the dogs remain.\r\n\r\nOne world, it\'s a battleground\r\nOne world, and we will smash it down\r\nOne world, one world', NULL, 1421, '2024-04-02 20:00:37', '2024-07-07 20:27:13');
INSERT INTO `songs` (`id`, `album_id`, `song`, `song_clean`, `duration`, `lyrics`, `lyrics_clean`, `views`, `created_at`, `updated_at`) VALUES
(102, 15, 'One slip', 'one slip', '5:10', 'A restless eye across a weary room\r\nA glazed look and I was on the road to ruin\r\nThe music played and played as we whirled without end\r\nNo hint, no word her honour to defend\r\n\r\n\"I will, I will, \" she sighed to my request\r\nAnd then she tossed her mane while my resolve was put to the test\r\nThen drowned in desire, our souls on fire\r\nI lead the way to the funeral pyre\r\nAnd without a thought of the consequence\r\nI gave in to my decadence\r\n\r\nOne slip and down the hole we fall\r\nIt seems to take no time at all\r\nA momentary lapse of reason\r\nThat binds a life for life\r\nA small regret, you won\'t forget\r\nThere\'ll be no sleep in here tonight\r\n\r\nWas it love, or was it the idea of being in love?\r\nOr was it the hand of fate that seemed to fit just like a glove?\r\nThe moment slipped by and soon the seeds were sown\r\nThe year grew late and neither one wanted to remain alone\r\n\r\nOne slip and down the hole we fall\r\nIt seems to take no time at all\r\nA momentary lapse of reason\r\nThat binds a life to a life\r\nYou won\'t regret, you will never forget\r\nThere\'ll be no sleep in here tonight', NULL, 0, '2024-04-02 20:00:43', '2024-04-17 22:58:52'),
(103, 15, 'On the turning away', 'on the turning away', '5:42', 'On the turning away\r\nFrom the pale and downtrodden\r\nAnd the words they say\r\nWhich we won\'t understand\r\n\r\nDon\'t accept that what\'s happening\r\nIs just a case of others\' suffering\r\nOr you\'ll find that you\'re joining in\r\nThe turning away\r\n\r\nIt\'s a sin that somehow\r\nLight is changing to shadow\r\nAnd casting its shroud\r\nOver all we have known\r\n\r\nUnaware how the ranks have grown\r\nDriven on by a heart of stone\r\nWe could find that we\'re all alone\r\nIn the dream of the proud\r\n\r\nOn the wings of the night\r\nAs the daytime is stirring\r\nWhere the speechless unite in a silent accord\r\n\r\nUsing words, you will find, are strange\r\nMesmerised as they light the flame\r\nFeel the new wind of change\r\nOn the wings of the night\r\n\r\nNo more turning away\r\nFrom the weak and the weary\r\nNo more turning away\r\nFrom the coldness inside\r\n\r\nJust a world that we all must share\r\nIt\'s not enough just to stand and stare\r\nIs it only a dream that there\'ll be\r\nNo more turning away?', NULL, 0, '2024-04-02 20:00:52', '2024-04-17 22:58:57'),
(104, 15, 'Yet another movie / Round and around', 'yet another movie round and around', '7:28', 'One sound, one single sound\r\nOne kiss, one single kiss\r\nA face outside the window pane\r\nHowever did it come to this?\r\n\r\nA man who ran, a child who cried\r\nA girl who heard, a voice that lied\r\nThe sun that burned a fiery red\r\nThe vision of an empty bed\r\n\r\nThe use of force, he was so tough\r\nShe\'ll soon submit, she\'s had enough (had enough)\r\nThe march of fate, the broken will\r\nSomeone is lying very still\r\n\r\nHe has laughed and he has cried\r\nHe has fought and he has died\r\nHe\'s just the same as all the rest\r\nHe\'s not the worst, he\'s not the best\r\n\r\nAnd still this ceaseless murmuring\r\nThe babbling that I brook\r\nThe seas of faces, eyes upraised\r\nThe empty screen, the vacant look\r\n\r\nA man in black on a snow white horse\r\nA pointless life has run its course\r\nThe red rimmed eyes, the tears still run\r\nAs he fades into the setting sun\r\n\r\nYou\'re going on that plane to take you where you belong\r\nBut no, I have\r\nYou have got to listen to me\r\nDo you have any idea what you have to look forward to if you stay here?\r\nNine chances out of ten we both end up in a concentration camp and that\r\nYou\'re only saying these things to make me go\r\nI\'m saying it \'cause it\'s true. Inside us, we both know we belong in different\r\nMaybe not today, maybe not tomorrow, but soon, and for the rest of your life\r\nBut what about us?\r\nBut what about us?\r\nBut what about us?', NULL, 0, '2024-04-02 20:01:19', '2024-04-17 22:59:08'),
(105, 15, 'A new machine, part 1', 'a new machien part 1', '1:47', 'I will always be here\r\nI will always look out from behind these eyes\r\nIt\'s only a lifetime\r\nIt\'s only a lifetime\r\nIt\'s only a lifetime', NULL, 0, '2024-04-02 20:01:27', '2024-04-17 22:59:15'),
(106, 15, 'Terminal frost', 'terminal frost', '6:17', 'Oh, yeah, yeah.\r\n...one thing ...never, ever again.', NULL, 0, '2024-04-02 20:01:34', '2024-04-17 22:59:17'),
(107, 15, 'A new machine, part 2', 'a new machine part 2', '0:39', 'I will always be here\r\nI will always look out from behind these eyes\r\nIt\'s only a lifetime\r\nIt\'s only a lifetime\r\nIt\'s only a lifetime', NULL, 0, '2024-04-02 20:01:41', '2024-04-17 22:59:20'),
(108, 15, 'Sorrow', 'sorrow', '8:47', 'The sweet smell of a great sorrow lies over the land\r\nPlumes of smoke rise and merge into the leaden sky\r\nA man lies and dreams of green fields and rivers\r\nBut awakes to a morning with no reason for waking\r\n\r\nHe\'s haunted by the memory of a lost paradise\r\nIn his youth or a dream, he can\'t be precise\r\nHe\'s chained forever to a world that\'s departed\r\nIt\'s not enough, it\'s not enough\r\n\r\nHis blood has frozen and curdled with fright\r\nHis knees have trembled and given way in the night\r\nHis hand has weakened at the moment of truth\r\nHis step has faltered\r\n\r\nOne world, one soul\r\nTime pass, the river roll\r\n\r\nAnd he talks to the river of lost love and dedication\r\nAnd silent replies that swirl invitation\r\nFlow dark and troubled to an oily sea\r\nA grim intimation of what is to be\r\n\r\nThere\'s an unceasing wind that blows through this night\r\nAnd there\'s dust in my eyes, that blinds my sight\r\nAnd silence that speaks so much louder than words\r\nOf promises broken', NULL, 0, '2024-04-02 20:01:49', '2024-04-17 22:59:22'),
(109, 16, 'Cluster one', 'cluster one', '5:59', NULL, NULL, 0, '2024-04-02 20:10:37', '2024-04-17 22:59:24'),
(110, 16, 'What do you want from me?', 'what do you want from me', '4:22', 'As you look around this room tonight\r\nSettle in your seat and dim the lights\r\nDo you want my blood do you want my tears\r\nWhat do you want?\r\nWhat do you want from me?\r\nShould I sing until I can\'t sing any more\r\nPlay these strings until my fingers are raw\r\nAh ah ah\r\nYou\'re so hard to please\r\nWhat do you want from me?\r\n\r\nDo you think I know something you don\'t know (What do you want from me?)\r\nIf I don\'t promise you the answers would you go (What do you want from me?)\r\nShould I stand out in the rain\r\nDo you want me to make a daisy chain for you\r\nAh ah ah\r\nI\'m not the one you need\r\nWhat do you want from me\r\n\r\nYou can have anything you want\r\nYou can drift, you can dream, even walk on water\r\nAnything you want\r\n\r\nYou can own everything you see\r\nSell your soul for complete control\r\nIs that really what you need?\r\n\r\nYou can lose yourself this night\r\nSee inside there is nothing to hide\r\nTurn and face the light\r\n\r\nAh ah ah, ah ah ah\r\nWhat do you want from me', NULL, 0, '2024-04-02 20:10:49', '2024-04-17 22:59:27'),
(111, 16, 'Poles apart', 'poles apart', '7:05', 'Did you know\r\nIt was all going to go, so wrong for you?\r\nAnd did you see\r\nIt was all going to be so right for me?\r\n\r\nWhy did we tell you then\r\nYou were always the golden boy then?\r\nAnd that you\'d never lose that light in your eyes\r\n\r\nHey you\r\nDid you ever realize what you\'d become?\r\nAnd did you see\r\nThat it wasn\'t only me you were running from?\r\n\r\nDid you know all the time but it\r\nNever bothered you anyway?\r\nLeading the blind while I stared out the steel in your eyes\r\n\r\nThe rain fell slow\r\nDown on all the roofs of uncertainty\r\n\r\nI thought of you\r\nAnd the years and all the sadness\r\nFell away from me\r\nAnd did you know?\r\n\r\nI never thought that you\'d lose that light in your eyes', NULL, 0, '2024-04-02 20:10:56', '2024-04-17 22:59:29'),
(112, 16, 'Marooned', 'marooned', '5:28', 'Out of the world today\r\ninto your light tonight\r\nLet it all slip right through,\r\nlet it all slide.\r\n\r\nWhere would we be without our endorphins\r\nSleeping in corners and street-ends.\r\n\r\nIn a haste and running I forgot to say\r\nthe indifference is grabbing me.\r\n\r\nWhere would we be without our endorphins\r\nSleeping in corners and street-ends.\r\n\r\nTo the rescue, to the rescue\r\nof me and my friends, of me and my friends.\r\n\r\nThe lady in red, she swallows my pride.\r\nThere\'s no chance of victory tonight.\r\n\r\nWhere would we be without our endorphins\r\nSleeping in corners and street-ends.\r\n\r\nTo the rescue, to the rescue\r\nof me and my friends, of me and my friends.\r\n\r\nIt\'s coming \'round, it\'s coming \'round,\r\nit\'s coming \'round to claim its ground.\r\nIt\'s coming \'round, it\'s coming \'round,\r\nyou will see.\r\n\r\nOut of your world today\r\ninto the light tonight.\r\nLet it all slip right through,\r\nlet it all slide.\r\n\r\nOut of your world today\r\ninto the light tonight.\r\nLet it all slip right through,\r\nlet it all slide.\r\n\r\nWhere would we be without our endorphins\r\nSleeping in corners and street-ends.\r\n\r\nTo the rescue, to the rescue\r\nof me and my friends.\r\nTo the rescue, to the rescue\r\nof me and my friends, of me and my friends.', NULL, 0, '2024-04-02 20:11:02', '2024-04-17 22:59:31'),
(113, 16, 'A great day for freedom', 'a great day for freedom', '4:18', 'On the day the wall came down\r\nThey threw the locks onto the ground\r\nAnd with glasses high\r\nWe raised a cry for freedom had arrived\r\n\r\nOn the day the wall came down\r\nThe ship of fools had finally run aground\r\nPromises lit up the night\r\nLike paper doves in flight\r\n\r\nI dreamed you had left my side\r\nNo warmth, not even pride remained\r\nAnd even though you needed me\r\nIt was clear that I could not do a thing for you\r\n\r\nNow life devalues day by day\r\nAs friends and neighbours turn away\r\nAnd there\'s a change that even with regret\r\nCannot be undone\r\n\r\nNow frontiers shift like desert sands\r\nWhile nations wash their bloodied hands\r\nOf loyalty, of history\r\nIn shades of grey\r\n\r\nI woke to the sound of drums\r\nThe music played, the morning sun streamed in\r\nI turned and I looked at you\r\nAnd all but the bitter residues slipped away\r\nSlipped away', NULL, 0, '2024-04-02 20:11:15', '2024-04-17 22:59:35'),
(114, 16, 'Wearing the inside out', 'wearing the inside out', '6:49', 'From morning to night, I stayed out of sight\r\nDidn\'t recognize I\'d become\r\nNo more than alive, I\'d barely survive\r\nIn a word, overrun\r\n\r\nWon\'t hear a sound (he\'s curled into the corner)\r\nFrom my mouth (but still the screen is flickering)\r\nI\'ve spent too long (with an endless stream of garbage)\r\nOn the inside out (curse the place)\r\n\r\nMy skin is cold (in a sea of random images)\r\nTo the human touch (the self-destructing animal)\r\nThis bleeding heart\'s (waiting for the waves)\r\nNot beating much (to break)\r\n\r\nI murmured a vow of silence, and now\r\nI don\'t even hear when I think aloud\r\nExtinguished by light, I turn on the night\r\nWear its darkness with an empty smile\r\n\r\nI\'m creeping back to life\r\nMy nervous system all awry\r\nI\'m wearing the inside out\r\n\r\nLook at him now, he\'s paler somehow\r\nBut he\'s coming around\r\nHe\'s starting to choke, it\'s been so long since he spoke\r\nWell, he can have the words right from my mouth\r\n\r\nAnd with these words, I can see\r\nClear through the clouds that covered me\r\nJust give it time, then speak my name\r\nNow we can hear ourselves again\r\n\r\nI\'m holding out (he\'s standing on the threshold)\r\nFor the day (caught in fiery anger)\r\nWhen all the clouds (and hurled into the furnace)\r\nHave blown away (he\'ll curse the place)\r\n\r\nI\'m with you now (he\'s torn in all directions)\r\nCan speak your name (and still the screen is flickering)\r\nNow we can hear (waiting for the flames)\r\nOurselves again (to break)', NULL, 0, '2024-04-02 20:11:25', '2024-04-17 22:59:38'),
(115, 16, 'Take it back', 'take it back', '6:12', 'Her love rains down on me easy as the breeze\r\nI listen to her breathing, it sounds like the waves on the sea\r\nI was thinking all about her burning with rage and desire\r\nWe were spinning into darkness, the earth was on fire\r\nShe could take it back, she might take it back someday\r\n\r\nSo I spy on her, I lied to her, I made promises I cannot keep\r\nThen I hear her laughter rising, rising from the deep\r\nAnd I make her prove her love for me, I take all that I can take\r\nAnd I push her to the limit to see if she will break\r\nShe might take it back, she could take it back some day\r\n\r\nNow I have seen the warnings, screaming from all sides\r\nIt\'s easy to ignore them, God knows I\'ve tried\r\nAll of this temptation, ya know it turned my faith to lies\r\nUntil I couldn\'t see the danger or hear the rising tide\r\nShe can take it back, she will take it back some day\r\n\r\nShe can take it back, she will take it back some day\r\n\r\nShe will take it back, she will take it back some day', NULL, 0, '2024-04-02 20:11:36', '2024-04-17 22:59:40'),
(116, 16, 'Coming back to life', 'coming back to life', '6:19', 'Where were you when I was burned and broken?\r\nWhile the days slipped by from my window watching\r\nAnd where were you when I was hurt and I was helpless?\r\n\'Cause the things you say and the things you do surround me\r\nWhile you were hanging yourself on someone else\'s words\r\nDying to believe in what you heard\r\nI was staring straight into the shining sun\r\n\r\nLost in thought and lost in time\r\nWhile the seeds of life and the seeds of change were planted\r\nOutside, the rain fell dark and slow\r\nWhile I pondered on this dangerous but irresistible pastime\r\nI took a heavenly ride through our silence\r\nI knew the moment had arrived\r\nFor killing the past and coming back to life\r\n\r\nI took a heavenly ride through our silence\r\nI knew the waiting had begun\r\nAnd headed straight into the shining sun', NULL, 0, '2024-04-02 20:11:44', '2024-04-17 22:59:43'),
(117, 16, 'Keep talking', 'keep talking', '6:11', 'There\'s a silence surrounding me\r\nI can\'t seem to think straight\r\nI sit in the corner\r\nAnd no one can bother me\r\nI think I should speak now (why won\'t you talk to me?)\r\nI can\'t seem to speak now (you never talk to me)\r\nMy words won\'t come out right (what are you thinking?)\r\nI feel like I\'m drowning (what are you feeling?)\r\nI\'m feeling weak now (why won\'t you talk to me?)\r\nBut I can\'t show my weakness (you never talk to me)\r\nI sometimes wonder (what are you thinking?)\r\nWhere do we go from here (what are you feeling?)\r\n\r\nI feel like I\'m drowning\r\n(You never talk to me) you know I can\'t breathe now\r\n(What are you thinking?) We\'re going nowhere\r\n(What are you feeling?) We\'re going nowhere\r\n(Why won\'t you talk to me?)\r\n(You never talk to me)\r\n(What are you thinking?)\r\n(Where do we go from here?)', NULL, 0, '2024-04-02 20:11:52', '2024-04-17 22:59:50'),
(118, 16, 'Lost for words', 'lost for words', '5:15', 'I was spending my time in the doldrums\r\nI was caught in a cauldron of hate\r\nI felt persecuted and paralysed\r\nI thought that everything else would just wait\r\n\r\nWhile you are wasting your time on your enemies\r\nEngulfed in a fever of spite\r\nBeyond your tunnel vision, reality fades\r\nLike shadows into the night\r\n\r\nTo martyr yourself to caution\r\nIs not gonna help at all\r\n\'Cause there\'ll be no safety in numbers\r\nWhen the right one walks out of the door\r\n\r\nCan you see your days blighted by darkness?\r\nIs it true, you beat your fists on the floor?\r\nStuck in a world of isolation\r\nWhile the ivy grows over the door\r\n\r\nSo I open my door to my enemies\r\nAnd I ask could we wipe the slate clean\r\nBut they tell me to please go fuck myself\r\nYou know you just can\'t win', NULL, 0, '2024-04-02 20:11:59', '2024-04-17 22:59:52'),
(119, 16, 'High hopes', 'high hopes', '8:32', 'Beyond the horizon of the place we lived when we were young\r\nIn a world of magnets and miracles\r\nOur thoughts strayed constantly and without boundary\r\nThe ringing of the division bell had begun\r\n\r\nAlong the Long Road and on down the Causeway\r\nDo they still meet there by the Cut\r\n\r\nThere was a ragged band that followed in our footsteps\r\nRunning before times took our dreams away\r\nLeaving the myriad small creatures trying to tie us to the ground\r\nTo a life consumed by slow decay\r\n\r\nThe grass was greener\r\nThe light was brighter\r\nWhen friends surrounded\r\nThe nights of wonder\r\n\r\nLooking beyond the embers of bridges glowing behind us\r\nTo a glimpse of how green it was on the other side\r\nSteps taken forwards but sleepwalking back again\r\nDragged by the force of some inner tide\r\nAt a higher altitude with flag unfurled\r\nWe reached the dizzy heights of that dreamed of world\r\n\r\nEncumbered forever by desire and ambition\r\nThere\'s a hunger still unsatisfied\r\nOur weary eyes still stray to the horizon\r\nThough down this road we\'ve been so many times\r\n\r\nThe grass was greener\r\nThe light was brighter\r\nThe taste was sweeter\r\nThe nights of wonder\r\nWith friends surrounded\r\nThe dawn mist glowing\r\nThe water flowing\r\nThe endless river\r\n\r\nForever and ever', NULL, 0, '2024-04-02 20:12:05', '2024-04-17 22:59:54'),
(120, 17, 'Things left unsaid', 'things left unsaid', '4:26', NULL, NULL, 0, '2024-04-02 20:31:19', '2024-04-17 22:59:57'),
(121, 17, 'It\'s what we do', 'its what we do', '6:17', NULL, NULL, 0, '2024-04-02 20:31:25', '2024-04-17 23:00:00'),
(122, 17, 'Ebb and Flow', 'ebb and flow', '1:52', NULL, NULL, 0, '2024-04-02 20:31:29', '2024-04-17 23:00:04'),
(123, 17, 'Sum', 'sum', '4:49', NULL, NULL, 0, '2024-04-02 20:31:37', '2024-04-17 23:00:05'),
(124, 17, 'Skins', 'skins', '2:37', NULL, NULL, 0, '2024-04-02 20:31:44', '2024-04-17 23:00:06'),
(125, 17, 'Unsung', 'unsung', '1:07', NULL, NULL, 0, '2024-04-02 20:31:50', '2024-04-17 23:00:08'),
(126, 17, 'Anisina', 'anisina', '3:15', NULL, NULL, 0, '2024-04-02 20:31:56', '2024-04-17 23:00:10'),
(127, 17, 'The lost art of conversation', 'the lost art of conversation', '1:43', NULL, NULL, 0, '2024-04-02 20:32:04', '2024-04-17 23:00:14'),
(128, 17, 'On noodle street', 'on noodle street', '1:42', NULL, NULL, 0, '2024-04-02 20:32:14', '2024-04-17 23:00:17'),
(129, 17, 'Night light', 'night light', '1:42', NULL, NULL, 0, '2024-04-02 20:32:24', '2024-04-17 23:00:19'),
(130, 17, 'Allons-y (1)', 'allons-y 1', '1:57', NULL, NULL, 0, '2024-04-02 20:32:29', '2024-04-17 23:00:35'),
(131, 17, 'Autumn \'68', 'autumn 68', '1:35', NULL, NULL, 0, '2024-04-02 20:32:35', '2024-04-17 23:00:29'),
(132, 17, 'Allons-y (2)', 'allons-y 2', '1:35', NULL, NULL, 0, '2024-04-02 20:32:40', '2024-04-17 23:00:34'),
(133, 17, 'Talkin\' Hawkin\'', 'talkin hawkin', '3:26', NULL, NULL, 0, '2024-04-02 20:33:12', '2024-04-17 23:00:39'),
(134, 17, 'Calling', 'callling', '3:38', NULL, NULL, 0, '2024-04-02 20:39:22', '2024-04-17 23:00:41'),
(135, 17, 'Eyes to pearls', 'eyes to pearls', '1:51', NULL, NULL, 0, '2024-04-02 20:39:26', '2024-04-17 23:00:44'),
(136, 17, 'Surfacing', 'surfacing', '2:46', NULL, NULL, 0, '2024-04-02 20:39:30', '2024-04-17 23:00:46'),
(137, 17, 'Louder than words', 'louder than words', '6:33', NULL, NULL, 0, '2024-04-02 20:39:37', '2024-04-17 23:00:51'),
(138, 18, 'Civil war', 'civil war', '7:41', 'What we\'ve got here is failure to\r\ncommunicate.\r\nSome men you just can\'t reach...\r\nSo, you get what we had here last week,\r\nwhich is the way he wants it!\r\nWell, he gets it!\r\nN\' I don\'t like it any more than you men.\" *\r\n\r\nLook at your young men fighting\r\nLook at your women crying\r\nLook at your young men dying\r\nThe way they\'ve always done before\r\n\r\nLook at the hate we\'re breeding\r\nLook at the fear we\'re feeding\r\nLook at the lives we\'re leading\r\nThe way we\'ve always done before\r\n\r\nMy hands are tied\r\nThe billions shift from side to side\r\nAnd the wars go on with brainwashed pride\r\nFor the love of God and our human rights\r\nAnd all these things are swept aside\r\nBy bloody hands time can\'t deny\r\nAnd are washed away by your genocide\r\nAnd history hides the lies of our civil wars\r\n\r\nD\'you wear a black armband\r\nWhen they shot the man\r\nWho said \"Peace could last forever\"\r\nAnd in my first memories\r\nThey shot Kennedy\r\nI went numb when I learned to see\r\nSo I never fell for Vietnam\r\nWe got the wall of D.C. to remind us all\r\nThat you can\'t trust freedom\r\nWhen it\'s not in your hands\r\nWhen everybody\'s fightin\'\r\nFor their promised land\r\n\r\nAnd, I don\'t need your civil war\r\nIt feeds the rich while it buries the poor\r\nYour power hungry sellin\' soldiers\r\nIn a human grocery store\r\nAin\'t that fresh\r\nI don\'t need your civil war\r\n\r\nLook at the shoes your filling\r\nLook at the blood we\'re spilling\r\nLook at the world we\'re killing\r\nThe way we\'ve always done before\r\nLook in the doubt we\'ve wallowed\r\nLook at the leaders we\'ve followed\r\nLook at the lies we\'ve swallowed\r\nAnd I don\'t want to hear no more\r\n\r\nMy hands are tied\r\nFor all I\'ve seen has changed my mind\r\nBut still the wars go on as the years go by\r\nWith no love of God or human rights\r\n\'Cause all these dreams are swept aside\r\nBy bloody hands of the hypnotized\r\nWho carry the cross of homicide\r\nAnd history bears the scars of our civil wars\r\n\r\n\"We practice selective annihilation of mayors and government\r\nofficials\r\nfor example to create a vacuum\r\nthen we fill that vacuum\r\nas popular war advances\r\npeace is closer\" **\r\n\r\nI don\'t need your civil war\r\nIt feeds the rich while it buries the poor\r\nYour power hungry sellin\' soldiers\r\nIn a human grocery store\r\nAin\'t that fresh\r\nAnd I don\'t need your civil war\r\nI don\'t need your civil war\r\nI don\'t need your civil war\r\nYour power hungry sellin\' soldiers\r\nIn a human grocery store\r\nAin\'t that fresh\r\nI don\'t need your civil war\r\nI don\'t need one more war\r\n\r\nI don\'t need one more war\r\nWhaz so civil \'bout war anyway\r\n\r\n*Strother Martin-from the film Cool Hand Luke\r\n**Peruvian Guerilla General', NULL, 6, '2024-04-02 21:00:25', '2024-04-17 23:00:53'),
(139, 18, '14 years', '14 years', '4:21', 'I try and feel the sunshine\r\nYou bring the rain\r\nYou try and hold me down\r\nWith your complaints\r\nYou cry and moan and complain\r\nYou whine an tear\r\nUp to my neck in sorrow\r\nThe touch you bring\r\nYou just don\'t step inside to\r\n14 years\r\nSo hard to keep my own head...\r\nThat\'s what I say\r\nYou know...I\'ve been the beggar...\r\nI\'ve played the thief\r\nI was the dog...they all tried to beat\r\n\r\nBut it\'s been\r\n14 years of silence\r\nIt\'s been\r\n14 years of pain\r\nIt\'s been\r\n14 years that are gone forever\r\nAnd I\'ll never have again\r\n\r\nYour stupid girlfriends tell you\r\nThat I\'m to blame\r\nWell they\'re all used-up has-beens\r\nOut of the game\r\nThis time I\'ll have the last word\r\nYou hear what I say\r\nI tried to see it your way\r\nIt won\'t work today\r\nYou just don\'t step inside to\r\n14 years\r\nSo hard to keep my own head...\r\nThat\'s what I say\r\nYou know...I\'ve been the dealer...\r\nHangin\' on your street\r\nI was the dog...they all tried to beat\r\n\r\nBut it\'s been\r\n14 years of silence\r\nIt\'s been\r\n14 years of pain\r\nIt\'s been\r\n14 years that are gone forever\r\nAnd I\'ll never have again\r\n\r\nBullshit and contemplation\r\nGossip\'s their trade\r\nIf they knew half the real truth\r\nWhat would they say\r\nWell I\'m past the point of concern\r\nIt\'s time to play\r\nThese last 4 years of madness\r\nSure put me straight\r\nDon\'t get back 14 years\r\nIn just one day\r\nSo hard to keep my own head\r\nJust go away\r\nYou know...just like a hooker she said\r\nNothin\'s for free\r\nOh I tried to see it your way\r\nI tried to see it your way', NULL, 0, '2024-04-02 21:00:32', '2024-04-17 23:00:55'),
(140, 18, 'Yesterdays', 'yesterdays', '3:16', 'Yesterday, There was so many things\r\nI was never told\r\nNow that I\'m startin\' to learn\r\nI feel I\'m growing old\r\n\r\n\'Cause yesterday\'s got nothin\' for me\r\nOld pictures that I\'ll always see\r\nSome things could be better\r\nIn my book of memories\r\nPrayers in my pocket\r\nAnd no hand in destiny\r\nI\'ll keep on movin\' along\r\nWith no time to plant my feet\r\n\r\n\'Cause yesterday\'s got nothin\' for me\r\nOld pictures that I\'ll always see\r\nSome things could be better\r\nIf we\'d all just let them be\r\n\r\nYesterday\'s got nothin\' for me\r\nYesterday\'s got nothin\' for me\r\nGot nothin\' for me\r\n\r\nYesterday, There was so many things\r\nI was never shown\r\nSuddenly this time I found\r\nI\'m on the streets and I\'m all alone\r\n\r\nYesterday\'s got nothin\' for me\r\nOld pictures that I\'ll always see\r\nI ain\'t got time to reminisce old novelties\r\n\r\nYesterday\'s got nothin\' for me\r\nYesterday\'s got nothin\' for me\r\nYesterday\'s got nothin\' for me\r\nYesterday\r\n\r\nYesterday', NULL, 0, '2024-04-02 21:00:37', '2024-04-17 23:00:58'),
(141, 18, 'Knockin\' on Heaven\'s door', 'knockin on heavens door', '5:36', 'Mama take this badge from me\r\nI can\'t use it anymore\r\nIt\'s getting dark too dark to see\r\nFeels like I\'m knockin\' on heaven\'s door\r\n\r\nKnock-knock-knockin\' on heaven\'s door\r\nKnock-knock-knockin\' on heaven\'s door\r\nKnock-knock-knockin\' on heaven\'s door\r\nKnock-knock-knockin\' on heaven\'s door\r\n\r\nMama put my guns in the ground\r\nI can\'t shoot them anymore\r\nThat cold black cloud is comin\' down\r\nFeels like I\'m knockin\' on heaven\'s door\r\n\r\nKnock-knock-knockin\' on heaven\'s door\r\nKnock-knock-knockin\' on heaven\'s door\r\nKnock-knock-knockin\' on heaven\'s door\r\nKnock-knock-knockin\' on heaven\'s door\r\n\r\n\"You just better start sniffin\' your own rank subjugation\r\nJack \'cause it\'s just you and your tattered libido, the\r\nbank and the mortician, forever man and it wouldn\'t be luck\r\nif you get out of life alive\"\r\n\r\nKnock-knock-knockin\' on heaven\'s door', NULL, 0, '2024-04-02 21:00:50', '2024-04-17 23:01:04'),
(142, 18, 'Get in the ring', 'get in the ring', '5:41', 'Why do you look at me when you hate me\r\nWhy should I look at you when you make me hate you to\r\nI sense a smell of retribution in the air\r\nI don\'t even understand why the fuck you even care\r\nAnd I don\'t need your jealousy yeah\r\nWhy drag me down in your misery\r\nAnd when you stare don\'t you think I feel it\r\nBut I\'m gonna deal it back to you in spades\r\nWhen I\'m havin\' fun ya know I can\'t conceal it\r\n\'Cause I know you\'d never cut it in my game- Oh no\r\nAnd when you\'re talkin\' about a vasectomy- Yeah\r\nI\'ll be writin\' down your obituary-\r\nHistory\r\n\r\nYou got your bitches with\r\nthe silicone injections\r\nCrystal meth and yeast infections\r\nBleached blond hair,\r\nCollagen lip projections\r\nWho are you to criticize my intentions\r\nGot your subtle manipulative devices\r\nJust like you I got my vices\r\nI got a thought that would be nice\r\nI\'d like to crush your head tight in my vice- PAIN!!\r\n\r\nAnd that goes for all you punks in the press\r\nThat want to start shit by printin\' lies instead of the\r\nthings we said\r\nThat means you\r\nAndy Secher at Hit Parader\r\nCircus Magazine\r\nMick Wall at Kerrang\r\nBob Guccione Jr. at Spin,\r\nWhat you pissed off cuz your dad gets more pussy than you?\r\nFuck you\r\nSuck my fuckin\' dick\r\n\r\nYou be rippin\' off the fuckin\' kids\r\nWhile they be payin\' their hard earned money to read about\r\nthe bands\r\nThey want to know about\r\nPrintin\' lies startin\' controversy\r\nYou wanta antagonize me\r\nAntagonize me motherfucker\r\nGet in the ring motherfucker\r\nAnd I\'ll kick your bitchy little ass\r\nPunk\r\n\r\nI don\'t like you, I just hate you\r\nI gonna kick your ass,\r\nOh yeah! Ohyeah!\r\n\r\nYou may not like our integrity yeah\r\nWe built a world out of anarchy\r\nOh yeah!\r\n\r\nAND IN THIS CORNER WEIGHING IN AT 850 POUNDS- GUNS N\' ROSES\r\n\r\nGet in the ring\r\nYeah\r\n\r\nYeah this song is dedicated to\r\nAll the Guns n\'fuckin\' Roses fans\r\nWho stuck with us through all the Fucking shit\r\nAnd to all those opposed...\r\nHmm...well', NULL, 0, '2024-04-02 21:00:58', '2024-04-17 23:01:08'),
(143, 18, 'Shotgun blues', 'shotgun blues', '3:23', 'I got the shotgun blues\r\nShotgun blues\r\nI said I don\'t know what I did\r\nBut I know I gotta move\r\nI got the shotgun blues\r\nShotgun blues\r\nI can\'t wait here forever\r\nI got too much here to lose\r\n\r\nAn now you\'re blowin\' smoke\r\nI think you\'re one big joke\r\nMe...I gotta lot to learn\r\nAn I\'m still waitin\' for the heads to turn\r\nYou say I walk a line\r\nFuck they move it every time\r\nYou walk a mile in my shoes\r\nAnd then you tell me \'bout singin\' the blues\r\nYou get what you pay for\r\nAn freedom\'s real high priced\r\nAn while your rippin\' off children\r\nSomebody\'s fuckin\' your wife\r\nIt\'s never made a difference\r\nIt\'s only how you survive\r\n\r\nI got the shotgun blues\r\nShotgun blues\r\nI said I don\'t know what I did\r\nBut I know I gotta move\r\nI got the shotgun blues\r\nShotgun blues\r\nI can\'t wait here forever\r\nI got too much here to lose\r\nAn now you ask me why\r\nI said it\'s do or die\r\nI\'ll stick it right in your face\r\nAnd then I\'ll put you in your motherfuckin\' place\r\nAnd you...you can suck my ass\r\nAn I think it\'s so low class\r\nMe...I\'m just so concerned\r\nI\'m still waitin\' for your ass to burn\r\nOoooh you want a confrontation\r\nI\'ll give you every fuckin\' chance\r\nWith your verbal masturbation\r\nMe...I just like to dance\r\nHow\'s that for provocation\r\nI\'m just makin\' a stance\r\nAn I\'m tired of the frustration\r\nOf livin\' inside of your lies\r\nAnd I\'m wired on indignation\r\nI said somebody\'s got to die\r\n\r\nI got the shotgun blues\r\nShotgun blues\r\nI said I don\'t know what I did\r\nBut I know I gotta move\r\nI got the shotgun blues\r\nShotgun blues\r\nI can\'t stay here forever\r\nI got too much here to lose\r\nI got the shotgun blues\r\nShotgun blues\r\nListen motherfucker\r\nYou\'re about to pay your dues\r\nI got the shotgun blues\r\nShotgun blues\r\nIf you\'re goin\' up against me\r\nThen you know you\'re gonna lose\r\nI know\r\nI know (there\'s ways- that we- can find)\r\nI know\r\nI know\r\n\r\nYou think anyone with an I.Q. over 15\r\nWould believe your shit...fuckhead\r\nNothin\' but a fuckin\' pussy', NULL, 0, '2024-04-02 21:01:08', '2024-04-17 23:01:10'),
(144, 18, 'Breakdown', 'breakdown', '7:04', 'We all come in from the cold\r\nWe come down from the wire\r\nAn everybody warms themselves\r\nto a different fire\r\nWhen sometimes we get burned\r\nYou\'d think sometime we\'d learn\r\nThe one you love is the one\r\nThat should take you higher\r\nYou ain\'t got no one\r\nYou better go back out and find her\r\n\r\nJust like children hidin\' in a closet\r\nCan\'t tell what\'s goin\' on outside\r\nSometimes we\'re so far off the beaten track\r\nWe\'ll get taken for a ride\r\nBy a parlor trick or some words of wit\r\nA hidden hand up a sleeve\r\nTo think the one you love\r\ncould hurt you now\r\nIs a little hard to believe\r\nBut everybody darlin\' sometimes\r\nBites the hand that feeds\r\n\r\nWhen I look around\r\nEverybody always brings me down\r\nWell is it them or me\r\nWell I just can\'t see\r\nBut there ain\'t no peace to found\r\nBut if someone really cared\r\nWell they\'d take the time to spare\r\nA moment to try and understand\r\nAnother one\'s despair\r\nRemember in this game we call life\r\nThat no one said it\'s fair\r\n\r\nBreakdown\r\nLet me hear it now\r\nBreakdown\r\nlet me hear it now\r\nYeah\r\nBreakdown\r\nLet me hear it now\r\nBreakdown\r\nlet me hear it now\r\nGet down with yo\' bad self\r\nAlright\r\n\r\nI\'ve come to know the cold\r\nI think of it as home\r\nWhen there ain\'t enough of me\r\nTo go around\r\nI\'d rather be left alone\r\nBut if I call you out of habit\r\nI\'m out of love and I gotta have it\r\nWould you give it to me\r\nIf I fit you needs\r\nLike when we both knew we had it\r\nBut now the damage\'s done\r\nAnd we\'re back out on the run\r\nFun how ev\'rything was Roses\r\nWhen we held on to the Guns\r\nJust because you\'re winnin\'\r\nDon\'t mean you\'re the lucky ones\r\n\r\nBreakdown\r\nLet me hear it now\r\nBreakdown\r\nYeah\r\nBreakdown\r\nBreakdown\r\nlet me hear it now\r\n\r\n\"There goes the challenger being chased\r\nBy the blue blue meanies on wheels\r\nThe vicious traffic squad cars are\r\nAfter our lone driver\r\nThe last American hero\r\nThe-the electric sintar\r\nThe demi-god,\r\nThe super driver of the golden west!\r\nTwo nasty Nazi cars are close behind\r\nThe beautiful lone driver\r\nThe police cars are getting closer-closer...\r\nCloser to our soul hero in his soul mobile- Yeah baby!\r\nThey about to strike, They gonna get him, Smash! Rape!\r\nThe last beautiful free soul on this planet\r\n\r\nBut...it is writen if the Evil Spirit\r\nArms the Tiger with claws\r\nBrahman provided wings for the Dove\r\nThus spake the Super Guru\" *\r\n\"Did you hear that\"', NULL, 0, '2024-04-02 21:01:15', '2024-04-17 23:01:12'),
(145, 18, 'Pretty tied up', 'pretty tied up', '4:48', 'I know this chick she lives down on Melrose\r\nShe ain\'t satisfied without some pain\r\nFriday night is goin\' up inside her...again\r\nWell crack the whip\r\n\'Cause that bitch is just insane\r\nI\'m serious\r\n\r\nShe\'s pretty tied up\r\nHangin\' upside down\r\nShe\'s pretty tied up\r\nAn you can ride her\r\nShe\'s pretty tied up\r\nHangin\' upside down\r\nI can\'t tell you she\'s the right one\r\nOh no,oh no,oh no\r\nOnce there was this rock n\' roll band rollin\' on the streets\r\nTime went by and it became a joke\r\nWe just needed more and more fulfilling- Uh-huh\r\nTime went by and it all went up in smoke\r\nBut check it out\r\n\r\nShe\'s pretty tied up\r\nHangin\' upside down\r\nShe\'s pretty tied up\r\nAn you can ride her\r\nShe\'s pretty tied up\r\nHangin\' upside down\r\nOhh I can\'t tell you she\'s the\r\nright one\r\nOh no,oh no,oh no\r\nOnce you made that money it costs more now\r\nIt might cost a lot more than you\'d think\r\nI just found a million dollars\r\nThat someone forgot\r\nIt\'s days like this that push me o\'er the brinks\r\nCool and stressing\r\n(pronounced:Kool ranch dres\'ing)\r\n\r\nShe\'s pretty tied up\r\nHangin\' upside down\r\nShe\'s pretty tied up\r\nAn you can ride her\r\nShe\'s pretty tied up\r\nHangin\' upside down\r\nAnd I can\'t tell you she\'s the\r\nright one\r\nOh she\'s the right one...(etc.)\r\n\r\n(But I can tell you a thing or two\r\n\'Bout somethin\' else\r\nIf you really wanna know-Know what\r\nI\'m sayin\')', NULL, 0, '2024-04-02 21:01:24', '2024-04-17 23:01:16'),
(146, 18, 'Locomotive', 'locomotiev', '8:42', 'Gonna find a way to cure this loneliness\r\nYeah I\'ll find a way to cure the pain\r\nIf I said that you\'re my friend\r\nAnd our love would never end\r\nHow long before I had your trust again\r\nI opened up the doors when it was cold outside\r\nHopin\' that you\'d find your own way in\r\nBut how can I protect you\r\nOr try not to neglect you\r\nWhen you won\'t take the love I have to give\r\nI bought me an illusion\r\nAn I put it on the wall\r\nI let it fill my head with dreams\r\nAnd I had to have them all\r\nBut oh the taste is never so sweet\r\nAs what you\'d believe it is-\r\nWell I guess it never is\r\nIt\'s these prejudiced illusions\r\nThat pump the blood\r\nTo the heart of the biz\r\n\r\nYou know I never thought\r\nThat it could take so long\r\nYou know I never knew how to be strong\r\nYeah, I let you shape me\r\nBut I feel as though you raped me\r\n\'Cause you climbed inside my world\r\nAnd in my songs\r\nSo now I\'ve closed the door\r\nTo keep the cold outside\r\nSeems somehow I\'ve found the will to live\r\nBut how can I forget you\r\nOr try not to reject you\r\nWhen we both know it takes time to forgive\r\n\r\nSweetness is a virtue\r\nAnd you lost your virtue long ago\r\nYou know I\'d like to hurt you\r\nBut my conscience always tells me no\r\nYou could sell your body on the street\r\nTo anyone whom you might meet\r\nWho\'d love to try and get inside\r\nAnd bust your innocence open wide\r\n\r\n\'Cause my baby\'s got a locomotive\r\nMy baby\'s gone off the track\r\nMy baby\'s got a locomotive\r\nGot ta peel the bitch off my back\r\nI know it looks like I\'m insane\r\nTake a closer look I\'m not to blame\r\nNo\r\n\r\nGonna have some fun with my frustration\r\nGonna watch the big screen in my head\r\nI\'d rather take a detour\r\n\'Cause this road ain\'t gettin\' clearer\r\nYour train of thought has cut me off again\r\nBetter tame that boy \'cause he\'s a wild one\r\nBetter tame that boy for he\'s a man\r\nSweetheart don\'t make me laugh\r\nYou\'s gettin\' too big for your pants\r\nAnd I\'s think maybe you should\r\nCut out while you can\r\nYou can use you illusion-\r\nLet it take you where it may\r\nWe live and learn\r\nAnd then sometimes it\'s best to walk away\r\nMe I\'m just here hangin\' on\r\nIt\'s my only place to stay at least\r\nFor now anyway\r\nI\'ve worked too hard for my illusions\r\nJust to throw them all away\r\n\r\nI\'m taking time for quiet consolation\r\nIn passing by this love that\'s passed away\r\nI know it\'s never easy-\r\nSo why should you believe me\r\nWhen I\'ve always got so many things to say\r\nCalling off the dogs a simple choice is made\r\n\'Cause playful hearts\r\nCan sometimes be enraged\r\nYou know I tried to wake you-\r\nI mean how long could it take you\r\nTo open up your eyes and turn the page\r\n\r\nKindness is a treasure-\r\nAnd it\'s one towards me you\'ve seldom shown\r\nSo I\'ll say it for good measure\r\nTo all the ones like you I\'ve known\r\nYa know I\'d like to shave your head\r\nAnd all my friends could\r\npaint it red\r\n\'Cause love to me\'s a two way street\r\nAn all I really want is peace\r\n\r\nBut my baby\'s got a locomotive\r\nMy baby\'s gone off the track\r\nMy baby\'s got a locomotive\r\nGot ta peel the bitch off my back\r\nI know it looks like I\'m insane\r\nTake a closer look I\'m not to blame\r\nNo\r\n\r\nAffection is a blessing\r\nCan you find it in your sordid heart\r\nI tried to keep this thing\r\nta-gether\r\nBut the tremor tore my pad apart\r\nYeah I know it\'s hard to face\r\nWhen all we\'ve worked for\'s gone to waste\r\nBut you\'re such a stupid woman\r\nAnd I\'m such a stupid man\r\nBut love like time\'s got its own plans\r\n\r\n\'Cause my baby\'s got a locomotive\r\nMy baby\'s gone off the track\r\nMy baby\'s got a locomotive\r\nGot ta peel the bitch off my back\r\nI know it looks like I\'m insane\r\nTake a closer look I\'m not to blame\r\nYeah\r\nIf love is blind I guess\r\nI\'ll buy myself a cane\r\n\r\nLove\'s so strange', NULL, 0, '2024-04-02 21:01:32', '2024-04-17 23:01:18'),
(147, 18, 'So fine', 'so fine', '4:06', 'How could she look so fine\r\nHow could it be she might be mine\r\nHow could she be so cool\r\nI\'ve been taken for a fool\r\nSo many times\r\nIt\'s a story of a man\r\nWho works as hard as he can\r\nJust to be a man\r\nwho stands on his own\r\nBut the book always burns\r\nAs the story takes it turn\r\nAn leaves a broken man\r\nHow could she be so cool\r\nHow could she be so fine\r\nI owe a favor to a friend\r\nMy friends they always come through for me- Yeah\r\nIt\'s a story of a man\r\nWho works as hard as he can\r\nJust to be a man\r\nwho stands on his own\r\nBut the book always burns\r\nAs the story takes it turn\r\nAn leaves a broken man\r\nIf you could only live my life\r\nYou could see the difference you make to me- To me\r\nI\'d look right up at night\r\nAnd all I\'d see was darkness\r\nNow I see the stars alright\r\nI wanna reach right up and grab one for you\r\nWhen the lights went down in your house\r\nYeah that made me happy\r\nThe sweat I make for you\r\nYeah...I think you know where that comes from\r\n\r\nWell I\'d look right up at night\r\nAnd all I\'d see was darkness\r\nNow I see the stars alright\r\nI wanna reach right up and grab one for you\r\nWhen the lights went down in your house\r\nYeah that made me happy\r\nThe sweat I make for you\r\nI think you know where that comes from\r\n\r\nHow could she look so good(So good)\r\nHow could she be so fine\r\nHow could she be so cool\r\nHow could it be she might be mine', NULL, 0, '2024-04-02 21:01:38', '2024-04-17 23:01:21'),
(148, 18, 'Estranged', 'estranged', '9:24', 'When you\'re talkin to yourself\r\nAnd nobody\'s home\r\nYou can fool yourself\r\nYou came in this world alone\r\n(Alone)\r\n\r\nSo nobody ever told you baby\r\nHow it was gonna be\r\nSo what\'ll happen to you baby\r\nGuess we\'ll have to wait and see\r\nOne, two\r\n\r\nOld at heart but I\'m only 28\r\nAnd I\'m much too young\r\nTo let love break my heart\r\nYoung at heart but it\'s getting much too late\r\nTo find ourselves so far apart\r\n\r\nI don\'t know how you\'re s\'posed\r\nTo find me lately\r\nAn what more could tou ask from me\r\nHow could you say that I never needed you\r\nWhen you took everything\r\nSaid you took everything from me\r\n\r\nYoung at heart an it gets so hard to wait\r\nWhen no one I know can seem to help me now\r\nOld at heart but I musn\'t hesitate\r\nIf I\'m to find my own way out\r\n\r\nStill talkin\' to myself\r\nand nobody\'s home\r\n(Alone)\r\n\r\nSo nobody ever told us baby\r\nHow it was gonna be\r\nSo what\'ll happen to us baby\r\nGuess we\'ll have to wait and see\r\n\r\nWhen I find out all the reasons\r\nMaybe I\'ll find another way\r\nFind another day\r\nWith all the changing seasons of my life\r\nMaybe I\'ll get it right next time\r\nAn now that you\'ve been broken down\r\nGot your head out of the clouds\r\nYou\'re back down on the ground\r\nAnd you don\'t talk so loud\r\nAn you don\'t walk so proud\r\nAny more, and what for\r\n\r\nWell I jumped into the river\r\nToo many times to make it home\r\nI\'m out here on my own, an drifting all alone\r\nIf it doesn\'t show give it time\r\nTo read between the lines\r\n\'Cause I see the storm getting closer\r\nAnd the waves they get so high\r\nSeems everything We\'ve ever known\'s here\r\nWhy must it drift away and die\r\n\r\nI\'ll never find anyone to replace you\r\nGuess I\'ll have to make it thru, this time- Oh this time\r\nWithout you\r\n\r\nI knew the storm was getting closer\r\nAnd all my friends said I was high\r\nBut everything we\'ve ever known\'s here\r\nI never wanted it to die', NULL, 0, '2024-04-02 21:01:44', '2024-04-17 23:01:23'),
(149, 18, 'You could be mine', 'you could be mine', '5:44', 'I\'m a cold heartbreaker\r\nFit ta burn and I\'ll rip\r\nyour heart in two\r\nAn I\'ll leave you lyin\' on the bed\r\nI\'ll be out the door before ya wake\r\nIt\'s nuthin\' new ta you\r\n\'Cause I think we\'ve seen that movie too\r\n\r\n\'Cause you could be mine\r\nBut you\'re way out of line\r\nWith your bitch slap rappin\'\r\nAnd your cocaine tongue\r\nYou get nuthin\' done\r\nI said you could be mine\r\n\r\nNow holidays come and then they go\r\nIt\'s nothin\' new today\r\nCollect another memory\r\nWhen I come home late at night\r\nDon\'t ask me where I\'ve been\r\nJust count your stars\r\nI\'m home again\r\n\r\n\'Cause you could be mine\r\nBut you\'re way out of line\r\nWith your bitch slap rappin\'\r\nAnd your cocaine tongue\r\nYou get nuthin\' done\r\nI said you could be mine\r\n\r\nYou\'ve gone sketchin\' too many times\r\nWhy don\'t ya give it a rest\r\nWhy\r\nMust you find\r\nAnother reason to cry\r\n\r\nWhile you\'re breakin\' down my back n\' I been rackin\' out my\r\nbrain\r\nIt don\'t matter how we make it\r\n\'Cause it always ends the same\r\nYou can push it for more mileage\r\nBut your flaps r\' wearin\' thin\r\nAnd I could sleep on it \'til mornin\'\r\nBut this nightmare never ends\r\nDon\'t forget to call my lawyers\r\nWith ridiculous demands\r\nAn you can take the pity so far\r\nBut it\'s more than I can stand\r\n\'Cause this couchtrip\'s gettin\' older\r\nTell me how long has it been\r\n\'Cause 5 years is forever\r\nAn you haven\'t grown up yet\r\n\r\nYou could be mine\r\nBut you\'re way out of line\r\nWith your bitch slap rappin\'\r\nAnd your cocaine tongue\r\nYou get nuthin\' done\r\nI said you could be mine\r\nYou should be\r\nYou could be mine\r\n\r\nYeah!', NULL, 0, '2024-04-02 21:01:52', '2024-04-17 23:01:26'),
(150, 18, 'Don\'t cry (alternate lyrics)', 'dont cry alternate lyrics', '4:44', 'If we could see tomorrow\r\nWhat of your plans\r\nNo one can live in sorrow\r\nAsk all your friends\r\nTimes that you took in stride\r\nThey\'re back in demand\r\nI was the one who\'s washing\r\nBlood off your hands\r\n\r\nDon\'t you cry tonight\r\nI still love you baby\r\nDon\'t you cry tonight\r\nDon\'t you cry tonight\r\nThere\'s a heaven above you baby\r\nAnd don\'t you cry tonight\r\n\r\nI know the things you wanted\r\nThey\'re not what you have\r\nWith all the people talkin\'\r\nIt\'s drivin\' you mad\r\nIf I was standin\' by you\r\nHow would you feel\r\nKnowing your love\'s decided\r\nAnd all love is real\r\n\r\nAn don\'t you cry tonight\r\nDon\'t you cry tonight\r\nDon\'t you cry tonight\r\nThere\'s a heaven above you baby\r\nAnd don\'t you cry tonight\r\n\r\nI thought I could live in your world\r\nAs years all went by\r\nWith all the voices I\'ve heard\r\nSomething has died\r\nAnd when you\'re in need of someone\r\nMy heart won\'t deny you\r\nSo many seem so lonely\r\nWith no one left to cry to baby\r\n\r\nAn don\'t you cry tonight\r\nAn don\'t you cry tonight\r\nAn don\'t you cry tonight\r\nThere\'s a heaven above you baby\r\nAnd don\'t you cry\r\nDon\'t you ever cry\r\nDon\'t you cry tonight\r\nBaby maybe someday\r\nDon\'t you cry\r\nDon\'t you ever cry\r\nDon\'t you cry\r\nTonight', NULL, 0, '2024-04-02 21:01:59', '2024-04-17 23:01:30'),
(151, 18, 'My world', 'my world', '1:24', 'You wan\'da step into my world\r\nIt\'s a sociopsychotic state of bliss\r\nYou\'ve been delayed in the real world\r\nHow many times have you hit and missed?\r\nYou cat-scan shows disfiguration\r\nI wanna laugh myself to death\r\nWith a misfired synapse\r\nwith a bent configuration\r\nI\'ll hold the line while you gasp for breath\r\nYou wanna talk to me\r\nSo talk to me\r\nYou wanna talk to me (7 times)\r\nYou can\'t talk to me\r\nYou don\'t understand your sex\r\nYou ain\'t been mindfucked yet\r\nLet\'s do it (3 times)\r\nOh my distorted smile\r\n\r\nGuess what I\'m doing now', NULL, 0, '2024-04-02 21:02:06', '2024-04-17 23:01:32'),
(152, 9, 'Eclipse', 'eclipse', '2:01', 'All that you touch\r\nAnd all that you see\r\nAll that you taste\r\nAll you feel\r\nAnd all that you love\r\nAnd all that you hate\r\nAll you distrust\r\nAll you save\r\nAnd all that you give\r\nAnd all that you deal\r\nAnd all that you buy\r\nBeg, borrow or steal\r\nAnd all you create\r\nAnd all you destroy\r\nAnd all that you do\r\nAnd all that you say\r\nAnd all that you eat\r\nAnd everyone you meet (everyone you meet)\r\nAnd all that you slight\r\nAnd everyone you fight\r\nAnd all that is now\r\nAnd all that is gone\r\nAnd all that\'s to come\r\nAnd everything under the sun is in tune\r\nBut the sun is eclipsed by the moon', NULL, 10, '2024-04-06 22:40:50', '2024-05-15 15:59:59'),
(153, 7, 'Breathe (in the air)', 'breathe in the air', '2:49', 'Breathe, breathe in the air\r\nDon\'t be afraid to care\r\nLeave, but don\'t leave me\r\nLook around, choose your own ground\r\n\r\nLong you live and high you fly\r\nSmiles you\'ll give and tears you\'ll cry\r\nAnd all you touch and all you see\r\nIs all your life will ever be\r\n\r\nRun, rabbit, run\r\nDig that hole, forget the sun\r\nWhen, at last, the work is done\r\nDon\'t sit down, it\'s time to dig another one\r\n\r\nLong you live and high you fly\r\nBut only if you ride the tide\r\nBalanced on the biggest wave\r\nYou race towards an early grave', NULL, 3, '2024-04-09 16:47:41', '2024-06-19 01:39:36'),
(154, 19, 'Ecuador (Original 12\")', 'ecuador', '5:53', 'Dame tu mano\r\ny venga conmigo\r\nVámonos al viaje para buscarlos sonidos mágicos\r\nde Ecuador\r\n\r\nEcuador\r\n\r\nEscúchame\r\nVámonos al viaje para buscar los sonidos mágicos\r\nde Ecuador\r\n\r\nEscúchame\r\n\r\nAhora sí', NULL, 5, '2024-04-09 17:17:01', '2024-04-17 23:01:39'),
(155, 19, 'Ecuador (Instrumental)', 'ecuador instrumental', '5:53', NULL, NULL, 1, '2024-04-09 17:17:21', '2024-07-03 23:21:13'),
(156, 19, 'Ecuador (Future Breeze Mix)', 'ecuador future breeze mix', '6:06', NULL, NULL, 0, '2024-04-09 17:17:33', '2024-04-17 23:02:02'),
(157, 19, '	Ecuador (Bruce Wayne Mix)', 'ecuador bruce wayne mix', '5:48', NULL, NULL, 0, '2024-04-09 17:17:46', '2024-04-17 23:01:55'),
(158, 19, 'Ecuador (Feelmachine Mix)', 'ecuador feelmachine mix', '5:45', NULL, NULL, 0, '2024-04-09 17:18:03', '2024-04-17 23:01:56'),
(159, 19, 'Ecuador (Klubbheads Mix)', 'ecuador klubbheads mix', '6:31', NULL, NULL, 0, '2024-04-09 17:18:12', '2024-04-17 23:02:09'),
(160, 20, 'Güisqui Sin Soda (Sexo Sin Boda)', 'guiski sin soda sexo sin boda', '4:29', NULL, NULL, 1, '2024-04-09 18:27:01', '2024-06-19 01:36:21'),
(161, 20, 'Cuando Era Más Joven', 'cuando era mas joven', '4:31', NULL, NULL, 1, '2024-04-09 18:27:10', '2024-06-19 01:36:23'),
(162, 20, 'Ciudadano Cero', 'ciudadano cero', '5:00', NULL, NULL, 1, '2024-04-09 18:27:15', '2024-06-19 01:36:27'),
(163, 20, 'El Joven Aprendiz De Pintor', 'el joven aprendiz de pintor', '4:05', NULL, NULL, 1, '2024-04-09 18:27:28', '2024-07-03 19:49:22'),
(164, 20, 'Rebajas De Enero', 'rebajas de enero', '3:56', NULL, NULL, 0, '2024-04-09 18:27:37', '2024-04-17 23:02:27'),
(165, 20, 'Kung Fu', 'kung fu', '3:49', NULL, NULL, 0, '2024-04-09 18:27:47', '2024-04-17 23:02:29'),
(166, 20, 'Balada De Tolito', 'balada de tolito', '4:54', NULL, NULL, 0, '2024-04-09 18:28:00', '2024-04-17 23:02:31');
INSERT INTO `songs` (`id`, `album_id`, `song`, `song_clean`, `duration`, `lyrics`, `lyrics_clean`, `views`, `created_at`, `updated_at`) VALUES
(167, 20, 'Incompatibilidad De Caracteres', 'incompatibilidad de caracteres', '3:25', NULL, NULL, 0, '2024-04-09 18:28:06', '2024-04-17 23:02:35'),
(168, 20, 'Princesa', 'princesa', '4:03', NULL, NULL, 0, '2024-04-09 18:28:16', '2024-04-17 23:02:38'),
(169, 20, 'Quédate A Dormir', 'quedate a dormir', '5:14', NULL, NULL, 1, '2024-04-09 18:28:21', '2024-06-19 01:36:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `song_votes`
--

DROP TABLE IF EXISTS `song_votes`;
CREATE TABLE IF NOT EXISTS `song_votes` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `song_id` mediumint UNSIGNED NOT NULL,
  `user_id` mediumint UNSIGNED NOT NULL,
  `vote` smallint UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_song_user` (`song_id`,`user_id`) USING BTREE,
  KEY `fk_song_vote_user` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `styles`
--

DROP TABLE IF EXISTS `styles`;
CREATE TABLE IF NOT EXISTS `styles` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `style` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alias` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `src` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_style` (`style`) USING BTREE,
  UNIQUE KEY `uq_alias` (`alias`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `styles`
--

INSERT INTO `styles` (`id`, `style`, `alias`, `description`, `src`, `created_at`, `updated_at`) VALUES
(1, 'Dance', 'dance', NULL, 'dance.jpg', '2024-03-02 12:40:07', '2024-07-02 23:15:18'),
(2, 'House', 'house', NULL, 'house.jpg', '2024-03-02 12:40:07', '2024-07-02 23:12:12'),
(3, 'Trance', 'trance', NULL, 'trance.jpg', '2024-03-02 12:40:07', '2024-07-02 22:58:56'),
(4, 'Hard Trance', 'hard-trance', NULL, 'hard-trance.jpg', '2024-03-07 21:44:56', '2024-07-02 23:20:13'),
(5, 'Hard House', 'hard-house', NULL, NULL, '2024-03-07 21:45:02', NULL),
(6, 'Euro House', 'euro-house', NULL, NULL, '2024-03-07 21:47:08', NULL),
(7, 'Rock', 'rock', NULL, 'rock.jpg', '2024-03-15 17:56:26', '2024-07-02 23:05:25'),
(8, 'Rock Sinfónico', 'rock-sinfonico', NULL, 'rock-sinfonico.jpg', '2024-03-15 17:56:35', '2024-07-02 23:07:36'),
(9, 'Progressive rock', 'progressive-rock', NULL, 'progressive-rock.jpg', '2024-03-15 17:57:01', '2024-07-02 23:36:39'),
(10, 'Hard Rock', 'hard-rock', NULL, 'hard-rock.jpg', '2024-03-15 17:57:37', '2024-07-02 23:33:09'),
(11, 'Pop', 'pop', NULL, 'pop.jpg', '2024-04-09 18:24:30', '2024-07-02 22:58:51'),
(12, 'Pop Rock', 'pop-rock', NULL, 'pop-rock.jpg', '2024-04-09 18:24:48', '2024-07-02 23:34:47'),
(14, 'dance2', 'dance2', NULL, NULL, '2024-07-04 18:37:37', '2024-07-04 18:38:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` enum('superadmin','admin','editor','user') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `roles`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Iván', 'penarrocha@gmail.com', '2024-05-23 17:32:08', '$2y$12$cW7Ad6xiiQuRAlE0SjzfgOnZCJrQiB8FO9OqR2sLsImQTaodkFMHu', 'Z3YqqSHoPhnGOHpsyPu28j8sjOtIG0LMvcBm12ihzj9uefMQfjrLAaZfiSKe', NULL, '2024-04-19 21:33:36', '2024-07-02 18:00:27', NULL),
(2, 'john', 'john@gmail.com', '2024-05-24 15:15:13', '$2y$12$xtzCjWfinnQ7ttMmEtIhCOBXKyGqYKKXSqf6oYvfsuCILLpysd1VO', NULL, NULL, '2024-04-19 22:06:02', '2024-07-04 17:13:15', NULL),
(3, 'unir', 'unir@unir.net', '2024-06-30 22:00:00', '$2y$12$wlYImth3tvL2ijEEUjDboujQA1.hOuCmFes2VIAMrnMnqYQYXUmC.', NULL, NULL, '2024-07-02 17:58:29', '2024-07-02 17:58:29', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `provider` enum('youtube') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `videoable_id` mediumint UNSIGNED NOT NULL,
  `videoable_type` enum('App\\Models\\Artist','App\\Models\\Album','App\\Models\\Song') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'App\\Models\\Song',
  `ordering` tinyint UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_videoable_id_table` (`videoable_id`,`videoable_type`,`source`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `videos`
--

INSERT INTO `videos` (`id`, `provider`, `source`, `description`, `videoable_id`, `videoable_type`, `ordering`) VALUES
(1, 'youtube', 'R49d4f5sEs4', NULL, 16, 'App\\Models\\Song', 0),
(2, 'youtube', 'G0wOOlwXLgA', NULL, 17, 'App\\Models\\Song', 0),
(3, 'youtube', 'vVooyS4mG4w', NULL, 17, 'App\\Models\\Song', 1),
(4, 'youtube', 'yl-Ms_ek-kE', NULL, 18, 'App\\Models\\Song', 1),
(5, 'youtube', '9XIuBCFNBFw', 'Pink Floyd concert video taken from the 20 October 1994 concert at Earls Court, London, England in The Division Bell Tour.', 18, 'App\\Models\\Song', 0),
(6, 'youtube', '2PMnJ_Luk_o', NULL, 19, 'App\\Models\\Song', 0),
(7, 'youtube', '_1jL8A20H_k', 'Live Pulse. Vocalistas por orden de aparición: Rachel Fury, Durga McBroom y Margaret Taylor', 19, 'App\\Models\\Song', 1),
(8, 'youtube', 'Ke9y_yfwJtg', 'Filmed at Long Island’s Nassau Coliseum in August 1988', 19, 'App\\Models\\Song', 2),
(9, 'youtube', '-0kcet4aPpQ', 'Official Music Video', 20, 'App\\Models\\Song', 0),
(10, 'youtube', 'rgmce_XukRQ', 'P.U.L.S.E. filmed on 20 October 1994 at Earls Court in London', 20, 'App\\Models\\Song', 1),
(11, 'youtube', 'Kjgwjh4H7wg', 'On 2 July 2005 Pink Floyd performed at the London Live 8 concert with Roger Waters rejoining David Gilmour, Nick Mason and Richard Wright', 20, 'App\\Models\\Song', 0),
(12, 'youtube', 'nYAYn7pyues', 'Official Music Video', 21, 'App\\Models\\Song', 0),
(13, 'youtube', 'HoLhKJuGhK0', '2023 Remaster', 21, 'App\\Models\\Song', 1),
(14, 'youtube', 'l8pEjmZVx3k', '2023 Remaster', 22, 'App\\Models\\Song', 0),
(15, 'youtube', 'KW2UwELSE3M', 'Filmed live on 20 October 1994 at Earls Court, London, UK. Restored & re-edited in 2019 from the original tape masters.', 22, 'App\\Models\\Song', 1),
(16, 'youtube', 'y-mGcfWXe0Y', 'Video taken from Set The Control For The Heart Of The Sun and Careful With That Axe, Eugene at Brighton \r\nLive at Brighton Dome, 29-06-1972', 22, 'App\\Models\\Song', 2),
(17, 'youtube', 'QFdkM40KOhE', '2023 Remaster', 23, 'App\\Models\\Song', 0),
(18, 'youtube', 'uPnlZB6XiM8', 'PULSE Restored & Re-Edited', 23, 'App\\Models\\Song', 1),
(19, 'youtube', 'k0xGxnZFNYs', '2023 Remaster', 152, 'App\\Models\\Song', 0),
(20, 'youtube', 'yeohTfT5fcU', 'PULSE Restored & Re-Edited', 152, 'App\\Models\\Song', 1),
(21, 'youtube', 'ObZFu1RW8irjYokO', 'Sash feat. Rodriguez - Ecuador (Original 12\" mix)', 154, 'App\\Models\\Song', 0),
(22, 'youtube', 'oln1XSnazE8', 'Sash feat. Rodriguez - Ecuador (Future Breeze mix)', 156, 'App\\Models\\Song', 0),
(23, 'youtube', 'mApbsJg_o5Q', 'Sash feat. Rodriguez - Ecuador (Klubbheads mix)', 159, 'App\\Models\\Song', 0),
(24, 'youtube', 'jx13xTq2Xj4', 'Sash feat. Rodriguez - Ecuador (Bruce Wayne mix)', 157, 'App\\Models\\Song', 0),
(25, 'youtube', 'BdVYij08LYs', 'Sash feat. Rodriguez - Ecuador (Feelmachine mix)', 158, 'App\\Models\\Song', 0),
(26, 'youtube', '48PJGVf4xqk', 'One of theses days', 45, 'App\\Models\\Song', 0);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `fk_album_label` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `album_artist`
--
ALTER TABLE `album_artist`
  ADD CONSTRAINT `fk_album_artist-album` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_album_artist-artist` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_album_artist_relationship` FOREIGN KEY (`relationship_id`) REFERENCES `relationships` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `album_song`
--
ALTER TABLE `album_song`
  ADD CONSTRAINT `fk_album_song_album` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_album_song_song` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `album_style`
--
ALTER TABLE `album_style`
  ADD CONSTRAINT `fk_album_style_album` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_album_style_style` FOREIGN KEY (`style_id`) REFERENCES `styles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `artist_song`
--
ALTER TABLE `artist_song`
  ADD CONSTRAINT `fk_artist_song-artist` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_artist_song-song` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `fk_song_album` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `song_votes`
--
ALTER TABLE `song_votes`
  ADD CONSTRAINT `fk_song_vote_song` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_song_vote_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
