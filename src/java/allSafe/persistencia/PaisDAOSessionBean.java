/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Pais;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author JuanCarlos
 */
@Stateless
public class PaisDAOSessionBean {
    
    @PersistenceContext
    EntityManager em;
    
      public List<Pais> getAllPais()
    {
        return em.createNamedQuery("Pais.findAll",Pais.class)
                .getResultList();
    }
    
    public void guardarProyecto (Pais pais) throws ControllerException
    {
        em.persist(pais);
    }
    
    public List<Pais> getPaisXID(int idPais) {
        return em.createNamedQuery("Pais.findByIdPais", Pais.class)
                .setParameter("idPais", idPais)
                .getResultList();
    }
    
}
