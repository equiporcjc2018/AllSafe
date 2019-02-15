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
@WebServlet(name = "RegistrarCargaEppCantidadServlet", urlPatterns = {"/registrarCargaEppCantidadServlet","/registroCargaEppCantidad"})
public class RegistrarCargaEppCantidadServlet extends HttpServlet {

    @EJB
    AsignarDAOSessionBean objAsignarDaoSessionBean;

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String prueba = "ASingaEPPa pory";
        HttpSession sesion = request.getSession();
        EppCantidadDTO objEppCantidadDTO = new EppCantidadDTO();
        
        Asignaeppaproyecto objAsignaeppaproyecto = new Asignaeppaproyecto();
        Estadosproyecto objEstadosproyecto = new Estadosproyecto();
        Tipodecarga objTipodecarga = new Tipodecarga();
        
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    Date date = new Date();
            String fecha = dateFormat.format(date);
            
            //int epp = Integer.parseInt(request.getParameter("id"));
            //int epp = Integer.parseInt(request.getParameter("txtIdEpp"));
            String [] epp2 = request.getParameterValues("txtIdEpp");
            String [] proy2 = request.getParameterValues("txtIdProy");
            String [] cantidad = request.getParameterValues("txtCantidad");
                       
            //for (String item : cantidad) {
            for (int i = 0; i < cantidad.length; i++) {
               int epp =  Integer.parseInt(epp2[i]);
               int proy =  Integer.parseInt(proy2[i]);
            
                if (!(cantidad[i].equals(""))) {
                
                //int intCantidad = Integer.parseInt(cantidad[i]);     
                String talla = "43";
                int unidad = 1;
                
                int precio = 1000;
                            
                objAsignaeppaproyecto = objAsignarDaoSessionBean.buscaAsigEppXID(epp,proy);
                 
                int estadoProy = 1;
                int tipoCarga = 1;
                
                objEstadosproyecto = objAsignarDaoSessionBean.buscaEstadoProy(estadoProy);
                objTipodecarga = objAsignarDaoSessionBean.buscaTipoDeCarga(tipoCarga);
                
                objEppCantidadDTO.setFecha(fecha);
                objEppCantidadDTO.setTalla(talla);
                objEppCantidadDTO.setUnidad(unidad);
                
                objEppCantidadDTO.setCantidad(Integer.parseInt(cantidad[i]));
                objEppCantidadDTO.setPrecio(precio);
                objEppCantidadDTO.setObjEstadosproyecto(objEstadosproyecto);
                objEppCantidadDTO.setObjTipodecarga(objTipodecarga);
                objEppCantidadDTO.setObjAsignaeppaproyecto(objAsignaeppaproyecto);
                //objEppCantidadDTO.setObjAsignaeppaproyecto(objAsignaeppaproyecto);
                
                
                 objAsignarDaoSessionBean.addCantidadEpp(objEppCantidadDTO);
                }
                
                
            }
           
            response.sendRedirect("AsignarCargaInicialEpp2.jsp");
            
            
            
        } catch (Exception e) {
                sesion.setAttribute("error6", "error en el proceso de Registro");
                response.sendRedirect("AsignarCargaInicialEpp2.jsp");
        }
    }

    

}