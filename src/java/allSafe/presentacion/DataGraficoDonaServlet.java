/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Asignatrabajadorproyecto;
import allSafe.Entities.Proyecto;
import allSafe.persistencia.AsignarDAOSessionBean;
import allSafe.persistencia.AsignarTrabajadorProyectoDAOSessionBeans;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ruben
 */
@WebServlet(name = "DataGraficoDonaServlet", urlPatterns = {"/dataGraficoDonaServlet"})
public class DataGraficoDonaServlet extends HttpServlet {

    @EJB
    AsignarTrabajadorProyectoDAOSessionBeans objAsignarTrabajadorProyectoDAOSessionBeans;
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

        List<Asignatrabajadorproyecto> listadoTrabajador;
        List<Asignatrabajadorproyecto> cantiTrabajadorProy;
        List<Proyecto> cantiProyecto;
        String name = "";
        int cantidad = 0;

        try {

            listadoTrabajador = objAsignarTrabajadorProyectoDAOSessionBeans.getAllAsignaTrabAProy();
            cantiTrabajadorProy = objAsignarTrabajadorProyectoDAOSessionBeans.getAllAsignaTrabAProy();
            cantiProyecto = objAsignarDaoSessionBean.getGrafico();
            List<DataJsonFinanciero> datos = new LinkedList();
            if (listadoTrabajador != null) {

                int cantidadTrabajadores = cantiTrabajadorProy.size();
                
                //for (Asignatrabajadorproyecto listaTrab : cantiTrabajadorProy) {
                for (Proyecto listaProy : cantiProyecto) {
                    int recorreProy = listaProy.getIdProyecto();

                    int descripEpp2 = 0;
                    for (Asignatrabajadorproyecto asignatrabaproyecto : listadoTrabajador) {
                        int obtengoProyecto = asignatrabaproyecto.getProyectoidProyecto().getIdProyecto();

                        if (obtengoProyecto == recorreProy) {

                            descripEpp2 = descripEpp2 + Integer.parseInt(asignatrabaproyecto.getIdasignatrabajadorproyecto().toString());
                            name = asignatrabaproyecto.getProyectoidProyecto().getNombreProyecto();

                            Number descripEpp = descripEpp2;
                            cantidad = descripEpp.intValue();
                            //obtengoProyecto++;
                        }

                    }
                    if (!(name.isEmpty()) && (!(cantidad == 0))) {
                        //Se crea el objeto
                        DataJsonFinanciero objDataJsonDona = new DataJsonFinanciero((Math.round((cantidad/cantidadTrabajadores)*100)),name);
                        //Se agrega el objeto a la lista
                        datos.add(objDataJsonDona);

                        name = "";
                        cantidad = 0;
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

    private class DataJsonFinanciero {
        
        private Number value;
        private String label;

        public DataJsonFinanciero(Number value, String label) {
            this.value = value;
            this.label = label;
        }

        public Number getValue() {
            return value;
        }

        public void setValue(Number value) {
            this.value = value;
        }

        public String getLabel() {
            return label;
        }

        public void setLabel(String label) {
            this.label = label;
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
