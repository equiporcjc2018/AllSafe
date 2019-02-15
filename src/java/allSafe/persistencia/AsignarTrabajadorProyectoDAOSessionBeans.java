/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Asignatrabajadorproyecto;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ruben
 */
public class AsignarTrabajadorProyectoDAOSessionBeans {
    @PersistenceContext
    EntityManager em;
    
    public List<Asignatrabajadorproyecto> getAllAsignaTrabAProy() throws ControllerException{
        
        return em.createNamedQuery("Asignatrabajadorproyecto.findAll", Asignatrabajadorproyecto.class).getResultList();

    }
}
