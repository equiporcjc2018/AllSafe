/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Cargo;
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
public class CargoSessionBean {

    @PersistenceContext
    EntityManager em;
    
    public List<Cargo> getAllCargo() throws ControllerException{
        Cargo objCargo = null;
        return em.createNamedQuery("Cargo.findAll", Cargo.class).getResultList();

    }
    
    public Cargo buscaCargoXID(int id){
        Cargo infoCargoEntidad = null;
        try {
            infoCargoEntidad =em.createNamedQuery("Cargo.findByIdCargo",Cargo.class)
                    .setParameter("idCargo", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoCargoEntidad;
    }
}
