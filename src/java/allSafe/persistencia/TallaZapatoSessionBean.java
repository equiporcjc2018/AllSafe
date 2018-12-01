/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Tallazapato;
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
public class TallaZapatoSessionBean {

    @PersistenceContext
    EntityManager em;
    
    public List<Tallazapato> getAllTallaZapato() throws ControllerException{
        Tallazapato objTallazapato = null;
        return em.createNamedQuery("Tallazapato.findAll", Tallazapato.class).getResultList();

    }
    
    public Tallazapato buscaTallazapatoXID(int id){
        Tallazapato infoTallazapatoEntidad = null;
        try {
            infoTallazapatoEntidad =em.createNamedQuery("Tallazapato.findByIdTallaZapato",Tallazapato.class)
                    .setParameter("idTallaZapato", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoTallazapatoEntidad;
    }
}
