/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Persona;
import allSafe.persistencia.PersonaSessionBean;
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
 * @author hachi
 */
@WebServlet(name = "CambiaVigenciaPersonaServlet", urlPatterns = {"/cambiaVigenciaPersona"})
public class CambiaVigenciaPersonaServlet extends HttpServlet {

    @EJB
    PersonaSessionBean objPersonaSessionBean;
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        String idPersona;
        try 
        {
            idPersona = request.getParameter("id_persona");
            Persona persona = objPersonaSessionBean.cambiarVigencia(idPersona);
            sesion.setAttribute("exito", "La Persona con Rut "+persona.getRutPasaportePersona()+" pasó a estar "+(persona.isVigente() ? "vigente" : "no vigente" ) );
            response.sendRedirect("MantenedorTrabajadores.jsp");
        } 
        catch (IOException | NumberFormatException ex) 
        {
            sesion.setAttribute("error", "Ocurrió un error al modificar la vigencia");
            response.sendRedirect("MantenedorTrabajadores.jsp");
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
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
