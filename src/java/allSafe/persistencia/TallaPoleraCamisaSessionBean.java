/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Tallapoleracamisa;
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
public class TallaPoleraCamisaSessionBean {

    @PersistenceContext
    EntityManager em;
    
    public List<Tallapoleracamisa> getAllTallaPoleraCamisa() throws ControllerException{
        Tallapoleracamisa objTallapoleracamisa = null;
        return em.createNamedQuery("Tallapoleracamisa.findAll", Tallapoleracamisa.class).getResultList();

    }
    
    public Tallapoleracamisa buscaTallaPoleraCamisaXID(int id){
        Tallapoleracamisa infoTallapoleracamisaEntidad = null;
        try {
            infoTallapoleracamisaEntidad =em.createNamedQuery("Tallapoleracamisa.findByIdTallaPoleraCamisa",Tallapoleracamisa.class)
                    .setParameter("idTallaPoleraCamisa", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoTallapoleracamisaEntidad;
    }
}
