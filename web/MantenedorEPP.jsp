<%-- 
    Document   : MantenedorEPP
    Created on : 29-11-2018, 1:13:07
    Author     : Camilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenedor EPP</title>
    </head>
    <body>
        <jsp:include page="./listarEppsServlet" flush="true"/>
        <jsp:include page="./listarTipoEppsServlet" flush="true"/>
        <jsp:useBean id="epp" class="allSafe.Entities.Epp" scope="page"/>
        <jsp:useBean id="tipoEpp" class="allSafe.Entities.Tipoepp" scope="page"/>
        <h1>Mantenedor EPP</h1>
        <fieldset><legend>Agregar EPP</legend>

                <form name="frmRegistroEPP" method="post" action="./registroEppServlet">
                    <p>Tipo EPP</p>
                    <p><c:forEach items="${listadoTipoEpps}" var="tipoEpp">
                        <input type="radio" name="RDBtipoEPP" value="${tipoEpp.idTipoEPP}" <td><c:out value="${tipoEpp.descripcionTipoEPP.toString()}"/>
                    </c:forEach></p>
                    <p>Nombre: <input type="text" name="txtnombre"></p>
                    <p>Descripcion: <input type="text" name="txtDescripcion"></p>


                <input type="submit" name="btnGuardar" value="Registrar">
            </form>
        </fieldset>

            <h3>Listado EPPS</h3>

        <div>
        <c:choose>
            <c:when test="${sessionScope.listadoEpps!=null}">
                <table>
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
                                <td><input type="button" name="btnEditar" value="Editar"/></td>
                                <td><input type="button" name="btnEliminar" value="Eliminar"/></td>
                               
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
