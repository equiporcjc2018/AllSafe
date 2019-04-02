/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Asignacantidadepp;
import allSafe.Entities.Asignaeppaproyecto;
import allSafe.Entities.Estadosproyecto;
import allSafe.Entities.Tipodecarga;
import allSafe.dto.EppCantidadDTO;

import allSafe.Entities.Persona;
import allSafe.Entities.Proyecto;
import allSafe.dto.PersonaProyectoDTO;
import allSafe.persistencia.AsignarDAOSessionBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
 * @author Ruben
 */
@WebServlet(name = "RegistrarDevolucionToolCenterServlet", urlPatterns = {"/registrarDevolucionToolCenterServlet"})
public class RegistrarDevolucionToolCenterServlet extends HttpServlet {

    @EJB
    AsignarDAOSessionBean objAsignarDaoSessionBean;

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String flag = "Bandera1";
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String flag2 = "Bandera2";
        String prueba = "asdasd";
        HttpSession sesion = request.getSession();
        EppCantidadDTO objEppCantidadDTO = new EppCantidadDTO();
        PersonaProyectoDTO objPersonaProyectoDTO = new PersonaProyectoDTO();
        List<Asignacantidadepp> listadoDevolucion;
        Proyecto objProyecto = new Proyecto();
        Persona objPersona = new Persona();
        
        Asignaeppaproyecto objAsignaeppaproyecto = new Asignaeppaproyecto();
        Estadosproyecto objEstadosproyecto = new Estadosproyecto();
        Tipodecarga objTipodecarga = new Tipodecarga();
        
        try {
            
            String id1 = (request.getParameter("id"));
            
            String[] parts = id1.split("-");
            
            String idEstado = parts[0];
            String idEpp = parts[1];
            String idProyecto = parts[2];
            String idCantidad = parts[3];
                       
            if (idEpp!=null) {
                
                //Ingreso de Fecha              
                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                String fecha = dateFormat.format(date);
                //Talla - Unidad
                String talla = "43";
                int unidad = 1;
                //Precio
                int precio = 1;
                
                int id_Epp = Integer.parseInt(idEpp.trim());
                int id_Proy = Integer.parseInt(idProyecto.trim());
                
                int id_Cantidad = Integer.parseInt(idCantidad.trim());
                id_Cantidad = id_Cantidad*-1;
                
                objAsignaeppaproyecto = objAsignarDaoSessionBean.buscaAsigEppXID(id_Epp,id_Proy);
                 
                int estadoProy = 1;
                int tipoCarga = 2;
                
                objEstadosproyecto = objAsignarDaoSessionBean.buscaEstadoProy(estadoProy);
                objTipodecarga = objAsignarDaoSessionBean.buscaTipoDeCarga(tipoCarga);
                
                objEppCantidadDTO.setFecha(fecha);
                objEppCantidadDTO.setTalla(talla);
                objEppCantidadDTO.setUnidad(unidad);
                
                objEppCantidadDTO.setCantidad(id_Cantidad);
                objEppCantidadDTO.setPrecio(precio);
                objEppCantidadDTO.setObjEstadosproyecto(objEstadosproyecto);
                objEppCantidadDTO.setObjTipodecarga(objTipodecarga);
                objEppCantidadDTO.setObjAsignaeppaproyecto(objAsignaeppaproyecto);
                
                
                
                 objAsignarDaoSessionBean.addCantidadEpp(objEppCantidadDTO);  
                
                
                
                response.sendRedirect("DevolucionToolCenter2.jsp");
                
            }else
            {
                sesion.setAttribute("error2", "debe llenar todos los campos");
                response.sendRedirect("DevolucionToolCenter2.jsp");
            }
            } 
            catch (Exception e) 
            {
                sesion.setAttribute("error4", "error en el proceso de Registro");
                response.sendRedirect("DevolucionToolCenter2.jsp");
            }
    }

    

}
