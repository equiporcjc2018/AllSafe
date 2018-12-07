<%-- 
    Document   : MantenedorProcesoEPP
    Created on : 05-12-2018, 23:19:18
    Author     : hachi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Concept - Bootstrap 4 Admin Dashboard Template</title>
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
    <body>
        <jsp:include page="./cargaProyectoServlet" flush="true"/>
        <jsp:include page="./listarEppsServlet" flush="true"/>
        <jsp:include page="./listarPersonaServlet" flush="true"/>
        <jsp:include page="./listarEppProcesoServlet" flush="true"/>
        <jsp:include page="./listarEstadoProyectoServlet" flush="true"/> 
        <jsp:useBean id="persona" class="allSafe.Entities.Persona" scope="page"/>
        <jsp:useBean id="proyecto" class="allSafe.Entities.Proyecto" scope="page"/>
        <jsp:useBean id="epp" class="allSafe.Entities.Epp" scope="page"/>
        <jsp:useBean id="estadoproyecto" class="allSafe.Entities.Estadosproyecto" scope="page"/>
        <jsp:useBean id="eppproceso" class="allSafe.Entities.Eppproceso" scope="page"/>
        <!-- ============================================================== -->
        <!-- main wrapper -->
        <!-- ============================================================== -->
        <div class="dashboard-main-wrapper">
            <!-- ============================================================== -->
            <!-- navbar -->
            <!-- ============================================================== -->
            <div class="dashboard-header">
                <nav class="navbar navbar-expand-lg bg-white fixed-top">
                    <a class="navbar-brand" href="index.html">
                        AllSafe <i class="fa fa-user-secret" aria-hidden="true"></i>
                    </a>
                    <h5>
                        Bienvenido ${usuarioConectado.personarutPasaportePersona.nombresPersona} 
                        ${usuarioConectado.personarutPasaportePersona.apePatPersona}
                    </h5>                
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse " id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto navbar-right-top">                        
                            <li class="nav-item dropdown nav-user">
                                <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="http://www.coordinadora.com/wp-content/uploads/sidebar_usuario-corporativo.png" alt="" class="user-avatar-md rounded-circle"></a>
                                <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                    <div class="nav-user-info">
                                        <h5 class="mb-0 text-white nav-user-name">
                                            ${usuarioConectado.personarutPasaportePersona.nombresPersona} 
                                            ${usuarioConectado.personarutPasaportePersona.apePatPersona}
                                        </h5>
                                        <span class="status"></span><span class="ml-2">Available</span>
                                    </div>                                                                
                                    <a class="dropdown-item" href="/AllSafe/Login.jsp" ><i class="fas fa-power-off mr-2"></i>Logout</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>      
            </div>
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
                            <h3 class="text-center">Proceso de EPP</h3>
<form name="frmRegistroEppProceso" method="post" action="./registroEppProcesoServlet">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="section-block" id="basicform">
                                    <h3 class="section-title">Proceso de EPP</h3>
                                    <p>Aqui se asignan Epps a proyectos y Trabajadores </p>
                                </div>
                                
                                <div class="card">
                                    <h5 class="card-header">Seleccion de Proyecto</h5>
                                    <div class="card-body">

                                        <div class="table-responsive">
                                            <c:choose>
                                                <c:when test="${sessionScope.listadoProyectos!=null}">
                                                    <table class="table table-striped table-bordered" id="proyecto">
                                                        <thead>
                                                            <tr>
                                                                <th>id </th>
                                                                <th>Nombre</th>
                                                                <th>Empresa</th>
                                                                <th>Pais</th>
                                                                <th>Seleccion</th>
                                                            </tr> 
                                                        </thead>
                                                        <tfoot>
                                                            <tr>
                                                                <th>id </th>
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
                                                                    <td><c:out value="${proyecto.nombreProyecto}"/></td>
                                                                    <td><c:out value="${proyecto.empresaidEmpresa.razonSocialEmpresa}"/></td>
                                                                    <td><c:out value="${proyecto.ciudadidCiudad.paisidPais.pais}"/></td>    
                                                                    <td><input   type="radio" name="rdbProyecto" value="${proyecto.idProyecto}" /></td>
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
                                                                <td><input  type="radio"  name="rdbPersona" value="${persona.rutPasaportePersona}" /></td>
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
                                    <h2 class="card-header">Seleccion de EPP</h2>
                                    <div class="card-body">

                                        <div class="table-responsive">
                                            <c:choose>
                                            <c:when test="${sessionScope.listadoEpps!=null}">
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
                                                                <td><input type="radio"  name="rdbEpp" value="${epp.idEPP}" /></td>
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
                                    <h2 class="card-header">Datos de Proceso</h2>
                                    <div class="card-body">

                                        <div class="form-group ">
                                            <label for="ddlEstadoProyecto-select">Estado Proyecto:</label>
                                            <select required class="form-control" id="ddlEstadoProyecto" name="ddlEstadoProyecto">
                                                <option value="">---Seleccione---</option>
                                                <c:forEach items="${sessionScope.listadoEstadosproyectos}" var="estadoproyecto">
                                                    <option value="${estadoproyecto.idEstadosProyecto}"><c:out value="${estadoproyecto.descripcionEstadosProyecto}" ></c:out></option>
                                                </c:forEach>
                                            </select>
                                        </div> 
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="txtTallaProceso" class="">Talla EPP</label>
                                                <input id="txtTallaProceso" name="txtTallaProceso" type="text" class="form-control">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="txtUnidadProceso" class="">Unidad Epp:</label>
                                                <input id="txtUnidadProceso" name="txtUnidadProceso" type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="txtCantidadProceso" class="col-form-label">Cantidad:</label>
                                                <input id="txtCantidadProceso" name="txtCantidadProceso" type="text" class="form-control">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="txtPrecioUnitarioProceso" class="col-form-label">Precio Unitario:</label>
                                                <input id="txtPrecioUnitarioProceso" name="txtPrecioUnitarioProceso" type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDestinoDevolucionProceso" class="col-form-label">Destino Devolucion:</label>
                                            <input id="txtDestinoDevolucionProceso" name="txtDestinoDevolucionProceso" type="text" class="form-control">

                                        </div>
                                        <div class="form-group">
                                            <label for="txtMotivoProceso">Motivo de Devolución</label>
                                            <textarea class="form-control" id="txtMotivoProceso" name="txtMotivoProceso" rows="3"></textarea>
                                        </div>


                                        <p><input type="submit" class="btn btn-success btn-space" name="btnGuardar" value="Registrar"></p>

                                    </div>
                                </div>
                            </div>
