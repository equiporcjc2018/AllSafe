/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Epp;
import allSafe.Entities.Asignaeppaproyecto;
import allSafe.Entities.Eppterreno;
import allSafe.Entities.Estadosproyecto;
import allSafe.Entities.Persona;
import allSafe.Entities.Proyecto;
import allSafe.Entities.Usuarioallsafe;
import allSafe.dto.EppProcesoProyectoEPPPersonaEstadoProyectoDTO;
import allSafe.dto.EppTerrenoProyectoEPPPErsonalDTO;
import allSafe.persistencia.EppDAOSessionBean;
import allSafe.persistencia.EppProcesoDaoSessionBeans;
import allSafe.persistencia.EppTerrenoDaoSessionsBeans;
import allSafe.persistencia.EstadoProyectoDAOSessionBeans;
import allSafe.persistencia.PersonaSessionBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import allSafe.persistencia.PersonaSessionBean;
import allSafe.persistencia.ProyectoDAOSessionBean;
import allSafe.persistencia.TipoEppDAOSessionBean;
import allSafe.persistencia.UsuarioDAOSessionBean;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JuanCarlos
 */
@WebServlet(name = "RegistroEntregaEPPServlet", urlPatterns = {"/registroEntregaEPPServlet","/registroEntregaEPP"})
public class RegistroEntregaEPPServlet extends HttpServlet {

    @EJB
    EppProcesoDaoSessionBeans objEppProcesoDaoSessionBeans;
    @EJB
    EppTerrenoDaoSessionsBeans objEppTerrenoDaoSessionBeans;
    @EJB
    EppDAOSessionBean objEppDAOSessionBean;
    @EJB
    ProyectoDAOSessionBean objProyectoDAOSessionBean;
    @EJB
    PersonaSessionBean objPersonaSessionBean;
    @EJB
    EstadoProyectoDAOSessionBeans objEstadoProyectoDAOSessionBeans;
    @EJB
    UsuarioDAOSessionBean objUsuarioDAOSessionBean;
    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        EppTerrenoProyectoEPPPErsonalDTO objEppepppepDTO = new EppTerrenoProyectoEPPPErsonalDTO();
        Asignaeppaproyecto objEppproceso = new Asignaeppaproyecto();
        Eppterreno objEppterreno = new Eppterreno();
        Proyecto objProyecto = new Proyecto();
        Persona objPersona = new Persona();
        Usuarioallsafe objUsuarioallsafe = new Usuarioallsafe();
        Epp objEpp = new Epp();
        Estadosproyecto objEstadosproyecto = new Estadosproyecto();
        try {
            
            
            
            
            String persona = request.getParameter("rdbPersonaTerreno");
                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                String fecha = dateFormat.format(date);
            int usuario = 1;
            String proyecto = "1";
            String estadoEPP = "Por Entregar";
            String idEpp = request.getParameter("rdbEpp");
            int cantidad = 1;
            String talla = "1";
            String observacion = "Observacion";
            String firma = request.getParameter("foto");

            String tipoEntrega = "Tipo Entrega";

            if (!(fecha == null || proyecto == null || persona == null || idEpp == null || estadoEPP == null || talla == null || cantidad == 0)) {
                
                objProyecto = objProyectoDAOSessionBean.buscaProyectoXID(Integer.parseInt(proyecto));
                objEpp = objEppDAOSessionBean.buscaEppXID(Integer.parseInt(idEpp));
                objEppterreno.setFechaEppTerreno(fecha);
                objPersona = objPersonaSessionBean.buscaPersonaXRut(persona);
                objUsuarioallsafe = objUsuarioDAOSessionBean.buscaUsuarioXCodigo(usuario);
                
                objEppterreno.setTallaEppTerreno(talla);
                objEppterreno.setEstadoEppTerreno(estadoEPP);
                objEppterreno.setCantidadEppTerreno(cantidad);
                objEppterreno.setObservacionEppTerreno(observacion);
                objEppterreno.setTipoEntregaEppTerreno(tipoEntrega);
                //objEppterreno.setFirmaEppTerreno(firmaEppTerreno);
                
                //objEppproceso.setUnidadEppProceso(Integer.parseInt(unidad));
                //objEppproceso.setCantidadEppProceso(cantidad);
                //objEppproceso.setPrecioUnitarioEppProceso(Integer.parseInt(precio));
                //objEppproceso.setDestinoDevolucionEppProceso(destinoDevolucion);
                //objEppproceso.setMotivoEppProceso(motivo);
                //objEstadosproyecto = objEstadoProyectoDAOSessionBeans.buscaEstadosproyectoXID(Integer.parseInt(estadoProyecto));
                
                objEppepppepDTO.setObjEppterreno(objEppterreno);
                objEppepppepDTO.setObjProyecto(objProyecto);
                objEppepppepDTO.setObjEpp(objEpp);
                objEppepppepDTO.setObjPersona(objPersona);
                objEppepppepDTO.setObjUsuarioallsafe(objUsuarioallsafe);
                
                
                objEppTerrenoDaoSessionBeans.addEppTerreno(objEppepppepDTO);
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
        
        
        
    }
    
    
}