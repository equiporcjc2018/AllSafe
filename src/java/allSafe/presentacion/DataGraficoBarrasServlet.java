/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Asignacantidadepp;
import allSafe.Entities.Asignaeppaproyecto;
import allSafe.Entities.Proyecto;
import allSafe.persistencia.AsignarDAOSessionBean;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdk.nashorn.internal.runtime.regexp.joni.constants.OPSize;

/**
 *
 * @author Ruben
 */
@WebServlet(name = "DataGraficoBarrasServlet", urlPatterns = {"/dataGraficoBarrasServlet"})
public class DataGraficoBarrasServlet extends HttpServlet {

    @EJB
    AsignarDAOSessionBean objAsignarDaoSessionBean;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //String id = request.getParameter("id");
        //String id = "2";
        //Financiero financiero = null;
        //Asignaeppaproyecto financiero = new Asignaeppaproyecto();
        //HttpSession sesion= request.getSession();
        //List<Asignaeppaproyecto> listadoEppCantidadProyecto;
        List<Asignacantidadepp> listadoEppCantidadProyecto;
        List<Proyecto> cantiProyecto;
        String name = "";
        int cantidad =0;
        
        try {
            //listadoEppCantidadProyecto = objAsignarDaoSessionBean.getAllAsignaEppAProy();
            listadoEppCantidadProyecto = objAsignarDaoSessionBean.getAllAsignaCantidadEppAProy();
            cantiProyecto = objAsignarDaoSessionBean.getGrafico();
            List<DataJsonFinancieroBarra> datos = new LinkedList();
            if (listadoEppCantidadProyecto != null) {
                //Se recorren los datos
                                
                for (Proyecto listaProy : cantiProyecto) {
                    int recorreProy = listaProy.getIdProyecto();
                                    
                    int cantidad1 =0; 
                    int cantidad2 =0; 
                    for (Asignacantidadepp asignaeppaproyecto : listadoEppCantidadProyecto) {
                         int obtengoProyecto = asignaeppaproyecto.getAsignaeppaproyectoIdasignaeppaproyecto().getProyectoidProyecto().getIdProyecto();
                         //int cantiProyecto2 = next.getAsignaeppaproyectoIdasignaeppaproyecto().getProyectoidProyecto().getIdProyecto();
                        int tipoCarga = asignaeppaproyecto.getTipodecargaIdtipodecarga().getIdtipodecarga();
                            if (obtengoProyecto==recorreProy) {
                                name = asignaeppaproyecto.getAsignaeppaproyectoIdasignaeppaproyecto().getProyectoidProyecto().getNombreProyecto();
                                
                                if (tipoCarga==1) {
                                    cantidad1 = cantidad1+Integer.parseInt(asignaeppaproyecto.getCantidadEppProceso().toString());
                                    Number q_1 = cantidad1;
                                    cantidad1 = q_1.intValue();
                                }
                                if (tipoCarga==3) {
                                    cantidad2 = cantidad2-Integer.parseInt(asignaeppaproyecto.getCantidadEppProceso().toString());
                                    Number q_2 = cantidad2;
                                    cantidad2 = q_2.intValue();
                                }
                                
                                }
                             
                             
                    }
                    if (!(name.isEmpty())) {
                         //Se crea el objeto
                    DataJsonFinancieroBarra objDataJsonFinanciero = new DataJsonFinancieroBarra(name,cantidad1,cantidad2);
                    //Se agrega el objeto a la lista
                    datos.add(objDataJsonFinanciero);
                    
                    name = "";
                    cantidad =0;
                    }
                   
                    
            }
                }

            
            Gson gson = new GsonBuilder().setPrettyPrinting().create();

            String json = gson.toJson(datos);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            response.getWriter().write(json);

        } catch (Exception e) {
        }

    }

    private class DataJsonFinancieroBarra {

        
        private String y;
        private Number a;
        private Number b;

        public DataJsonFinancieroBarra(String y, Number a, Number b) {
            this.y = y;
            this.a = a;
            this.b = b;
        }

        public String getY() {
            return y;
        }

        public void setY(String y) {
            this.y = y;
        }

        public Number getA() {
            return a;
        }

        public void setA(Number a) {
            this.a = a;
        }

        public Number getB() {
            return b;
        }

        public void setB(Number b) {
            this.b = b;
        }
        
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        processRequest(request, response);
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