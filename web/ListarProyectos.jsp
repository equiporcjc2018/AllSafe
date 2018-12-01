
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
        <title>Despliegue proyecto</title>
    </head>
    <body>
        <jsp:include page="./cargaProyectos" flush="true"/>
        <jsp:useBean id="proyecto" class="allSafe.Entities.Proyecto" scope="page"/>
        <jsp:useBean id="pais" class="allSafe.Entities.Pais" scope="page"></jsp:useBean>
        <jsp:useBean id="ciudad" class="allSafe.Entities.Ciudad" scope="page"></jsp:useBean>
        <jsp:useBean id="empresa" class="allSafe.Entities.Empresa" scope="page"></jsp:useBean>
       

            <h3>Proyectos</h3>

        <div>
        <c:choose>
            <c:when test="${sessionScope.listadoProyectos!=null}">
                <table>
                    <thead>
                        <tr>
                            <th>Nombre proyecto</th>
                            <th>País</th>
                            <th>Ciudad</th>
                            <th>Empresa</th>
                            <th>Fecha inicio</th>
                            <th>Fecha término</th>
                        </tr> 
                    </thead>
                    <tbody>
                        <c:forEach items="${sessionScope.listadoProyectos}" var="proyecto">
                            <tr>
                                <td><c:out value="${proyecto.nombreProyecto}"/></td>
                                <td><c:out value="${proyecto.paisidPais.pais}"/></td>
                                <td><c:out value="${proyecto.ciudadidCiudad.nombreCiudad}"/></td>
                                <td><c:out value="${proyecto.empresaidEmpresa.idEmpresa}"/></td>
                                <td><c:out value="${proyecto.fechaInicioProyecto}"/></td>
                                <td><c:out value="${proyecto.fechaTerminoProyecto}"/></td>
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
    </body>
</html>
