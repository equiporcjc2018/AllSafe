CREATE TABLE `parametro` (
  `idparametro` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `llave` int(11) NOT NULL,
  `valor` varchar(255) NOT NULL,
  PRIMARY KEY (`idparametro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Parametros de configuracion del sistema';
