<%-- 
    Document   : MantenedorEntregaEPP
    Created on : 01-12-2018, 1:47:23
    Author     : rcv
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
        <title>AllSafe - Proceso</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/libs/css/style.css">
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">

        <link href="datatables/media/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        <script src="datatables/media/js/jquery.js" type="text/javascript"></script>
        <script src="datatables/media/js/jquery.dataTables.js" type="text/javascript"></script>
        <script>
            $(document).ready(function ()
            {
                $('#proyecto').DataTable();
            });
        </script> 
        <script>
            $(document).ready(function ()
            {
                $('#persona').DataTable();
            });
        </script> 
        <script>
            $(document).ready(function ()
            {
                $('#epp').DataTable();
            });
        </script> 
        <script>
            $(document).ready(function ()
            {
                $('#eppproceso').DataTable();
            });
        </script> 
    </head>



    <body onload="prepareCanvas();">
        <c:choose>

            <c:when test="${sessionScope.usuarioConectado!=null}">



                <jsp:useBean id="persona" class="allSafe.Entities.Persona" scope="page"/>
                <jsp:include page="./listarPersonaServlet" flush="true"/>
                <jsp:include page="./listarEppsServlet" flush="true"/>
                <jsp:include page="./listarTipoEppsServlet" flush="true"/>
                <jsp:useBean id="epp" class="allSafe.Entities.Epp" scope="page"/>
                <jsp:useBean id="tipoEpp" class="allSafe.Entities.Tipoepp" scope="page"/>

                <jsp:include page="./listarEppProcesoServlet" flush="true"/>
                <jsp:useBean id="eppproceso" class="allSafe.Entities.Eppproceso" scope="page"/>
                <jsp:include page="./listarEppTerrenoServlet" flush="true"/>
                <jsp:useBean id="eppterreno" class="allSafe.Entities.Eppterreno" scope="page"/>
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

                                        <div class="container-fluid">
                                            <div class="jumbotron text-center">
                                                <h1>Gestión EPP</h1>
                                                <p>Realiza entrega de EPP</p> 
                                            </div>


                                            <br>
                                            <br>
                                            <br>

