/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;
import allSafe.dto.UsuarioDTO;
import allSafe.persistencia.UsuarioDAOSessionBean;
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
 * @author alvarosmh
 */
@WebServlet(name = "EnviarCodigoClaveRecuperacion", urlPatterns = {"/enviarCodigoClaveServlet", "/enviarCodigoClave"})
public class EnviarCodigoClaveRecuperacion extends HttpServlet {

    @EJB
    UsuarioDAOSessionBean usuarioDAO;
    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion= request.getSession();
        String usuario = request.getParameter("txtLogin");
        if(null != usuario && !usuario.isEmpty()){
            try{
                if(usuarioDAO.addCodigoRecuperacion(usuario)){
                    sesion.setAttribute("exito", "Te hemos enviado correo con un enlace para cambiar la contraseña");
                    response.sendRedirect("RecuperarClave.jsp");
                    
                }else{
                    sesion.setAttribute("error", "Ocurrio un error, vuelva a intentarlo");
                    response.sendRedirect("Login.jsp");
                    
                }
            }catch(Exception e){
                sesion.setAttribute("error", "Ocurrio un error, vuelva a intentarlo");
                response.sendRedirect("Login.jsp");
                e.printStackTrace();
            }
            
        }else{
            response.sendRedirect("Login.jsp");
            sesion.setAttribute("error", "Ocurrio un error, vuelva a intentarlo");
        }
        
    }

   

}
