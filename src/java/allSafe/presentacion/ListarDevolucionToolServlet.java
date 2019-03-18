/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Asignacantidadepp;
import allSafe.Entities.Asignaeppaproyecto;
import allSafe.Entities.Estadosproyecto;
import allSafe.Entities.Proyecto;
import allSafe.Entities.Tipodecarga;
import allSafe.persistencia.AsignarDAOSessionBean;
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
 * @author Ruben
 */
@WebServlet(name = "ListarDevolucionToolServlet", urlPatterns = {"/listarDevolucionToolServlet"})
public class ListarDevolucionToolServlet extends HttpServlet {

    @EJB
    AsignarDAOSessionBean objAsignarDAOSessionBean;

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion= request.getSession();
        List<Asignacantidadepp> listadoReasignacion;
        Tipodecarga listadoTipodeCarga;
                                       
        try {
            int codTipoCarga= 2;
                        
            listadoTipodeCarga = objAsignarDAOSessionBean.buscaTipoDeCarga(codTipoCarga);
            int codTC = listadoTipodeCarga.getIdtipodecarga();
            listadoReasignacion = objAsignarDAOSessionBean.getReasignacion(codTC);
            
            sesion.setAttribute("listadoReasignacion", listadoReasignacion);
            response.sendRedirect("DevolucionToolCenter2.jsp");
        } catch (Exception ex) {
            //Logger.getLogger(ListarEppsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
        
    

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion= request.getSession();
        List<Asignacantidadepp> listadoDevolucion;
        try {
            int codProyecto= Integer.parseInt(request.getParameter("ddlProyecto"));
            //listadoDevolucion = objAsignarDAOSessionBean.getAllDevolucion();
            listadoDevolucion = objAsignarDAOSessionBean.NewEncontarSqlArmado(codProyecto);
            sesion.setAttribute("listadoDevolucion", listadoDevolucion);
            response.sendRedirect("DevolucionToolCenter2.jsp");
            
        } catch (Exception ex) {
            Logger.getLogger(ListarEppsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   

}
