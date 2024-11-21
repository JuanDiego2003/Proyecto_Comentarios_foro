-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2024 a las 21:27:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tu_foro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coment`
--

CREATE TABLE `coment` (
  `id_comentario` int(11) NOT NULL,
  `contenido` varchar(255) NOT NULL,
  `id_publicacion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE `likes` (
  `id_like` int(11) NOT NULL,
  `id_publicacion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pubication`
--

CREATE TABLE `pubication` (
  `id_publicacion` int(11) NOT NULL,
  `contenido` varchar(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp(),
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `coment`
--
ALTER TABLE `coment`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `FK32tnyf4n6njsyireytag6syd5` (`id_publicacion`),
  ADD KEY `FK5jv8ol5wyrw0cgnfvdbbjcltn` (`id_usuario`);

--
-- Indices de la tabla `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id_like`),
  ADD KEY `FKbqgjlt19flgjrqye2v8xqv9x2` (`id_publicacion`),
  ADD KEY `FKecv36t05ll99dnq0bdprfgguo` (`id_usuario`);

--
-- Indices de la tabla `pubication`
--
ALTER TABLE `pubication`
  ADD PRIMARY KEY (`id_publicacion`),
  ADD KEY `FK12ewo2g5636fda3o560w536o6` (`id_usuario`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `coment`
--
ALTER TABLE `coment`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `likes`
--
ALTER TABLE `likes`
  MODIFY `id_like` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pubication`
--
ALTER TABLE `pubication`
  MODIFY `id_publicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `coment`
--
ALTER TABLE `coment`
  ADD CONSTRAINT `FK32tnyf4n6njsyireytag6syd5` FOREIGN KEY (`id_publicacion`) REFERENCES `pubication` (`id_publicacion`),
  ADD CONSTRAINT `FK5jv8ol5wyrw0cgnfvdbbjcltn` FOREIGN KEY (`id_usuario`) REFERENCES `user` (`id_usuario`);

--
-- Filtros para la tabla `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `FKbqgjlt19flgjrqye2v8xqv9x2` FOREIGN KEY (`id_publicacion`) REFERENCES `pubication` (`id_publicacion`),
  ADD CONSTRAINT `FKecv36t05ll99dnq0bdprfgguo` FOREIGN KEY (`id_usuario`) REFERENCES `user` (`id_usuario`);

--
-- Filtros para la tabla `pubication`
--
ALTER TABLE `pubication`
  ADD CONSTRAINT `FK12ewo2g5636fda3o560w536o6` FOREIGN KEY (`id_usuario`) REFERENCES `user` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
