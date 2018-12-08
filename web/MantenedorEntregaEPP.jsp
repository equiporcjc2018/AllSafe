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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        
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
         <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" href="assets/vendor/charts/chartist-bundle/chartist.css">
    <link rel="stylesheet" href="assets/vendor/charts/morris-bundle/morris.css">
    <link rel="stylesheet" href="assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendor/charts/c3charts/c3.css">
    <link rel="stylesheet" href="assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
        <title>GestionEPP</title>
    </head>



    <body onload="prepareCanvas();">
        <c:choose>
            <c:when test="${usuarioConectado!=null}">
                
                
        <jsp:include page="./registroEntregaEPP" flush="true"/>    
        <jsp:useBean id="persona" class="allSafe.Entities.Persona" scope="page"/>   
        <!-- ============================================================== -->
                <!-- main wrapper -->
                <!-- ============================================================== -->
                <div class="dashboard-main-wrapper">
                    <!-- ============================================================== -->
                    <!-- navbar -->
                    <!-- ============================================================== -->
                    <jsp:include page="/common/Header.jsp" flush="true"/>
                    <!-- ============================================================== -->
                    <!-- end navbar -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- left sidebar -->
                    <!-- ============================================================== -->
                    <jsp:include page="/common/Menu.jsp" flush="true"/>
                    <!-- ============================================================== -->
                    <!-- end left sidebar -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- wrapper  -->
                    <!-- ============================================================== -->
        
                    <div class="dashboard-wrapper">
                        <div class="container-fluid dashboard-content">
                            <div class="row">

                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    
        <div class="jumbotron text-center">
            <h1>Gestión EPP</h1>
            <p>Realiza entrega de EPP</p> 
        </div>
        
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="container">
                    <fieldset><legend>Datos trabajador</legend>
                        <div class="jumbotron">
                        <div class="panel-body">
                        
                        <form name="frmBuscaColaborador" method="POST" action="./registroEntregaEPP">

                            <p>Rut <input class="form-control" type="text" name="txtRut">
                            <br>
                            <button type="submit" class="btn btn-default center-block">Buscar</button></p>
                        </form>
                            <p>Datos del colaborador </p>
                             
                            
                            <c:if test="${infoPersona!=null}">   
                                <table class="table table-bordered table-striped ">
                                   <thead>
                                       <tr>

                                           <td>Nombre</td>
                                           <td>Apellido Pat.</td>
                                           <td>Apellido Mat</td>
                                           <td>Talla Pantalon</td>
                                           <td>Talla Polera</td>
                                           <td>Talla Overol</td>
                                           <td>Talla Zapato</td>
                                   </thead>
                                   <tbody>
                                       <c:forEach items="${infoPersona}" var="persona">

                                           <tr>

                                           <!--td--><!--c:out value="$//{personal.rutPersonal}"/></td-->
                                           <td><c:out value="${persona.nombresPersona}"/></td>   
                                           <td><c:out value="${persona.apePatPersona}"/></td>
                                           <td><c:out value="${persona.apeMatPersona}"/></td>
                                           <td><c:out value="${persona.tallaPantalonidTallaPantalon.numeroTallaPantalon}"/></td>
                                           <td><c:out value="${persona.tallaPoleraCamisaidtallaPoleraCamisa.letraPoleraCamisa}"/></td>
                                           <td><c:out value="${persona.tallaOberolidTallaOberol.letraTallaOberol}"/></td>
                                           <td><c:out value="${persona.tallaZApatoidtallaZApato.numeroZapato}"/></td>

                                           </tr>

                                   </c:forEach>

                                   </tbody>
                               </table>
                            
                            
                            </div>
                            </div>
                            </div>
                             <%--<p>Nombre trabajador<input class="form-control" type="text" name="txtNombre" disabled="true"></p>--%>
                            
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
                </c:if>
                </div>
            </div>
        </div>

                        <c:if test="${infoPersona!=null}">   


                            <canvas id="canvasEjemplo" width="300" height="200"></canvas>
                            <p>Firma recepción trabajdor</p>
                            <br><input type="button" id="borrador" value="Limpiar firma" />
                            <input type="submit" name="btnEntregar" value="Ingresar entrega">


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
                            </c:if>
                            
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
                    
                     </div>


                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- footer -->
                        <!-- ============================================================== -->
                        <jsp:include page="Footer.jsp" flush="true"/> 
                        <!-- ============================================================== -->
                        <!-- end footer -->
                        <!-- ============================================================== -->
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end main wrapper -->
                <!-- ============================================================== -->
                <!-- Optional JavaScript -->
                <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
                <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
                <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
                <script src="assets/libs/js/main-js.js"></script> 
                    
                    </c:when>
            <c:otherwise>
                <c:redirect url="Login.jsp"/>
            </c:otherwise>
           </c:choose>
                    </body>

                    </html>