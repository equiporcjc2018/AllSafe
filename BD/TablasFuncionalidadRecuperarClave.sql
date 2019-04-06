CREATE TABLE `usuarioclaverecuperar` (
  `idusuarioclaverecuperar` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `codigo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idusuarioclaverecuperar`),
  UNIQUE KEY `idusuariorecuperarclave_UNIQUE` (`idusuarioclaverecuperar`),
  KEY `idUsuario_idx` (`usuario`),
  CONSTRAINT `idUsuarioRecuperar` FOREIGN KEY (`usuario`) REFERENCES `usuarioallsafe` (`idUsuarioAllSafe`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

CREATE TABLE `usuarioclavehistorial` (
  `idusuarioclavehistorial` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(200) NOT NULL,
  `fechacreacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` varchar(1) DEFAULT 'A',
  PRIMARY KEY (`idusuarioclavehistorial`),
  UNIQUE KEY `idusuariohistorialclave_UNIQUE` (`idusuarioclavehistorial`),
  KEY `IDUSUARIO_idx` (`usuario`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`usuario`) REFERENCES `usuarioallsafe` (`idUsuarioAllSafe`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='Contiene el historial de las claves que ha usado el usuario';
