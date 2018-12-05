<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
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
                        
                        
                        
                              <jsp:include page="./listarEppsServlet" flush="true"/>
        <jsp:include page="./listarTipoEppsServlet" flush="true"/>
        <jsp:useBean id="epp" class="allSafe.Entities.Epp" scope="page"/>
        <jsp:useBean id="tipoEpp" class="allSafe.Entities.Tipoepp" scope="page"/>
        <h1>Mantenedor EPP</h1>
        <fieldset><legend>Agregar EPP</legend>

                <form name="frmRegistroEPP" method="post" action="./registroEppServlet">
                    <p>Tipo EPP</p>
                    <p><c:forEach items="${listadoTipoEpps}" var="tipoEpp">
                        <input type="radio" name="RDBtipoEPP" value="${tipoEpp.idTipoEPP}" <td><c:out value="${tipoEpp.descripcionTipoEPP.toString()}"/>
                    </c:forEach></p>
                    <p>Nombre: <input type="text" name="txtnombre" required></p>
                    <p>Descripcion: <input type="text" name="txtDescripcion" required></p>


                <input type="submit" name="btnGuardar" value="Registrar">
            </form>
        </fieldset>

            <h3>Listado EPPS</h3>

        <div>
        <c:choose>
            <c:when test="${sessionScope.listadoEpps!=null}">
                <table>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Descripcion</th>
                            <th>Tipo EPP</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </tr> 
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Descripcion</th>
                            <th>Tipo EPP</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </tr> 
                    </tfoot>
                    <tbody>
                        <c:forEach items="${sessionScope.listadoEpps}" var="epp">
                            <tr>
                                <td><c:out value="${epp.idEPP}"/></td>
                                <td><c:out value="${epp.nombreEPPcol}"/></td>
                                <td><c:out value="${epp.descripcionEPP}"/></td>
                                <td><c:out value="${epp.tipoEPPidTipoEPP.descripcionTipoEPP}"/></td>
                                <td><input type="button" name="btnEditar" value="Editar"/></td>
                                <td><input type="button" name="btnEliminar" value="Eliminar"/></td>
                               
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