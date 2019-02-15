/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Eppterreno;
import allSafe.dto.Conexion;
import allSafe.persistencia.EppTerrenoDaoSessionsBeans;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author hachi
 */
@WebServlet(name = "GenerarReporte1Servlet", urlPatterns = {"/generarReporte1Servlet"})
public class GenerarReporte1Servlet extends HttpServlet {

    
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession sesion= request.getSession();
           ServletContext context = request.getServletContext();
        File reportfile = new File (context.getRealPath("reportes/reporteFormatoEntregaEPP.jasper"));
        
        Map<String,Object> parameter = new HashMap<String,Object>();
        
        String rut = (String) request.getParameter("txtRutPersona");
        parameter.put("rutPersona", rut);
        try{
            Connection con = Conexion.getConexion();
            byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, con);

            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outputstream = response.getOutputStream();
            outputstream.write(bytes, 0, bytes.length);

            outputstream.flush();
            outputstream.close();

            response.sendRedirect("EjemploReporte.jsp");
        }catch(Exception ex){
            System.out.println("problemas al leer la BD "+ex.getMessage());
            response.sendRedirect("EjemploReporte.jsp");
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
