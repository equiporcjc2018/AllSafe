/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;

import allSafe.Entities.Usuarioallsafe;
import allSafe.persistencia.UsuarioDAOSessionBean;
import allSafe.util.Utilidades;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
        String pass=Utilidades.generateMD5Signature(request.getParameter("txtPass"));
        //Si el checkbox esta habilitado, guardar cookie con el nombre de usuario
        if(null != request.getParameter("boolRemember")){            
            Cookie c = new Cookie("txtLogin", login);
            c.setMaxAge(24*60*60);
            response.addCookie(c);
        }
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
              System.err.println("Error al obtener usuario, se redirecciona a loginn"+e);
              sesion.setAttribute("error", "El Usuario no Existe");
              response.sendRedirect("Login.jsp");
        }
        

    }

}
