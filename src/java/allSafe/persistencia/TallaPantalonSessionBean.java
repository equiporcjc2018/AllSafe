/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Tallapantalon;
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
public class TallaPantalonSessionBean {

    @PersistenceContext
    EntityManager em;
    
    public List<Tallapantalon> getAllTallaPantalon() throws ControllerException{
        Tallapantalon objTallapantalon = null;
        return em.createNamedQuery("Tallapantalon.findAll", Tallapantalon.class).getResultList();

    }
    
    public Tallapantalon buscaTallaPantalonXID(int id){
        Tallapantalon infoTallaPantalonEntidad = null;
        try {
            infoTallaPantalonEntidad =em.createNamedQuery("Tallapantalon.findByIdTallaPantalon",Tallapantalon.class)
                    .setParameter("idTallaPantalon", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoTallaPantalonEntidad;
    }
}
