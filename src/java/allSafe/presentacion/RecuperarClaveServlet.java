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
@WebServlet(name = "RecuperarClaveServlet", urlPatterns = {"/recuperarClaveServlet", "/recuperarClave"})
public class RecuperarClaveServlet extends HttpServlet {

    @EJB
    UsuarioDAOSessionBean usuarioDAO;
    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        String id = request.getParameter("id");
        if(null != codigo && !codigo.isEmpty() && null != id && !id.isEmpty()){
            try{
                if(usuarioDAO.validarCodigoRecuperacionClave(codigo, Integer.parseInt(id))){
                    response.sendRedirect("CambiarClave.jsp/"+codigo+"/"+id);
                
                }else{
                    response.sendRedirect("CodigoExpirado.jsp");
                    
                }
            }catch(Exception e){
                response.sendRedirect("CodigoExpirado.jsp");
                e.printStackTrace();
            }
            
        }else{
            response.sendRedirect("CodigoExpirado.jsp");
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion= request.getSession();
        String clave = request.getParameter("txtClave");
        String id = request.getParameter("id");
        String codigo = request.getParameter("codigo");
        if(null != clave && !clave.isEmpty() && null != codigo && !codigo.isEmpty() && null != id && !id.isEmpty()){
            try{
                if(usuarioDAO.validarCodigoRecuperacionClave(codigo, Integer.parseInt(id))){
                    UsuarioDTO usuario = new UsuarioDTO();
                    usuario.setPassUsuarioAllSafe(clave);
                    usuario.setIdUsuarioAllSafe(Integer.parseInt(id));
                    usuarioDAO.updateUsuarioPass(usuario);
                
                }else{
                    response.sendRedirect("CodigoExpirado.jsp");
                    
                }
            }catch(Exception e){
                response.sendRedirect("CodigoExpirado.jsp");
                e.printStackTrace();
            }
            
        }else{
            response.sendRedirect("Login.jsp");
            sesion.setAttribute("error", "Ocurrio un error, vuelva a intentarlo");
        }
        
    }

   

}