</form>                       
                                <hr>
                            <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h2 class="card-header">Listado de EPP en Proceso</h2>
                                    <div class="card-body">


                                        <div class="table-responsive">
                                            <c:choose>
                                            <c:when test="${sessionScope.listadoEppProceso!=null}">
                                                <table class="table table-striped table-bordered"  id="eppproceso">
                                                    <thead>
                                                        <tr>
                                                            <th>Fecha de Creacion</th>
                                                            <th>Nombre Proyecto</th>
                                                            <th>Estado Del Proyecto</th>
                                                            <th>Nombre Trabajador</th>
                                                            <th>Talla EPP</th>
                                                            <th>Unidad EPP</th>
                                                            <th>Cantidad</th>
                                                            <th>Precio Unitario</th>
                                                            <th>Destino Devolucion</th>
                                                            <th>Motivido</th>
                                                            <th>Editar</th>
                                                            <th>Eliminar</th>      
                                                        </tr> 
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Fecha de Creacion</th>
                                                            <th>Nombre Proyecto</th>
                                                            <th>Estado Del Proyecto</th>
                                                            <th>Nombre Trabajador</th>
                                                            <th>Talla EPP</th>
                                                            <th>Unidad EPP</th>
                                                            <th>Cantidad</th>
                                                            <th>Precio Unitario</th>
                                                            <th>Destino Devolucion</th>
                                                            <th>Motivido</th>
                                                            <th>Editar</th>
                                                            <th>Eliminar</th>
                                                        </tr> 
                                                    </tfoot>
                                                    <tbody>
                                                        <c:forEach items="${sessionScope.listadoEppProceso}" var="eppproceso">
                                                            <tr>
                                                                <td><c:out value="${eppproceso.fechaCreacionEppProceso}"/></td>
                                                                <td><c:out value="${eppproceso.proyectoidProyecto.nombreProyecto}"/></td>
                                                                <td><c:out value="${eppproceso.estadosProyectoidEstadosProyecto.descripcionEstadosProyecto}"/></td>
                                                                <td><c:out value="${eppproceso.personarutPasaportePersona.nombresPersona} ${eppproceso.personarutPasaportePersona.apePatPersona} ${eppproceso.personarutPasaportePersona.apeMatPersona} "/></td>
                                                                <td><c:out value="${eppproceso.tallaEppProceso}"/></td>
                                                                <td><c:out value="${eppproceso.unidadEppProceso}"/></td>
                                                                <td><c:out value="${eppproceso.cantidadEppProceso}"/></td>
                                                                <td><c:out value="${eppproceso.precioUnitarioEppProceso}"/></td>
                                                                <td><c:out value="${eppproceso.destinoDevolucionEppProceso}"/></td>
                                                                <td><c:out value="${eppproceso.motivoEppProceso}"/></td>
                                                                <td><input type="button" class="btn btn-primary btn-space" name="btnEditar" value="Editar"/></td>
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
    </body>
</html>
