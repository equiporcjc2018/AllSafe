/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Eppterreno;
import allSafe.Entities.Persona;
import allSafe.persistencia.ControllerException;
import allSafe.persistencia.EppTerrenoDaoSessionsBeans;
import allSafe.persistencia.PersonaSessionBean;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author hachi
 */
@WebServlet(name = "BuscarEppTerrenoXRutServlet", urlPatterns = {"/buscarEppTerrenoXRutServlet"})
public class BuscarEppTerrenoXRut extends HttpServlet {

    @EJB
    EppTerrenoDaoSessionsBeans objEppTerrenoDaoSessionsBeans;
    @EJB
    PersonaSessionBean objPersonaSessionBean;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion= request.getSession();
        List<Eppterreno>listadoEppTerreno;
        String rut = request.getParameter("txtRutPersona");
        try {
            listadoEppTerreno = objEppTerrenoDaoSessionsBeans.buscaEppTerrenoXRut(rut);
            Persona objPersona = objPersonaSessionBean.buscaPersonaXRut(rut);
            sesion.setAttribute("rutBuscadoHistorico", listadoEppTerreno);
            sesion.setAttribute("PersonaBuscada", objPersona);
            response.sendRedirect("ReporteHistoricoXTrabajador.jsp");
        } catch (Exception ex) {
            response.sendRedirect("ReporteHistoricoXTrabajador.jsp");
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
