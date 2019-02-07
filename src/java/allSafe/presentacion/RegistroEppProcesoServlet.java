/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Epp;
import allSafe.Entities.Asignaeppaproyecto;
import allSafe.Entities.Estadosproyecto;
import allSafe.Entities.Persona;
import allSafe.Entities.Proyecto;
import allSafe.dto.EppProcesoProyectoEPPPersonaEstadoProyectoDTO;
import allSafe.persistencia.EppDAOSessionBean;
import allSafe.persistencia.EppProcesoDaoSessionBeans;
import allSafe.persistencia.EstadoProyectoDAOSessionBeans;
import allSafe.persistencia.PersonaSessionBean;
import allSafe.persistencia.ProyectoDAOSessionBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hachi
 */
@WebServlet(name = "RegistroEppProcesoServlet", urlPatterns = {"/registroEppProcesoServlet"})
public class RegistroEppProcesoServlet extends HttpServlet {

    @EJB
    EppProcesoDaoSessionBeans objEppProcesoDaoSessionBeans;
    @EJB
    EppDAOSessionBean objEppDAOSessionBean;
    @EJB
    ProyectoDAOSessionBean objProyectoDAOSessionBean;
    @EJB
    PersonaSessionBean objPersonaSessionBean;
    @EJB
    EstadoProyectoDAOSessionBeans objEstadoProyectoDAOSessionBeans;
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        EppProcesoProyectoEPPPersonaEstadoProyectoDTO objEppepppepDTO = new EppProcesoProyectoEPPPersonaEstadoProyectoDTO();
        Asignaeppaproyecto objEppproceso = new Asignaeppaproyecto();
        Proyecto objProyecto = new Proyecto();
        Persona objPersona = new Persona();
        Epp objEpp = new Epp();
        Estadosproyecto objEstadosproyecto = new Estadosproyecto();
        try {
            
                        
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    Date date = new Date();
            
            String fecha = dateFormat.format(date);
            
            String proyecto = request.getParameter("rdbProyecto");
            String persona = request.getParameter("rdbPersona");
            //String epp = request.getParameter("rdbEpp");
            String epp = "";
            String [] epp2 = request.getParameterValues("rdbEpp");
            //String [] talla2 = request.getParameterValues("txtTallaProceso");
            
            
            //String eppBd="";
            //for(int i=0; i<epp2.length;i++){
            //eppBd=eppBd+epp2[i];
            //}
            
            String estadoProyecto = request.getParameter("ddlEstadoProyecto");
            
            String talla = request.getParameter("txtTallaProceso");
            String unidad = request.getParameter("txtUnidadProceso");
            String cantidad = request.getParameter("txtCantidadProceso");
            String precio = request.getParameter("txtPrecioUnitarioProceso");
            String destinoDevolucion = request.getParameter("txtDestinoDevolucionProceso");
            String motivo = request.getParameter("txtMotivoProceso");

            if (!(fecha == null || proyecto == null || persona == null || epp == null || estadoProyecto == null || talla == null || cantidad == null || precio == null || destinoDevolucion == null || motivo == null || unidad == null )) {
                
                epp="";
                for(int i=0; i<epp2.length;i++){
                epp = epp2[i];
                //talla = talla2[i];
                objProyecto = objProyectoDAOSessionBean.buscaProyectoXID(Integer.parseInt(proyecto));
                objEpp = objEppDAOSessionBean.buscaEppXID(Integer.parseInt(epp));
                //objEppproceso.setFechaCreacionEppProceso(fecha);
                objPersona = objPersonaSessionBean.buscaPersonaXRut(persona);
                //objEppproceso.setTallaEppProceso(talla);
                //objEppproceso.setUnidadEppProceso(Integer.parseInt(unidad));
                //objEppproceso.setCantidadEppProceso(cantidad);
                //objEppproceso.setPrecioUnitarioEppProceso(Integer.parseInt(precio));
                //objEppproceso.setDestinoDevolucionEppProceso(destinoDevolucion);
                //objEppproceso.setMotivoEppProceso(motivo);
                objEstadosproyecto = objEstadoProyectoDAOSessionBeans.buscaEstadosproyectoXID(Integer.parseInt(estadoProyecto));
                objEppepppepDTO.setObjEppproceso(objEppproceso);
                objEppepppepDTO.setObjProyecto(objProyecto);
                objEppepppepDTO.setObjEpp(objEpp);
                objEppepppepDTO.setObjPersona(objPersona);
                objEppepppepDTO.setObjEstadosproyecto(objEstadosproyecto);
                objEppProcesoDaoSessionBeans.addEppProceso(objEppepppepDTO);
                sesion.setAttribute("Exito", "EPP Proceso Agregado Correctamente");
                }
                
                response.sendRedirect("MantenedorProcesoEPP.jsp");
                
            }else{
                sesion.setAttribute("error1", "debe llenar todos los campos");
                response.sendRedirect("MantenedorProcesoEPP.jsp");
            }
        } catch (Exception e) {
            sesion.setAttribute("error", "error en el proceso de Registro");
            response.sendRedirect("MantenedorProcesoEPP.jsp");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
