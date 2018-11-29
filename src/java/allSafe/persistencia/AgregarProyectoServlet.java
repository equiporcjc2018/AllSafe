/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Ciudad;
import allSafe.Entities.Empresa;
import allSafe.Entities.Pais;
import allSafe.Entities.Proyecto;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JuanCarlos
 */
@WebServlet(name = "AgregarProyectoServlet", urlPatterns = {"/agregarProyectoServlet", "/agregarProyecto"})
public class AgregarProyectoServlet extends HttpServlet {

@EJB
    private ProyectoDAOSessionBean proyectoDAOSessionBean;
	
	@EJB
    private PaisDAOSessionBean paisDAOSessionBean;
	
	@EJB
    private EmpresaDAOSessionBean empresaDAOSessionBean;
        
        @EJB
    private CiudadDAOSessionBean ciudadDAOSessionBean;
    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
        String nombre = request.getParameter("txtNombreProyecto");
        String ubicacion = request.getParameter("txtUbicacion");
        
        String fechaInicio = null;
        try {
            fechaInicio = request.getParameter("txtFechaInicio");
        } catch (Exception e) {
            System.out.println("problemas con la transformacion de la fecha");
        }
        
		
	String fechaTermino = null;
        try {
            fechaTermino = request.getParameter("txtFechaTermino");
        } catch (Exception e) {
            System.out.println("problemas con la transformacion de la fecha");
        }
		
        int idPais = Integer.parseInt(request.getParameter("ddlPais"));
        List<Pais> pais = this.paisDAOSessionBean.getPaisXID(idPais);
		
	int idEmpresa = Integer.parseInt(request.getParameter("ddlEmpresa"));
        List<Empresa> empresa = this.empresaDAOSessionBean.getEmpresaXID(idEmpresa);
		
	int idCiudad = Integer.parseInt(request.getParameter("ddlCiudad"));
        List<Ciudad> ciudad = this.ciudadDAOSessionBean.getCiudadXID(idCiudad);
        
        Proyecto proyecto = new Proyecto();
        proyecto.setNombreProyecto(nombre);
        proyecto.setUbicacionProyecto(ubicacion);
        proyecto.setFechaInicioProyecto(fechaInicio);
        proyecto.setFechaTerminoProyecto(fechaTermino);
        proyecto.setIdProyecto(idPais);
        //proyecto.setCiudadidCiudad(idCiudad);
        //proyecto.setEmpresa_idEmpresa(idEmpresa);
        try {
            this.proyectoDAOSessionBean.guardarProyecto(proyecto);
            request.getSession().setAttribute("msg", "informacion correctamente Guardada");
            response.sendRedirect("agregarProyecto.jsp");
        } catch (Exception e) {
            request.getSession().setAttribute("msg", "no se pudo guardar la info.. error al guardar");
            response.sendRedirect("agregarProyecto.jsp");
        }
   
        
    }

   

}
