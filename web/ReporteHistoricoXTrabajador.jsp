<%-- 
    Document   : ReporteHistoricoXTrabajador
    Created on : 09-02-2019, 14:28:50
    Author     : hachi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/libs/css/style.css">
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <link rel="stylesheet" href="assets/vendor/charts/morris-bundle/morris.css">
        <script src="datatables/media/js/jquery.js" type="text/javascript"></script>
        <link href="datatables/media/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        <script src="datatables/media/js/jquery.dataTables.js" type="text/javascript"></script>
        
        <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.4.2/css/buttons.dataTables.min.css">
        
            <script src="//cdn.datatables.net/buttons/1.4.2/js/dataTables.buttons.min.js"></script>
                <script src="//cdn.datatables.net/buttons/1.4.2/js/buttons.flash.min.js"></script>
                <script src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
                <script src=" //cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
                <script src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
                <script src="//cdn.datatables.net/buttons/1.4.2/js/buttons.html5.min.js"></script>
                <script src=" //cdn.datatables.net/buttons/1.4.2/js/buttons.print.min.js"></script>
        
        <title>Reporte Historico Por Rut de Trabajador</title>
        
        <script>
            $(document).ready(function ($)
            {
                $('#terreno').DataTable({
                  info: true,
                  paging: true,
                  ordering: true,
                  searching: true,
                  
                  
            dom: "Bfrtip",
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
                
            ]
            
                    
                });
                
                
            });
        </script>    
        
    </head>
    <body>
                <c:choose>
            <c:when test="${usuarioConectado!=null}">
                <jsp:useBean id="eppTerreno" class="allSafe.Entities.Eppterreno" scope="page"/>
                <jsp:useBean id="persona" class="allSafe.Entities.Persona" scope="page"/>
                <c:choose>
                    <c:when test="${rutBuscadoHistorico==null && PersonaBuscada==null}">
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
                        <div class="container-fluid  dashboard-content">
                            <!-- ============================================================== -->
                            <!-- pageheader -->
                            <!-- ============================================================== -->
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="page-header">
                                        <h1 class="text-center">Reporte Entrega a cliente</h1>                            
                                       
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end pageheader -->
                            <!-- ============================================================== -->
                            <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                <h3 class="section-title">Generador de reporte</h3>
                                <p>Aquí puedes generar un reporte al ingresar el rut de un trabajador</p>
                                <div class="card">
                                    <h3 class="card-header">Generar Reporte</h3>
                                    <div class="card-body">

                                        <form name="formGenExcel" method="post" action="./buscarEppTerrenoXRutServlet" >
                                            
                                            <div class="ink-form horizontal">
                                                <div class="form-row ">
                                                        <div class="form-group col-md-6">
                                                            <label for="txtRutPersona" class="col-form-label">Ingrese rut:</label>
                                                            <input id="txtRutPersona" name="txtRutPersona" type="text" class="form-control " required>

                                                        </div>
                                                        
                                                    </div>


                                                    <input type="submit" class="btn btn-success btn-space" name="btnGuardar" value="Buscar Rut">
                                                
                                            </div>
                                        </form>

                                    </div>
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
                <script src="assets/vendor/charts/morris-bundle/raphael.min.js"></script>
                <script src="assets/vendor/charts/morris-bundle/morris.js"></script>
                <script src="assets/vendor/charts/morris-bundle/Morrisjs.js"></script>
                <script src="assets/libs/js/main-js.js"></script>
                    </c:when>
                    <c:otherwise>
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
                        <div class="container-fluid  dashboard-content">
                            <!-- ============================================================== -->
                            <!-- pageheader -->
                            <!-- ============================================================== -->
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="page-header">
                                        <h1 class="text-center">Reporte Entrega a cliente</h1>                            
                                       
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end pageheader -->
                            <!-- ============================================================== -->
                            <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                <h3 class="section-title">Generador de reporte</h3>
                                <p>Aquí puedes generar un reporte al ingresar el rut de un trabajador</p>
                                <div class="card">
                                    <h3 class="card-header">Generar Reporte</h3>
                                    <div class="card-body">

                                        
                                        
                                        <form name="formGenExcel" method="post" action="./buscarEppTerrenoXRutServlet" >
                                            
                                            <div class="ink-form horizontal">
                                                <div class="form-row ">
                                                        <div class="form-group col-md-6">
                                                            <label for="txtRutPersona" class="col-form-label">Ingrese rut:</label>
                                                            <input id="txtRutPersona" name="txtRutPersona" type="text" class="form-control " required>

                                                        </div>
                                                        
                                                    </div>


                                                    <input type="submit" class="btn btn-success btn-space" name="btnGuardar" value="Buscar Rut">
                                                
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="card">
                                            <h3 class="card-header">Rut Consultado</h3>
                                            <div class="card-body">

                                                <div class="table-responsive">
                                                    <c:choose>
                                                        <c:when test="${sessionScope.rutBuscadoHistorico!=null && sessionScope.PersonaBuscada!=null}">
                                                            <table class="table table-striped" id="terreno">
                                                                <caption> <b>NOMBRE TRABAJADOR:</b> <c:out value="${PersonaBuscada.nombresPersona}"/> <c:out value="${PersonaBuscada.apePatPersona}"/> <c:out value="${PersonaBuscada.apeMatPersona}"/> <br>
                                                                    <b>RUT TRABAJADOR:</b> <c:out value="${PersonaBuscada.rutPasaportePersona}"/></caption>
                                                                <thead>
                                                                    
                                                                    <tr>
                                                                        <th>Proyecto</th>
                                                                        <th>Numero EPP</th>
                                                                        <th>Cantidad</th>
                                                                        <th>Talla</th>
                                                                        <th>Fecha</th>
                                                                        <th>Iniciales</th>
                                                                        <th>Observaciones</th>                                                                      
                                                                    </tr> 
                                                                </thead>
                                                                <tfoot>
                                                                    <tr>
                                                                        <th>Proyecto</th>
                                                                        <th>Numero EPP</th>
                                                                        <th>Cantidad</th>
                                                                        <th>Talla</th>
                                                                        <th>Fecha</th>
                                                                        <th>Iniciales</th>
                                                                        <th>Observaciones</th> 
                                                                    </tr> 
                                                                </tfoot>
                                                                <tbody>
                                                                    
                                                                    <c:forEach items="${sessionScope.rutBuscadoHistorico}" var="eppTerreno">
                                                                        <tr>                                                                          
                                                                            <td><c:out value="${eppTerreno.proyectoidProyecto.nombreProyecto}"/></td>
                                                                            <td><c:out value="${eppTerreno.EPPidEPP.nombreEPPcol}"/></td>
                                                                            <td><c:out value="${eppTerreno.cantidadEppTerreno}"/></td>
                                                                            <td><c:out value="${eppTerreno.tallaEppTerreno}"/></td>
                                                                            <td><c:out value="${eppTerreno.fechaEppTerreno}"/></td>
                                                                            <td><c:out value="${eppTerreno.personarutPasaportePersona.nombresPersona.charAt(0)}.${eppTerreno.personarutPasaportePersona.apePatPersona.charAt(0)}.${eppTerreno.personarutPasaportePersona.apeMatPersona.charAt(0)}"/></td>
                                                                            <td><c:out value="${eppTerreno.observacionEppTerreno}"/></td>
                                                                            
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
                            <c:remove var="RutBuscadoHistorico"/>
                            <c:remove var="PersonaBuscada"/>
                                
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
                <script src="assets/vendor/charts/morris-bundle/raphael.min.js"></script>
                <script src="assets/vendor/charts/morris-bundle/morris.js"></script>
                <script src="assets/vendor/charts/morris-bundle/Morrisjs.js"></script>
                <script src="assets/libs/js/main-js.js"></script>
                    </c:otherwise>
                </c:choose>
                
            </c:when>
            
            <c:otherwise>
                <c:redirect url="Login.jsp"/>
            </c:otherwise>
        </c:choose>
        
    </body>
</html>
