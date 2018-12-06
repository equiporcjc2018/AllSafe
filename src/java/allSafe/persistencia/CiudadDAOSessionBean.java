/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Ciudad;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;

/**
 *
 * @author JuanCarlos
 */
@Stateless
public class CiudadDAOSessionBean {
    
    @PersistenceContext
    EntityManager em;
    
      public List<Ciudad> getAllCiudad()
    {
        return em.createNamedQuery("Ciudad.findAll",Ciudad.class)
                .getResultList();
    }
    
    public void guardarCiudad (Ciudad ciudad) throws ControllerException
    {
        em.persist(ciudad);
    }
    
     public Ciudad buscaCiudadXID(int id){
        Ciudad infoTallaCiudadEntidad = null;
        try {
            infoTallaCiudadEntidad =em.createNamedQuery("Ciudad.findByIdCiudad",Ciudad.class)
                    .setParameter("idCiudad", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoTallaCiudadEntidad;
    }
     
    
    
    
}
