/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Persona;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author JuanCarlos
 */


@Stateless
public class PersonaDAOSessionBean {
    
    @PersistenceContext
    EntityManager em;
    
      public List<Persona> getAllPersona()
    {
        return em.createNamedQuery("Persona.findAll",Persona.class)
                .getResultList();
    }
    
    public void guardarPersona (Persona persona) throws ControllerException
    {
        em.persist(persona);
    }
}
