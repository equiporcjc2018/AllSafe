/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Epp;
import allSafe.Entities.Tipoepp;
import allSafe.dto.EppTipoEppDTO;
import allSafe.persistencia.ControllerException;
import allSafe.persistencia.EppDAOSessionBean;
import allSafe.persistencia.TipoEppDAOSessionBean;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Ruben
 */
@WebServlet(name = "RegistroCargaMasivaEppServlet", urlPatterns = {"/registroCargaMasivaEppServlet"})
@MultipartConfig
public class RegistroCargaMasivaEppServlet extends HttpServlet {

    @EJB
    EppDAOSessionBean objEppDAOSessionBean;
    @EJB
    TipoEppDAOSessionBean objTipoEppDAOSessionBean;
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String aqui ="aca";
                    HttpSession sesion = request.getSession();
                    EppTipoEppDTO objEppTipoEppDTO = new EppTipoEppDTO();
                    Epp objEpp = new Epp();
                    Tipoepp objTipoepp = new Tipoepp();
        
        String csvFile = "C:\\Users\\Ruben\\Documents\\Inventos\\03 AllSafe\\13 Carga masiva\\archivo.csv";
        //String csvFile=request.getParameter("file");
        //String csvFile = filePart.getSubmittedFileName();
        //String csvFile = request.getPart("cargaMasivaEpp");
        String nombre = request.getParameter("nombre");
        Part archivo = request.getPart("archivo");
        //String csvFile = Paths.get(archivo.getSubmittedFileName()).getFileName().toString();
        
        
        
        InputStream is = archivo.getInputStream();
        
        
        String csvFile2 = archivo.getContentType();
        String csvFile3 = archivo.getHeader(nombre);
        String csvFile4 = archivo.getName();
        String csvFile5 = archivo.getSubmittedFileName();
        
        
        BufferedReader br = null;
        String line = "";
        //Se define separador ","
        String cvsSplitBy = ";";
        int bandera =0;
        try {
            br = new BufferedReader(new FileReader(csvFile));
            
            while ((line = br.readLine()) != null) {                
                String[] datos = line.split(cvsSplitBy);
                //Imprime datos.
                
                if (bandera==0) {
                    //no hace nada
                    bandera = 1;
                }else
                {
                    //System.out.println(datos[0] + ", " + datos[1] + ", " + datos[2] + ", " + datos[3] + ", " + datos[4] + ", " + datos[5]);
                   
                    //try {
                        //String nombre = request.getParameter("txtnombre");
                        String nombre2 = datos[0];
                        //String descripcion = request.getParameter("txtDescripcion");
                        String descripcion = datos[1];
                        //String tipoEpp = request.getParameter("RDBtipoEPP");
                        String tipoEpp = datos[2];
                        String vigente = "Y";
                        //String vigente = datos[3];
                        if (!(nombre2 == null || descripcion == null ||tipoEpp == null )) {
                            objEpp.setNombreEPPcol(nombre2);
                            objEpp.setDescripcionEPP(descripcion);
                            objEpp.setVigencia(vigente);
                            objTipoepp = objTipoEppDAOSessionBean.buscaTipoEPPXID(Integer.parseInt(tipoEpp));
                            objEppTipoEppDTO.setObjEpp(objEpp);
                            objEppTipoEppDTO.setObjTipoepp(objTipoepp);
                            objEppDAOSessionBean.addEpp(objEppTipoEppDTO);
                            

                        }else{
                            sesion.setAttribute("error1", "debe llenar todos los campos");
                            response.sendRedirect("MantenedorEPP.jsp");
                        }
                    //} catch (Exception e) {
                      //  sesion.setAttribute("error", "error en el proceso de Registro");
                        //response.sendRedirect("MantenedorEPP.jsp");
                    //}
                }
               
            }
                            sesion.setAttribute("Exito", "EPP Agregado Correctamente");
                            response.sendRedirect("MantenedorEPP.jsp");
            
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ControllerException ex) {
            Logger.getLogger(RegistroCargaMasivaEppServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
    }
}
    }

    

}
