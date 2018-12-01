<%-- 
    Document   : Login
    Created on : 16-03-2017, 12:15:02
    Author     : rcarrasco
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/bootstrap.min.css" rel="stylesheet"/>       
        <link href="css/signin.css" rel="stylesheet"/>
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
     
        <div class="container">            
            <form name="frmIngreso" class="form-signin" method="POST" action="./validaIngresobj" >
                <h2 class="form-signin-heading text-center">Ingreso al Sistema AllSafe RCV</h2>
                <br/>
                <label for="txtLogin" class="">Login de acceso</label>

                <input type="text" id="txtLogin" name="txtLogin" class="form-control" placeholder="login" required autofocus>

                <label for="txtPass" class="sr-only">Password</label>
                <input type="password" id="txtPass" name="txtPass"  class="form-control" placeholder="Password" required>
                
                <button class="btn btn-success" type="submit">Ingresar</button>
                <!--<button class="btn btn-info" type="button" onclick="window.location.href='RegistraNuevoUsuario.jsp'">Registrarse</button>-->                
            </form>
            
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

        
         <!-- Footer -->
<footer class="page-footer font-small special-color-dark pt-4">

    <!-- Footer Elements -->
    <div class="container">

      <!-- Social buttons -->
      <ul class="list-unstyled list-inline text-center">
        <li class="list-inline-item">
          <a class="btn-floating btn-fb mx-1">
            <i class="fa fa-facebook"> </i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="btn-floating btn-tw mx-1">
            <i class="fa fa-twitter"> </i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="btn-floating btn-gplus mx-1">
            <i class="fa fa-google-plus"> </i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="btn-floating btn-li mx-1">
            <i class="fa fa-linkedin"> </i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="btn-floating btn-dribbble mx-1">
            <i class="fa fa-dribbble"> </i>
          </a>
        </li>
      </ul>
      <!-- Social buttons -->

    </div>
    <!-- Footer Elements -->

    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">© 2018 Copyright:
      <a href="https://mdbootstrap.com/bootstrap-tutorial/"> EquipoAllSafe.com</a>
    </div>
    <!-- Copyright -->

  </footer>
  <!-- Footer -->  
        
    </body>
</html>
