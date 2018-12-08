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
        <title>Login</title>
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
                <div class="card-header text-center"><a href="#"><img class="logo-img" src="assets/images/logo.png" alt="logo"></a>
                    <span class="splash-description">Cambiar el Logo y este Titulo.</span></div>
                <div class="card-body">

                    <form name="frmIngreso" class="form-signin" method="POST" action="./validaIngresobj" >
                        <h2 class="form-signin-heading text-center">Ingreso al Sistema AllSafe RCV</h2>
                        <br/>
                        <label for="txtLogin" class="">Login de acceso</label>                    
                        <div class="form-group">
                            <input class="form-control form-control-lg" id="txtLogin" name="txtLogin" type="text" placeholder="Username">
                        </div>
                        <div class="form-group">
                            <input class="form-control form-control-lg" id="txtPass" name="txtPass" type="password" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label class="custom-control custom-checkbox">
                                <input class="custom-control-input" type="checkbox"><span class="custom-control-label">Remember Me</span>
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Ingresar</button>
                        <!--<button class="btn btn-info" type="button" onclick="window.location.href='RegistraNuevoUsuario.jsp'">Registrarse</button>-->                

                    </form>
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
                    <div class="card-footer-item card-footer-item-bordered">
                        <a href="#" class="footer-link">Create An Account</a></div>
                    <div class="card-footer-item card-footer-item-bordered">
                        <a href="#" class="footer-link">Forgot Password</a>
                    </div>
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