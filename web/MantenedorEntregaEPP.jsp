<%-- 
    Document   : MantenedorEntregaEPP
    Created on : 01-12-2018, 1:47:23
    Author     : JuanCarlos
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GestionEPP</title>
    </head>



    <body onload="prepareCanvas();">

         <jsp:include page="./listarTallaOberolServlet" flush="true"/>
        <jsp:include page="./listarTallaPantalonServlet" flush="true"/>
        <jsp:include page="./listarTallaPoleraServlet" flush="true"/>
        <jsp:include page="./listarTallaZapatoServlet" flush="true"/>
        <jsp:include page="./listarCargoServlet" flush="true"/>
        <jsp:include page="./listarTipoPlantaServlet" flush="true"/>
        <jsp:include page="./listarPersonaServlet" flush="true"/>
        <jsp:useBean id="oberol" class="allSafe.Entities.Tallaoberol" scope="page"/>
        <jsp:useBean id="pantalon" class="allSafe.Entities.Tallapantalon" scope="page"/>
        <jsp:useBean id="polera" class="allSafe.Entities.Tallapoleracamisa" scope="page"/>
        <jsp:useBean id="zapato" class="allSafe.Entities.Tallazapato" scope="page"/>
        <jsp:useBean id="cargo" class="allSafe.Entities.Cargo" scope="page"/>
        <jsp:useBean id="epp" class="allSafe.Entities.Epp" scope="page"/>
        <jsp:useBean id="tipoEpp" class="allSafe.Entities.Tipoepp" scope="page"/>
        
        <div class="jumbotron text-center">
            <h1>Gestión Epp</h1>
            <p>Realiza entrega de EPPS</p> 
        </div>
        
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-body">
                    <fieldset><legend>Datos trabajador</legend>

                        <form class="form-group" name="frmRegistroEntrega" method="post" action="./registroEntregaEPP">
                            <p>Rut <input class="form-control" type="text" name="txtRut"><input class="btn btn-primary" type="button" value="Ingresar Rut"/></p>
                            <p>Nombre trabajador<input class="form-control" type="text" name="txtNombre" disabled="true"></p>
                            
                            <legend>Lista Epps a entregar</legend>
                            <div class="container">

                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Overol</th>
                                            <td>Cant.</td>
                                            <th>Pantalón</th>
                                            <td>Cant.</td>
                                            <th>Polera</th>
                                            <td>Cant.</td>
                                            <th>Zapato</th>
                                            <th>Cant.</th>
                                        </tr>
                                    </thead>

                                    <td><select required name="ddlOberol">
                                            <option value="">--Seleccione--</option>
                                            <c:forEach items="${sessionScope.listaOberol}" var="oberol">
                                                <option value="${oberol.idTallaOberol}"><c:out value="${oberol.letraTallaOberol} - ${oberol.numeroTallaOberol}" ></c:out></option>
                                            </c:forEach>
                                        </select></td>
                                    <td><input type="text" name="cantOberol"></td>
                                    <td><select required name="ddlPantalon">
                                            <option value="">--Seleccione--</option>
                                            <c:forEach items="${sessionScope.listaPantalon}" var="pantalon">
                                                <option value="${pantalon.idTallaPantalon}"><c:out value="${pantalon.letraTallaPantalon} - ${pantalon.numeroTallaPantalon} " ></c:out></option>
                                            </c:forEach>
                                        </select></td>
                                    <td><input type="text" name="cantPantalon"></td>
                                    <td><select required name="ddlPolera">
                                            <option value="">--Seleccione--</option>
                                            <c:forEach items="${sessionScope.listaPolera}" var="polera">
                                                <option value="${polera.idTallaPoleraCamisa}"><c:out value="${polera.letraPoleraCamisa}- ${polera.numeroPoleraCamisa}" ></c:out></option>
                                            </c:forEach>
                                        </select></td>
                                    <td><input type="text" name="cantPolera"></td>
                                    <td><select required name="ddlZapato">
                                            <option value="">--Seleccione--</option>
                                            <c:forEach items="${sessionScope.listaZapato}" var="zapato">
                                                <option value="${zapato.idTallaZapato}"><c:out value="${zapato.numeroZapato}" ></c:out></option>
                                            </c:forEach>
                                        </select></td>
                                    <td><input type="text" name="cantZapato"></td>
                                </table>
                            </div>
                
                </div>
            </div>
        </div>




                            <canvas id="canvasEjemplo" width="300" height="200"></canvas>
                            <p>Firma recepción trabajdor</p>
                            <br><input type="button" id="borrador" value="Limpiar firma" />
                            <input type="submit" name="btnEntregar" value="Ingresar entrega">

</form>
                            <div class="container">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <fieldset><legend>Lista Epps entregados</legend>
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Nombre</th>
                                                        <th>Fecha entrega</th>
                                                        <th>Tipo epp</th>
                                                        <th>Epp</th>
                                                        <th>Cantidad</th>
                                                        <th>Talla</th>
                                                        <th>Firma</th>
                                                        <th><input class="btn btn-primary" type="button" value="Generar doc entrega"/></th>
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
                                    </div>
                                </div>
                            </div>
                            <script>

                                var miLienzo; // el canvas
                                var contexto; // el contexto
                                var canvasLimites; // los margenes del canvas
                                var flagPaint = false; // nos dice si pintar o no
                                var actualPos; // la posición actual donde hice click

                                function prepareCanvas() {
                                    miLienzo = document.getElementById("canvasEjemplo");
                                    contexto = miLienzo.getContext("2d"); // obtenemos el contexto ( dibujar en 2d)
                                    canvasLimites = miLienzo.getBoundingClientRect(); // obtenemos los limites del canvas
                                    miLienzo.addEventListener('mousedown', cambiarEstado, false);
                                    miLienzo.addEventListener('mouseup', cambiarEstado, false);
                                    miLienzo.addEventListener('mousemove', pintarLinea, false);
                                    miLienzo.style.cursor = "hand";

                                    borrador = document.getElementById("borrador");
                                    borrador.addEventListener('click', erase, false);
                                }

                                function cambiarEstado() {
                                    flagPaint = !flagPaint;
                                    actualPos = obtenerCoordenadas(event);
                                }

                                function pintarLinea(event) {

                                    if (flagPaint) {
                                        var coordenadas = obtenerCoordenadas(event);
                                        contexto.beginPath(); // comenzamos a dibujar
                                        contexto.moveTo(actualPos.x, actualPos.y); // ubicamos el cursor en la posicion (10,10)
                                        contexto.lineTo(coordenadas.x, coordenadas.y);
                                        actualPos = {
                                            x: coordenadas.x,
                                            y: coordenadas.y
                                        };
                                        contexto.strokeStyle = "#000"; // color de la linea
                                        contexto.stroke(); // dibujamos la linea
                                    }
                                }

                                function obtenerCoordenadas(event) {
                                    var posX;
                                    var posY;

                                    if (event.pageX || event.pageY) {
                                        posX = event.pageX - canvasLimites.left;
                                        posY = event.pageY - canvasLimites.top;
                                    } else {
                                        posX = event.clientX - canvasLimites.left;
                                        posY = event.clientY - canvasLimites.top;
                                    }

                                    return {x: posX,
                                        y: posY
                                    };
                                }
                                function erase() {
                                    contexto.clearRect(0, 0, miLienzo.width, miLienzo.height);
                                }

                            </script>
                        
                    </fieldset>
                    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
                    </body>

                    </html>
