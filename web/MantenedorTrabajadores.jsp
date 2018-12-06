<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Concept - Bootstrap 4 Admin Dashboard Template</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
</head>

<body>
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
                        <h3 class="text-center">Content goes here!</h3>
                        
 <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="section-block" id="basicform">
            <h3 class="section-title">Basic Form Elements</h3>
            <p>Use custom button styles for actions in forms, dialogs, and more with support for multiple sizes, states, and more.</p>
        </div>
        <div class="card">
            <h5 class="card-header">Basic Form</h5>
            <div class="card-body">
                <form>
                    <div class="form-group">
                        <label for="inputText3" class="col-form-label">Input Text</label>
                        <input id="inputText3" type="text" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="input-select">Example Select</label>
                        <select class="form-control" id="input-select">
                            <option>Choose Example</option>
                        </select>
                    </div>                    

                </form>
                
                
                
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
        <h1>Mantenedor Trabajadores</h1>
        <legend>Agregar Trabajador</legend>

                <form name="frmRegistroTrabajador" method="post" action="./registroTrabajadorServlet">
                                        
                    <p><b>Datos Personales</b></p>
                    <p>rut:<input type="text" name="txtRut" id="txtRut"  required> <input type="radio" checked="cheked" name="rdbIdentificacion"  onclick="document.getElementById('txtRut').disabled = !this.checked; document.getElementById('txtPasaporte').disabled = this.checked;"  /> Pasaporte:<input type="text" name="txtPasaporte" id="txtPasaporte" disabled="false" required> <input type="radio" name="rdbIdentificacion" onclick="document.getElementById('txtPasaporte').disabled = !this.checked; document.getElementById('txtRut').disabled = this.checked;" /> </p>                    
                    <p>Nombre: <input type="text" name="txtNombre" required> Aperrido Paterno: <input type="text" name="txtApellidoPaterno" required> Apellido Materno<input type="text" name="txtApellidoMaterno" required></p>
                    <p>Fecha Nacimiento: <input type="date" name="txtFechaNacimiento" required> Nacionalidad: <input type="text" name="txtNacionalidad" required> Correo:<input type="email" name="txtCorreo" required></p>
                    <p><b>Laboral</b></p>
                    <p>Cargo:
                        <select required name="ddlCargo">
                            <option value="">--Seleccione--</option>
                            <c:forEach items="${sessionScope.listaCargo}" var="cargo">
                                <option value="${cargo.idCargo}"><c:out value="${cargo.descripcionCargo}" ></c:out></option>
                            </c:forEach>
                        </select>
                        Tipo Planta:
                        <select required name="ddlTipoPlanta">
                            <option value="">--Seleccione--</option>
                            <c:forEach items="${sessionScope.listaPlanta}" var="tipoPlanta">
                                <option value="${tipoPlanta.idTipoPlanta}"><c:out value="${tipoPlanta.descripcionTipoPlanta}" ></c:out></option>
                            </c:forEach>
                        </select>
                    </p>
                    <p><b>Vestimenta</b></p>
                    
                    <p>Oberol:
                        <select required name="ddlOberol">
                            <option value="">--Seleccione--</option>
                            <c:forEach items="${sessionScope.listaOberol}" var="oberol">
                                <option value="${oberol.idTallaOberol}"><c:out value="${oberol.letraTallaOberol} - ${oberol.numeroTallaOberol}" ></c:out></option>
                            </c:forEach>
                        </select>
                        Pantalon:
                        <select required name="ddlPantalon">
                            <option value="">--Seleccione--</option>
                            <c:forEach items="${sessionScope.listaPantalon}" var="pantalon">
                                <option value="${pantalon.idTallaPantalon}"><c:out value="${pantalon.letraTallaPantalon} - ${pantalon.numeroTallaPantalon} " ></c:out></option>
                            </c:forEach>
                        </select>
                        Polera:
                        <select required name="ddlPolera">
                            <option value="">--Seleccione--</option>
                            <c:forEach items="${sessionScope.listaPolera}" var="polera">
                                <option value="${polera.idTallaPoleraCamisa}"><c:out value="${polera.letraPoleraCamisa}- ${polera.numeroPoleraCamisa}" ></c:out></option>
                            </c:forEach>
                        </select>
                        Zapatos:
                        <select required name="ddlZapato">
                            <option value="">--Seleccione--</option>
                            <c:forEach items="${sessionScope.listaZapato}" var="zapato">
                                <option value="${zapato.idTallaZapato}"><c:out value="${zapato.numeroZapato}" ></c:out></option>
                            </c:forEach>
                        </select>
                    </p>


                <input type="submit" name="btnGuardar" value="Registrar">
            </form>                
                
                
            </div>
        </div>
</div>                       
                        
                        
                        
                        
                        
            
 
       

        
<div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
    <div class="card">
        <h5 class="card-header">Listado Trabajadores</h5>
        <div class="card-body">
        <c:choose>
            <c:when test="${sessionScope.listaTrabajadores!=null}">
                 <table class="table table-striped">
                    
                    <thead>
                        <tr>
                            <TH scope="col">Datos Personales</TH>
                            <TH scope="col">Laboral</TH>
                            <TH scope="col">Vestimenta</TH>
                            <TH scope="col">Accion</TH>
                        </tr>
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
                            <th scope="col">Editar</th>
                            <th scope="col">Eliminar</th>
                        </tr> 
                    </thead>
                    <tfoot>
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
                            <th scope="col">Editar</th>
                            <th scope="col">Eliminar</th>
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