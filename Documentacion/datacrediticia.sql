/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : datacrediticia

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2015-07-07 15:47:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(13) NOT NULL COMMENT 'RNC o Cédula',
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `direccion` text,
  `telefonocasa` varchar(20) DEFAULT NULL,
  `telefonocelular` varchar(20) DEFAULT NULL,
  `correoelectronico` varchar(200) NOT NULL,
  `fechanacimiento` date NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcliente`),
  UNIQUE KEY `identificacion` (`identificacion`) USING BTREE,
  KEY `nombres` (`nombres`,`apellidos`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
  `idempresa` int(11) NOT NULL AUTO_INCREMENT,
  `rnc` varchar(9) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idempresa`),
  UNIQUE KEY `rnc` (`rnc`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for historialcrediticio
-- ----------------------------
DROP TABLE IF EXISTS `historialcrediticio`;
CREATE TABLE `historialcrediticio` (
  `idhistorialcrediticio` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `idtipoproducto` int(11) NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `limitecredito` decimal(20,2) NOT NULL,
  `nocuota` int(3) DEFAULT NULL,
  `montocuota` decimal(12,2) DEFAULT NULL,
  `balanceactual` decimal(20,2) DEFAULT NULL,
  `fechatransaccion` datetime NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idhistorialcrediticio`),
  KEY `idcliente` (`idcliente`),
  KEY `idempresa` (`idempresa`),
  KEY `idtipoproducto` (`idtipoproducto`),
  KEY `idmoneda` (`idmoneda`),
  CONSTRAINT `historialcrediticio_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `historialcrediticio_ibfk_2` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`),
  CONSTRAINT `historialcrediticio_ibfk_3` FOREIGN KEY (`idtipoproducto`) REFERENCES `tipoproducto` (`idtipoproducto`),
  CONSTRAINT `historialcrediticio_ibfk_4` FOREIGN KEY (`idmoneda`) REFERENCES `moneda` (`idmoneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for indiceinflacion
-- ----------------------------
DROP TABLE IF EXISTS `indiceinflacion`;
CREATE TABLE `indiceinflacion` (
  `idindiceinflacion` int(1) NOT NULL AUTO_INCREMENT,
  `periodo` varchar(6) NOT NULL,
  `indiceinflacion` decimal(5,2) NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idindiceinflacion`),
  UNIQUE KEY `periodo` (`periodo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for moneda
-- ----------------------------
DROP TABLE IF EXISTS `moneda`;
CREATE TABLE `moneda` (
  `idmoneda` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `tasacompra` decimal(5,2) NOT NULL,
  `tasaventa` decimal(5,2) NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmoneda`),
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tipoproducto
-- ----------------------------
DROP TABLE IF EXISTS `tipoproducto`;
CREATE TABLE `tipoproducto` (
  `idtipoproducto` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(200) NOT NULL,
  `comentario` varchar(6000) DEFAULT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idtipoproducto`),
  UNIQUE KEY `tipo` (`tipo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
