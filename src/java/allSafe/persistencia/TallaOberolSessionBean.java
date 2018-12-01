/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Tallaoberol;
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
public class TallaOberolSessionBean {

    @PersistenceContext
    EntityManager em;
    
    public List<Tallaoberol> getAllTallaOberol() throws ControllerException{
        Tallaoberol objTallapoleracamisa = null;
        return em.createNamedQuery("Tallaoberol.findAll", Tallaoberol.class).getResultList();

    }
    
    public Tallaoberol buscaTallaOberolXID(int id){
        Tallaoberol infoTallaOberolEntidad = null;
        try {
            infoTallaOberolEntidad =em.createNamedQuery("Tallaoberol.findByIdTallaOberol",Tallaoberol.class)
                    .setParameter("idTallaOberol", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoTallaOberolEntidad;
    }
}
