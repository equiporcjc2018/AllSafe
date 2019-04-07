/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Epp;
import allSafe.Entities.Tipoepp;
import allSafe.dto.EppTipoEppDTO;
import allSafe.persistencia.EppDAOSessionBean;
import allSafe.persistencia.TipoEppDAOSessionBean;
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
 * @author hachi
 */
@WebServlet(name = "RegistroEppServlet", urlPatterns = {"/registroEppServlet"})
public class RegistroEppServlet extends HttpServlet {

    @EJB
    EppDAOSessionBean objEppDAOSessionBean;
    @EJB
    TipoEppDAOSessionBean objTipoEppDAOSessionBean;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        EppTipoEppDTO objEppTipoEppDTO = new EppTipoEppDTO();
        Epp objEpp = new Epp();
        Tipoepp objTipoepp = new Tipoepp();
        try {
            String nombre = request.getParameter("txtnombre");
            String descripcion = request.getParameter("txtDescripcion");
            String tipoEpp = request.getParameter("RDBtipoEPP");
            String vigente = "Y";
            if (!(nombre == null || descripcion == null ||tipoEpp == null )) {
                objEpp.setNombreEPPcol(nombre);
                objEpp.setDescripcionEPP(descripcion);
                objEpp.setVigencia(vigente);
                objTipoepp = objTipoEppDAOSessionBean.buscaTipoEPPXID(Integer.parseInt(tipoEpp));
                objEppTipoEppDTO.setObjEpp(objEpp);
                objEppTipoEppDTO.setObjTipoepp(objTipoepp);
                objEppDAOSessionBean.addEpp(objEppTipoEppDTO);
                sesion.setAttribute("Exito", "EPP Agregado Correctamente");
                response.sendRedirect("MantenedorEPP.jsp");
                
            }else{
                sesion.setAttribute("error1", "debe llenar todos los campos");
                response.sendRedirect("MantenedorEPP.jsp");
            }
        } catch (Exception e) {
            sesion.setAttribute("error", "error en el proceso de Registro");
            response.sendRedirect("MantenedorEPP.jsp");
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
