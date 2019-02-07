<%-- 
    Document   : AsignarCargaInicialEpp
    Created on : 12-ene-2019, 16:39:01
    Author     : Ruben
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

    <title>AllSafe - Asignar Carga Inicial EPP </title>
    <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/libs/css/style.css">
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        
        <script src="datatables/media/js/jquery.js" type="text/javascript"></script>
        <link href="datatables/media/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        <script src="datatables/media/js/jquery.dataTables.js" type="text/javascript"></script>
        
            
        <script>
             $(document).ready(function() 
            {
                var table = $('#asignaeppcantidad').DataTable();

                $('#asignaeppcantidad tbody').on('click', 'tr', function () {
                    var data = table.row( this ).data();
                    alert( 'Proyecto '+data[1]+' seleccionado' );
                } );
            } );
        </script>
    
    <script>
     $(document).ready(function() {
                let modal = JQuery("#editModal");
                
            // Setup - add a text input to each footer cell
            $('#asignaeppcantidad tfoot th').each( function () {
                var title = $(this).text();
                $(this).html( '<input type="text" placeholder="Buscar '+title+'" />' );
            } );

            // DataTable
            var table = $('#asignaeppcantidad').DataTable(
                
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
                <jsp:include page="./listarEppProyectoServlet" flush="true"/>
                <jsp:include page="./listarEstadoProyectoServlet" flush="true"/> 
                <jsp:include page="./cargaPaisServlet" flush="true"/> 
                <jsp:useBean id="epp" class="allSafe.Entities.Epp" scope="page"/>
                <jsp:useBean id="proyecto" class="allSafe.Entities.Proyecto" scope="page"/>
                <jsp:useBean id="pais" class="allSafe.Entities.Pais" scope="page"/> 
                <jsp:useBean id="estadoproyecto" class="allSafe.Entities.Estadosproyecto" scope="page"/>
                <jsp:useBean id="asignaeppcantidad" class="allSafe.Entities.Asignaeppaproyecto" scope="page"/>
                
                
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
                        <div class="col-md-12">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <h2 class="text-center">Asignar EPP a Proyecto</h2>
                                    <form name="frmRegistroEppProy2" method="post" action="./registroCargaEppCantidad" id="formulario">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="section-block" id="basicform">
                                                <h3>Aquí se ingresan las cantidades de los Epp-Proy</h3>
                                                  
                                            </div>

                                        </div>      
                                        <hr>

                                        <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                            <div class="card">
                                                <h3 class="card-header">Ingreso de Cantidades de EPP</h3>
                                                <div class="card-body">
                                                    <hr>
                                        
                                        <hr>
                                                    <div class="table-responsive">
                                                        <c:choose>
                                                            <c:when test="${sessionScope.listadoEppProyecto!=null}">
                                                                
                                                                <div class="text-center">
                                                                    <a class="toggle-vis btn btn-sm btn-info" data-column="0">0 Id</a>
                                                                    <a class="toggle-vis btn btn-sm btn-info" data-column="1">1 Num. proy</a>
                                                                    <a class="toggle-vis btn btn-sm btn-info" data-column="2">2 Nombre proy</a>
                                                                    <a class="toggle-vis btn btn-sm btn-info" data-column="3">3 Nombre Epp</a>
                                                                    
                                                                    
                                                                </div>
                                                               <table class="table table-striped table-bordered" id="asignaeppcantidad">
                                                                
                                                                    <thead>
                                                                        <tr>
                                                                            <th>0 Id</th>
                                                                            <th>1 Num. proy</th>
                                                                            <th>2 Nombre proy</th>
                                                                            <th>3 Nombre Epp</th>
                                                                                                                                                     
                                                                            <th>6 Accion</th>  
                                                                        </tr> 
                                                                    </thead>
                                                                    <tfoot>
                                                                        <tr>
                                                                            <th>0 Id</th>
                                                                            <th>1 Num. proy</th>
                                                                            <th>2 Nombre proy</th>
                                                                            <th>3 Nombre Epp</th>
                                                                                                                                                       
                                                                            <th>6 Accion</th>  
                                                                        </tr> 
                                                                    </tfoot>
                                                                    <tbody>
                                                                        <c:forEach items="${sessionScope.listadoEppProyecto}" var="asignaeppcantidad">
                                                                            
                                                                            
                                                                            <tr>
                                                                                <td><a  id="idProy"><c:out value="${asignaeppcantidad.idasignaeppaproyecto}"/></a></td>
                                                                                <td><c:out value="${asignaeppcantidad.proyectoidProyecto.numeroProyecto}"/></td>
                                                                                <td><c:out value="${asignaeppcantidad.proyectoidProyecto.nombreProyecto}"/></td>
                                                                                <td><c:out value="${asignaeppcantidad.eppidEPP.nombreEPPcol}"/></td>
                                                                               
                                                                                <!--
                                                                                <td>
                                                                                    <select id="moneda" class="form-control">
                                                                                        <option value="" disabled selected>Elige tu Moneda </option>
                                                                                        <option value="USD">Dolar Estadounidense</option>
                                                                                        <option value="MXN">Peso Mexicano</option>
                                                                                        <option value="GBP">Libras</option>
                                                                                        <option value="EUR">Euros</option>
                                                                                    </select>
                                                                                </td>
                                                                                 -->
                                                                                <td>
                                                                                    <button type="button" class="btn btn-primary mb-2 mb-sm-0" data-toggle="modal" data-target="#contacto">Ingresar</button>
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
                                        
                                         <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
                                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                </div>
                                                <div class="modal-body">
                                                  ...
                                                </div>
                                                <div class="modal-footer">
                                                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                  <button type="button" class="btn btn-primary">Save changes</button>
                                                </div>
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
                                                            <table class="table table-striped table-bordered"  id="asignaeppproyecto2">
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
                                                                    <c:forEach items="${sessionScope.listadoEppProyecto}" var="asignaeppproyecto2">
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
                </div>
 </div>
                </div>
     
     <!-- Modal  Contacto-->
    <div class="modal fade" id="contacto" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content bg-dark text-light">
            <div class="modal-header">
            <h5 class="modal-title display-4" id="exampleModalLongTitle">Ingresar Valores EPP</h5>
            
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span class="fa-layers fa-fw">
                    <i class="fas fa-circle" style="color:Tomato"></i>
                    <i class="fa-inverse fas fa-times" data-fa-transform="shrink-6"></i>
                </span>
            </button>
            </div>
            <div class="modal-body">
            <div class="row">
                <div class="col-md-6 mb-3 mb-md-0">
                    <form name="frmRegistroEppProy" method="post" action="./registroCargaEppCantidad">
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Talla</label>
                            <input type="text" class="form-control" id="recipient-name">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Unidad</label>
                            
                            <input type="number" class="form-control" id="txtTalla" name="txtTalla" placeholder="Ingrese Dias"  maxlength="30">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Cantidad</label>
                            <input type="text" class="form-control" id="recipient-name">
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Precio</label>
                            <textarea class="form-control" id="message-text"></textarea>
                        </div>
                        <button class="btn btn-primary">Ingresar</button>
                    </form>
                </div>
                <div class="col-md-6">
                    <img src="01.jpg" alt="" class="img-fluid rounded">
                    <h5 class="font-weight-light mt-2">Teléfono: +56 5 5555 5555</h5>
                    <h5 class="font-weight-light">Email: ventas@all-safe.cl</h5>
                    <h5 class="font-weight-light">Dirección: Av. Calle #555. Santiago</h5>
                    <h5 class="font-weight-light">
                        <a href="#" class="text-light">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="text-light">
                            <i class="fab fa-phoenix-framework"></i>
                        </a>
                        <a href="#" class="text-light">
                            <i class="fab fa-reddit-alien"></i>
                        </a>
                    </h5>
                </div>
            </div>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
        </div>
    </div>
     <!-- Modal  contacto-->
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
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

