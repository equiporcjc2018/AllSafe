<%-- 
    Document   : AsignarEPPaProyecto
    Created on : 08-ene-2019, 0:18:24
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
        
        <script src="datatables/media/js/jquery.js" type="text/javascript"></script>
        <link href="datatables/media/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        <script src="datatables/media/js/jquery.dataTables.js" type="text/javascript"></script>
        
        
        <script>
            $(document).ready(function ()
            {
                $('#proyecto').DataTable();
            });
        </script> 
               
        <script>
            $(document).ready(function() {
            var groupColumn = 1;
            var table = $('#asignaeppproyecto').DataTable({
                "columnDefs": [
                    { "visible": false, "targets": groupColumn }
                ],
                "order": [[ groupColumn, 'asc' ]],
                "displayLength": 10,
                "drawCallback": function ( settings ) {
                    var api = this.api();
                    var rows = api.rows( {page:'current'} ).nodes();
                    var last=null;

                    api.column(groupColumn, {page:'current'} ).data().each( function ( group, i ) {
                        if ( last !== group ) {
                            $(rows).eq( i ).before(
                                '<tr class="group"><td colspan="5">'+group+'</td></tr>'
                            );

                            last = group;
                        }
                    } );
                }
            } );
 
    // Order by the grouping
            $('#asignaeppproyecto tbody').on( 'click', 'tr.group', function () {
                var currentOrder = table.order()[0];
                if ( currentOrder[0] === groupColumn && currentOrder[1] === 'asc' ) {
                    table.order( [ groupColumn, 'desc' ] ).draw();
                }
                else {
                    table.order( [ groupColumn, 'asc' ] ).draw();
                }
            } );
            
            $('#asignaeppproyecto tfoot th').each( function () {
                var title = $(this).text();
                $(this).html( '<input type="text" placeholder="Buscar '+title+'" />' );
            } );

            // DataTable
            var table = $('#asignaeppproyecto').DataTable();

            // Apply the search
            table.columns().every( function () {
                var that = this;

                $( 'input', this.footer() ).on( 'keyup change', function () {
                    if ( that.search() !== this.value ) {
                        that
                            .search( this.value )
                            .draw();
                    }
                } );
            } );
            
                        
            
        } );
        </script> 
                
        <script>
            $(document).ready(function() {
                
                
            // Setup - add a text input to each footer cell
            $('#epp tfoot th').each( function () {
                var title = $(this).text();
                $(this).html( '<input type="text" placeholder="Buscar '+title+'" />' );
            } );

            // DataTable
            var table = $('#epp').DataTable(
                
            );

            // Apply the search
            table.columns().every( function () {
                var that = this;

                $( 'input', this.footer() ).on( 'keyup change', function () {
                    if ( that.search() !== this.value ) {
                        that
                            .search( this.value )
                            .draw();
                    }
                } );
            } );
            
            $('a.toggle-vis').on( 'click', function (e) {
        e.preventDefault();
 
        // Get the column API object
        var column = table.column( $(this).attr('data-column') );
 
        // Toggle the visibility
        column.visible( ! column.visible() );
    } );
            
                
        } );
        
        
        </script> 
        
         


    </head>
    <body>
        <c:choose>
            <c:when test="${usuarioConectado!=null}">
                <jsp:include page="./cargaProyectoServlet" flush="true"/>
                
                <jsp:include page="./listarEppsServlet" flush="true"/>
                <jsp:include page="./listarEppNoEstandarServlet" flush="true"/>
                <jsp:include page="./listarEppProyectoServlet" flush="true"/>
                <jsp:include page="./listarEstadoProyectoServlet" flush="true"/> 
                <jsp:include page="./cargaPaisServlet" flush="true"/> 
                <jsp:useBean id="epp" class="allSafe.Entities.Epp" scope="page"/>
                <jsp:useBean id="proyecto" class="allSafe.Entities.Proyecto" scope="page"/>
                <jsp:useBean id="pais" class="allSafe.Entities.Pais" scope="page"/>
                
                <jsp:useBean id="estadoproyecto" class="allSafe.Entities.Estadosproyecto" scope="page"/>
                <jsp:useBean id="asignaeppproyecto" class="allSafe.Entities.Asignaeppaproyecto" scope="page"/>
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
                                    <form name="frmRegistroEppProy" method="post" action="./registroEppProy">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="section-block" id="basicform">
                                                <p>Aquí se asignan EPP a Proyectos</p>
                                            </div>

                                            <div class="card">
                                                <h5 class="card-header">Selección de Proyecto</h5>
                                                <div class="card-body">

                                                    <div class="table-responsive">
                                                        <c:choose>
                                                            <c:when test="${sessionScope.listadoProyectos!=null}">
                                                                <table class="table table-striped table-bordered" id="proyecto">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Id </th>
                                                                            <th>Número</th>
                                                                            <th>Nombre</th>
                                                                            <th>Empresa</th>
                                                                            <th>Pais</th>
                                                                            
                                                                            <th>Seleccion</th>
                                                                        </tr> 
                                                                    </thead>
                                                                    <tfoot>
                                                                        <tr>
                                                                            <th>Id </th>
                                                                            <th>Número</th>
                                                                            <th>Nombre</th>
                                                                            <th>Empresa</th>
                                                                            <th>Pais</th>
                                                                            
                                                                            <th>Seleccion</th>
                                                                        </tr> 
                                                                    </tfoot>
                                                                    <tbody>
                                                                        <c:forEach items="${sessionScope.listadoProyectos}" var="proyecto">
                                                                            <tr>
                                                                                <td><c:out value="${proyecto.idProyecto}"/></td>
                                                                                <td><c:out value="${proyecto.numeroProyecto}"/></td>
                                                                                <td><c:out value="${proyecto.nombreProyecto}"/></td>
                                                                                <td><c:out value="${proyecto.empresaidEmpresa.razonSocialEmpresa}"/></td>
                                                                                <td><c:out value="${proyecto.ciudadidCiudad.paisidPais.pais}"/></td>    
                                                                                    
                                                                                <td>
                                                                                    <div class="custom-control custom-radio">
                                                                                        <input required type="radio" id="proyecto${proyecto.idProyecto}" name="rdbProyecto" value="${proyecto.idProyecto}" class="custom-control-input">
                                                                                        <label class="custom-control-label" for="proyecto${proyecto.idProyecto}"></label>
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
                                        <hr>

                                        <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                            <div class="card">
                                                <h2 class="card-header">Selección de EPP Estándar</h2>
                                                <div class="card-body">
                                                    <hr>
                                        
                                        <hr>
                                                    <div class="table-responsive">
                                                        <c:choose>
                                                            <c:when test="${sessionScope.listadoEpps!=null}">
                                                                
                                                                <div class="text-center">
                                                                    <a class="toggle-vis btn btn-sm btn-info" data-column="0">Id</a>
                                                                    <a class="toggle-vis btn btn-sm btn-info" data-column="1">Nombre</a>
                                                                    <a class="toggle-vis btn btn-sm btn-info" data-column="2">Descripción</a>
                                                                    <a class="toggle-vis btn btn-sm btn-info" data-column="3">Tipo EPP</a>
                                                                    
                                                                </div>
                                                                <table class="table table-striped table-bordered"  id="epp">
                                                                
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Id</th>
                                                                            <th>Nombre</th>
                                                                            <th>Descripción</th>
                                                                            <th>Tipo EPP</th>
                                                                            
                                                                            <th>Seleccion</th>
                                                                        </tr> 
                                                                    </thead>
                                                                    <tfoot>
                                                                        <tr>
                                                                            <th>Id</th>
                                                                            <th>Nombre</th>
                                                                            <th>Descripción</th>
                                                                            <th>Tipo EPP</th>
                                                                            
                                                                            <th>Seleccion</th>
                                                                        </tr> 
                                                                    </tfoot>
                                                                    <tbody>
                                                                        <c:forEach items="${sessionScope.listadoEpps}" var="epp">
                                                                            <tr>
                                                                                <td><c:out value="${epp.idEPP}"/></td>
                                                                                <td><c:out value="${epp.nombreEPPcol}"/></td>
                                                                                <td><c:out value="${epp.descripcionEPP}"/></td>
                                                                                <td><c:out value="${epp.tipoEPPidTipoEPP.descripcionTipoEPP}"/></td>
                                                                                
                                                                                <td>
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input  type="checkbox" id="epp${epp.idEPP}" name="chkEpp" value="${epp.idEPP}" class="custom-control-input">
                                                                                        <label class="custom-control-label" for="epp${epp.idEPP}"></label>
                                                                                        
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
                                        
                                        <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                            <div class="card">
                                                <h2 class="card-header">Selección de EPP No Estándar</h2>
                                                <div class="card-body">
                                                    <hr>
                                        
                                        <hr>
                                                    <div class="table-responsive">
                                                        <c:choose>
                                                            <c:when test="${sessionScope.listadoEppNoEstandar!=null}">
                                                                
                                                                <div class="text-center">
                                                                    <a class="toggle-vis btn btn-sm btn-info" data-column="0">Id</a>
                                                                    <a class="toggle-vis btn btn-sm btn-info" data-column="1">Nombre</a>
                                                                    <a class="toggle-vis btn btn-sm btn-info" data-column="2">Descripción</a>
                                                                    <a class="toggle-vis btn btn-sm btn-info" data-column="3">Tipo EPP</a>
                                                                    
                                                                </div>
                                                                <table class="table table-striped table-bordered"  id="epp">
                                                                
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Id</th>
                                                                            <th>Nombre</th>
                                                                            <th>Descripción</th>
                                                                            <th>Tipo EPP</th>
                                                                            
                                                                            <th>Seleccion</th>
                                                                        </tr> 
                                                                    </thead>
                                                                    <tfoot>
                                                                        <tr>
                                                                            <th>Id</th>
                                                                            <th>Nombre</th>
                                                                            <th>Descripción</th>
                                                                            <th>Tipo EPP</th>
                                                                            
                                                                            <th>Seleccion</th>
                                                                        </tr> 
                                                                    </tfoot>
                                                                    <tbody>
                                                                        <c:forEach items="${sessionScope.listadoEppNoEstandar}" var="eppNoE">
                                                                            <tr>
                                                                                <td><c:out value="${eppNoE.idEPP}"/></td>
                                                                                <td><c:out value="${eppNoE.nombreEPPcol}"/></td>
                                                                                <td><c:out value="${eppNoE.descripcionEPP}"/></td>
                                                                                <td><c:out value="${eppNoE.tipoEPPidTipoEPP.descripcionTipoEPP}"/></td>
                                                                                
                                                                                <td>
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input  type="checkbox" id="epp${eppNoE.idEPP}" name="chkEpp" value="${eppNoE.idEPP}" class="custom-control-input">
                                                                                        <label class="custom-control-label" for="epp${eppNoE.idEPP}"></label>
                                                                                        
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
                                        

                                        <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                            <div class="card">
                                                <h2 class="card-header">Asignar</h2>
                                                <div class="card-body">

                                                    <p><input type="submit" class="btn btn-success btn-space" name="btnGuardar" value="Registrar"></p>

                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    
                                    <hr>
                                    <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="card">
                                            <h2 class="card-header">Listado de EPP asociado a Proyectos</h2>
                                            <div class="card-body">


                                                <div class="table-responsive">
                                                    <c:choose>
                                                        <c:when test="${sessionScope.listadoEppProyecto!=null}">
                                                            <table class="table table-striped table-bordered"  id="asignaeppproyecto">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Número Proyecto</th>
                                                                        <th>Nombre Proyecto</th>
                                                                        <th>Proyecto Vigente</th>
                                                                        <th>Nombre Epp</th>
                                                                        <th>Descripción Epp</th>
                                                                        <th>Eliminar</th>      
                                                                    </tr> 
                                                                </thead>
                                                                <tfoot>
                                                                    <tr>
                                                                        <th>Número Proyecto</th>
                                                                        <th>Nombre Proyecto</th>
                                                                        <th>Proyecto Vigente</th>
                                                                        <th>Nombre Epp</th>
                                                                        <th>Descripcion Epp</th>
                                                                        
                                                                        <th>Eliminar</th>      
                                                                    </tr> 
                                                                </tfoot>
                                                                <tbody>
                                                                    <c:forEach items="${sessionScope.listadoEppProyecto}" var="asignaeppproyecto">
                                                                        <tr>
                                                                            <td><c:out value="${asignaeppproyecto.proyectoidProyecto.numeroProyecto}"/></td>
                                                                            <td><c:out value="${asignaeppproyecto.proyectoidProyecto.nombreProyecto}"/></td>
                                                                            <td><c:out value="${asignaeppproyecto.proyectoidProyecto.vigenteproyecto}"/></td>
                                                                            <td><c:out value="${asignaeppproyecto.eppidEPP.nombreEPPcol}"/></td>
                                                                            <td><c:out value="${asignaeppproyecto.eppidEPP.descripcionEPP}"/></td>
                                                                            
                                                                           
                                                                            
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
                <%-- <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script> --%>
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

