/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Epp;
import allSafe.Entities.Proyecto;
import allSafe.persistencia.ProyectoDAOSessionBean;
import java.io.IOException;
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
@WebServlet(name = "CambiaVigenciaProyectoServlet", urlPatterns = {"/cambiaVigenciaProyectoServlet","/cambiaVigenciaProyecto"})
public class CambiaVigenciaProyectoServlet extends HttpServlet {

    @EJB
    ProyectoDAOSessionBean proyectoDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        int idProyecto;
        Proyecto proyecto;
        try 
        {
            idProyecto = Integer.parseInt(request.getParameter("id_proyecto"));
            proyecto = proyectoDAO.cambiarVigencia(idProyecto);
            sesion.setAttribute("exito", "Vigencia del proyecto modificada correctamente");
            response.sendRedirect("MantenedorProyectos.jsp");
        } 
        catch (Exception ex) 
        {
            ex.printStackTrace();
            sesion.setAttribute("error", "Ocurrió un error al modificar la vigencia");
            response.sendRedirect("MantenedorProyectos.jsp");
        }
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }



}
