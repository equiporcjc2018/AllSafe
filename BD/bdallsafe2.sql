-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2018 a las 04:11:44
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdallsafe2`
--
DROP SCHEMA IF EXISTS `bdallsafe2` ;
CREATE SCHEMA IF NOT EXISTS `bdallsafe2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `bdallsafe2` ;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL,
  `descripcionCargo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idCargo`, `descripcionCargo`) VALUES
(1, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `idCiudad` int(11) NOT NULL,
  `nombreCiudad` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL,
  `rutEmpresa` varchar(10) NOT NULL,
  `razonSocialEmpresa` varchar(255) NOT NULL,
  `direccionEmpresa` varchar(255) NOT NULL,
  `sitioWebEmpresa` varchar(255) NOT NULL,
  `telefonoEmpresa` int(11) NOT NULL,
  `giroEmpresa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `epp`
--

CREATE TABLE `epp` (
  `idEPP` int(11) NOT NULL,
  `nombreEPPcol` varchar(100) NOT NULL,
  `descripcionEPP` varchar(255) NOT NULL,
  `TipoEPP_idTipoEPP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eppproceso`
--

CREATE TABLE `eppproceso` (
  `idEppProceso` int(11) NOT NULL,
  `Proyecto_idProyecto` int(11) NOT NULL,
  `EPP_idEPP` int(11) NOT NULL,
  `fechaCreacionEppProceso` varchar(45) NOT NULL,
  `Persona_idPersona` int(11) NOT NULL,
  `tallaEppProceso` varchar(45) NOT NULL,
  `unidadEppProceso` int(11) NOT NULL,
  `cantidadEppProceso` varchar(45) NOT NULL,
  `precioUnitarioEppProceso` int(11) NOT NULL,
  `destinoDevolucionEppProceso` varchar(45) NOT NULL,
  `motivoEppProceso` varchar(255) NOT NULL,
  `EstadosProyecto_idEstadosProyecto` int(11) NOT NULL,
  `usuarioEppProceso` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eppsolicitudterreno`
--

CREATE TABLE `eppsolicitudterreno` (
  `idEppSolicitudTerreno` int(11) NOT NULL,
  `fechaEppSolicitudTerreno` varchar(45) NOT NULL,
  `idUsuario` varchar(45) NOT NULL,
  `EPP_idEPP` int(11) NOT NULL,
  `estadoEppSolicitudTerreno` varchar(45) NOT NULL,
  `cantidadEppSolicitudTerreno` int(11) NOT NULL,
  `Proyecto_idProyecto` int(11) NOT NULL,
  `obervacionEppSolicitudTerreno` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eppterreno`
--

CREATE TABLE `eppterreno` (
  `idEppTerreno` int(11) NOT NULL,
  `Persona_idPersona` int(11) NOT NULL,
  `fechaEppTerreno` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Proyecto_idProyecto` int(11) NOT NULL,
  `EstadoEppTerreno` varchar(45) NOT NULL,
  `EPP_idEPP` int(11) NOT NULL,
  `CantidadEppTerreno` int(11) NOT NULL,
  `TallaEppTerreno` varchar(45) NOT NULL,
  `observacionEppTerreno` varchar(255) NOT NULL,
  `firmaEppTerreno` tinyblob NOT NULL,
  `tipoEntregaEppTerreno` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosproyecto`
--

CREATE TABLE `estadosproyecto` (
  `idEstadosProyecto` int(11) NOT NULL,
  `descripcionEstadosProyecto` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menuallsafe`
--

CREATE TABLE `menuallsafe` (
  `idMenuAllsafe` int(11) NOT NULL,
  `nombreMenuAllsafe` varchar(100) NOT NULL,
  `padreMenuAllsafe` int(11) NOT NULL,
  `destinoMenuAllsafe` varchar(255) NOT NULL,
  `PerfilAllSafe_idPerfilAllSafe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `nacionalidadPais` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfilallsafe`
--

CREATE TABLE `perfilallsafe` (
  `idPerfilAllSafe` int(11) NOT NULL,
  `nombrePerfilAllSafe` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfilallsafe`
--

INSERT INTO `perfilallsafe` (`idPerfilAllSafe`, `nombrePerfilAllSafe`) VALUES
(1, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL,
  `rutPasaportePersona` varchar(45) NOT NULL,
  `nombresPersona` varchar(100) NOT NULL,
  `apePatPersona` varchar(45) NOT NULL,
  `apeMatPersona` varchar(45) NOT NULL,
  `fechaNacPersona` varchar(10) NOT NULL,
  `nacionalidadPersona` varchar(45) NOT NULL,
  `tipoPlanta` varchar(45) NOT NULL,
  `correoPersona` varchar(100) NOT NULL,
  `Cargo_idCargo` int(11) NOT NULL,
  `tallaZApato_idtallaZApato` int(11) NOT NULL,
  `tallaPoleraCamisa_idtallaPoleraCamisa` int(11) NOT NULL,
  `TallaPantalon_idTallaPantalon` int(11) NOT NULL,
  `TallaOberol_idTallaOberol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `rutPasaportePersona`, `nombresPersona`, `apePatPersona`, `apeMatPersona`, `fechaNacPersona`, `nacionalidadPersona`, `tipoPlanta`, `correoPersona`, `Cargo_idCargo`, `tallaZApato_idtallaZApato`, `tallaPoleraCamisa_idtallaPoleraCamisa`, `TallaPantalon_idTallaPantalon`, `TallaOberol_idTallaOberol`) VALUES
(1, '11.111.111-1', 'Diego', 'Muñoz', 'app', '11-08-1984', 'Chilena', '1', 'prueba@prueba.cl', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `idProyecto` int(11) NOT NULL,
  `nombreProyecto` varchar(200) NOT NULL,
  `ubicacionProyecto` varchar(255) NOT NULL,
  `fechaInicioProyecto` varchar(45) NOT NULL,
  `fechaTerminoProyecto` varchar(45) NOT NULL,
  `Pais_idPais` int(11) NOT NULL,
  `Ciudad_idCiudad` int(11) NOT NULL,
  `Empresa_idEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tallaoberol`
--

CREATE TABLE `tallaoberol` (
  `idTallaOberol` int(11) NOT NULL,
  `numeroTallaOberol` int(11) NOT NULL,
  `letraTallaOberol` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tallaoberol`
--

INSERT INTO `tallaoberol` (`idTallaOberol`, `numeroTallaOberol`, `letraTallaOberol`) VALUES
(1, 50, 'L');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tallapantalon`
--

CREATE TABLE `tallapantalon` (
  `idTallaPantalon` int(11) NOT NULL,
  `numeroTallaPantalon` int(11) NOT NULL,
  `letraTallaPantalon` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tallapantalon`
--

INSERT INTO `tallapantalon` (`idTallaPantalon`, `numeroTallaPantalon`, `letraTallaPantalon`) VALUES
(1, 50, 'L');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tallapoleracamisa`
--

CREATE TABLE `tallapoleracamisa` (
  `idTallaPoleraCamisa` int(11) NOT NULL,
  `numeroPoleraCamisa` int(11) NOT NULL,
  `letraPoleraCamisa` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tallapoleracamisa`
--

INSERT INTO `tallapoleracamisa` (`idTallaPoleraCamisa`, `numeroPoleraCamisa`, `letraPoleraCamisa`) VALUES
(1, 16, 'L');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tallazapato`
--

CREATE TABLE `tallazapato` (
  `idTallaZapato` int(11) NOT NULL,
  `numeroZapato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tallazapato`
--

INSERT INTO `tallazapato` (`idTallaZapato`, `numeroZapato`) VALUES
(1, 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoepp`
--

CREATE TABLE `tipoepp` (
  `idTipoEPP` int(11) NOT NULL,
  `descripcionTipoEPP` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoplanta`
--

CREATE TABLE `tipoplanta` (
  `idTipoPlanta` int(11) NOT NULL,
  `descripcionTipoPlanta` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioallsafe`
--

CREATE TABLE `usuarioallsafe` (
  `idUsuarioAllSafe` int(11) NOT NULL,
  `loginUsuarioAllSafe` varchar(45) NOT NULL,
  `passUsuarioAllSafe` varchar(45) NOT NULL,
  `Persona_idPersona` int(11) NOT NULL,
  `PerfilAllSafe_idPerfilAllSafe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarioallsafe`
--

INSERT INTO `usuarioallsafe` (`idUsuarioAllSafe`, `loginUsuarioAllSafe`, `passUsuarioAllSafe`, `Persona_idPersona`, `PerfilAllSafe_idPerfilAllSafe`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`idCiudad`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indices de la tabla `epp`
--
ALTER TABLE `epp`
  ADD PRIMARY KEY (`idEPP`),
  ADD KEY `fk_EPP_TipoEPP1_idx` (`TipoEPP_idTipoEPP`);

--
-- Indices de la tabla `eppproceso`
--
ALTER TABLE `eppproceso`
  ADD PRIMARY KEY (`idEppProceso`),
  ADD KEY `fk_EppProceso_Proyecto1_idx` (`Proyecto_idProyecto`),
  ADD KEY `fk_EppProceso_EPP1_idx` (`EPP_idEPP`),
  ADD KEY `fk_EppProceso_Persona1_idx` (`Persona_idPersona`),
  ADD KEY `fk_EppProceso_EstadosProyecto1_idx` (`EstadosProyecto_idEstadosProyecto`);

--
-- Indices de la tabla `eppsolicitudterreno`
--
ALTER TABLE `eppsolicitudterreno`
  ADD PRIMARY KEY (`idEppSolicitudTerreno`),
  ADD KEY `fk_EppSolicitudTerreno_EPP1_idx` (`EPP_idEPP`),
  ADD KEY `fk_EppSolicitudTerreno_Proyecto1_idx` (`Proyecto_idProyecto`);

--
-- Indices de la tabla `eppterreno`
--
ALTER TABLE `eppterreno`
  ADD PRIMARY KEY (`idEppTerreno`),
  ADD KEY `fk_EppEntregaTerreno_Persona1_idx` (`Persona_idPersona`),
  ADD KEY `fk_EppTerreno_Proyecto1_idx` (`Proyecto_idProyecto`),
  ADD KEY `fk_EppTerreno_EPP1_idx` (`EPP_idEPP`);

--
-- Indices de la tabla `estadosproyecto`
--
ALTER TABLE `estadosproyecto`
  ADD PRIMARY KEY (`idEstadosProyecto`);

--
-- Indices de la tabla `menuallsafe`
--
ALTER TABLE `menuallsafe`
  ADD PRIMARY KEY (`idMenuAllsafe`),
  ADD KEY `fk_MenuAllsafe_PerfilAllSafe1_idx` (`PerfilAllSafe_idPerfilAllSafe`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`idPais`);

--
-- Indices de la tabla `perfilallsafe`
--
ALTER TABLE `perfilallsafe`
  ADD PRIMARY KEY (`idPerfilAllSafe`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idPersona`),
  ADD KEY `fk_Persona_Cargo1_idx` (`Cargo_idCargo`),
  ADD KEY `fk_Persona_tallaZApato1_idx` (`tallaZApato_idtallaZApato`),
  ADD KEY `fk_Persona_tallaPoleraCamisa1_idx` (`tallaPoleraCamisa_idtallaPoleraCamisa`),
  ADD KEY `fk_Persona_TallaPantalon1_idx` (`TallaPantalon_idTallaPantalon`),
  ADD KEY `fk_Persona_TallaOberol1_idx` (`TallaOberol_idTallaOberol`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`idProyecto`),
  ADD KEY `fk_Proyecto_Pais1_idx` (`Pais_idPais`),
  ADD KEY `fk_Proyecto_Ciudad1_idx` (`Ciudad_idCiudad`),
  ADD KEY `fk_Proyecto_Empresa1_idx` (`Empresa_idEmpresa`);

--
-- Indices de la tabla `tallaoberol`
--
ALTER TABLE `tallaoberol`
  ADD PRIMARY KEY (`idTallaOberol`);

--
-- Indices de la tabla `tallapantalon`
--
ALTER TABLE `tallapantalon`
  ADD PRIMARY KEY (`idTallaPantalon`);

--
-- Indices de la tabla `tallapoleracamisa`
--
ALTER TABLE `tallapoleracamisa`
  ADD PRIMARY KEY (`idTallaPoleraCamisa`);

--
-- Indices de la tabla `tallazapato`
--
ALTER TABLE `tallazapato`
  ADD PRIMARY KEY (`idTallaZapato`);

--
-- Indices de la tabla `tipoepp`
--
ALTER TABLE `tipoepp`
  ADD PRIMARY KEY (`idTipoEPP`);

--
-- Indices de la tabla `tipoplanta`
--
ALTER TABLE `tipoplanta`
  ADD PRIMARY KEY (`idTipoPlanta`);

--
-- Indices de la tabla `usuarioallsafe`
--
ALTER TABLE `usuarioallsafe`
  ADD PRIMARY KEY (`idUsuarioAllSafe`),
  ADD KEY `fk_UsuarioAllSafe_Persona1_idx` (`Persona_idPersona`),
  ADD KEY `fk_UsuarioAllSafe_PerfilAllSafe1_idx` (`PerfilAllSafe_idPerfilAllSafe`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `epp`
--
ALTER TABLE `epp`
  ADD CONSTRAINT `fk_EPP_TipoEPP1` FOREIGN KEY (`TipoEPP_idTipoEPP`) REFERENCES `tipoepp` (`idTipoEPP`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `eppproceso`
--
ALTER TABLE `eppproceso`
  ADD CONSTRAINT `fk_EppProceso_EPP1` FOREIGN KEY (`EPP_idEPP`) REFERENCES `epp` (`idEPP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EppProceso_EstadosProyecto1` FOREIGN KEY (`EstadosProyecto_idEstadosProyecto`) REFERENCES `estadosproyecto` (`idEstadosProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EppProceso_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EppProceso_Proyecto1` FOREIGN KEY (`Proyecto_idProyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `eppsolicitudterreno`
--
ALTER TABLE `eppsolicitudterreno`
  ADD CONSTRAINT `fk_EppSolicitudTerreno_EPP1` FOREIGN KEY (`EPP_idEPP`) REFERENCES `epp` (`idEPP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EppSolicitudTerreno_Proyecto1` FOREIGN KEY (`Proyecto_idProyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `eppterreno`
--
ALTER TABLE `eppterreno`
  ADD CONSTRAINT `fk_EppEntregaTerreno_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EppTerreno_EPP1` FOREIGN KEY (`EPP_idEPP`) REFERENCES `epp` (`idEPP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EppTerreno_Proyecto1` FOREIGN KEY (`Proyecto_idProyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menuallsafe`
--
ALTER TABLE `menuallsafe`
  ADD CONSTRAINT `fk_MenuAllsafe_PerfilAllSafe1` FOREIGN KEY (`PerfilAllSafe_idPerfilAllSafe`) REFERENCES `perfilallsafe` (`idPerfilAllSafe`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_Persona_Cargo1` FOREIGN KEY (`Cargo_idCargo`) REFERENCES `cargo` (`idCargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Persona_TallaOberol1` FOREIGN KEY (`TallaOberol_idTallaOberol`) REFERENCES `tallaoberol` (`idTallaOberol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Persona_TallaPantalon1` FOREIGN KEY (`TallaPantalon_idTallaPantalon`) REFERENCES `tallapantalon` (`idTallaPantalon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Persona_tallaPoleraCamisa1` FOREIGN KEY (`tallaPoleraCamisa_idtallaPoleraCamisa`) REFERENCES `tallapoleracamisa` (`idTallaPoleraCamisa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Persona_tallaZApato1` FOREIGN KEY (`tallaZApato_idtallaZApato`) REFERENCES `tallazapato` (`idTallaZapato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `fk_Proyecto_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Proyecto_Empresa1` FOREIGN KEY (`Empresa_idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Proyecto_Pais1` FOREIGN KEY (`Pais_idPais`) REFERENCES `pais` (`idPais`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarioallsafe`
--
ALTER TABLE `usuarioallsafe`
  ADD CONSTRAINT `fk_UsuarioAllSafe_PerfilAllSafe1` FOREIGN KEY (`PerfilAllSafe_idPerfilAllSafe`) REFERENCES `perfilallsafe` (`idPerfilAllSafe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_UsuarioAllSafe_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
