/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;
import allSafe.persistencia.UsuarioDAOSessionBean;
import allSafe.persistencia.UsuarioRecuperarClaveBean;
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
    UsuarioRecuperarClaveBean historialDAO;
    
   
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
                int resultado = historialDAO.addCodigoRecuperacionYEnviarCorreo(usuario);
                switch (resultado) {
                    case 0:
                        sesion.setAttribute("exito", "Te hemos enviado un mail con un enlace para cambiar tu contraseña de AllSafe.");
                        break;
                    case -1:
                        sesion.setAttribute("error", "Usuario no encontrado");
                        break;
                    case -2:
                        sesion.setAttribute("error", "Error inesperado (CODIGO -2)");
                        break;
                    default:
                        sesion.setAttribute("error", "Error inesperado (CODIGO -3)");
                        break;
                }
            }catch(Exception e){
                e.printStackTrace();
                sesion.setAttribute("error", "Algo salió mal.");
            }
        }else{
            sesion.setAttribute("error", "Debes ingresar tu nombre de usuario.");
        }
        response.sendRedirect("Login.jsp");
        
    }

   

}
