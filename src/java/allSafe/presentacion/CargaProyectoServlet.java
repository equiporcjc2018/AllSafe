/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Proyecto;
import allSafe.persistencia.ProyectoDAOSessionBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "CargaProyectoServlet", urlPatterns = {"/cargaProyectoServlet", "/cargaProyectos"})
public class CargaProyectoServlet extends HttpServlet {

    private ProyectoDAOSessionBean proyectoDAOSessionBean;
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        HttpSession sesion = request.getSession();
        
        List<Proyecto> listadoProyectos=this.proyectoDAOSessionBean.getAllProyecto();
       
        sesion.setAttribute("listadoProyectos", listadoProyectos);
        response.sendRedirect("ListarProyectos.jsp");
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

  

}
