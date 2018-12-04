<%-- 
    Document   : MantenedorProyectos
    Created on : 03-12-2018, 21:46:29
    Author     : hachi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proyectos</title>
    </head>
    <body>
        <jsp:include page="./cargaPais" flush="true"></jsp:include>
        <jsp:include page="./cargaCiudad" flush="true"></jsp:include>
        <jsp:include page="./cargaEmpresa" flush="true"></jsp:include>
        <jsp:include page="./cargaProyectoServlet" flush="true"/>
        <jsp:useBean id="proyecto" class="allSafe.Entities.Proyecto" scope="page"/>
        <jsp:useBean id="pais" class="allSafe.Entities.Pais" scope="page"></jsp:useBean>
        <jsp:useBean id="ciudad" class="allSafe.Entities.Ciudad" scope="page"></jsp:useBean>
        <jsp:useBean id="empresa" class="allSafe.Entities.Empresa" scope="page"></jsp:useBean>
            <h1>Mantenedor Proyectos</h1>

            <h1>Registro de nuevo proyecto</h1>
            <fieldset>

                <form class="form-group" name="frmRegistroProyectos" method="post" action="./cargaProyectos">
                    <p>Nombre proyecto <input class="form-control" type="text" name="txtNombreProyecto" required></p>
                    <p>Ubicación <input class="form-control" type="text" name="txtUbicacion" required></p>
                    <p>Fecha inicio<input class="form-control" type="date" name="txtFechaInicio" required></p>
                    <p>Fecha término<input class="form-control" type="date" name="txtFechaTermino" required></p>

                    <p>País 
                        <select name="ddlPais" >
                            <option value="0">--Seleccione--</option>
                        <c:forEach items="${sessionScope.listaPais}" var="pais">
                            <option value="<c:out value="${pais.idPais}"></c:out>"><c:out value="${pais.pais}"></c:out></option>
                        </c:forEach>
                    </select>
                </p>

                <p>Ciudad 
                    <select name="ddlCiudad">
                        <option value="0">--Seleccione--</option>
                        <c:forEach items="${sessionScope.listaCiudad}" var="ciudad">
                            <option value="<c:out value="${ciudad.idCiudad}"></c:out>"><c:out value="${ciudad.nombreCiudad}"></c:out></option>
                        </c:forEach>
                    </select>
                </p>

                <p>Empresa 
                    <select name="ddlEmpresa">
                        <option value="0">--Seleccione--</option>
                        <c:forEach items="${sessionScope.listaEmpresa}" var="empresa">
                            <option value="<c:out value="${empresa.idEmpresa}"></c:out>"><c:out value="${empresa.razonSocialEmpresa}"></c:out></option>
                        </c:forEach>
                    </select>
                </p>

                <input class="btn btn-primary" type="submit" name="btnGuardar" value="Registrar">
            </form>
        </fieldset>
        <c:if test="${sessionScope.msg!=null}">
            <c:out value="${msg}"></c:out>
            <c:remove var="msg"></c:remove>
        </c:if>   
            
            <h3>Listado Proyectos</h3>

            <div>
            <c:choose>
                <c:when test="${sessionScope.listadoProyectos!=null}">
                    <table>
                        <thead>
                            <tr>
                                <th>Nombre proyecto</th>
                                <th>País</th>
                                <th>Ciudad</th>
                                <th>Rut Empresa</th>
                                <th>Razon Social Empresa</th>
                                <th>Fecha inicio</th>
                                <th>Fecha término</th>
                            </tr> 
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Nombre proyecto</th>
                                <th>País</th>
                                <th>Ciudad</th>
                                <th>Rut Empresa</th>
                                <th>Razon Social Empresa</th>
                                <th>Fecha inicio</th>
                                <th>Fecha término</th>
                            </tr> 
                        </tfoot>
                        <tbody>
                            <c:forEach items="${sessionScope.listadoProyectos}" var="proyecto">
                                <tr>
                                    <td><c:out value="${proyecto.nombreProyecto}"/></td>
                                    <td><c:out value="${proyecto.ciudadidCiudad.paisidPais.pais}"/></td>
                                    <td><c:out value="${proyecto.ciudadidCiudad.nombreCiudad}"/></td>
                                    <td><c:out value="${proyecto.empresaidEmpresa.rutEmpresa}"/></td>
                                    <td><c:out value="${proyecto.empresaidEmpresa.razonSocialEmpresa}"/></td>
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

        <jsp:include page="Footer.jsp" flush="true"/> 
    </body>
</html>
