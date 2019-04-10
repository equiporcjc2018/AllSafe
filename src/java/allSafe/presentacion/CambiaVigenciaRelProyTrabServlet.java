/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Asignatrabajadorproyecto;
import allSafe.Entities.Proyecto;
import allSafe.persistencia.AsignarDAOSessionBean;
import java.io.IOException;
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
@WebServlet(name = "CambiaVigenciaRelProyTrabServlet", urlPatterns = {"/cambiaVigenciaRelProyTrabServlet","/cambiaVigenciaRelProyTrab"})
public class CambiaVigenciaRelProyTrabServlet extends HttpServlet {

    @EJB
    AsignarDAOSessionBean asignarDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        try 
        {
            int idAsignacion = Integer.parseInt(request.getParameter("idAsignacion"));
            Asignatrabajadorproyecto asignacion = asignarDAO.cambiarVigenciaAsigProyTrab(idAsignacion);
            sesion.setAttribute("exito", "La asignación entre "+asignacion.getPersonarutPasaportePersona().getRutPasaportePersona()+" y el proyecto "+asignacion.getProyectoidProyecto().getNombreProyecto()+" pasó a estar "+(asignacion.isVigente() ? "vigente" : "no vigente" ) );
            response.sendRedirect("AsignarPersonaAProyecto.jsp");
        } 
        catch (IOException | NumberFormatException ex) 
        {
            ex.printStackTrace();
            sesion.setAttribute("error", "Ocurrió un error al modificar la vigencia");
            response.sendRedirect("AsignarPersonaAProyecto.jsp");
        }
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }



}
