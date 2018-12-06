<%-- 
    Document   : MantenedorProcesoEPP
    Created on : 05-12-2018, 23:19:18
    Author     : hachi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="datatables/media/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        <script src="datatables/media/js/jquery.js" type="text/javascript"></script>
        <script src="datatables/media/js/jquery.dataTables.js" type="text/javascript"></script>
        <script>
            $(document).ready(function ()
            {
                $('#proyecto').DataTable();
            });
        </script> 
        <script>
            $(document).ready(function ()
            {
                $('#persona').DataTable();
            });
        </script> 
        <script>
            $(document).ready(function ()
            {
                $('#epp').DataTable();
            });
        </script> 
        <script>
            $(document).ready(function ()
            {
                $('#eppproceso').DataTable();
            });
        </script> 
    </head>
    <body>

        <jsp:include page="./cargaProyectoServlet" flush="true"/>
        <jsp:include page="./listarEppsServlet" flush="true"/>
        <jsp:include page="./listarPersonaServlet" flush="true"/>
        <jsp:include page="./listarEppProcesoServlet" flush="true"/>
        <jsp:include page="./listarEstadoProyectoServlet" flush="true"/> 
        <jsp:useBean id="persona" class="allSafe.Entities.Persona" scope="page"/>
        <jsp:useBean id="proyecto" class="allSafe.Entities.Proyecto" scope="page"/>
        <jsp:useBean id="epp" class="allSafe.Entities.Epp" scope="page"/>
        <jsp:useBean id="estadoproyecto" class="allSafe.Entities.Estadosproyecto" scope="page"/>
        <jsp:useBean id="eppproceso" class="allSafe.Entities.Eppproceso" scope="page"/>
        <h1>Mantenedor Epp Proceso</h1>
        <fieldset><legend>Agregar Proceso de Epp</legend>

            <form name="frmRegistroEppProceso" method="post" action="./registroEppProcesoServlet">

                <p><h2>Seleccion de Proyecto</h2></p>                  
                <c:choose>
                    <c:when test="${sessionScope.listadoProyectos!=null}">
                        <table class="table table-striped table-bordered" id="proyecto">
                            <thead>
                                <tr>
                                    <th>id </th>
                                    <th>Nombre</th>
                                    <th>Empresa</th>
                                    <th>Pais</th>
                                    <th>Seleccion</th>
                                </tr> 
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>id </th>
                                    <th>Nombre</th>
                                    <th>Empresa</th>
                                    <th>Pais</th>
                                    <th>Seleccion</th>
                                </tr> 
                            </tfoot>
                            <tbody>
                                <c:forEach items="${sessionScope.listadoProyectos}" var="proyecto">
                                    <tr>
                                        <td><c:out value="${proyecto.idProyecto}"/></td>
                                        <td><c:out value="${proyecto.nombreProyecto}"/></td>
                                        <td><c:out value="${proyecto.empresaidEmpresa.razonSocialEmpresa}"/></td>
                                        <td><c:out value="${proyecto.ciudadidCiudad.paisidPais.pais}"/></td>    
                                        <td><input required type="radio" name="rdbProyecto" value="${proyecto.idProyecto}" /></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>


                    <c:otherwise>
                        No existen resultados
                    </c:otherwise>
                </c:choose>
                        
                <hr><hr>
                
                <p><h2>Seleccion de Persona</h2></p>  
        
                <c:choose>
                    <c:when test="${sessionScope.listaTrabajadores!=null}">
                        <table  id="persona">
                            <thead>
                                <tr>
                                    <th>rut</th>
                                    <th>Nombre</th>
                                    <th>Seleccion</th>
                                </tr> 
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>rut</th>
                                    <th>Nombre</th>
                                    <th>Seleccion</th>
                                </tr> 
                            </tfoot>
                            <tbody>
                                <c:forEach items="${sessionScope.listaTrabajadores}" var="persona">
                                    <tr>
                                        <td><c:out value="${persona.rutPasaportePersona}"/></td>
                                        <td><c:out value="${persona.nombresPersona} ${persona.apePatPersona} ${persona.apePatPersona}"/></td>
                                        <td><input required type="radio" name="rdbPersona" value="${persona.rutPasaportePersona}" /></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>

                    <c:otherwise>
                        No existen resultados
                    </c:otherwise>
                </c:choose>
                        
                <hr><hr>
                
                <p><h2>Seleccion de EPP</h2></p>     
        
                <c:choose>
                    <c:when test="${sessionScope.listadoEpps!=null}">
                        <table  id="epp">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Descripcion</th>
                                    <th>Tipo</th>
                                    <th>Seleccion</th>
                                </tr> 
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Descripcion</th>
                                    <th>Tipo</th>
                                    <th>Seleccion</th>
                                </tr> 
                            </tfoot>
                            <tbody>
                                <c:forEach items="${sessionScope.listadoEpps}" var="epp">
                                    <tr>
                                        <td><c:out value="${epp.nombreEPPcol}"/></td>
                                        <td><c:out value="${epp.descripcionEPP}"/></td>
                                        <td><c:out value="${epp.tipoEPPidTipoEPP.descripcionTipoEPP}"/></td>
                                        <td><input required type="radio" name="rdbEpp" value="${epp.idEPP}" /></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>

                    <c:otherwise>
                        No existen resultados
                    </c:otherwise>
                </c:choose>

                <hr><hr>

                <h2>Datos de Proceso</h2>
                <p>Cargo:
                        <select required name="ddlEstadoProyecto">
                            <option value="">--Seleccione--</option>
                            <c:forEach items="${sessionScope.listadoEstadosproyectos}" var="estadoproyecto">
                                <option value="${estadoproyecto.idEstadosProyecto}"><c:out value="${estadoproyecto.descripcionEstadosProyecto}" ></c:out></option>
                            </c:forEach>
                        </select>
                        
                    </p>
                <p>Talla Epp: <input type="text" name="txtTallaProceso" required />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unidad: <input type="text" name="txtUnidadProceso" required /></p>
                <p>Cantidad: <input type="text" name="txtCantidadProceso" required />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Precio Unitario: <input type="text" name="txtPrecioUnitarioProceso" required /></p>
                <p>Destino de Devolución: <input type="text" name="txtDestinoDevolucionProceso" required /></p>
                <p><textarea name="txtMotivoProceso" >
                    Ingrese El Motivo de Devolución
                    </textarea>
                </p>
                
                <p><input type="submit" name="btnGuardar" value="Registrar"></p>
                <hr><hr>
                
                <p><h2>Listado de EPP en Proceso</h2></p>      
        
                <c:choose>
                    <c:when test="${sessionScope.listadoEppProceso!=null}">
                        <table  id="eppproceso">
                            <thead>
                                <tr>
                                    <th>Fecha de Creacion</th>
                                    <th>Nombre Proyecto</th>
                                    <th>Estado Del Proyecto</th>
                                    <th>Nombre Trabajador</th>
                                    <th>Talla EPP</th>
                                    <th>Unidad EPP</th>
                                    <th>Cantidad</th>
                                    <th>Precio Unitario</th>
                                    <th>Destino Devolucion</th>
                                    <th>Motivido</th>
                                    <th>Editar</th>
                                    <th>Eliminar</th>      
                                </tr> 
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Fecha de Creacion</th>
                                    <th>Nombre Proyecto</th>
                                    <th>Estado Del Proyecto</th>
                                    <th>Nombre Trabajador</th>
                                    <th>Talla EPP</th>
                                    <th>Unidad EPP</th>
                                    <th>Cantidad</th>
                                    <th>Precio Unitario</th>
                                    <th>Destino Devolucion</th>
                                    <th>Motivido</th>
                                    <th>Editar</th>
                                    <th>Eliminar</th>
                                </tr> 
                            </tfoot>
                            <tbody>
                                <c:forEach items="${sessionScope.listadoEppProceso}" var="eppproceso">
                                    <tr>
                                        <td><c:out value="${eppproceso.fechaCreacionEppProceso}"/></td>
                                        <td><c:out value="${eppproceso.proyectoidProyecto.nombreProyecto}"/></td>
                                        <td><c:out value="${eppproceso.estadosProyectoidEstadosProyecto.descripcionEstadosProyecto}"/></td>
                                        <td><c:out value="${eppproceso.personarutPasaportePersona.nombresPersona} ${eppproceso.personarutPasaportePersona.apePatPersona} ${eppproceso.personarutPasaportePersona.apeMatPersona} "/></td>
                                        <td><c:out value="${eppproceso.tallaEppProceso}"/></td>
                                        <td><c:out value="${eppproceso.unidadEppProceso}"/></td>
                                        <td><c:out value="${eppproceso.cantidadEppProceso}"/></td>
                                        <td><c:out value="${eppproceso.precioUnitarioEppProceso}"/></td>
                                        <td><c:out value="${eppproceso.destinoDevolucionEppProceso}"/></td>
                                        <td><c:out value="${eppproceso.motivoEppProceso}"/></td>
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
                                                        
            </form>

            <jsp:include page="Footer.jsp" flush="true"/> 
    </body>
</html>
