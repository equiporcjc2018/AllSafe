/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.persistencia.EppDAOSessionBean;
import allSafe.Entities.Epp;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "CambiaEstadoVigenteEPPServelt", urlPatterns = {"/cambiaEstadoVigenteEPPServelt","/cambiaEstadoVigenteEpp"})
public class CambiaEstadoVigenteEPPServelt extends HttpServlet {

    @EJB
    EppDAOSessionBean objEppDAOSessionBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        try 
        {
            int idEpp = Integer.parseInt(request.getParameter("id_epp"));
            Epp infoEpp = this.objEppDAOSessionBean.cambiarVigenciaEPP(idEpp);
            sesion.setAttribute("exito", "El EPP "+infoEpp.getNombreEPPcol()+" pasó a estar "+(infoEpp.isVigente() ? "Vigente" : "No vigente" ));
            response.sendRedirect("MantenedorEPP.jsp");
        } 
        catch (IOException | NumberFormatException ex) 
        {
            sesion.setAttribute("error", "Ocurrió un error al modificar la vigencia");
            Logger.getLogger(ListarEppsServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("MantenedorEPP.jsp");
        }
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }



}
