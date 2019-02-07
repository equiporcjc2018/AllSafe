/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;
import allSafe.Entities.Ciudad;
import allSafe.Entities.Empresa;
import allSafe.Entities.Proyecto;
import allSafe.dto.ProyectoCiudadEmpresaDTO;
import allSafe.persistencia.CiudadDAOSessionBean;
import allSafe.persistencia.EmpresaDAOSessionBean;
import allSafe.persistencia.PaisDAOSessionBean;
import allSafe.persistencia.ProyectoDAOSessionBean;
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
 * @author JuanCarlos
 */
@WebServlet(name = "AgregarProyectoServlet", urlPatterns = {"/agregarProyectoServlet", "/agregarProyecto"})
public class AgregarProyectoServlet extends HttpServlet {

    @EJB
    PaisDAOSessionBean objPaisDAOSessionBean;
    @EJB
    CiudadDAOSessionBean objCiudadDAOSessionBean;
    @EJB
    EmpresaDAOSessionBean objEmpresaDAOSessionBean;
    @EJB
    ProyectoDAOSessionBean objProyectoDAOSessionBean;
    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        ProyectoCiudadEmpresaDTO objPCEDTO = new ProyectoCiudadEmpresaDTO();
        Proyecto objProyecto = new Proyecto();
        Ciudad objCiudad = new Ciudad();
        Empresa objEmpresa = new Empresa();
        try {
            int numProy = Integer.parseInt(request.getParameter("txtNumProyecto"));
            String nombre = request.getParameter("txtNombreProyecto");
            String ubicacion = request.getParameter("txtUbicacion");
            String fechaIn = request.getParameter("txtFechaInicio");
            String fechaTer= request.getParameter("txtFechaTermino");
            String ciudad= request.getParameter("ddlCiudad");
            String empresa= request.getParameter("ddlEmpresa");
            String vigenteProy = "Si";
            if (!(nombre == null || ubicacion == null ||fechaIn == null ||fechaTer == null ||ciudad == null ||empresa == null )) {
                objProyecto.setNumeroProyecto(numProy);
                objProyecto.setNombreProyecto(nombre);
                objProyecto.setUbicacionProyecto(ubicacion);
                objProyecto.setFechaInicioProyecto(fechaIn);
                objProyecto.setFechaTerminoProyecto(fechaTer);
                objProyecto.setVigenteproyecto(vigenteProy);
                objCiudad = objCiudadDAOSessionBean.buscaCiudadXID(Integer.parseInt(ciudad));
                objEmpresa = objEmpresaDAOSessionBean.buscaEmpresaXID(Integer.parseInt(empresa));
                objPCEDTO.setObjProyecto(objProyecto);
                objPCEDTO.setObjCiudad(objCiudad);
                objPCEDTO.setObjEmpresa(objEmpresa);
                objProyectoDAOSessionBean.guardarProyecto(objPCEDTO);
                sesion.setAttribute("Exito", "Proyecto Agregado Correctamente");
                response.sendRedirect("MantenedorProyectos.jsp");
                
            }else{
                sesion.setAttribute("error1", "debe llenar todos los campos");
                response.sendRedirect("MantenedorProyectos.jsp");
            }
        } catch (Exception e) {
            sesion.setAttribute("error", "error en el proceso de Registro");
            response.sendRedirect("MantenedorProyectos.jsp");
        }
   
        
    }

   

}
