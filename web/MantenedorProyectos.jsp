<%-- 
    Document   : MantenedorProyectos
    Created on : 03-12-2018, 21:46:29
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
        <title>AllSafe - Proyectos Revision Proyectos 30.12.2018</title>
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
function soloNumeros(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = " 0123456789";
    especiales = [8, 37, 39, 46];

    tecla_especial = false
    for(var i in especiales) {
        if(key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }

    if(letras.indexOf(tecla) == -1 && !tecla_especial)
        return false;
}

function limpiaNumeroProyecto() {
    var val = document.getElementById("txtNombre").value;
    var tam = val.length;
    for(i = 0; i < tam; i++) {
        if(!isNaN(val[i]))
            document.getElementById("txtNombre").value = '';
    }
}
</script>
        
    </head>
    <body>
        <c:choose>
            <c:when test="${usuarioConectado!=null}">
                <jsp:include page="./cargaPais" flush="true"></jsp:include>
                <jsp:include page="./cargaCiudad" flush="true"></jsp:include>
                <jsp:include page="./cargaEmpresa" flush="true"></jsp:include>
                <jsp:include page="./cargaProyectoServlet" flush="true"/>
                <jsp:useBean id="proyecto" class="allSafe.Entities.Proyecto" scope="page"/>
                <jsp:useBean id="pais" class="allSafe.Entities.Pais" scope="page"></jsp:useBean>
                <jsp:useBean id="ciudad" class="allSafe.Entities.Ciudad" scope="page"></jsp:useBean>
                <jsp:useBean id="empresa" class="allSafe.Entities.Empresa" scope="page"></jsp:useBean>
                    <!-- ============================================================== -->
                    <!-- main wrapper -->
                    <div class="dashboard-main-wrapper">
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
                                    <h1 class="text-center">Proyectos</h1>

                                    <c:choose>
                                        <c:when test="${proyectoAEditar == null}">
                                            <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                                <h3 class="section-title">Gestion Proyectos</h3>
                                                <p>Aqui puedes Registrar, editar, y dar de baja Proyectos</p>
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
                                                <div class="card">
                                                    <h3 class="card-header">Registro de Proyectos</h3>
                                                    <div class="card-body">


                                                        <form  name="frmRegistroProyectos" method="post" action="./agregarProyecto">
                                                            <div class="form-row">
                                                                <div class="form-group col-md-4">
                                                                    <label for="txtNumProyecto" class="col-form-label">Numero proyecto</label>
                                                                    <input id="txtNumProyecto" onkeypress="return soloNumeros(event)" onblur="limpiaNumeroProyecto()" name="txtNumProyecto" type="text" class="form-control" required>
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <label for="txtNombreProyecto" class="col-form-label">Nombre proyecto</label>
                                                                    <input id="txtNombreProyecto" name="txtNombreProyecto" type="text" class="form-control" required>
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <label for="txtUbicacion" class="col-form-label">Ubicación</label>
                                                                    <input id="txtUbicacion" name="txtUbicacion" type="text" class="form-control" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-row">
                                                                <div class="form-group col-md-6">
                                                                    <label for="txtFechaInicio" class="col-form-label">Fecha inicio</label>
                                                                    <input id="txtFechaInicio" name="txtFechaInicio" type="date" class="form-control" required>
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label for="txtFechaTermino" class="col-form-label">Fecha término</label>
                                                                    <input id="txtFechaTermino" name="txtFechaTermino" type="date" class="form-control" required>
                                                                </div>
                                                            </div>


                                                            <div class="form-row">
                                                                <div class="form-group col-md-4">
                                                                    <label for="ddlPais-select">País</label>
                                                                    <select required class="form-control" id="ddlPais" name="ddlPais">
                                                                        <option value="">---Seleccione---</option>
                                                                        <c:forEach items="${sessionScope.listaPais}" var="pais">
                                                                            <option value="<c:out value="${pais.idPais}"></c:out>"><c:out value="${pais.pais}"></c:out></option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div> 
                                                                <div class="form-group col-md-4 ">
                                                                    <label for="ddlCiudad-select">Ciudad</label>
                                                                    <select required class="form-control" id="ddlCiudad" name="ddlCiudad">
                                                                        <option value="">---Seleccione---</option>
                                                                        <c:forEach items="${sessionScope.listaCiudad}" var="ciudad">
                                                                            <option value="<c:out value="${ciudad.idCiudad}"></c:out>"><c:out value="${ciudad.nombreCiudad}"></c:out></option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div> 
                                                                <div class="form-group col-md-4 ">
                                                                    <label for="ddlEmpresa-select">Empresa</label>
                                                                    <select required class="form-control" id="ddlEmpresa" name="ddlEmpresa">
                                                                        <option value="">---Seleccione---</option>
                                                                        <c:forEach items="${sessionScope.listaEmpresa}" var="empresa">
                                                                            <option value="<c:out value="${empresa.idEmpresa}"></c:out>"><c:out value="${empresa.razonSocialEmpresa}"></c:out></option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div> 
                                                            </div>


                                                            <input class="btn btn-success btn-space" type="submit" name="btnGuardar" value="Registrar">
                                                            <hr>
                                                            <div class="form-group">
                                                                <label for="exampleFormControlFile1">Llenar tabla Con Arrchivo CVS. o XLS</label>
                                                                <input type="file" class="form-control-file" id="exampleFormControlFile1">
                                                            </div>
                                                        </form>
                                                        <c:if test="${sessionScope.msg!=null}">
                                                            <c:out value="${msg}"></c:out>
                                                            <c:remove var="msg"></c:remove>
                                                        </c:if>   

                                                    </div>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <%--EDICION DE PROYECTOS --%>
                                            <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                                <h3 class="section-title">Gestion Proyectos</h3>
                                                <p>Aqui puedes Registrar, editar, y dar de baja Proyectos</p>
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
                                                <div class="card">
                                                    <h3 class="card-header">Edicion de Proyectos</h3>
                                                    <div class="card-body">


                                                        <form  name="frmEditarProyectos" method="post" action="./editarProyectoServlet">
                                                            <div class="form-group col-md-6">
                                                                <label for="idProyectomodifica" class="col-form-label">Id a Editar</label>
                                                                <input id="idProyectomodifica" name="idProyectomodifica" value="${proyectoAEditar.idProyecto}" type="text" class="form-control required" readonly required>

                                                            </div>
                                                                <hr>
                                                            <div class="form-row">
                                                                <div class="form-group col-md-4">
                                                                    <label for="txtNumProyectoModifica" class="col-form-label">Numero proyecto</label>
                                                                    <input id="txtNumProyectoModifica" name="txtNumProyectoModifica" type="text" value="${proyectoAEditar.numeroProyecto}" class="form-control" required>
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <label for="txtNombreProyectoModifica" class="col-form-label">Nombre proyecto</label>
                                                                    <input id="txtNombreProyectoModifica" name="txtNombreProyectoModifica" value="${proyectoAEditar.nombreProyecto}" type="text" class="form-control" required>
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <label for="txtUbicacionModifica" class="col-form-label">Ubicación</label>
                                                                    <input id="txtUbicacionModifica" name="txtUbicacionModifica" type="text" value="${proyectoAEditar.ubicacionProyecto}" class="form-control" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-row">
                                                                <div class="form-group col-md-6">
                                                                    <label for="txtFechaInicioModifica" class="col-form-label">Fecha inicio</label>
                                                                    <input id="txtFechaInicioModifica" name="txtFechaInicioModifica" type="date" value="${proyectoAEditar.fechaInicioProyecto}" class="form-control" required>
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label for="txtFechaTerminoModifica" class="col-form-label">Fecha término</label>
                                                                    <input id="txtFechaTerminoModifica" name="txtFechaTerminoModifica" type="date" value="${proyectoAEditar.fechaTerminoProyecto}" class="form-control" required>
                                                                </div>
                                                            </div>


                                                            <div class="form-row">
                                                                <div class="form-group col-md-4">
                                                                    <label for="ddlPais-select">País</label>
                                                                    <select required class="form-control" id="ddlPais" name="ddlPaisModifica">
                                                                        <option value="">---Seleccione---</option>
                                                                        <c:forEach items="${sessionScope.listaPais}" var="pais">
                                                                            <c:choose >
                                                                                <c:when test="${pais.idPais == proyectoAEditar.ciudadidCiudad.paisidPais.idPais }">
                                                                                    <option selected="true"  value="<c:out value="${pais.idPais}"></c:out>"><c:out value="${pais.pais}"></c:out></option>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                   <option value="<c:out value="${pais.idPais}"></c:out>"><c:out value="${pais.pais}"></c:out></option> 
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                                
                                                                        </c:forEach>
                                                                    </select>
                                                                </div> 
                                                                <div class="form-group col-md-4 ">
                                                                    <label for="ddlCiudad-select">Ciudad</label>
                                                                    <select required class="form-control" id="ddlCiudad" name="ddlCiudadModifica">
                                                                        <option value="">---Seleccione---</option>
                                                                        <c:forEach items="${sessionScope.listaCiudad}" var="ciudad">
                                                                            <c:choose >
                                                                                <c:when test="${ciudad.idCiudad == proyectoAEditar.ciudadidCiudad.idCiudad }">
                                                                                    <option selected="true"  value="<c:out value="${ciudad.idCiudad}"></c:out>"><c:out value="${ciudad.nombreCiudad}"></c:out></option>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                   <option value="<c:out value="${ciudad.idCiudad}"></c:out>"><c:out value="${ciudad.nombreCiudad}"></c:out></option> 
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div> 
                                                                <div class="form-group col-md-4 ">
                                                                    <label for="ddlEmpresa-select">Empresa</label>
                                                                    <select required class="form-control" id="ddlEmpresa" name="ddlEmpresaModifica">
                                                                        <option value="">---Seleccione---</option>
                                                                        <c:forEach items="${sessionScope.listaEmpresa}" var="empresa">
                                                                            <c:choose >
                                                                                <c:when test="${empresa.idEmpresa == proyectoAEditar.empresaidEmpresa.idEmpresa }">
                                                                                    <option selected="true"  value="<c:out value="${empresa.idEmpresa}"></c:out>"><c:out value="${empresa.razonSocialEmpresa}"></c:out></option>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <option value="<c:out value="${empresa.idEmpresa}"></c:out>"><c:out value="${empresa.razonSocialEmpresa}"></c:out></option> 
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div> 
                                                            </div>


                                                            <input type="submit" class="btn btn-success btn-space" name="btnEditar" value="Editar">
                                                            <input type="button" class="btn btn-dark btn-space" name="btnVolver" value="Calcelar Edicion" onclick="window.location.href='MantenedorProyectos.jsp'">
                                                            <hr>
                                                            
                                                        </form>
                                                        <c:if test="${sessionScope.msg!=null}">
                                                            <c:out value="${msg}"></c:out>
                                                            <c:remove var="msg"></c:remove>
                                                        </c:if>   

                                                    </div>
                                                </div>
                                            </div>

                                        </c:otherwise>
                                    </c:choose>
                                    <hr>
                                    <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="card">
                                            <h3 class="card-header">Listado Proyectos</h3>
                                            <div class="card-body">

                                                <div class="table-responsive">
                                                    <c:choose>
                                                        <c:when test="${sessionScope.listadoProyectos!=null}">
                                                            <table class="table table-striped" id="proyecto">
                                                                <thead>
                                                                    <tr> 
                                                                        <th>Numero proyecto</th>
                                                                        <th>Nombre proyecto</th>
                                                                        <th>País</th>
                                                                        <th>Ciudad</th>
                                                                        <th>Rut Empresa</th>
                                                                        <th>Razon Social Empresa</th>
                                                                        <th>Fecha inicio</th>
                                                                        <th>Fecha término</th>
                                                                        <th>Acciones</th>
                                                                    </tr> 
                                                                </thead>
                                                                <tfoot>
                                                                    <tr>
                                                                        <th>Numero proyecto</th>
                                                                        <th>Nombre proyecto</th>
                                                                        <th>País</th>
                                                                        <th>Ciudad</th>
                                                                        <th>Rut Empresa</th>
                                                                        <th>Razon Social Empresa</th>
                                                                        <th>Fecha inicio</th>
                                                                        <th>Fecha término</th>
                                                                        <th>Acciones</th>
                                                                    </tr> 
                                                                </tfoot>
                                                                <tbody>
                                                                    <c:forEach items="${sessionScope.listadoProyectos}" var="proyecto">
                                                                        <tr>
                                                                            <td><c:out value="${proyecto.numeroProyecto}"/></td>
                                                                            <td><c:out value="${proyecto.nombreProyecto}"/></td>
                                                                            <td><c:out value="${proyecto.ciudadidCiudad.paisidPais.pais}"/></td>
                                                                            <td><c:out value="${proyecto.ciudadidCiudad.nombreCiudad}"/></td>
                                                                            <td><c:out value="${proyecto.empresaidEmpresa.rutEmpresa}"/></td>
                                                                            <td><c:out value="${proyecto.empresaidEmpresa.razonSocialEmpresa}"/></td>
                                                                            <td><c:out value="${proyecto.fechaInicioProyecto}"/></td>
                                                                            <td><c:out value="${proyecto.fechaTerminoProyecto}"/></td>
                                                                            <td>
                                                                                <c:url value="./editarProyectoServlet" var="edicionDeProyecto">
                                                                                    <c:param name="idProyectoAEditar" value="${proyecto.idProyecto}"/>
                                                                                </c:url>
                                                                                <button type="button" class="btn btn-primary btn-sm btn-space" name="btnEditar" onclick="window.location.href = '<c:out value="${edicionDeProyecto}"/>'" ><i class="fas fa-edit"></i></button>
                                                                            
                                                                                <c:if test="${proyecto.isVigente()}">
                                                                                    <c:url value="./cambiaVigenciaProyecto" var="modificarVigencia">
                                                                                        <c:param name="id_proyecto" value="${proyecto.idProyecto}"/>
                                                                                    </c:url>
                                                                                    <button type="button" class="btn btn-success btn-sm btn-space" onclick="window.location.href = '<c:out value="${modificarVigencia}"/>'"><i class="fas fa-check"></i></button>
                                                                                </c:if>
                                                                                <c:if test="${!proyecto.isVigente()}">
                                                                                    <c:url value="./cambiaVigenciaProyecto" var="modificarVigencia">
                                                                                        <c:param name="id_proyecto" value="${proyecto.idProyecto}"/>
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
                                                        <c:remove var="proyectoAEditar" />
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
                <%--<script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>--%>
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
