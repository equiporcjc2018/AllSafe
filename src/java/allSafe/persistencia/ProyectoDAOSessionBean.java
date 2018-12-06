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
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
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
    
    public Proyecto buscaProyectoXID(int id){
        Proyecto infoProyectoEntidad = null;
        try {
            infoProyectoEntidad =em.createNamedQuery("Proyecto.findByIdProyecto",Proyecto.class)
                    .setParameter("idProyecto", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoProyectoEntidad;
    }
    
}
