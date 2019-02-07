/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Epp;
import allSafe.persistencia.ControllerException;
import allSafe.persistencia.EppDAOSessionBean;
import java.io.IOException;
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
@WebServlet(name = "ListarEppsServlet", urlPatterns = {"/listarEppsServlet"})
public class ListarEppsServlet extends HttpServlet {

  @EJB
  EppDAOSessionBean objEppDAOSessionBean;

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion= request.getSession();
        List<Epp>listadoEpps = null;
        try {
            //String vigente = "Si";
            int estandar = 1;
            listadoEpps = objEppDAOSessionBean.getAllEppEstandar(estandar);
            sesion.setAttribute("listadoEpps", listadoEpps);
        } catch (ControllerException ex) {
            Logger.getLogger(ListarEppsServlet.class.getName()).log(Level.SEVERE, null, ex);
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
