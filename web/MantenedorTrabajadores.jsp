<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>AllSafe - Tabajadores</title>
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
                $('#trabajadores').DataTable();
            });
        </script> 
    </head>

    <body>
        <c:choose>
            <c:when test="${usuarioConectado!=null}">
                <jsp:include page="./listarTallaOberolServlet" flush="true"/>
                <jsp:include page="./listarTallaPantalonServlet" flush="true"/>
                <jsp:include page="./listarTallaPoleraServlet" flush="true"/>
                <jsp:include page="./listarTallaZapatoServlet" flush="true"/>
                <jsp:include page="./listarCargoServlet" flush="true"/>
                <jsp:include page="./listarTipoPlantaServlet" flush="true"/>
                <jsp:include page="./listarPersonaServlet" flush="true"/>
                <jsp:useBean id="oberol" class="allSafe.Entities.Tallaoberol" scope="page"/>
                <jsp:useBean id="pantalon" class="allSafe.Entities.Tallapantalon" scope="page"/>
                <jsp:useBean id="polera" class="allSafe.Entities.Tallapoleracamisa" scope="page"/>
                <jsp:useBean id="zapato" class="allSafe.Entities.Tallazapato" scope="page"/>
                <jsp:useBean id="cargo" class="allSafe.Entities.Cargo" scope="page"/>
                <jsp:useBean id="tipoPlanta" class="allSafe.Entities.Tipoplanta" scope="page"/>
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
                                    <h1 class="text-center">Trabajadores</h1>

                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="section-block" id="basicform">
                                            <h3 class="section-title">Gestion Trabajadores</h3>
                                            <p>Aqui puedes Registrar, editar, y dar de baja a trabajadores</p>
                                        </div>
                                        <div class="card">
                                            <h3 class="card-header">Registrar Trabajador</h3>
                                            <div class="card-body">

                                                <h4>Datos Personales</h4>
                                                <form name="frmRegistroTrabajador" method="post" action="./registroTrabajadorServlet">
                                                    <div class="custom-control custom-radio">
                                                        <input required type="radio" id="customRadio1" name="rdbIdentificacion" class="custom-control-input" onclick="document.getElementById('txtRut').disabled = !this.checked; document.getElementById('txtPasaporte').disabled = this.checked;">
                                                        <label class="custom-control-label" for="customRadio1">Rut</label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input required type="radio" id="customRadio2" name="rdbIdentificacion" class="custom-control-input" onclick="document.getElementById('txtPasaporte').disabled = !this.checked; document.getElementById('txtRut').disabled = this.checked;">
                                                        <label class="custom-control-label" for="customRadio2">Pasaporte</label>
                                                    </div>
                                                    <div class="form-row ">
                                                        <div class="form-group col-md-6">
                                                            <label for="txtRut" >Rut</label>
                                                            <input id="txtRut" name="txtRut" type="text" disabled="false" class="form-control">
                                                        </div>

                                                        <div class="form-group col-md-6">
                                                            <label for="txtPasaporte" >Pasaporte</label>
                                                            <input id="txtPasaporte" name="txtPasaporte" type="text" disabled="false" class="form-control">

                                                        </div>

                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-md-4">
                                                            <label for="txtNombre" class="col-form-label">Nombre </label>
                                                            <input id="txtNombre" name="txtNombre" type="text" class="form-control">
                                                        </div>
                                                        <div class="form-group col-md-4">
                                                            <label for="txtApellidoPaterno" class="col-form-label">Apellido Paterno</label>
                                                            <input id="txtApellidoPaterno" name="txtApellidoPaterno" type="text"  class="form-control">
                                                        </div>
                                                        <div class="form-group col-md-4">
                                                            <label for="txtApellidoMaterno" class="col-form-label">Apellido Materno</label>
                                                            <input id="txtApellidoMaterno" name="txtApellidoMaterno" type="text"  class="form-control">
                                                        </div>

                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-md-4">
                                                            <label for="txtFechaNacimiento" class="col-form-label">Fecha Nacimiento</label>
                                                            <input id="txtFechaNacimiento" name="txtFechaNacimiento" type="date" class="form-control">  
                                                        </div>
                                                        <div class="form-group col-md-4">
                                                            <label for="txtNacionalidad" class="col-form-label">Nacionalidad</label>
                                                            <input id="txtNacionalidad" name="txtNacionalidad" type="text"  class="form-control">
                                                        </div>
                                                        <div class="form-group col-md-4">
                                                            <label for="txtCorreo" class="col-form-label">Correo</label>
                                                            <input id="txtCorreo" name="txtCorreo" type="text"  class="form-control">
                                                        </div>

                                                    </div>
                                                    <hr>
                                                    <h4>Laboral</h4>
                                                    <div class="form-row">
                                                        <div class="form-group col-md-6">
                                                            <label for="ddlCargo-select">Cargo</label>
                                                            <select required class="form-control" id="ddlCargo" name="ddlCargo">
                                                                <option value="">---Seleccione---</option>
                                                                <c:forEach items="${sessionScope.listaCargo}" var="cargo">
                                                                    <option value="${cargo.idCargo}"><c:out value="${cargo.descripcionCargo}" ></c:out></option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label for="ddlTipoPlanta-select">Planta</label>
                                                            <select required class="form-control" id="ddlTipoPlanta" name="ddlTipoPlanta">
                                                                <option value="">---Seleccione---</option>
                                                                <c:forEach items="${sessionScope.listaPlanta}" var="tipoPlanta">
                                                                    <option value="${tipoPlanta.idTipoPlanta}"><c:out value="${tipoPlanta.descripcionTipoPlanta}" ></c:out></option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>                                              
                                                    </div> 
                                                    <hr>
                                                    <h4>Vestimenta</h4>
                                                    <div class="form-row">

                                                        <div class="form-group col-md-3">
                                                            <label for="ddlOberol-select">Oberol</label>
                                                            <select required class="form-control" id="ddlOberol" name="ddlOberol">
                                                                <option value="">---Seleccione---</option>
                                                                <c:forEach items="${sessionScope.listaOberol}" var="oberol">
                                                                    <option value="${oberol.idTallaOberol}"><c:out value="${oberol.letraTallaOberol} - ${oberol.numeroTallaOberol}" ></c:out></option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-3">
                                                            <label for="ddlPantalon-select">Pantalon</label>
                                                            <select required class="form-control" id="ddlPantalon" name="ddlPantalon">
                                                                <option value="">---Seleccione---</option>
                                                                <c:forEach items="${sessionScope.listaPantalon}" var="pantalon">
                                                                    <option value="${pantalon.idTallaPantalon}"><c:out value="${pantalon.letraTallaPantalon} - ${pantalon.numeroTallaPantalon}" ></c:out></option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-3">
                                                            <label for="ddlPolera-select">Polera</label>
                                                            <select required class="form-control" id="ddlPolera" name="ddlPolera">
                                                                <option value="">---Seleccione---</option>
                                                                <c:forEach items="${sessionScope.listaPolera}" var="polera">
                                                                    <option value="${polera.idTallaPoleraCamisa}"><c:out value="${polera.letraPoleraCamisa}- ${polera.numeroPoleraCamisa}" ></c:out></option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-3">

                                                            <label for="ddlZapato-select">Zapato</label>

                                                            <select required class="form-control" id="ddlZapato" name="ddlZapato">
                                                                <option value="">---Seleccione---</option>
                                                                <c:forEach items="${sessionScope.listaZapato}" var="zapato">
                                                                    <option value="${zapato.idTallaZapato}"><c:out value="${zapato.numeroZapato}" ></c:out></option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>  
                                                    </div> 
                                                    <input type="submit" class="btn btn-success btn-space" name="btnGuardar" value="Registrar">
                                                    <hr>
                                                    <div class="form-group">
                                                        <label for="exampleFormControlFile1">Llenar tabla Con Arrchivo CVS. o XLS</label>
                                                        <input type="file" class="form-control-file" id="exampleFormControlFile1">
                                                    </div>
                                                </form>


                                            </div>

                                        </div>

                                    </div>           
                                    <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                        <div class="card">
                                            <h3 class="card-header">Listado Trabajadores</h3>
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <c:choose>
                                                        <c:when test="${sessionScope.listaTrabajadores!=null}">
                                                            <table id="trabajadores" class="table table-striped table-bordered">

                                                                <thead>

                                                                    <tr>
                                                                        <th scope="col">Rut/Pasaporte</th>
                                                                        <th scope="col">Nombre Completo</th>
                                                                        <th scope="col">Fecha de Nacimiento</th>
                                                                        <th scope="col">Nacionalidad</th>
                                                                        <th scope="col">Correo</th>
                                                                        <th scope="col">Cargo</th>
                                                                        <th scope="col">Tipo Planta</th>
                                                                        <th scope="col">Oberol</th>
                                                                        <th scope="col">Pantalon</th>
                                                                        <th scope="col">Polera</th>
                                                                        <th scope="col">Zapato</th>
                                                                        <th scope="col">Vigente</th>
                                                                        <th scope="col">Editar</th>
                                                                        <th scope="col">Cambiar Estado</th>
                                                                    </tr> 
                                                                </thead>
                                                                <tfoot>
                                                                    <tr>
                                                                        <th>Rut/Pasaporte</th>
                                                                        <th>Nombre Completo</th>
                                                                        <th>Fecha de Nacimiento</th>
                                                                        <th>Nacionalidad</th>
                                                                        <th>Correo</th>
                                                                        <th>Cargo</th>
                                                                        <th>Tipo Planta</th>
                                                                        <th>Oberol</th>
                                                                        <th>Pantalon</th>
                                                                        <th>Polera</th>
                                                                        <th>Zapato</th>
                                                                        <th>Vigente</th>
                                                                        <th>Editar</th>
                                                                        <th>Cambiar Estado</th>
                                                                    </tr> 
                                                                </tfoot>
                                                                <tbody>
                                                                    <c:forEach items="${sessionScope.listaTrabajadores}" var="persona">
                                                                        <tr>
                                                                            <td><c:out value="${persona.rutPasaportePersona}"/></td>
                                                                            <td><c:out value="${persona.nombresPersona} ${persona.apePatPersona} ${persona.apeMatPersona}"/></td>
                                                                            <td><c:out value="${persona.fechaNacPersona}"/></td>
                                                                            <td><c:out value="${persona.nacionalidadPersona}"/></td>
                                                                            <td><c:out value="${persona.correoPersona}"/></td>
                                                                            <td><c:out value="${persona.cargoidCargo.descripcionCargo}"/></td>
                                                                            <td><c:out value="${persona.tipoPlantaidTipoPlanta.descripcionTipoPlanta}"/></td>
                                                                            <td><c:out value="${persona.tallaOberolidTallaOberol.letraTallaOberol} - ${persona.tallaOberolidTallaOberol.numeroTallaOberol}"/></td>
                                                                            <td><c:out value="${persona.tallaPantalonidTallaPantalon.letraTallaPantalon} - ${persona.tallaPantalonidTallaPantalon.numeroTallaPantalon}"/></td>
                                                                            <td><c:out value="${persona.tallaPoleraCamisaidtallaPoleraCamisa.letraPoleraCamisa} - ${persona.tallaPoleraCamisaidtallaPoleraCamisa.numeroPoleraCamisa}"/></td>
                                                                            <td><c:out value="${persona.tallaZApatoidtallaZApato.numeroZapato}"/></td>
                                                                            <td><c:if test="${persona.vigencia == 'Y'}" >Si</c:if><c:if test="${persona.vigencia == 'N'}" >No</c:if> </td>
                                                                            <td><input type="button" class="btn btn-primary btn-space" name="btnEditar" value="Editar"/></td>
                                                                            <td><input type="button" class="btn btn-secondary btn-space"  name="btnCambiarEstado" value="Cambiar Estado"/></td>

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