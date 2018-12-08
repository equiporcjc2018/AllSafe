<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>AllSafe - Epps</title>
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
        <c:choose>
            <c:when test="${usuarioConectado!=null}">
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
                                                        <div class="custom-control custom-radio">
                                                            <input required type="radio" id="${tipoEpp.idTipoEPP}" name="RDBtipoEPP" value="${tipoEpp.idTipoEPP}" class="custom-control-input">
                                                            <label class="custom-control-label" for="${tipoEpp.idTipoEPP}">${tipoEpp.descripcionTipoEPP}</label>
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
            
        </c:when>
        <c:otherwise>
            <c:redirect url="Login.jsp"/>
        </c:otherwise>
    </c:choose>
</body>

</html>