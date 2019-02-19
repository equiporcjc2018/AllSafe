<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/libs/css/style.css">
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <link rel="stylesheet" href="assets/vendor/charts/morris-bundle/morris.css">
        <title>AllSafe - Home</title>
        
       
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
                        <div class="container-fluid  dashboard-content">
                            <!-- ============================================================== -->
                            <!-- pageheader -->
                            <!-- ============================================================== -->
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="page-header">
                                        <h2 class="pageheader-title">Home</h2>                            
                                        <div class="page-breadcrumb">
                                            <nav aria-label="breadcrumb">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                                </ol>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end pageheader -->
                            <!-- ============================================================== -->
                            <div class="row">
                                <!-- ============================================================== -->
                                <!-- donut chart  -->
                                <!-- ============================================================== -->
                                <div class="col-xl-12 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <div class="card">
                                        <h2 class="card-header">Inventario Inicial vs Entregado</h2>
                                        <h5 class="card-header">Cantidad EPP </h5>
                                        <div class="card-body">
                                            <div id="bar-example"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ============================================================== -->
                                <!-- end donut chart  -->
                                <!-- ============================================================== -->
                            </div>               
                           
                                <!-- ============================================================== -->
                                <!-- ============================================================== -->
                                <!--Prueba otro grafico  -->
                                <!-- ============================================================== -->
                            <div class="row">
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <div class="card">
                                        <h2 class="card-header">Cantidad de EPP por Proyecto</h2>
                                        <h5 class="card-header">Cantidad EPP </h5>
                                        <div class="card-body">
                                            <div id="morris_bar"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <div class="card">
                                        <h2 class="card-header">Cantidad de Trabajadores por Proyecto</h2>
                                        <h5 class="card-header">Cantidad Trabajador </h5>
                                        <div class="card-body">
                                            <div id="morris_donut"></div>
                                        </div>
                                    </div>
                                </div>
                                
                                
                            </div>
                            
                                
                                
                                
                                
                                
                        </div>
                        <!-- ============================================================== -->
                        <!-- footer -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- footer -->
                        <!-- ============================================================== -->
                        <jsp:include page="common/Footer.jsp" flush="true"/> 
                        <!-- ============================================================== -->
                        <!-- end footer -->
                        <!-- ============================================================== -->
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
                <script src="assets/vendor/charts/morris-bundle/raphael.min.js"></script>
                <script src="assets/vendor/charts/morris-bundle/morris.js"></script>
                <script src="assets/vendor/charts/morris-bundle/Morrisjs.js"></script>
                <script src="assets/libs/js/main-js.js"></script>
            </c:when>
            <c:otherwise>
                <c:redirect url="Login.jsp"/>
            </c:otherwise>
        </c:choose>

    </body>


</html>