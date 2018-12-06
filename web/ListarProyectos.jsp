<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro proyecto</title>    
    
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" href="assets/vendor/charts/chartist-bundle/chartist.css">
    <link rel="stylesheet" href="assets/vendor/charts/morris-bundle/morris.css">
    <link rel="stylesheet" href="assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendor/charts/c3charts/c3.css">
    <link rel="stylesheet" href="assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
    <title>AllSafe - Home</title>
</head>

<body>
    <c:choose>
        <c:when test="${usuarioConectado!=null && usuarioConectado!=''}">      
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
                                <!--<a class="dropdown-item" href="#"><i class="fas fa-user mr-2"></i>Account</a>-->
                                <!--<a class="dropdown-item" href="#"><i class="fas fa-cog mr-2"></i>Setting</a>-->
                                <a class="dropdown-item" href="/AllSafe/Login.jsp" ><i class="fas fa-power-off mr-2"></i>Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
                           
                                    
                                    
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
         <jsp:include page="/common/Menu.jsp" flush="true"/>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    
                    
         <!--[INI] ACA SE AGREGA EL CONTENIDO-->           
                    
        <jsp:include page="./cargaProyectoServlet" flush="true"/>
        <jsp:useBean id="proyecto" class="allSafe.Entities.Proyecto" scope="page"/>
        <jsp:useBean id="pais" class="allSafe.Entities.Pais" scope="page"></jsp:useBean>
        <jsp:useBean id="ciudad" class="allSafe.Entities.Ciudad" scope="page"></jsp:useBean>
        <jsp:useBean id="empresa" class="allSafe.Entities.Empresa" scope="page"></jsp:useBean>       

         <h3>Proyectos</h3>
            
            
<div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
    <div class="card">
        <h5 class="card-header">Listado</h5>
        <div class="card-body">
            <c:choose>
            <c:when test="${sessionScope.listadoProyectos!=null}">
            <table class="table table-striped">
                <thead>
                    <tr>                     
                        <th scope="col">Nombre proyecto</th>
                        <th scope="col">Pa�s</th>
                        <th scope="col">Ciudad</th>
                        <th scope="col">Empresa</th>
                        <th scope="col">Fecha inicio</th>
                        <th scope="col">Fecha t�rmino</th>
                    </tr>
                </thead>
                <tbody>
                          <c:forEach items="${sessionScope.listadoProyectos}" var="proyecto">
                            <tr>
                                <td><c:out value="${proyecto.nombreProyecto}"/></td>
                                <td><c:out value="${proyecto.ciudadidCiudad.nombreCiudad}"/></td>
                                <td><c:out value="${proyecto.ciudadidCiudad.nombreCiudad}"/></td>
                                <td><c:out value="${proyecto.empresaidEmpresa.idEmpresa}"/></td>
                                <td><c:out value="${proyecto.fechaInicioProyecto}"/></td>
                                <td><c:out value="${proyecto.fechaTerminoProyecto}"/></td>
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
            
            
                    
        <!--[END] ACA SE AGREGA EL CONTENIDO-->             
                    
                    
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
                <jsp:include page="/common/Footer.jsp" flush="true"/>       
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- end wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <!-- jquery 3.3.1 -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <!-- bootstap bundle js -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- slimscroll js -->
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <!-- main js -->
    <script src="assets/libs/js/main-js.js"></script>
    <!-- chart chartist js -->
    <script src="assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
    <!-- sparkline js -->
    <script src="assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
    <!-- morris js -->
    <script src="assets/vendor/charts/morris-bundle/raphael.min.js"></script>
    <script src="assets/vendor/charts/morris-bundle/morris.js"></script>
    <!-- chart c3 js -->
    <script src="assets/vendor/charts/c3charts/c3.min.js"></script>
    <script src="assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
    <script src="assets/vendor/charts/c3charts/C3chartjs.js"></script>
    <script src="assets/libs/js/dashboard-ecommerce.js"></script>
    
            </c:when>
            <c:otherwise>
                <c:redirect url="Login.jsp"/>
            </c:otherwise>
        </c:choose>    
    
</body>
 
</html>