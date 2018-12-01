/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Proyecto;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ProyectoDAOSessionBean {
    
    @PersistenceContext
    EntityManager em;
    
      public List<Proyecto> getAllProyecto()
    {
        return em.createNamedQuery("Proyecto.findAll",Proyecto.class)
                .getResultList();
    }
    
    public void guardarProyecto (Proyecto proyecto) throws ControllerException
    {
        em.persist(proyecto);
    }
    
    
}
