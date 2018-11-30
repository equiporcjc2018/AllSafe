<%-- 
    Document   : Home
    Created on : 16-03-2017, 14:20:54
    Author     : amontess
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="css/bootstrap.min.css" rel="stylesheet"/>       
        <link href="css/bootstrap-theme.min.css" rel="stylesheet"/>                       
        <link href="css/theme.css" rel="stylesheet"/>                       
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body >
        <c:choose>
            <c:when test="${usuarioConectado!=null}">
                <jsp:include page="/common/Menu.jsp" flush="true"/>
                <div class="container theme-showcase" >
                    <div class="jumbotron">
                        <h1 class="text-center">Equipo AllSafe</h1>                
                    </div>

                    <div class="p-3 mb-2 bg-primary text-white">
                        <h1 class="text-center" style="font-size: 50px;" >Nuestra Solución</h1>
                        <!--<div class="p-3 mb-2 bg-primary text-white">.bg-primary</div>--> 
                        <!--<div style="font-size:50px;">Este texto tiene un tamaño de 25 pixeles.</div>-->               
                    </div>
                    
                    

                    <div class="container">
                        <!--%= new java.util.Date()%-->
                        <section class="row">
                            <article class="col-md-10">
                                <p>
                                    Somos una herramienta de detección, supervisión y control de riesgos laborales. Genera reportes en tiempo real, alertando una acción o condición insegura para su pronta solución.
                                </p>
                                <p>
                                    We are a tool for detection, supervision and control of occupational risks. It generates reports in real time, alerting an action or unsafe condition for its prompt solution.
                                </p>
                            </article>
                            
                           
                            
                            <aside class="col-md-3">
                                <!--p>Ignacio Montoya</p>
                                <p>Josefina Rodriguez</p>
                                <p>Juan Carlos Concha</p>
                                <p>Roger Navarro</p-->
                            </aside>
                        </section>
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
                    
                        
                    
                    <c:if test="${exito!=null}">
                        <div class="alert alert-success" role="alert">
                            <c:out value="${exito}"/>
                            <c:remove var="exito"/>
                        </div>
                    </c:if>
                </div>
            </c:when>
            <c:otherwise>
                <c:redirect url="Login.jsp"/>
            </c:otherwise>
        </c:choose>
    </body>
    
       
</html>