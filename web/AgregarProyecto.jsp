
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

                <form class="form-group" name="frmRegistroProyectos" method="post" action="./cargaProyectos">
                    <p>Nombre proyecto <input class="form-control" type="text" name="txtNombreProyecto"></p>
                    <p>Ubicación <input class="form-control" type="text" name="txtUbicacion"></p>
                    <p>Fecha inicio<input class="form-control" type="date" name="txtFechaInicio"></p>
                    <p>Fecha término<input class="form-control" type="date" name="txtFechaTermino"></p>

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

                <input class="btn btn-primary" type="submit" name="btnGuardar" value="Registrar">
            </form>
        </fieldset>
        <c:if test="${sessionScope.msg!=null}">
            <c:out value="${msg}"></c:out>
            <c:remove var="msg"></c:remove>
        </c:if>   
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>        
    </body>
    
   
</html>
