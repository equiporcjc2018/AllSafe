<%-- 
    Document   : MantenedorTrabajadores
    Created on : 30-11-2018, 23:50:58
    Author     : hachi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <jsp:include page="./listarTallaOberolServlet" flush="true"/>
        <jsp:include page="./listarTallaPantalonServlet" flush="true"/>
        <jsp:include page="./listarTallaPoleraServlet" flush="true"/>
        <jsp:include page="./listarTallaZapatoServlet" flush="true"/>
        <jsp:include page="./listarCargoServlet" flush="true"/>
        <jsp:include page="./listarTipoPlantaServlet" flush="true"/>
        <jsp:include page="./listarPersonaServlet" flush="true"/>
        <jsp:useBean id="oberol" class="allSafe.Entities.Tallaoberol" scope="page"/>
        <jsp:useBean id="pantalon" class="allSafe.Entities.Tallapantalon" scope="page"/>
        <jsp:useBean id="polera" class="allSafe.Entities.Tallapoleracamisa" scope="page"/>
        <jsp:useBean id="zapato" class="allSafe.Entities.Tallazapato" scope="page"/>
        <jsp:useBean id="cargo" class="allSafe.Entities.Cargo" scope="page"/>
        <jsp:useBean id="tipoPlanta" class="allSafe.Entities.Tipoplanta" scope="page"/>
        <jsp:useBean id="persona" class="allSafe.Entities.Persona" scope="page"/>
        <h1>Mantenedor Trabajadores</h1>
        <fieldset><legend>Agregar Trabajador</legend>

                <form name="frmRegistroTrabajador" method="post" action="./registroTrabajadorServlet">
                                        
                    <p><b>Datos Personales</b></p>
                    <p>rut:<input type="text" name="txtRut" id="txtRut"  required> <input type="radio" checked="cheked" name="rdbIdentificacion"  onclick="document.getElementById('txtRut').disabled = !this.checked; document.getElementById('txtPasaporte').disabled = this.checked;"  /> Pasaporte:<input type="text" name="txtPasaporte" id="txtPasaporte" disabled="false" required> <input type="radio" name="rdbIdentificacion" onclick="document.getElementById('txtPasaporte').disabled = !this.checked; document.getElementById('txtRut').disabled = this.checked;" /> </p>                    
                    <p>Nombre: <input type="text" name="txtNombre" required> Aperrido Paterno: <input type="text" name="txtApellidoPaterno" required> Apellido Materno<input type="text" name="txtApellidoMaterno" required></p>
                    <p>Fecha Nacimiento: <input type="date" name="txtFechaNacimiento" required> Nacionalidad: <input type="text" name="txtNacionalidad" required> Correo:<input type="email" name="txtCorreo" required></p>
                    <p><b>Laboral</b></p>
                    <p>Cargo:
                        <select required name="ddlCargo">
                            <option value="">--Seleccione--</option>
                            <c:forEach items="${sessionScope.listaCargo}" var="cargo">
                                <option value="${cargo.idCargo}"><c:out value="${cargo.descripcionCargo}" ></c:out></option>
                            </c:forEach>
                        </select>
                        Tipo Planta:
                        <select required name="ddlTipoPlanta">
                            <option value="">--Seleccione--</option>
                            <c:forEach items="${sessionScope.listaPlanta}" var="tipoPlanta">
                                <option value="${tipoPlanta.idTipoPlanta}"><c:out value="${tipoPlanta.descripcionTipoPlanta}" ></c:out></option>
                            </c:forEach>
                        </select>
                    </p>
                    <p><b>Vestimenta</b></p>
                    
                    <p>Oberol:
                        <select required name="ddlOberol">
                            <option value="">--Seleccione--</option>
                            <c:forEach items="${sessionScope.listaOberol}" var="oberol">
                                <option value="${oberol.idTallaOberol}"><c:out value="${oberol.letraTallaOberol} - ${oberol.numeroTallaOberol}" ></c:out></option>
                            </c:forEach>
                        </select>
                        Pantalon:
                        <select required name="ddlPantalon">
                            <option value="">--Seleccione--</option>
                            <c:forEach items="${sessionScope.listaPantalon}" var="pantalon">
                                <option value="${pantalon.idTallaPantalon}"><c:out value="${pantalon.letraTallaPantalon} - ${pantalon.numeroTallaPantalon} " ></c:out></option>
                            </c:forEach>
                        </select>
                        Polera:
                        <select required name="ddlPolera">
                            <option value="">--Seleccione--</option>
                            <c:forEach items="${sessionScope.listaPolera}" var="polera">
                                <option value="${polera.idTallaPoleraCamisa}"><c:out value="${polera.letraPoleraCamisa}- ${polera.numeroPoleraCamisa}" ></c:out></option>
                            </c:forEach>
                        </select>
                        Zapatos:
                        <select required name="ddlZapato">
                            <option value="">--Seleccione--</option>
                            <c:forEach items="${sessionScope.listaZapato}" var="zapato">
                                <option value="${zapato.idTallaZapato}"><c:out value="${zapato.numeroZapato}" ></c:out></option>
                            </c:forEach>
                        </select>
                    </p>


                <input type="submit" name="btnGuardar" value="Registrar">
            </form>
        </fieldset>

        
        
            <h3>Listado Trabajadores</h3>

        <div>
        <c:choose>
            <c:when test="${sessionScope.listaTrabajadores!=null}">
                <table border>
                    
                    <thead>
                        <tr>
                        <TH COLSPAN=5>Datos Personales</TH>
                        <TH COLSPAN=2>Laboral</TH>
                        <TH COLSPAN=4>Vestimenta</TH>
                        <TH COLSPAN=2>Accion</TH>
                    </tr>
                        <tr>
                            <th>Rut/Pasaporte</th>
                            <th>Nombre Completo</th>
                            <th>Fecha de Nacimiento</th>
                            <th>Nacionalidad</th>
                            <th>Correo</th>
                            <th>Cargo</th>
                            <th>Tipo Planta</th>
                            <th>Oberol</th>
                            <th>Pantalon</th>
                            <th>Polera</th>
                            <th>Zapato</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </tr> 
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Rut/Pasaporte</th>
                            <th>Nombre Completo</th>
                            <th>Fecha de Nacimiento</th>
                            <th>Nacionalidad</th>
                            <th>Correo</th>
                            <th>Cargo</th>
                            <th>Tipo Planta</th>
                            <th>Oberol</th>
                            <th>Pantalon</th>
                            <th>Polera</th>
                            <th>Zapato</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </tr> 
                    </tfoot>
                    <tbody>
                        <c:forEach items="${sessionScope.listaTrabajadores}" var="persona">
                            <tr>
                                <td><c:out value="${persona.rutPasaportePersona}"/></td>
                                <td><c:out value="${persona.nombresPersona} ${persona.apePatPersona} ${persona.apeMatPersona}"/></td>
                                <td><c:out value="${persona.fechaNacPersona}"/></td>
                                <td><c:out value="${persona.nacionalidadPersona}"/></td>
                                <td><c:out value="${persona.correoPersona}"/></td>
                                <td><c:out value="${persona.cargoidCargo.descripcionCargo}"/></td>
                                <td><c:out value="${persona.tipoPlantaidTipoPlanta.descripcionTipoPlanta}"/></td>
                                <td><c:out value="${persona.tallaOberolidTallaOberol.letraTallaOberol} - ${persona.tallaOberolidTallaOberol.numeroTallaOberol}"/></td>
                                <td><c:out value="${persona.tallaPantalonidTallaPantalon.letraTallaPantalon} - ${persona.tallaPantalonidTallaPantalon.numeroTallaPantalon}"/></td>
                                <td><c:out value="${persona.tallaPoleraCamisaidtallaPoleraCamisa.letraPoleraCamisa} - ${persona.tallaPoleraCamisaidtallaPoleraCamisa.numeroPoleraCamisa}"/></td>
                                <td><c:out value="${persona.tallaZApatoidtallaZApato.numeroZapato}"/></td>
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
