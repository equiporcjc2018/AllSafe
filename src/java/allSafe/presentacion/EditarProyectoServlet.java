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
import allSafe.persistencia.ProyectoDAOSessionBean;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "EditarProyectoServlet", urlPatterns = {"/editarProyectoServlet"})
public class EditarProyectoServlet extends HttpServlet {

@EJB
ProyectoDAOSessionBean objProyectoDAOSessionBean;
@EJB
CiudadDAOSessionBean objCiudadDAOSessionBean;
@EJB
EmpresaDAOSessionBean objEmpresaDAOSessionBean;
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        int id=Integer.parseInt(request.getParameter("idProyectoAEditar"));
        
        Proyecto objProyecto=objProyectoDAOSessionBean.buscaProyectoXID(id);
        
        if(objProyecto!=null){
            sesion.setAttribute("proyectoAEditar", objProyecto);
            response.sendRedirect("MantenedorProyectos.jsp");
        }else{
            sesion.setAttribute("error1", "no se logro traer el Proyecto a editar");
            response.sendRedirect("MantenedorProyectos.jsp");
        }
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
            int id=Integer.parseInt(request.getParameter("idProyectomodifica"));
            int numProy = Integer.parseInt(request.getParameter("txtNumProyectoModifica"));
            String nombre = request.getParameter("txtNombreProyectoModifica");
            String ubicacion = request.getParameter("txtUbicacionModifica");
            String fechaIn = request.getParameter("txtFechaInicioModifica");
            String fechaTer= request.getParameter("txtFechaTerminoModifica");
            String ciudad= request.getParameter("ddlCiudadModifica");
            String empresa= request.getParameter("ddlEmpresaModifica");
            Proyecto objProyectoED=objProyectoDAOSessionBean.buscaProyectoXID(id);
            String vigenteProy = objProyectoED.getVigencia();
            if (!(nombre == null || ubicacion == null ||fechaIn == null ||fechaTer == null ||ciudad == null ||empresa == null )) {
                objProyecto.setIdProyecto(id);           
                objProyecto.setNumeroProyecto(numProy);
                objProyecto.setNombreProyecto(nombre);
                objProyecto.setUbicacionProyecto(ubicacion);
                objProyecto.setFechaInicioProyecto(fechaIn);
                objProyecto.setFechaTerminoProyecto(fechaTer);
                objProyecto.setVigencia(vigenteProy);
                objCiudad = objCiudadDAOSessionBean.buscaCiudadXID(Integer.parseInt(ciudad));
                objEmpresa = objEmpresaDAOSessionBean.buscaEmpresaXID(Integer.parseInt(empresa));
                objPCEDTO.setObjProyecto(objProyecto);
                objPCEDTO.setObjCiudad(objCiudad);
                objPCEDTO.setObjEmpresa(objEmpresa);
                objProyectoDAOSessionBean.updateProyecto(objPCEDTO);
                sesion.setAttribute("exito", "Proyecto Editado Correctamente");
                response.sendRedirect("MantenedorProyectos.jsp");
                
            }else{
                sesion.setAttribute("error1", "debe llenar todos los campos");
                response.sendRedirect("MantenedorProyectos.jsp");
            }
        } catch (Exception e) {
            sesion.setAttribute("error", "error en el proceso de Edicion");
            response.sendRedirect("MantenedorProyectos.jsp");
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
