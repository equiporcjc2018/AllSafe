/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Asignatrabajadorproyecto;
import allSafe.persistencia.AsignarDAOSessionBean;
import allSafe.persistencia.ControllerException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ejb.EJB;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Ruben
 */
@WebServlet(name = "ListarTrabajadorProyectoServlet", urlPatterns = {"/listarTrabajadorProyectoServlet"})
public class ListarTrabajadorProyectoServlet extends HttpServlet {

    @EJB
    AsignarDAOSessionBean objAsignarDAOSessionBean;
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion= request.getSession();
        List<Asignatrabajadorproyecto>listadoTrabajadorProyecto;
        try {
            listadoTrabajadorProyecto = objAsignarDAOSessionBean.getAllAsignaTrabAProy();
            sesion.setAttribute("listadoTrabajadorProyecto", listadoTrabajadorProyecto);
        } catch (ControllerException ex) {
            Logger.getLogger(ListarEppsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    

}
