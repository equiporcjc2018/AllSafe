<%-- 
    Document   : AsignarPersonaAProyecto
    Created on : 05-ene-2019, 20:14:20
    Author     : Ruben
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>AllSafe - Asignar Trab. a Proy. </title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/libs/css/style.css">
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">

        <script src="datatables/media/js/jquery.js" type="text/javascript"></script>
        <link href="datatables/media/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        <script src="datatables/media/js/jquery.dataTables.js" type="text/javascript"></script>

        <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.4.2/css/buttons.dataTables.min.css">

        

    </head>
    <body>
        <c:choose>
            <c:when test="${usuarioConectado!=null}">
                <jsp:include page="./cargaProyectoServlet" flush="true"/>

                <jsp:include page="./listarPersonaServlet" flush="true"/>
                <jsp:include page="./listarTrabajadorProyectoServlet" flush="true"/>
                <jsp:include page="./listarEstadoProyectoServlet" flush="true"/> 
                <jsp:include page="./cargaPaisServlet" flush="true"/> 
                <jsp:useBean id="persona" class="allSafe.Entities.Persona" scope="page"/>
                <jsp:useBean id="proyecto" class="allSafe.Entities.Proyecto" scope="page"/>
                <jsp:useBean id="pais" class="allSafe.Entities.Pais" scope="page"/>

                <jsp:useBean id="estadoproyecto" class="allSafe.Entities.Estadosproyecto" scope="page"/>
                <jsp:useBean id="asignatrabajadorproyecto" class="allSafe.Entities.Asignatrabajadorproyecto" scope="page"/>
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
                                    <h3 class="text-center">Asignar Trabajador a Proyecto</h3>
                                    <form name="frmRegistroTrabaProy" method="post" action="./registroTrabProy">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="section-block" id="basicform">
                                                <p>Aqui se asignan Trabajadores a Proyectos</p>
                                                <c:if test="${error!=null}">
                                            <div class="alert alert-danger" role="alert">
                                                <c:out value="${error}"/>
                                                <c:remove var="error"/>
                                            </div>
                                        </c:if>            
                                        <c:if test="${exito!=null}">
                                            <div class="alert alert-success" role="alert">
                                                <c:out value="${exito}"/>
                                                <c:remove var="exito"/>
                                            </div>
                                        </c:if>  
                                            </div>

                                            <div class="card">
                                                <h2 class="card-header">Seleccion de Proyecto</h2>
                                                <div class="card-body">

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
                                        <hr>

                                        <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                            <div class="card">
                                                <h2 class="card-header">Seleccion de Persona</h2>
                                                <div class="card-body">
                                                        <c:choose>
                                                            <c:when test="${sessionScope.listaTrabajadores!=null}">
                                                                <table class="table table-striped table-bordered"  id="persona">

                                                                    <thead>
                                                                        <tr>
                                                                            <th>Rut</th>
                                                                            <th>Nombre</th>
                                                                            <th>Nacionalidad</th>
                                                                            <th>Seleccion</th>
                                                                        </tr> 
                                                                    </thead>
                                                                    <tfoot>
                                                                        <tr>
                                                                            <th>por rut</th>
                                                                            <th>por nombre</th>
                                                                            <th>por nacionalidad</th>
                                                                        </tr> 
                                                                    </tfoot>
                                                                    <tbody>
                                                                        <c:forEach items="${sessionScope.listaTrabajadores}" var="persona">
                                                                            <tr>
                                                                                <td><c:out value="${persona.rutPasaportePersona}"/></td>
                                                                                <td><c:out value="${persona.nombresPersona} ${persona.apePatPersona} ${persona.apePatPersona}"/></td>
                                                                                <td><c:out value="${persona.nacionalidadPersona}"/></td>

                                                                                <td>
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input  type="checkbox" id="persona${persona.rutPasaportePersona}" name="chkPersona" value="${persona.rutPasaportePersona}" class="custom-control-input">
                                                                                        <label class="custom-control-label" for="persona${persona.rutPasaportePersona}"></label>

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


                                        <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                            <div class="card">
                                                <h2 class="card-header">Asignar</h2>
                                                <div class="card-body">

                                                    <p><input type="submit" class="btn btn-success btn-space btn-lg btn-block" name="btnGuardar" value="Registrar"></p>

                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                    <hr>
                                    <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="card">
                                            <h2 class="card-header">Listado de Trabajadores y Proyectos</h2>
                                            <div class="card-body">


                                                <div class="table-responsive">
                                                    <c:choose>
                                                        <c:when test="${sessionScope.listadoTrabajadorProyecto!=null}">
                                                            <table class="table table-striped table-bordered"  id="asignatrabajadorproyecto">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Número Proyecto</th>
                                                                        <th>Nombre Proyecto</th>
                                                                        <th>Proyecto Vigente</th>
                                                                        <th>Rut Trabajador</th>
                                                                        <th>Nombre Trabajador</th>

                                                                        <th>Vigencia</th>      
                                                                    </tr> 
                                                                </thead>
                                                                <tfoot>
                                                                    <tr>
                                                                        <th>Número Proyecto</th>
                                                                        <th>Nombre Proyecto</th>
                                                                        <th>Proyecto Vigente</th>
                                                                        <th>Rut Trabajador</th>
                                                                        <th>Nombre Trabajador</th>

                                                                        <th>Vigencia</th>
                                                                    </tr> 
                                                                </tfoot>
                                                                <tbody>
                                                                    <c:forEach items="${sessionScope.listadoTrabajadorProyecto}" var="asignatrabajadorproyecto">
                                                                        <tr>
                                                                            <td><c:out value="${asignatrabajadorproyecto.proyectoidProyecto.numeroProyecto}"/></td>
                                                                            <td><c:out value="${asignatrabajadorproyecto.proyectoidProyecto.nombreProyecto}"/></td>
                                                                            <td><c:out value="${asignatrabajadorproyecto.proyectoidProyecto.isVigente()?'Si':'No'}"/></td>
                                                                            <td><c:out value="${asignatrabajadorproyecto.personarutPasaportePersona.rutPasaportePersona}"/></td>
                                                                            <td><c:out value="${asignatrabajadorproyecto.personarutPasaportePersona.nombresPersona} ${asignatrabajadorproyecto.personarutPasaportePersona.apePatPersona} ${asignatrabajadorproyecto.personarutPasaportePersona.apeMatPersona}"/></td>

                                                                            <td>
                                                                                
                                                                                <c:if test="${asignatrabajadorproyecto.isVigente()}">
                                                                                    <c:url value="./cambiaVigenciaRelProyTrab" var="modificarVigencia">
                                                                                        <c:param name="idAsignacion" value="${asignatrabajadorproyecto.idasignatrabajadorproyecto}"/>
                                                                                    </c:url>
                                                                                    <button type="button" class="btn btn-success btn-sm btn-space" onclick="window.location.href = '<c:out value="${modificarVigencia}"/>'"><i class="fas fa-check"></i></button>
                                                                                </c:if>
                                                                                <c:if test="${!asignatrabajadorproyecto.isVigente()}">
                                                                                    <c:url value="./cambiaVigenciaRelProyTrab" var="modificarVigencia">
                                                                                        <c:param name="idAsignacion" value="${asignatrabajadorproyecto.idasignatrabajadorproyecto}"/>
                                                                                    </c:url>
                                                                                    <button type="button" class="btn btn-danger btn-sm btn-space" onclick="window.location.href = '<c:out value="${modificarVigencia}"/>'"><i class="fas fa-times"></i></button>
                                                                                </c:if>
                                                                                
                                                                                
                                                                                
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
<script src="//cdn.datatables.net/buttons/1.4.2/js/dataTables.buttons.min.js"></script>
        <script src="//cdn.datatables.net/buttons/1.4.2/js/buttons.flash.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script src=" //cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
        <script src="//cdn.datatables.net/buttons/1.4.2/js/buttons.html5.min.js"></script>
        <script src="//cdn.datatables.net/buttons/1.4.2/js/buttons.print.min.js"></script>

        <script>
            $(document).ready(function ()
            {
                $('#proyecto').DataTable({
                    responsive: true
                });
                var tablePersona = $('#persona').DataTable({
                    responsive: true
                });
                $('#asignatrabajadorproyecto').DataTable({
                        info: true,
                        paging: true,
                        ordering: true,
                        searching: true,
                        responsive: true,
                        dom: "B",
                        buttons: [
                                'copy', 'csv', 'excel', 'pdf', 'print',
                        ]
                });
                
                $('#persona tfoot th').each(function () {
                    var title = $(this).text();
                    $(this).html('<input type="text" placeholder="Buscar ' + title + '" />');
                });
                // Apply the search
                tablePersona.columns().every(function () {
                    var that = this;
                    $('input', this.footer()).on('keyup change', function () {
                        if (that.search() !== this.value) {
                            that.search(this.value).draw();
                        }
                    });
                });
            });
        </script> 
    </body>
</html>
