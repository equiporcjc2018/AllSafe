/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

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
        
        Proyecto objProyecto = new Proyecto();
        Persona objPersona = new Persona();
        
        Asignaeppaproyecto objAsignaeppaproyecto = new Asignaeppaproyecto();
        Estadosproyecto objEstadosproyecto = new Estadosproyecto();
        Tipodecarga objTipodecarga = new Tipodecarga();
        
        try {
                      
            //String proyecto = request.getParameter("txtIdProy");
            int proy2 = Integer.parseInt(request.getParameter("txtIdProy"));
            int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
            cantidad = cantidad*(-1);
            int idePP_devolver = 0;
            String [] idePP_devolver2 = request.getParameterValues("chkDevIdEpp");
            String  idePP_devolver3 = request.getParameter("chkDevIdEpp");
            //String [] persona2 = request.getParameter("chkDevIdEpp");
            

            //if (!(proyecto == null || persona == null )) {
            if (( idePP_devolver == 0 )) {
                
                
                for(int i=0; i<idePP_devolver2.length;i++){
                idePP_devolver = Integer.parseInt(idePP_devolver2[i]);
                
                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                String fecha = dateFormat.format(date);
                
                String talla = "43";
                int unidad = 1;
                
                int precio = 1;
                            
                //objAsignaeppaproyecto = objAsignarDaoSessionBean.buscaAsigEppXID(idePP_devolver,proyecto);
                objAsignaeppaproyecto = objAsignarDaoSessionBean.buscaAsigEppXID(idePP_devolver,proy2);
                 
                int estadoProy = 1;
                int tipoCarga = 2;
                
                objEstadosproyecto = objAsignarDaoSessionBean.buscaEstadoProy(estadoProy);
                objTipodecarga = objAsignarDaoSessionBean.buscaTipoDeCarga(tipoCarga);
                
                objEppCantidadDTO.setFecha(fecha);
                objEppCantidadDTO.setTalla(talla);
                objEppCantidadDTO.setUnidad(unidad);
                
                objEppCantidadDTO.setCantidad(cantidad);
                objEppCantidadDTO.setPrecio(precio);
                objEppCantidadDTO.setObjEstadosproyecto(objEstadosproyecto);
                objEppCantidadDTO.setObjTipodecarga(objTipodecarga);
                objEppCantidadDTO.setObjAsignaeppaproyecto(objAsignaeppaproyecto);
                
                
                
                 objAsignarDaoSessionBean.addCantidadEpp(objEppCantidadDTO);  
                
                }
                
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
