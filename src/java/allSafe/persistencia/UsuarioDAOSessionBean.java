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
        return em.createNamedQuery("Usuarioallsafe.findAll", Usuarioallsafe.class).getResultList();

    }
    
    public Usuarioallsafe getValidaUser(String user) {
        Usuarioallsafe objUsuario = null;

        try {
            objUsuario = this.em.createNamedQuery("Usuarioallsafe.findByLoginUsuarioAllSafe", Usuarioallsafe.class)
                    .setParameter("loginUsuarioAllSafe", user)
                    .getSingleResult();
        } catch (NoResultException ex) {
            System.out.println("Error nro:" + ex.getMessage());
            return null;

        } catch (NonUniqueResultException ex2) {
            System.out.println("Error nro:" + ex2.getMessage());
            return null;
        }
        return objUsuario;
    }

    public Usuarioallsafe buscaUsuarioXCodigo(int codigo) {
        Usuarioallsafe infoUsuario = null;
        try {
            infoUsuario = em.createNamedQuery("Usuarioallsafe.findByIdUsuarioAllSafe", Usuarioallsafe.class)
                    .setParameter("idUsuarioAllSafe", codigo)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        } catch (NonUniqueResultException ex) {
            throw ex;
        }
        return infoUsuario;
    }
    
    public Usuarioallsafe updateUsuario(Usuarioallsafe usuario) {
        try {
            System.out.println(usuario.toString());
            Usuarioallsafe auxUsuario = this.buscaUsuarioXCodigo(usuario.getIdUsuarioAllSafe());
            auxUsuario.setPassUsuarioAllSafe(usuario.getPassUsuarioAllSafe());
            usuario = em.merge(usuario);
            em.flush();
            return auxUsuario;
        } catch (NoResultException ex) {
            ex.printStackTrace();
            return null;
        } catch (NonUniqueResultException ex) {
            ex.printStackTrace();
            throw ex;
        }
    }
    

}
