/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;


import allSafe.Entities.Asignacantidadepp;
import allSafe.Entities.Asignaeppaproyecto;
import allSafe.persistencia.AsignarDAOSessionBean;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DataGraficoServlet", urlPatterns = {"/dataGraficoServlet"})
public class DataGraficoServlet extends HttpServlet {

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

        try {
            //listadoEppCantidadProyecto = objAsignarDaoSessionBean.getAllAsignaEppAProy();
            listadoEppCantidadProyecto = objAsignarDaoSessionBean.getAllAsignaCantidadEppAProy();
            List<DataJsonFinanciero> datos = new LinkedList();
            if (listadoEppCantidadProyecto != null) {
                //Se recorren los datos

                //for (Asignaeppaproyecto asignaeppaproyecto : listadoEppCantidadProyecto) {
                for (Asignacantidadepp asignaeppaproyecto : listadoEppCantidadProyecto) {
                    //String name = asignaeppaproyecto.getProyectoidProyecto().getNombreProyecto();
                    //Number descripEpp = asignaeppaproyecto.getEppidEPP().getIdEPP();
                    String name = asignaeppaproyecto.getAsignaeppaproyectoIdasignaeppaproyecto().getProyectoidProyecto().getNombreProyecto();
                    Number descripEpp = asignaeppaproyecto.getCantidadEppProceso();
                    int cantidad = descripEpp.intValue();

                    //Se crea el objeto
                    DataJsonFinanciero objDataJsonFinanciero = new DataJsonFinanciero(name, cantidad);
                    //Se agrega el objeto a la lista
                    datos.add(objDataJsonFinanciero);

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

    private class DataJsonFinanciero {

        String nombre;
        Number cantidad;

        public DataJsonFinanciero(String nombre, int cantidad) {
            this.nombre = nombre;
            this.cantidad = cantidad;
        }

        public Number getCantidad() {
            return cantidad;
        }

        public void setCantidad(Number cantidad) {
            this.cantidad = cantidad;
        }

        public String getNombre() {
            return nombre;
        }

        public void setNombre(String nombre) {
            this.nombre = nombre;
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
