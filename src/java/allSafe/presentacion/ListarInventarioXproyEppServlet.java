/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Asignacantidadepp;
import allSafe.persistencia.AsignarDAOSessionBean;
import allSafe.persistencia.ControllerException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ruben
 */
@WebServlet(name = "ListarInventarioXproyEppServlet", urlPatterns = {"/listarInventarioXproyEppServlet","/listarInventarioServlet"})
public class ListarInventarioXproyEppServlet extends HttpServlet {

    @EJB
    AsignarDAOSessionBean objAsignacantidadeppDAOSessionBeans;
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        List<Asignacantidadepp> listadoInventario;
        try {
            listadoInventario = objAsignacantidadeppDAOSessionBeans.getInventario();
            sesion.setAttribute("listadoInventario", listadoInventario);
        } catch (Exception ex) {
            Logger.getLogger(ListarTallaOberolServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    

}
