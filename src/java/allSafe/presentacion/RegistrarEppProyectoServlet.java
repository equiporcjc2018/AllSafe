/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Asignaeppaproyecto;
import allSafe.Entities.Epp;
import allSafe.Entities.Proyecto;
import allSafe.dto.EppProyectoDTO;
import allSafe.persistencia.AsignarDAOSessionBean;
import allSafe.persistencia.EppDAOSessionBean;
import allSafe.persistencia.ProyectoDAOSessionBean;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "RegistrarEppProyectoServlet", urlPatterns = {"/registrarEppProyectoServlet","/registroEppProy"})
public class RegistrarEppProyectoServlet extends HttpServlet {

    
    @EJB
    ProyectoDAOSessionBean objProyectoDAOSessionBean;
    @EJB
    EppDAOSessionBean objEppDAOSessionBean;
    @EJB
    AsignarDAOSessionBean objAsignarDaoSessionBean;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String prueba = "Epp";
        HttpSession sesion = request.getSession();
        EppProyectoDTO objEppProyectoDTO = new EppProyectoDTO();
        
        Proyecto objProyecto = new Proyecto();
        Epp objEpp = new Epp();
        Asignaeppaproyecto objAsignaeppaproyecto = new Asignaeppaproyecto();
        
        try {
                      
            String proyecto = request.getParameter("rdbProyecto");
            
            int epp = 0;
            String [] epp2 = request.getParameterValues("chkEpp");
            

            if (!(proyecto.isEmpty())) {
                
                
                for(int i=0; i<epp2.length;i++){
                epp = Integer.parseInt(epp2[i]);
                //Se obtiene el objeto proyecto
                objProyecto = objProyectoDAOSessionBean.buscaProyectoXID(Integer.parseInt(proyecto));
                //Se busca si el epp ya fue asignado
                objAsignaeppaproyecto = objAsignarDaoSessionBean.buscaAsigEppXID(epp,Integer.parseInt(proyecto));
                    if ((objAsignaeppaproyecto==null)) {
                        objEpp = objEppDAOSessionBean.buscaEppXcodigo(epp);
                        objEppProyectoDTO.setObjProyecto(objProyecto);
                        objEppProyectoDTO.setObjEpp(objEpp);
                
                        objAsignarDaoSessionBean.addEppProy(objEppProyectoDTO);
                        sesion.setAttribute("Exito4", "Epp Proceso Agregado Correctamente");
                    }
                
                }
                
                response.sendRedirect("AsignarEPPaProyecto.jsp");
                
            }else
            {
                sesion.setAttribute("error5", "debe llenar todos los campos");
                response.sendRedirect("AsignarEPPaProyecto.jsp");
            }
            } 
            catch (Exception e) 
            {
                sesion.setAttribute("error6", "error en el proceso de Registro");
                response.sendRedirect("AsignarEPPaProyecto.jsp");
            }
    }

    

}
