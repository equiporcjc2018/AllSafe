/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Epp;
import allSafe.dto.EppTipoEppDTO;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author hachi
 */
@Stateless
public class EppDAOSessionBean {

    @PersistenceContext
    EntityManager em;
    
    public List<Epp> getAllEpps() throws ControllerException{
        Epp objEpp = null;
        return em.createNamedQuery("Epp.findAll", Epp.class).getResultList();

    }
    
    public void addEpp(EppTipoEppDTO eppTipoEppDTO) throws ControllerException {
        Epp objEpp = new Epp();
        objEpp.setNombreEPPcol(eppTipoEppDTO.getObjEpp().getNombreEPPcol());
        objEpp.setDescripcionEPP(eppTipoEppDTO.getObjEpp().getDescripcionEPP());
        objEpp.setTipoEPPidTipoEPP(eppTipoEppDTO.getObjTipoepp());
        em.persist(objEpp);
    }
    
}
