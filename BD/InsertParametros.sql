/*
-- Query: SELECT * FROM bdallsafe2.parametro
LIMIT 0, 1000

-- Date: 2019-04-06 19:10
*/
INSERT INTO `` (`idparametro`,`descripcion`,`llave`,`valor`) VALUES (4,'Correo del remitente del mail de recuperacion de clave de usuario',1,'alvaro.sanmartinh@gmail.com');
INSERT INTO `` (`idparametro`,`descripcion`,`llave`,`valor`) VALUES (5,'Asunto del mail de recuperacion de clave de usuario',2,'Enlace para cambiar clave AllSafe');
INSERT INTO `` (`idparametro`,`descripcion`,`llave`,`valor`) VALUES (6,'Cuerpo del mail de recuperacion de clave de usuario',3,'Hola {{3}} <br><br> Te hemos enviado este correo porque has solicitado recuperar tu clave de AllSafe. <br> Si has sido tú, debes seguir <a href=\'http://{{0}}/AllSafe/CambiarClave.jsp?codigo={{1}}&id={{2}}\'>este enlace</a> para poder reestablecer tu clave. <br><br> Si el enlace no funciona, copia y pega esto en tu navegador: <br><br>http://{{0}}/AllSafe/CambiarClave.jsp?codigo={{1}}&id={{2}}<br><br>Si no has solicitado el cambio de tu clave, alguien puede estar intentando acceder a tu cuenta, te recomendamos usar una clave segura y no compartirla con nadie.');
INSERT INTO `` (`idparametro`,`descripcion`,`llave`,`valor`) VALUES (7,'Clave del correo del remitente del mail de recuperacion de clave de usuario',4,'clave');
INSERT INTO `` (`idparametro`,`descripcion`,`llave`,`valor`) VALUES (8,'Ip y Puerto del servidor de aplicaciones (Puede ser un DNS)',5,'localhost:8080');
