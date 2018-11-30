
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro proyecto</title>
    </head>
    <body>
        <jsp:include page="./cargaPais" flush="true"></jsp:include>
        <jsp:include page="./cargaCiudad" flush="true"></jsp:include>
        <jsp:include page="./cargaEmpresa" flush="true"></jsp:include> 

        <jsp:useBean id="pais" class="allSafe.Entities.Pais" scope="page"></jsp:useBean>
        <jsp:useBean id="ciudad" class="allSafe.Entities.Ciudad" scope="page"></jsp:useBean>
        <jsp:useBean id="empresa" class="allSafe.Entities.Empresa" scope="page"></jsp:useBean>

            <h1>Registro de nuevo proyecto</h1>
            <fieldset>

                <form name="frmRegistroProyectos" method="post" action="./cargaProyectos">
                    <p>Nombre proyecto <input type="text" name="txtNombreProyecto"></p>
                    <p>Ubicación <input type="text" name="txtUbicacion"></p>
                    <p>Fecha inicio<input type="date" name="txtFechaInicio"></p>
                    <p>Fecha término<input type="date" name="txtFechaTermino"></p>

                    <p>País 
                        <select name="ddlPais">
                            <option value="0">--Seleccione--</option>
                        <c:forEach items="${sessionScope.listaPais}" var="pais">
                            <option value="<c:out value="${pais.idPais}"></c:out>"></option>
                        </c:forEach>
                    </select>
                </p>

                <p>Ciudad 
                    <select name="ddlCiudad">
                        <option value="0">--Seleccione--</option>
                        <c:forEach items="${sessionScope.listaCiudad}" var="ciudad">
                            <option value="<c:out value="${ciudad.idCiudad}"></c:out>"></option>
                        </c:forEach>
                    </select>
                </p>

                <p>Empresa 
                    <select name="ddlEmpresa">
                        <option value="0">--Seleccione--</option>
                        <c:forEach items="${sessionScope.listaEmpresa}" var="empresa">
                            <option value="<c:out value="${empresa.idEmpresa}"></c:out>"></option>
                        </c:forEach>
                    </select>
                </p>

                <input type="submit" name="btnGuardar" value="Registrar">
            </form>
        </fieldset>
        <c:if test="${sessionScope.msg!=null}">
            <c:out value="${msg}"></c:out>
            <c:remove var="msg"></c:remove>
        </c:if>    
    </body>
</html>
