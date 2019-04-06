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
        <title>Recuperar contraseña</title>
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
                   
                    <form name="frmIngreso" class="form-signin" method="POST" action="./recuperarClave" >
                        <h2 class="form-signin-heading text-center">Cambiar contraseña</h2>
                        <br/>  
                        <input type=hidden id="codigo" name="codigo" value="<%= request.getParameter("codigo") %>">
                        <input type=hidden id="id" name="id" value="<%= request.getParameter("id") %>">
                        
                        <div class="form-group">
                            <input class="form-control form-control-lg" id="txtClave" name="txtClave" type="password" placeholder="Clave">
                        </div>
                        <div class="form-group">
                            <input class="form-control form-control-lg" id="txtClave2" name="txtClave2" type="password" placeholder="Repetir">
                        </div>
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Enviar</button>
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