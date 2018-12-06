/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Estadosproyecto;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;

/**
 *
 * @author hachi
 */
@Stateless
public class EstadoProyectoDAOSessionBeans {

    @PersistenceContext
    EntityManager em;
    
    public List<Estadosproyecto> getAllEstadosproyectos() throws ControllerException{
        return em.createNamedQuery("Estadosproyecto.findAll", Estadosproyecto.class).getResultList();
    }
    
    public Estadosproyecto buscaEstadosproyectoXID(int id){
        Estadosproyecto infoEstadosproyectoEntidad = null;
        try {
            infoEstadosproyectoEntidad =em.createNamedQuery("Estadosproyecto.findByIdEstadosProyecto",Estadosproyecto.class)
                    .setParameter("idEstadosProyecto", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoEstadosproyectoEntidad;
    }
    
}
