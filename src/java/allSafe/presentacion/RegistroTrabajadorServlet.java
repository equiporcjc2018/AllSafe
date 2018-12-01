/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Cargo;
import allSafe.Entities.Persona;
import allSafe.Entities.Tallaoberol;
import allSafe.Entities.Tallapantalon;
import allSafe.Entities.Tallapoleracamisa;
import allSafe.Entities.Tallazapato;
import allSafe.Entities.Tipoplanta;
import allSafe.dto.PersonaCargoTipoPlantaOberolPantalonPoleraZapatoDTO;
import allSafe.persistencia.CargoSessionBean;
import allSafe.persistencia.PersonaSessionBean;
import allSafe.persistencia.TallaOberolSessionBean;
import allSafe.persistencia.TallaPantalonSessionBean;
import allSafe.persistencia.TallaPoleraCamisaSessionBean;
import allSafe.persistencia.TallaZapatoSessionBean;
import allSafe.persistencia.TipoPlantaSessionBean;
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
@WebServlet(name = "RegistroTrabajadorServlet", urlPatterns = {"/registroTrabajadorServlet"})
public class RegistroTrabajadorServlet extends HttpServlet {

    @EJB
    PersonaSessionBean objPersonaSessionBean;
    @EJB
    CargoSessionBean objCargoSessionBean;
    @EJB
    TipoPlantaSessionBean objTipoPlantaSessionBean;
    @EJB
    TallaOberolSessionBean objTallaOberolSessionBean;
    @EJB
    TallaPantalonSessionBean objTallaPantalonSessionBean;
    @EJB
    TallaPoleraCamisaSessionBean objTallaPoleraCamisaSessionBean;
    @EJB
    TallaZapatoSessionBean objTallaZapatoSessionBean;
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        PersonaCargoTipoPlantaOberolPantalonPoleraZapatoDTO objPCTPOPPZDTO = new PersonaCargoTipoPlantaOberolPantalonPoleraZapatoDTO();
        Persona objPersona = new Persona();
        Cargo objCargo = new Cargo();
        Tipoplanta objTipoplanta = new Tipoplanta();
        Tallaoberol objTallaoberol = new Tallaoberol();
        Tallapantalon objTallapantalon = new Tallapantalon();
        Tallapoleracamisa objTallapoleracamisa = new Tallapoleracamisa();
        Tallazapato objTallazapato = new Tallazapato();
        
        try {
            String rut = request.getParameter("txtRut");
            String pasaporte = request.getParameter("txtPasaporte");
            String identificacion = null;
            if (rut == null) {
                identificacion = pasaporte;
            }
            if (pasaporte == null) {
                identificacion = rut;
            }
            String nombre = request.getParameter("txtNombre");
            String apePat = request.getParameter("txtApellidoPaterno");
            String apeMat = request.getParameter("txtApellidoMaterno");
            String fecNac = request.getParameter("txtFechaNacimiento");
            String nacionalidad = request.getParameter("txtNacionalidad");
            String correo = request.getParameter("txtCorreo");
            String cargo = request.getParameter("ddlCargo");
            String planta = request.getParameter("ddlTipoPlanta");
            String oberol = request.getParameter("ddlOberol");
            String pantalon = request.getParameter("ddlPantalon");
            String polera = request.getParameter("ddlPolera");
            String zapato = request.getParameter("ddlZapato");
            
            if (!(identificacion == null || nombre == null || apePat == null || apeMat == null || fecNac == null || nacionalidad == null || correo == null  || cargo == null || planta == null || oberol == null || pantalon == null || polera == null || zapato == null )) {
                objPersona.setRutPasaportePersona(identificacion);
                objPersona.setNombresPersona(nombre);
                objPersona.setApePatPersona(apePat);
                objPersona.setApeMatPersona(apeMat);
                objPersona.setFechaNacPersona(fecNac);
                objPersona.setNacionalidadPersona(nacionalidad);
                objPersona.setCorreoPersona(correo);
                objCargo = objCargoSessionBean.buscaCargoXID(Integer.parseInt(cargo));
                objTipoplanta = objTipoPlantaSessionBean.buscaTipoPlantaXID(Integer.parseInt(planta));
                objTallaoberol = objTallaOberolSessionBean.buscaTallaOberolXID(Integer.parseInt(oberol));
                objTallapantalon = objTallaPantalonSessionBean.buscaTallaPantalonXID(Integer.parseInt(pantalon));
                objTallapoleracamisa = objTallaPoleraCamisaSessionBean.buscaTallaPoleraCamisaXID(Integer.parseInt(polera));
                objTallazapato = objTallaZapatoSessionBean.buscaTallazapatoXID(Integer.parseInt(zapato));
                objPCTPOPPZDTO.setObjPersona(objPersona);
                objPCTPOPPZDTO.setObjCargo(objCargo);
                objPCTPOPPZDTO.setObjTipoplanta(objTipoplanta);
                objPCTPOPPZDTO.setObjTallaoberol(objTallaoberol);
                objPCTPOPPZDTO.setObjTallapantalon(objTallapantalon);
                objPCTPOPPZDTO.setObjTallapoleracamisa(objTallapoleracamisa);
                objPCTPOPPZDTO.setObjTallazapato(objTallazapato);
                objPersonaSessionBean.addPerdona(objPCTPOPPZDTO);
                sesion.setAttribute("Exito", "Trabajador Agregado Correctamente");
                response.sendRedirect("MantenedorTrabajadores.jsp");
                
            }else{
                sesion.setAttribute("error1", "debe llenar todos los campos");
                response.sendRedirect("MantenedorTrabajadores.jsp");
            }
        } catch (Exception e) {
            sesion.setAttribute("error", "error en el proceso de Registro");
            response.sendRedirect("MantenedorTrabajadores.jsp");
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
