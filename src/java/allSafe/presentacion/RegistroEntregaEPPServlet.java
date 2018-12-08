/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Persona;
import allSafe.persistencia.EppDAOSessionBean;
import allSafe.persistencia.PersonaSessionBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import allSafe.persistencia.PersonaDAOSessionBean;
import allSafe.persistencia.TipoEppDAOSessionBean;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JuanCarlos
 */
@WebServlet(name = "RegistroEntregaEPPServlet", urlPatterns = {"/registroEntregaEPPServlet","/registroEntregaEPP"})
public class RegistroEntregaEPPServlet extends HttpServlet {

    @EJB
    private PersonaSessionBean personaDAOSessionBeans;
    
    @EJB 
    private EppDAOSessionBean eppDAOSessionBean;
    
    @EJB 
    private TipoEppDAOSessionBean tipoEppDAOSessionBean;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        String personaIngresar = (request.getParameter("txtRut"));
        List<Persona> infoPersona = this.personaDAOSessionBeans.buscaPersonaXRut2(personaIngresar);
        sesion.setAttribute("infoPersona", infoPersona);
        response.sendRedirect("MantenedorEntregaEPP.jsp");
        
        
    }

   
}
