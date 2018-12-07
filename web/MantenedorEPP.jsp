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
            function pulsar(obj) {
                if (!obj.checked)
                    return
                elem = document.getElementsByName(obj.name);
                for (i = 0; i < elem.length; i++)
                    elem[i].checked = false;
                obj.checked = true;
            }
        </script>
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
                            <h1 class="text-center">Epps</h1>



                            <jsp:include page="./listarEppsServlet" flush="true"/>
                            <jsp:include page="./listarTipoEppsServlet" flush="true"/>
                            <jsp:useBean id="epp" class="allSafe.Entities.Epp" scope="page"/>
                            <jsp:useBean id="tipoEpp" class="allSafe.Entities.Tipoepp" scope="page"/>
                            <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                <h3 class="section-title">Gestion Epps</h3>
                                        <p>Aqui puedes Registrar, editar, y dar de baja Epps</p>
                                <div class="card">
                                    <h3 class="card-header">Agregar EPP</h3>
                                    <div class="card-body">


                                        <form name="frmRegistroEPP" method="post" action="./registroEppServlet">

                                            <h5>Tipo EPP</h5>
                                            <c:forEach items="${listadoTipoEpps}" var="tipoEpp">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="RDBtipoEPP" id="RDBtipoEPP" value="${tipoEpp.idTipoEPP}" checked>
                                                    <label class="form-check-label" for="RDBtipoEPP">
                                                        ${tipoEpp.descripcionTipoEPP.toString()}
                                                    </label>
                                                </div>

                                            </c:forEach>
                                            <hr>
                                            <div class="form-row ">
                                                <div class="form-group col-md-6">
                                                    <label for="txtnombre" class="col-form-label">Nombre</label>
                                                    <input id="txtnombre" name="txtnombre" type="text" class="form-control required">

                                                </div>
                                                <div class="form-group col-md-6 ">
                                                    <label for="txtDescripcion" class="col-form-label">Descripcion</label>
                                                    <input id="txtDescripcion" name="txtDescripcion" type="text" class="form-control" required>

                                                </div>
                                            </div>


                                            <input type="submit" class="btn btn-success btn-space" name="btnGuardar" value="Registrar">
                                        </form>

                                    </div>
                                </div>
                            </div>


                            <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h3 class="card-header">Listado EPPS</h3>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <c:choose>
                                            <c:when test="${sessionScope.listadoEpps!=null}">
                                                <table class="table table-striped" id="proyecto">
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
                                                                <td><input type="button" class="btn btn-primary btn-space" name="btnEditar" value="Editar"/></td>
                                                                <td><input type="button" class="btn btn-secondary btn-space" name="btnEliminar" value="Eliminar"/></td>

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