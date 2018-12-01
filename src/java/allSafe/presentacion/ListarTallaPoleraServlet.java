/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Tallapoleracamisa;
import allSafe.persistencia.ControllerException;
import allSafe.persistencia.TallaPoleraCamisaSessionBean;
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
@WebServlet(name = "ListarTallaPoleraServlet", urlPatterns = {"/listarTallaPoleraServlet"})
public class ListarTallaPoleraServlet extends HttpServlet {

    @EJB
    TallaPoleraCamisaSessionBean objTallaPoleraCamisaSessionBean;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        List<Tallapoleracamisa> listadoTallapoleracamisas;
        try {
            listadoTallapoleracamisas = objTallaPoleraCamisaSessionBean.getAllTallaPoleraCamisa();
            sesion.setAttribute("listaPolera", listadoTallapoleracamisas);
        } catch (ControllerException ex) {
            Logger.getLogger(ListarTallaPoleraServlet.class.getName()).log(Level.SEVERE, null, ex);
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
