/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.presentacion;
import allSafe.Entities.Usuarioallsafe;
import allSafe.persistencia.UsuarioDAOSessionBean;
import allSafe.persistencia.UsuarioRecuperarClaveBean;
import allSafe.util.Utilidades;
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
        String clave = request.getParameter("txtClave");
        String id = request.getParameter("id");
        String codigo = request.getParameter("codigo");
        if(null != clave && !clave.isEmpty() && null != codigo && !codigo.isEmpty() && null != id && !id.isEmpty()){
            try{
                if(historialDAO.validarCodigoRecuperacionClave(codigo, Integer.parseInt(id))){
                    Usuarioallsafe usuario = usuarioDAO.buscaUsuarioXCodigo(Integer.parseInt(id));
                    usuario.setPassUsuarioAllSafe(Utilidades.generateMD5Signature(clave));
                    
                    usuarioDAO.updateUsuario(usuario);
                    historialDAO.desactivarTodasLasClavesDelHistorial(usuario);
                    historialDAO.addHistorialClave(usuario);
                    sesion.setAttribute("exito", "Hemos cambiado tu clave correctamente");
                    response.sendRedirect("Login.jsp");
                }else{
                    response.sendRedirect("CodigoExpirado.jsp");
                }
            }catch(Exception e){
                response.sendRedirect("Login.jsp");
                e.printStackTrace();
            }
            
        }else{
            sesion.setAttribute("error", "Ocurrio un error, vuelva a intentarlo");
            response.sendRedirect("Login.jsp");
        }
        
    }

   

}
