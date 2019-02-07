<%-- 
    Document   : AsignarCargaInicialEpp2
    Created on : 17-ene-2019, 20:00:14
    Author     : Ruben
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>AllSafe - Asignar EPP a Proy. </title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/libs/css/style.css">
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
        
        <script src="datatables/media/js/jquery.js" type="text/javascript"></script>
        <link href="datatables/media/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        <script src="datatables/media/js/jquery.dataTables.js" type="text/javascript"></script>
       
       
        <script>
            $(document).ready(function() {
            var table = $('#asignaeppproyecto').DataTable();

            $('button').click( function() {
                var data = table.$('input, select').serialize();
                
            } );
        } );
        </script> 
        
        
        
         


    </head>
    <body>
        <c:choose>
            <c:when test="${usuarioConectado!=null}">
                <jsp:include page="./cargaProyectoServlet" flush="true"/>
                <jsp:include page="./listarEppsServlet" flush="true"/>
                <jsp:include page="./listarEppProyectoServlet" flush="true"/>
                <jsp:include page="./listarEstadoProyectoServlet" flush="true"/> 
                <jsp:include page="./listarCantidadEppProyectoServlet" flush="true"/> 
                <jsp:include page="./cargaPaisServlet" flush="true"/> 
                <jsp:useBean id="epp" class="allSafe.Entities.Epp" scope="page"/>
                <jsp:useBean id="proyecto" class="allSafe.Entities.Proyecto" scope="page"/>
                <jsp:useBean id="pais" class="allSafe.Entities.Pais" scope="page"/>
                
                <jsp:useBean id="estadoproyecto" class="allSafe.Entities.Estadosproyecto" scope="page"/>
                <jsp:useBean id="listadoEppCantidadProyecto" class="allSafe.Entities.Asignacantidadepp" scope="page"/>
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
                                    <h3 class="text-center">Asignar EPP a Proyecto</h3>
                                    <form name="frmRegistroEppProy" method="post" action="./registroCargaEppCantidad">
                                       <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="card">
                                            <h2 class="card-header">Listado de EPP asociado a Proyectos</h2>
                                            <div class="card-body">


                                                <div class="table-responsive">
                                                    <c:choose>
                                                        <c:when test="${sessionScope.listadoEppProyecto!=null}">
                                                            <table id="asignaeppproyecto" class="display" style="width:100%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Número Proyecto</th>
                                                                        <th>Nombre Proyecto</th>
                                                                        <th>Nombre Epp</th>
                                                                        <th>Cantidad</th>
                                                                        <th>Eliminar</th>      
                                                                    </tr> 
                                                                </thead>
                                                                <tfoot>
                                                                    <tr>
                                                                        <th>Número Proyecto</th>
                                                                        <th>Nombre Proyecto</th>
                                                                        <th>Nombre Epp</th>
                                                                        <th>Cantidad</th>
                                                                        
                                                                        <th>Eliminar</th>      
                                                                    </tr> 
                                                                </tfoot>
                                                                <tbody>
                                                                    <c:forEach items="${sessionScope.listadoEppProyecto}" var="asignaeppproyecto">
                                                                        <tr>
                                                                            <td><c:out value="${asignaeppproyecto.proyectoidProyecto.numeroProyecto}"/></td>
                                                                            <td><c:out value="${asignaeppproyecto.proyectoidProyecto.nombreProyecto}"/></td>
                                                                            <td style="display:none;"><input type="text" id="txtIdEpp" name="txtIdEpp" value="${asignaeppproyecto.eppidEPP.idEPP}" readonly="true" /></td>                                                                                                                                                                                                                                        
                                                                            <td><c:out value="${asignaeppproyecto.eppidEPP.nombreEPPcol}"/></td>
                                                                            <td><input type="text" id="row-1-age" name="txtCantidad"></td>
                                                                            
                                                                           
                                                                            
                                                                            <td><input type="button" class="btn btn-secondary btn-space"  name="btnEliminar" value="Eliminar"/></td>
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
                                       
                                        

                                        <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                            <div class="card">
                                                <h2 class="card-header">Ingresar Cantidad</h2>
                                                <div class="card-body">

                                                    <p><button type="submit" class="btn btn-success">Registrar</button></p>

                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    
                                    <hr>
                                    
                                    <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="card">
                                            <h2 class="card-header">Listado de Cantidades de Epp</h2>
                                            <div class="card-body">


                                                <div class="table-responsive">
                                                    <c:choose>
                                                        <c:when test="${sessionScope.listadoEppCantidadProyecto!=null}">
                                                            
                                                            <table class="table table-striped table-bordered"  id="listadoEppCantidadProyecto">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Id</th>
                                                                        <th>Número Proyecto</th>
                                                                        <th>Nombre Proyecto</th>
                                                                        <th>Nombre Epp</th>
                                                                        <th>Cantidad</th>
                                                                        <th>Eliminar</th>      
                                                                    </tr> 
                                                                </thead>
                                                                <tfoot>
                                                                    <tr>
                                                                        <th>Id</th>
                                                                        <th>Número Proyecto</th>
                                                                        <th>Nombre Proyecto</th>
                                                                        <th>Nombre Epp</th>
                                                                        <th>Cantidad</th>
                                                                        <th>Eliminar</th>      
                                                                    </tr> 
                                                                </tfoot>
                                                                <tbody>
                                                                    <c:forEach items="${sessionScope.listadoEppCantidadProyecto}" var="listadoEppCantidadProyecto">
                                                                        <tr>
                                                                            <td><c:out value="${listadoEppCantidadProyecto.idEppProceso}"/></td>
                                                                            <td><c:out value="${listadoEppCantidadProyecto.asignaeppaproyectoIdasignaeppaproyecto.proyectoidProyecto.numeroProyecto}"/></td>
                                                                            <td><c:out value="${listadoEppCantidadProyecto.asignaeppaproyectoIdasignaeppaproyecto.proyectoidProyecto.nombreProyecto}"/></td>
                                                                            <td><c:out value="${listadoEppCantidadProyecto.asignaeppaproyectoIdasignaeppaproyecto.eppidEPP.nombreEPPcol}"/></td>
                                                                            <td><c:out value="${listadoEppCantidadProyecto.cantidadEppProceso}"/></td>
                                                                            
                                                                            
                                                                           
                                                                            
                                                                            <td><input type="button" class="btn btn-secondary btn-space"  name="btnEliminar" value="Eliminar"/></td>
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