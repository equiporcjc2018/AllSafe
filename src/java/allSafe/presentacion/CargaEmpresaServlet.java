/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Empresa;
import allSafe.persistencia.EmpresaDAOSessionBean;
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

/**
 *
 * @author JuanCarlos
 */
@WebServlet(name = "CargaEmpresaServlet", urlPatterns = {"/cargaEmpresaServlet","/cargaEmpresa"})
public class CargaEmpresaServlet extends HttpServlet {
    @EJB
    private EmpresaDAOSessionBean empresaDAOSessionBean;
   
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        List<Empresa> listaEmpresa=this.empresaDAOSessionBean.getAllEmpresa();
        sesion.setAttribute("listaEmpresa", listaEmpresa);
        response.sendRedirect("AgregarProyecto.jsp");
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
}