<form name="frmBuscaColaborador" method="POST" action="./registroEntregaEPP">

                                                <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                                    <div class="card">
                                                        <h2 class="card-header">Seleccion de Persona</h2>
                                                        <div class="card-body">

                                                            <div class="table-responsive">
                                                                <c:choose>
                                                                    <c:when test="${sessionScope.listaTrabajadores!=null}">
                                                                        <table class="table table-striped table-bordered"  id="persona">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>rut</th>
                                                                                    <th>Nombre</th>
                                                                                    <th>Seleccion</th>
                                                                                </tr> 
                                                                            </thead>
                                                                            <tfoot>
                                                                                <tr>
                                                                                    <th>rut</th>
                                                                                    <th>Nombre</th>
                                                                                    <th>Seleccion</th>
                                                                                </tr> 
                                                                            </tfoot>
                                                                            <tbody>
                                                                                <c:forEach items="${sessionScope.listaTrabajadores}" var="persona">
                                                                                    <tr>
                                                                                        <td><c:out value="${persona.rutPasaportePersona}"/></td>
                                                                                        <td><c:out value="${persona.nombresPersona} ${persona.apePatPersona} ${persona.apePatPersona}"/></td>
                                                                                        <td>
                                                                                            <div class="custom-control custom-radio">
                                                                                                <input required type="radio" id="${persona.rutPasaportePersona}" name="rdbPersonaTerreno" value="${persona.rutPasaportePersona}" class="custom-control-input">
                                                                                                <label class="custom-control-label" for="${persona.rutPasaportePersona}"></label>
                                                                                            </div>

                                                                                        </td>

                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                    </c:when>

                                                                    <c:otherwise>
                                                                        No existen resultados
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>





                                                <br>
                                                <br>
                                                <br>


                                                <%--<p>Nombre trabajador<input class="form-control" type="text" name="txtNombre" disabled="true"></p>--%>

                                                <legend>Lista Epps a entregar</legend>


                                                <div class="container-fluid dashboard-content">
                                                    <div class="row">
                                                        <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                                            <div class="card">
                                                                <h2 class="card-header">Seleccion de EPP</h2>
                                                                <div class="card-body">

                                                                    <div class="table-responsive">

                                                                        <c:choose>
                                                                            <%--<c:when test="${sessionScope.listadoEpps!=null}">--%>
                                                                            <c:when test="${sessionScope.usuarioConectado!=null}">


                                                                                <table class="table table-striped table-bordered"  id="epp">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th>Nombre</th>
                                                                                            <th>Descripcion</th>
                                                                                            <th>Tipo</th>
                                                                                            <th>Seleccion</th>
                                                                                        </tr> 
                                                                                    </thead>
                                                                                    <tfoot>
                                                                                        <tr>
                                                                                            <th>Nombre</th>
                                                                                            <th>Descripcion</th>
                                                                                            <th>Tipo</th>
                                                                                            <th>Seleccion</th>
                                                                                        </tr> 
                                                                                    </tfoot>
                                                                                    <tbody>
                                                                                        <c:forEach items="${sessionScope.listadoEpps}" var="epp">
                                                                                            <tr>
                                                                                                <td><c:out value="${epp.nombreEPPcol}"/></td>
                                                                                                <td><c:out value="${epp.descripcionEPP}"/></td>
                                                                                                <td><c:out value="${epp.tipoEPPidTipoEPP.descripcionTipoEPP}"/></td>
                                                                                                <td>
                                                                                                    <div class="custom-control custom-radio">
                                                                                                        <input required type="radio" id="EPP${epp.idEPP}" name="rdbEpp" value="${epp.idEPP}" class="custom-control-input">
                                                                                                        <label class="custom-control-label" for="EPP${epp.idEPP}"></label>
                                                                                                    </div>

                                                                                                </td>

                                                                                            </tr>
                                                                                        </c:forEach>
                                                                                    </tbody>
                                                                                </table>

                                                                                <p><input type="submit" class="btn btn-success btn-space" name="btnGuardar" value="Asignar"></p>

                                                                                <br>
                                                                                <br>
                                                                                <br>
                                                                                

                                                                                <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                                                                    <div class="card">
                                                                                        <h2 class="card-header">Listado de EPP Asociados </h2>
                                                                                        <div class="card-body">


                                                                                            <div class="table-responsive">


                                                                                                <table class="table table-striped table-bordered"  id="eppproceso">
                                                                                                    <thead>
                                                                                                        <tr>
                                                                                                            <th>Fecha de Creacion</th>
                                                                                                            <th>Nombre Proyecto</th>
                                                                                                            <th>Estado Del EPP</th>
                                                                                                            <th>Rut del Trabajador</th>
                                                                                                            <th>Nombre Trabajador</th>
                                                                                                            <th>Talla EPP</th>

                                                                                                            <th>Nombre EPP</th>
                                                                                                            <th>Cantidad</th>


                                                                                                            <th>Editar</th>
                                                                                                            <th>Eliminar</th>    
                                                                                                        </tr> 
                                                                                                    </thead>
                                                                                                    <tfoot>
                                                                                                        <tr>
                                                                                                            <th>Fecha de Creacion</th>
                                                                                                            <th>Nombre Proyecto</th>
                                                                                                            <th>Estado Del EPP</th>
                                                                                                            <th>Rut del Trabajador</th>
                                                                                                            <th>Nombre Trabajador</th>
                                                                                                            <th>Talla EPP</th>

                                                                                                            <th>Nombre EPP</th>
                                                                                                            <th>Cantidad</th>


                                                                                                            <th>Editar</th>
                                                                                                            <th>Eliminar</th>
                                                                                                        </tr> 
                                                                                                    </tfoot>
                                                                                                    <tbody>
                                                                                                        <c:forEach items="${sessionScope.listadoEppTerreno}" var="eppterreno">
                                                                                                            <tr>
                                                                                                                <td><c:out value="${eppterreno.fechaEppTerreno}"/></td>
                                                                                                                <td><c:out value="${eppterreno.proyectoidProyecto.nombreProyecto}"/></td>
                                                                                                                <td><c:out value="${eppterreno.estadoEppTerreno}"/></td>
                                                                                                                <td><c:out value="${eppterreno.personarutPasaportePersona.rutPasaportePersona}"/></td>
                                                                                                                <td><c:out value="${eppterreno.personarutPasaportePersona.nombresPersona} ${eppterreno.personarutPasaportePersona.apePatPersona} ${eppterreno.personarutPasaportePersona.apeMatPersona} "/></td>
                                                                                                                <td><c:out value="${eppterreno.tallaEppTerreno}"/></td>
                                                                                                                <td><c:out value="${eppterreno.EPPidEPP.nombreEPPcol}"/></td>

                                                                                                                <td><c:out value="${eppterreno.cantidadEppTerreno}"/></td>


                                                                                                                <td><input type="button" class="btn btn-primary btn-space" name="btnEditar" value="Editar"/></td>
                                                                                                                <td><input type="button" class="btn btn-secondary btn-space"  name="btnEliminar" value="Eliminar"/></td>
                                                                                                            </tr>
                                                                                                        </c:forEach>
                                                                                                    </tbody>
                                                                                                </table>




                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div> 

                                                                                <div class="jumbotron text-center">
                                                                                    <p>Firma Recepción de EPP</p> 

                                                                                    <canvas id="canvasEjemplo" width="300" height="200"></canvas>
                                                                                    <p>Firma recepción trabajador</p>

                                                                                    <input type="file" name="foto"/>


                                                                                    <br><input type="button" id="borrador" value="Limpiar firma" />
                                                                                    <input type="submit" name="btnEntregar" value="Ingresar entrega">
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


                                                                            </c:when>

                                                                            <c:otherwise>
                                                                                No existen resultados
                                                                            </c:otherwise>






                                                                        </c:choose>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
</form>
                                                <!-- ============================================================== -->
                                                <!-- footer -->
                                                <!-- ============================================================== -->
                                                <jsp:include page="Footer.jsp" flush="true"/> 
                                                <!-- ============================================================== -->
                                                <!-- end footer -->
                                                <!-- ============================================================== -->








                                                <%-- </c:if> --%>
                                            </div>
                                        </div>
                                    </div>
                                    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
                                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

                                </div>


                            </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- footer -->
                    <!-- ============================================================== -->
                    <jsp:include page="common/Footer.jsp" flush="true"/> 
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