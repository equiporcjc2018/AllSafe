/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Tipoplanta;
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
public class TipoPlantaSessionBean {

    @PersistenceContext
    EntityManager em;
    
    public List<Tipoplanta> getAllTipoPlanta() throws ControllerException{
        Tipoplanta objTipoplanta = null;
        return em.createNamedQuery("Tipoplanta.findAll", Tipoplanta.class).getResultList();

    }
    
    public Tipoplanta buscaTipoPlantaXID(int id){
        Tipoplanta infoTipoplantaEntidad = null;
        try {
            infoTipoplantaEntidad =em.createNamedQuery("Tipoplanta.findByIdTipoPlanta",Tipoplanta.class)
                    .setParameter("idTipoPlanta", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoTipoplantaEntidad;
    }
}
