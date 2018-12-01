/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Usuarioallsafe;
import allSafe.persistencia.UsuarioDAOSessionBean;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
@WebServlet(name = "ValidaIngresoServlet", urlPatterns = {"/validaIngresoServlet","/validaIngresobj"})
public class ValidaIngresoServlet extends HttpServlet {
@EJB
UsuarioDAOSessionBean objUsuarioDAOSessionBean;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion= request.getSession();
        String login=request.getParameter("txtLogin");
        String pass=generateMD5Signature(request.getParameter("txtPass"));              
        Usuarioallsafe objUsuario;
                
        
        try {
            objUsuario = this.objUsuarioDAOSessionBean.validaUsuario(login, pass);
               
            if(objUsuario!=null){
              sesion.setAttribute("usuarioConectado", objUsuario);
              response.sendRedirect("Home.jsp");
            }else{
              sesion.setAttribute("error", "El Usuario no Existe");
              response.sendRedirect("Login.jsp");
            }
        } catch (IOException e) {
               System.err.println("Error al obtener usuario, se redirecciona a login"+e);
              sesion.setAttribute("error", "El Usuario no Existe");
              response.sendRedirect("Login.jsp");
        }
        

    }
    
    //Se agrega metodos para encriptar MD5
       public static String generateMD5Signature(String input) {
    try {
        //Cambiando MD5 por SHA-1 podríamos obtener la huella usando este otro algoritmo
        MessageDigest md = MessageDigest.getInstance("MD5");
        //MessageDigest md = MessageDigest.getInstance(input);
        byte[] huella = md.digest(input.getBytes());
        return transformaAHexadecimal(huella);
    } catch (NoSuchAlgorithmException ex) {
        //Logger.getLogger(Tools.class.getName()).log(Level.SEVERE,
          //      "No se ha encontrado el algoritmo MD5", ex);
        return "-1";
    }
}
 
//Método para transformar el array de bytes en una cadena hexadecimal
private static String transformaAHexadecimal(byte buf[]) {
    StringBuilder strbuf = new StringBuilder(buf.length * 2);
    for (int i = 0; i < buf.length; i++) {
        if (((int) buf[i] & 0xff) < 0x10) {
            strbuf.append("0");
        }
        strbuf.append(Long.toString((int) buf[i] & 0xff, 16));
    }
    return strbuf.toString();
}

    

}
