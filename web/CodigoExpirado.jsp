<%-- 
    Document   : Login
    Created on : 16-03-2017, 12:15:02
    Author     : rcarrasco
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Recuperar Contraseña</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/libs/css/style.css">
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <style>
            html,
            body {
                height: 100%;
            }

            body {
                display: -ms-flexbox;
                display: flex;
                -ms-flex-align: center;
                align-items: center;
                padding-top: 40px;
                padding-bottom: 40px;
            }
        </style>
    </head>

    <body>
        <!-- ============================================================== -->
        <!-- login page  -->
        <!-- ============================================================== -->
        <div class="splash-container">
            <div class="card ">
                <div class="card-header text-center"><a href="#"><img class="logo-img" style="width: 180px; height: 80px;" src="assets/images/fieldcore.png" alt="logo"></a>
                    <span class="splash-description"></span></div>
                <div class="card-body">

                        <h2 class="form-signin-heading text-center">Código expirado</h2>
                        <br/>                    
                        <div class="form-group">
                            <label>No se ha podido efectuar la recuperación. <a href="Login.jsp">Volver al login</a></label>
                        </div>
                        <!--<button class="btn btn-info" type="button" onclick="window.location.href='RegistraNuevoUsuario.jsp'">Registrarse</button>-->                

                    <br>

                    <c:if test="${error!=null}">
                        <div class="alert alert-danger" role="alert">
                            <c:out value="${error}"/>
                            <c:remove var="error"/>
                        </div>

                        <%
                            session.invalidate();
                        %>

                    </c:if>            
                    <c:if test="${exito!=null}">
                        <div class="alert alert-success" role="alert">
                            <c:out value="${exito}"/>
                            <c:remove var="exito"/>
                        </div>
                    </c:if>                  


                </div>
                <div class="card-footer bg-white p-0  ">
                    
                </div>
            </div>
        </div>

        <!-- Footer 
        <footer class="page-footer font-small special-color-dark pt-4">
             Copyright 
            <div class="footer-copyright text-center py-3">© 2018 Copyright:
              <a href="https://mdbootstrap.com/bootstrap-tutorial/"> EquipoAllSafe.com</a>
            </div>
             Copyright 
        
        </footer>
         Footer      -->


        <!-- ============================================================== -->
        <!-- end login page  -->
        <!-- ============================================================== -->
        <!-- Optional JavaScript -->
        <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    </body>

</html>