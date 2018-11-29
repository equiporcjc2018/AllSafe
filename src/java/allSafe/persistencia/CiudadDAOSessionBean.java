/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Ciudad;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author JuanCarlos
 */
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
    
     public List<Ciudad> getCiudadXID(int idCiudad) {
        return em.createNamedQuery("Pais.findByIdCiudad", Ciudad.class)
                .setParameter("idCiudad", idCiudad)
                .getResultList();
    }
    
    
}
