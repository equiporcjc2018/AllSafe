<%-- 
    Document   : DevolucionToolCenter2
    Created on : 06-03-2019, 15:32:57
    Author     : RubenCarrasco
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>AllSafe - Devolución </title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/libs/css/style.css">
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        
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
       
       
        <script>
             $(document).ready(function ($)
            {
                $('#listadoDevolucion').DataTable({
                  info: true,
                  paging: true,
                  ordering: true,
                  searching: true,
            dom: "B",
            buttons: [
                //'copy', 'csv', 'excel', 'pdf', 'print',
                'excel', 'pdf',
            ]    
                });   
            });
        </script> 
        <script>
            $(document).ready(function() {
                $('#listadoReasignacion').DataTable();
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
                <jsp:include page="./listarInventarioServlet" flush="true"/> 
                <jsp:include page="./cargaPaisServlet" flush="true"/>
                
                <jsp:include page="./listarDevolucionToolServlet" flush="true"/> 
                <jsp:useBean id="epp" class="allSafe.Entities.Epp" scope="page"/>
                <jsp:useBean id="proyecto" class="allSafe.Entities.Proyecto" scope="page"/>
                <jsp:useBean id="pais" class="allSafe.Entities.Pais" scope="page"/>
                
                <jsp:useBean id="estadoproyecto" class="allSafe.Entities.Estadosproyecto" scope="page"/>
                <jsp:useBean id="listadoReasignacion" class="allSafe.Entities.Asignacantidadepp" scope="page"/>
                <!--jsp:useBean id="listadoDevolucion" class="allSafe.Entities.Asignacantidadepp" scope="page"/-->
                <c:choose>
                    <c:when test="${listadoDevolucion==null}">
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
                                        <h1 class="text-center">Devolución Tool Center</h1>                            
                                       
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end pageheader -->
                            <!-- ============================================================== -->
                            <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                <h3 class="section-title">Devolución Tool</h3>
                                <p>Aquí puedes realizar la devolución de Epp al tool center y reasignar a otro proyecto</p>
                                <div class="card">
                                    <h3 class="card-header">Devolución</h3>
                                    <div class="card-body">

                                        <form name="formGenExcel" method="post" action="./listarDevolucionToolServlet" >
                                            
                                            <div class="ink-form horizontal">
                                                <div class="form-row">
                                                    <label for="ddlProyecto-select">Proyecto</label>
                                                    <select required class="form-control" id="ddlProyecto" name="ddlProyecto">
                                                        <option value="">---Seleccione---</option>
                                                        <c:forEach items="${sessionScope.listadoProyectos}" var="proyecto">
                                                            <option value="<c:out value="${proyecto.idProyecto}"></c:out>"><c:out value="${proyecto.nombreProyecto}"></c:out></option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <br>
                                                <input type="submit" class="btn btn-success btn-space" name="btnGuardar" value="Buscar Proyecto">
                                                
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
                        <div class="container-fluid dashboard-content">
                            <div class="row">
                                
                                <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                <h3 class="section-title">Devolución Tool</h3>
                                <p>Aquí puedes realizar la devolución de Epp al tool center y reasignar a otro proyecto</p>
                                <div class="card">
                                    <h3 class="card-header">Devolución</h3>
                                    <div class="card-body">

                                        <form name="formGenExcel" method="post" action="./listarDevolucionToolServlet" >
                                            
                                            <div class="ink-form horizontal">
                                                <div class="form-row">
                                                    <label for="ddlProyecto-select">Proyecto</label>
                                                    <select required class="form-control" id="ddlProyecto" name="ddlProyecto">
                                                        <option value="">---Seleccione---</option>
                                                        <c:forEach items="${sessionScope.listadoProyectos}" var="proyecto">
                                                            <option value="<c:out value="${proyecto.idProyecto}"></c:out>"><c:out value="${proyecto.nombreProyecto}"></c:out></option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <br>
                                                <input type="submit" class="btn btn-success btn-space" name="btnGuardar" value="Buscar Proyecto">
                                                
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>

                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <h3 class="text-center">Devolución EPP a Tool Center</h3>
                                    <form name="frmRegistroEppProy" method="post" action="./registrarDevolucionToolCenterServlet">
                                        
                                        <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="card">
                                            <h2 class="card-header">Listado de Cantidades de Epp por proyecto</h2>
                                            <div class="card-body">


                                                <div class="table-responsive">
                                                    <c:choose>
                                                        <c:when test="${sessionScope.listadoDevolucion!=null}">
                                                            
                                                            <table class="table table-striped table-bordered"  id="listadoDevolucion">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Id</th>
                                                                        <th>Nombre</th>
                                                                        <th>Proyecto</th>
                                                                        <th>Id Epp</th>
                                                                        <th>Epp</th>
                                                                        <th>Stock</th>
                                                                        <th>Selección</th>
                                                                             
                                                                    </tr> 
                                                                </thead>
                                                                <tfoot>
                                                                    <tr>
                                                                        <th>Id</th>
                                                                        <th>Nombre</th>
                                                                        <th>Proyecto</th>
                                                                        <th>Id Epp</th>
                                                                        <th>Epp</th>
                                                                        <th>Stock</th>
                                                                        <th>Selección</th>
                                                                             
                                                                    </tr> 
                                                                </tfoot>
                                                                <tbody>
                                                                    <c:forEach items="${sessionScope.listadoDevolucion}" var="listadoDevolucion">
                                                                        <tr>
                                                                            <c:if test="${listadoDevolucion[5]>0}">
                                                                                <td><c:out value="${listadoDevolucion[0]}"/></td>
                                                                                <td><c:out value="${listadoDevolucion[1]}"/></td>
                                                                                <td><c:out value="${listadoDevolucion[2]}"/></td>
                                                                                <td><c:out value="${listadoDevolucion[3]}"/></td>
                                                                                <td><c:out value="${listadoDevolucion[4]}"/></td>
                                                                                <td><c:out value="${listadoDevolucion[5]}"/></td>
                                                                                <td style="display:none;"><input type="text" id="txtIdProy" name="txtIdProy" value="${listadoDevolucion[0]}" readonly="true" /></td>
                                                                                <td style="display:none;"><input type="text" id="txtCantidad" name="txtCantidad" value="${listadoDevolucion[5]}" readonly="true" /></td>

                                                                                <td>
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input  type="checkbox" id="listadoDevolucion${listadoDevolucion[3]}" name="chkDevIdEpp" value="${listadoDevolucion[3]}" class="custom-control-input">
                                                                                        <label class="custom-control-label" for="listadoDevolucion${listadoDevolucion[3]}"></label>

                                                                                    </div>

                                                                                </td>
                                                                             </c:if>
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
                                                <h2 class="card-header">Devolución Tool Center</h2>
                                                <div class="card-body">

                                                    <p><button type="submit" class="btn btn-success">Devolver</button></p>

                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    
                                    <hr>
                                
                                </div>

                               <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <h3 class="text-center">Reasginar EPP de Tool Center a otro Proyecto</h3>
                                    <form name="frmReasignaEpp" method="post" action="./xxxx">
                                        
                                        <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="card">
                                            <h2 class="card-header">Listado de Cantidades de Epp a Reasignar</h2>
                                            <div class="card-body">


                                                <div class="table-responsive">
                                                    <c:choose>
                                                        <c:when test="${sessionScope.listadoReasignacion!=null}">
                                                            
                                                            <table class="table table-striped table-bordered"  id="listadoReasignacion">
                                                                <thead>
                                                                    <tr class="warning">
                                                                        <th>Id</th>
                                                                        <th>Origen</th>
                                                                        <th>Proyecto Origen</th>
                                                                        <th>Id Epp</th>
                                                                        <th>Epp</th>
                                                                        <th>Stock Tool</th>
                                                                        <th>Proyecto Destino</th>
                                                                        <th>Selección</th>
                                                                             
                                                                    </tr> 
                                                                </thead>
                                                                <tfoot>
                                                                    <tr>
                                                                        <th>Id</th>
                                                                        <th>Nombre</th>
                                                                        <th>Proyecto</th>
                                                                        <th>Id Epp</th>
                                                                        <th>Epp</th>
                                                                        <th>Stock</th>
                                                                        <th>Proyecto Destino</th>
                                                                        <th>Selección</th>
                                                                             
                                                                    </tr> 
                                                                </tfoot>
                                                                <tbody>
                                                                    <c:forEach items="${sessionScope.listadoReasignacion}" var="listadoReasignacion">
                                                                        <tr>
                                                                            <td><c:out value="${listadoReasignacion[0]}"/></td>
                                                                            <td><c:out value="${listadoReasignacion[1]}"/></td>
                                                                            <td><c:out value="${listadoReasignacion[2]}"/></td>
                                                                            <td><c:out value="${listadoReasignacion[3]}"/></td>
                                                                            <td><c:out value="${listadoReasignacion[4]}"/></td>
                                                                            <td><c:out value="${listadoReasignacion[5]*-1}"/></td>
                                                                            <td>
                                                                                <select required="true"  id="ddlProyecto" name="ddlProyecto">
                                                                                    <option value="">---Seleccione---</option>
                                                                                    <c:forEach items="${sessionScope.listadoProyectos}" var="proyecto">
                                                                                        <option value="<c:out value="${proyecto.idProyecto}"></c:out>"><c:out value="${proyecto.nombreProyecto}"></c:out></option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </td>
                                                                            
                                                                          
                                                                            
                                                                            <td>
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input  type="checkbox" id="listadoReasignacion${listadoReasignacion[3]}" name="chkDevIdEpp" value="${listadoReasignacion[3]}" class="custom-control-input">
                                                                                        <label class="custom-control-label" for="listadoReasignacion${listadoReasignacion[3]}"></label>
                                                                                        
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
                                    <c:remove var="listadoDevolucion"/>   
                                        

                                        <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                            <div class="card">
                                                <h2 class="card-header">Reasignar</h2>
                                                <div class="card-body">

                                                    <p><button type="submit" class="btn btn-warning">Reasignar</button></p>

                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    
                                    <hr>
                                
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
                <!--<script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>-->
                <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
                <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
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