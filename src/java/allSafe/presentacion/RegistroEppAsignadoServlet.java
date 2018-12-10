/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Epp;
import allSafe.Entities.Eppproceso;
import allSafe.Entities.Estadosproyecto;
import allSafe.Entities.Persona;
import allSafe.Entities.Proyecto;
import allSafe.dto.EppProcesoProyectoEPPPersonaEstadoProyectoDTO;
import allSafe.persistencia.ControllerException;
import allSafe.persistencia.EppDAOSessionBean;
import allSafe.persistencia.EppProcesoDaoSessionBeans;
import allSafe.persistencia.EstadoProyectoDAOSessionBeans;
import allSafe.persistencia.PersonaSessionBean;
import allSafe.persistencia.ProyectoDAOSessionBean;
import allSafe.persistencia.TipoEppDAOSessionBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ruben
 */
@WebServlet(name = "RegistroEppAsignadoServlet", urlPatterns = {"/registroEppAsignadoServlet"})
public class RegistroEppAsignadoServlet extends HttpServlet {

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
        HttpSession sesion= request.getSession();
        List<Persona>listadoPersonas;
        try {
            String rut = (request.getParameter("txtRut")); 
            listadoPersonas = this.objPersonaSessionBean.buscaPersonaXRut2(rut);
            sesion.setAttribute("listaTrabajadores", listadoPersonas);
        } catch (Exception ex) {
            Logger.getLogger(ListarPersonaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       /*
        HttpSession sesion = request.getSession();
        EppProcesoProyectoEPPPersonaEstadoProyectoDTO objEppepppepDTO = new EppProcesoProyectoEPPPersonaEstadoProyectoDTO();
        Eppproceso objEppproceso = new Eppproceso();
        Proyecto objProyecto = new Proyecto();
        Persona objPersona = new Persona();
        Epp objEpp = new Epp();
        Estadosproyecto objEstadosproyecto = new Estadosproyecto();
        try {
            
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    Date date = new Date();
            
            String fecha = dateFormat.format(date);
            
            //String proyecto = request.getParameter("rdbProyecto");
            String rutPersona = (request.getParameter("txtRut"));
            String epp = request.getParameter("rdbEpp");
            //String estadoProyecto = request.getParameter("ddlEstadoProyecto");
            
            //String talla = request.getParameter("txtTallaProceso");
            //String unidad = request.getParameter("txtUnidadProceso");
            //String cantidad = request.getParameter("txtCantidadProceso");
            //String precio = request.getParameter("txtPrecioUnitarioProceso");
            //String destinoDevolucion = request.getParameter("txtDestinoDevolucionProceso");
            //String motivo = request.getParameter("txtMotivoProceso");

            //if (!(fecha == null || proyecto == null || persona == null || epp == null || estadoProyecto == null || talla == null || cantidad == null || precio == null || destinoDevolucion == null || motivo == null || unidad == null )) {
            if (!(fecha == null || epp == null )) {
                
                //objProyecto = objProyectoDAOSessionBean.buscaProyectoXID(Integer.parseInt(proyecto));
                objEpp = objEppDAOSessionBean.buscaEppXID(Integer.parseInt(epp));
                objEppproceso.setFechaCreacionEppProceso(fecha);
                //objPersona = objPersonaSessionBean.buscaPersonaXRut(persona);
                //objEppproceso.setTallaEppProceso(talla);
                //objEppproceso.setUnidadEppProceso(Integer.parseInt(unidad));
                //objEppproceso.setCantidadEppProceso(cantidad);
                //objEppproceso.setPrecioUnitarioEppProceso(Integer.parseInt(precio));
                //objEppproceso.setDestinoDevolucionEppProceso(destinoDevolucion);
                //objEppproceso.setMotivoEppProceso(motivo);
                //objEstadosproyecto = objEstadoProyectoDAOSessionBeans.buscaEstadosproyectoXID(Integer.parseInt(estadoProyecto));
                objEppepppepDTO.setObjEppproceso(objEppproceso);
                objEppepppepDTO.setObjProyecto(objProyecto);
                objEppepppepDTO.setObjEpp(objEpp);
                objEppepppepDTO.setObjPersona(objPersona);
                objEppepppepDTO.setObjEstadosproyecto(objEstadosproyecto);
                objEppProcesoDaoSessionBeans.addEppProceso(objEppepppepDTO);
                sesion.setAttribute("Exito", "EPP Proceso Agregado Correctamente");
                response.sendRedirect("MantenedorEntregaEPP.jsp");
                
            }else{
                sesion.setAttribute("error1", "debe llenar todos los campos");
                response.sendRedirect("MantenedorEntregaEPP.jsp");
            }
        } catch (Exception e) {
            sesion.setAttribute("error", "error en el proceso de Registro");
            response.sendRedirect("MantenedorEntregaEPP.jsp");
        }
        */
    }

    
}
