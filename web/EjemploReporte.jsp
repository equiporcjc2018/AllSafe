<%-- 
    Document   : EjemploReporte
    Created on : 09-02-2019, 14:28:50
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
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/libs/css/style.css">
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <link rel="stylesheet" href="assets/vendor/charts/morris-bundle/morris.css">
        <title>JSP Page</title>
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
                                        <h1 class="text-center">Reporte Entrega a cliente</h1>                            
                                       
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end pageheader -->
                            <!-- ============================================================== -->
                            <div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
                                <h3 class="section-title">Generador de reporte</h3>
                                <p>Aquí puedes generar un reporte al ingresar el rut de un trabajador</p>
                                <div class="card">
                                    <h3 class="card-header">Generar Reporte</h3>
                                    <div class="card-body">

                                        <c:url var="generar" value="/generarReporte1Servlet" >

                                        </c:url>
                                        
                                        <form name="formGenPdf" action="./generarReporte1Servlet" target="_blank">
                                            
                                            <div class="ink-form horizontal">
                                                <div class="form-row ">
                                                        <div class="form-group col-md-6">
                                                            <label for="txtRutPersona" class="col-form-label">Ingrese rut:</label>
                                                            <input id="txtRutPersona" name="txtRutPersona" type="text" class="form-control required">

                                                        </div>
                                                        
                                                    </div>


                                                    <input type="submit" class="btn btn-success btn-space" name="btnGuardar" value="Generar pdf">
                                                
                                            </div>
                                        </form>

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
