/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Persona;
import allSafe.Entities.Proyecto;
import allSafe.dto.PersonaProyectoDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "RegistrarDevolucionToolCenterServlet", urlPatterns = {"/registrarDevolucionToolCenterServlet"})
public class RegistrarDevolucionToolCenterServlet extends HttpServlet {

    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String flag = "Bandera1";
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String flag2 = "Bandera2";
        String prueba = "asdasd";
        HttpSession sesion = request.getSession();
        PersonaProyectoDTO objPersonaProyectoDTO = new PersonaProyectoDTO();
        
        Proyecto objProyecto = new Proyecto();
        Persona objPersona = new Persona();
        
        try {
                      
            //String proyecto = request.getParameter("rdbProyecto");
            
            String persona = "";
            String [] persona2 = request.getParameterValues("chkDevIdEpp");
            //String [] persona2 = request.getParameter("chkDevIdEpp");
            

            //if (!(proyecto == null || persona == null )) {
            if (!( persona == null )) {
                
                
                for(int i=0; i<persona2.length;i++){
                persona = persona2[i];
                
                //objProyecto = objProyectoDAOSessionBean.buscaProyectoXID(Integer.parseInt(proyecto));
                //objPersona = objPersonaSessionBean.buscaPersonaXRut(persona);
                //objPersonaProyectoDTO.setObjProyecto(objProyecto);
                //objPersonaProyectoDTO.setObjPersona(objPersona);
                
                //objAsignarDaoSessionBean.addTrabProy(objPersonaProyectoDTO);
                sesion.setAttribute("Exito3", "Trabajador Proceso Agregado Correctamente");
                }
                
                response.sendRedirect("DevolucionToolCenter.jsp");
                
            }else
            {
                sesion.setAttribute("error2", "debe llenar todos los campos");
                response.sendRedirect("DevolucionToolCenter.jsp");
            }
            } 
            catch (Exception e) 
            {
                sesion.setAttribute("error4", "error en el proceso de Registro");
                response.sendRedirect("DevolucionToolCenter.jsp");
            }
    }

    

}
