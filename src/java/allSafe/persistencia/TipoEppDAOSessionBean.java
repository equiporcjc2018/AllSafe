/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Tipoepp;
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
public class TipoEppDAOSessionBean {

    @PersistenceContext
    EntityManager em;
    
    public List<Tipoepp> getAllTipoEpps() throws ControllerException{
        Tipoepp objTipoepp = null;
        return em.createNamedQuery("Tipoepp.findAll", Tipoepp.class).getResultList();

    }
    
    public Tipoepp buscaTipoEPPXID(int id){
        Tipoepp infoTipoeppEntidad = null;
        try {
            infoTipoeppEntidad =em.createNamedQuery("Tipoepp.findByIdTipoEPP",Tipoepp.class)
                    .setParameter("idTipoEPP", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoTipoeppEntidad;
    }
}
