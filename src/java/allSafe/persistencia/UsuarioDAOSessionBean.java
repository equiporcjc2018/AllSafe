/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;


import allSafe.Entities.Usuarioallsafe;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;

/**
 *
 * @author Ruben
 */
@Stateless
public class UsuarioDAOSessionBean {


@PersistenceContext
    private EntityManager em;

    public Usuarioallsafe validaUsuario(String login, String password) {
        Usuarioallsafe objUsuario = null;

        try {
            objUsuario = this.em.createNamedQuery("Usuarioallsafe.validaUsuario", Usuarioallsafe.class)
                    .setParameter("loginUsuarioAllSafe", login)
                    .setParameter("passUsuarioAllSafe", password)
                    .getSingleResult();
        } catch (PersistenceException ex) {
            System.out.println("Error nro:" + ex.getMessage());
        }
        return objUsuario;
    }

    public List<Usuarioallsafe> getAllUser() {
        Usuarioallsafe objUsuario = null;
        return em.createNamedQuery("Usuarioallsafe.findAll", Usuarioallsafe.class).getResultList();

    }
    
    public Usuarioallsafe getValidaUser(String user) {
        Usuarioallsafe objUsuario = null;

        try {
            objUsuario = this.em.createNamedQuery("Usuarioallsafe.findByLoginUsuarioAllSafe", Usuarioallsafe.class)
                    .setParameter("user", user)
                    .getSingleResult();
        } catch (NoResultException ex) {
            System.out.println("Error nro:" + ex.getMessage());

        } catch (NonUniqueResultException ex2) {
            System.out.println("Error nro:" + ex2.getMessage());

        }
        return objUsuario;
    }
/*
    public void addUsuario(UsuarioDTO usuarioDto) throws ControladorExceptions {
        Usuariobj infoUsuario = new Usuariobj();

        infoUsuario.setIdusuarioBj(getAllUser().size()+1);
        infoUsuario.setUserBj(usuarioDto.getLogin());
        infoUsuario.setPassBj(usuarioDto.getPassword());
        infoUsuario.setNombreBj(usuarioDto.getNombreUsuario());
        infoUsuario.setApePatBj(usuarioDto.getApePatUsuario());
        infoUsuario.setApeMatBj(usuarioDto.getApeMatUsuario());
        infoUsuario.setCorreoBj(usuarioDto.getCorreoUsuario());
        Perfilbj infoPerfil = em.find(Perfilbj.class, usuarioDto.getPerfilIdperfil());
        infoUsuario.setPerfilBjidperfilBj(infoPerfil);

        em.persist(infoUsuario);

    }

    public void updateUsuario(UsuarioDTO usuarioDTO) throws ControladorExceptions {
        Usuariobj infoUsuario = new Usuariobj();
        infoUsuario.setIdusuarioBj(usuarioDTO.getIdusuario());
        infoUsuario.setUserBj(usuarioDTO.getLogin());
        infoUsuario.setPassBj(usuarioDTO.getPassword());
        infoUsuario.setNombreBj(usuarioDTO.getNombreUsuario());
        infoUsuario.setApePatBj(usuarioDTO.getApePatUsuario());
        infoUsuario.setApeMatBj(usuarioDTO.getApeMatUsuario());
        infoUsuario.setCorreoBj(usuarioDTO.getCorreoUsuario());
        Perfilbj infoPerfil = em.find(Perfilbj.class, usuarioDTO.getPerfilIdperfil());
        infoUsuario.setPerfilBjidperfilBj(infoPerfil);
        //Sucursal infoSucursal = em.find(Sucursal.class, usuarioDTO.getIdSucursal());
        //infoUsuario.setSucursalIdSucursal(infoSucursal);
        em.merge(infoUsuario);
    }
    */
/*
    public void eliminaUsuario(Usuario usuario) throws ControladorExceptions {
        em.remove(usuario);
        
    }
    
     public void deleteUsuario(int codigoUsuario)throws ControladorExceptions{
        Usuario UsuarioEntity =em.find(Usuario.class, codigoUsuario);
        em.remove(UsuarioEntity);
    }
*/
    public Usuarioallsafe buscaUsuarioXCodigo(int codigo) {
        Usuarioallsafe infoUsuario = null;
        try {
            infoUsuario = em.createNamedQuery("Usuarioallsafe.findByIdUsuarioAllSafe", Usuarioallsafe.class)
                    .setParameter("idUsuario", codigo)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        } catch (NonUniqueResultException ex) {
            throw ex;
        }
        return infoUsuario;
    }
/*
    public List<Usuario> buscaUsuariosXCodigoPerfil(int codigoPerfil) {
        return em.createNamedQuery("Usuario.UsuariosXCodigoPerfil", Usuario.class)
                .setParameter("idPerfil", codigoPerfil)
                .getResultList();
    }

    public Usuarioallsafe buscaUsuariosXRut(String rut) {
        return em.createNamedQuery("Usuario.findByRutUsuario", Usuarioallsafe.class)
                .setParameter("rutUsuario", rut)
                .getSingleResult();
    }*/

}
