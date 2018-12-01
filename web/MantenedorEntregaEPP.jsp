<%-- 
    Document   : MantenedorEntregaEPP
    Created on : 01-12-2018, 1:47:23
    Author     : JuanCarlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<!--[if IE]><script type="text/javascript" src="/excanvas.js"></script><![endif]-->
<style>
.drop-shadow {
	margin:2em 20% 4em;
}
canvas {
	border-style:solid;
	border-color:#000000;
	border-radius:5px;
	border-width:1px;
}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GestionEPP</title>
    </head>
    <body onload="prepareCanvas();">
        <h1>Gestión Epp</h1>

        <fieldset><legend>Asignar EPP</legend>

            <form name="frmRegistroEntrega" method="post" action="">
                <p>Rut <input type="text" name="txtRut"><input type="button" value="Ingresar Rut"/></p>
                <p>Nombre <input type="text" name="txtNombre" disabled="true"></p>
                <p>Apellido paterno<input type="text" name="txtApPaterno" disabled="true"></p>
                <p>Apellido materno<input type="text" name="txtAppMaterno" disabled="true"></p>
                <p>Fecha entrega<input type="date" name="txtFechaEntrega"></p>
                 <p>TipoEpp 
                        <select name="ddltipoEpp">
                            <option value="0">--Seleccione--</option>
                        <c:forEach items="${sessionScope.listaTipoEpp}" var="epp">
                            <option value="<c:out value="${epp.idTipoEpp}"></c:out>"></option>
                        </c:forEach>
                    </select>
                </p>
                 <p>Seleccione Epp 
                        <select name="ddlEpp">
                            <option value="0">--Seleccione--</option>
                        <c:forEach items="${sessionScope.listaEpp}" var="epp">
                            <option value="<c:out value="${epp.idTipo}"></c:out>"></option>
                        </c:forEach>
                    </select>
                </p>
                <p>Cantidad<input type="text" name="txtCantidad"></p>
                <p>Talla<input type="text" name="txtTalla"><input type="button" value="Agregar Epp"/></p>
                <br>
                <fieldset><legend>Lista Epps a entregar</legend>
                    
                </fieldset>
                
                <canvas id="canvasEjemplo" width="300" height="200"></canvas>
                <p>Firma trabajdor</p>
	<br><input type="button" id="borrador" value="Limpiar firma" />
        <input type="submit" name="btnEntregar" value="Ingresar entrega">
        <br>
        <fieldset><legend>Lista Epps entregados</legend>
             <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Ap. paterno</th>
                            <th>Ap. materno</th>
                            <th>Fecha entrega</th>
                            <th>Tipo epp</th>
                            <th>Epp</th>
                            <th>Cantidad</th>
                            <th>Talla</th>
                            <th>Firma</th>
                            <th><input type="button" value="Generar doc entrega"/></th>
                        </tr> 
                    </thead>
                    <tbody>
                        <c:forEach items="${sessionScope.listadoProyectos}" var="proyecto">
                            <tr>
                                <td><c:out value="${proyecto.nombreProyecto}"/></td>
                                <td><c:out value="${proyecto.paisidPais.pais}"/></td>
                                <td><c:out value="${proyecto.ciudadidCiudad.nombreCiudad}"/></td>
                                <td><c:out value="${proyecto.empresaidEmpresa.idEmpresa}"/></td>
                                <td><c:out value="${proyecto.fechaInicioProyecto}"/></td>
                                <td><c:out value="${proyecto.fechaTerminoProyecto}"/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                    
                </fieldset>
	<script>
 
	var miLienzo; // el canvas
	var contexto; // el contexto
	var canvasLimites; // los margenes del canvas
	var flagPaint=false; // nos dice si pintar o no
	var actualPos; // la posición actual donde hice click
 
	function prepareCanvas(){
		miLienzo=document.getElementById("canvasEjemplo");
		contexto= miLienzo.getContext("2d"); // obtenemos el contexto ( dibujar en 2d)
		canvasLimites=miLienzo.getBoundingClientRect(); // obtenemos los limites del canvas
		miLienzo.addEventListener('mousedown',cambiarEstado,false);
		miLienzo.addEventListener('mouseup',cambiarEstado,false);
		miLienzo.addEventListener('mousemove',pintarLinea,false);
		miLienzo.style.cursor="hand";
 
		borrador=document.getElementById("borrador");
		borrador.addEventListener('click',erase,false);
	}
 
	function cambiarEstado(){
		flagPaint=!flagPaint;
		actualPos=obtenerCoordenadas(event);
	}
 
	function pintarLinea(event){
 
		if(flagPaint){
			var coordenadas=obtenerCoordenadas(event);
			contexto.beginPath(); // comenzamos a dibujar
			contexto.moveTo(actualPos.x, actualPos.y); // ubicamos el cursor en la posicion (10,10)
			contexto.lineTo(coordenadas.x,coordenadas.y);
			actualPos={
				x:coordenadas.x,
				y:coordenadas.y
			};
			contexto.strokeStyle = "#000"; // color de la linea
			contexto.stroke(); // dibujamos la linea
		}
	}
 
	function obtenerCoordenadas(event){
		var posX;
		var posY;
 
		if (event.pageX || event.pageY) {
			posX = event.pageX- canvasLimites.left;
			posY = event.pageY- canvasLimites.top;
		}else{
			posX = event.clientX - canvasLimites.left;
			posY = event.clientY - canvasLimites.top;
		}
 
		return {x:posX,
			y:posY
		};
	}
	function erase(){
		contexto.clearRect(0, 0, miLienzo.width, miLienzo.height);
	}
 
	</script>
            </form>
        </fieldset>
    </body>
    
</html>
