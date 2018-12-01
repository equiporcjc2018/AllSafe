/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Cargo;
import allSafe.persistencia.CargoSessionBean;
import allSafe.persistencia.ControllerException;
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
@WebServlet(name = "ListarCargoServlet", urlPatterns = {"/listarCargoServlet"})
public class ListarCargoServlet extends HttpServlet {

    @EJB
    CargoSessionBean objCargoSessionBean;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        List<Cargo> listadoCargos;
        try {
            listadoCargos = objCargoSessionBean.getAllCargo();
            sesion.setAttribute("listaCargo", listadoCargos);
        } catch (ControllerException ex) {
            Logger.getLogger(ListarCargoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
