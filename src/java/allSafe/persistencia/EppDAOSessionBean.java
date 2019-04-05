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
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;

/**
 *
 * @author rcv
 */
@Stateless
public class EppDAOSessionBean {

    @PersistenceContext
    EntityManager em;
    
    public List<Epp> getAllEpps() throws ControllerException{
        Epp objEpp = null;
        return em.createNamedQuery("Epp.findAll", Epp.class).getResultList();

    }
    
    public List<Epp> getAllEppEstandar(int estandar) throws ControllerException
    {
        return em.createNamedQuery("Epp.findByTipoEPP", Epp.class)
                .setParameter("tipoEPPidTipoEPP", estandar)
                .getResultList();
    }
    
    public List<Epp> getAllEppNoEstandar(int noEstandar) throws ControllerException
    {
        Epp objEpp = null;
        return em.createNamedQuery("Epp.findByTipoEPP", Epp.class)
                .setParameter("tipoEPPidTipoEPP", noEstandar)
                .getResultList();
    }
    
    public void addEpp(EppTipoEppDTO eppTipoEppDTO) throws ControllerException {
        Epp objEpp = new Epp();
        objEpp.setNombreEPPcol(eppTipoEppDTO.getObjEpp().getNombreEPPcol());
        objEpp.setDescripcionEPP(eppTipoEppDTO.getObjEpp().getDescripcionEPP());
        objEpp.setTipoEPPidTipoEPP(eppTipoEppDTO.getObjTipoepp());
        objEpp.setVigenteepp(eppTipoEppDTO.getObjEpp().getVigenteepp());
        em.persist(objEpp);
    }
    
    public void UpdateEpp(EppTipoEppDTO eppTipoEppDTO) throws ControllerException {
        Epp objEpp = new Epp();
        objEpp.setIdEPP(eppTipoEppDTO.getObjEpp().getIdEPP());
        objEpp.setNombreEPPcol(eppTipoEppDTO.getObjEpp().getNombreEPPcol());
        objEpp.setDescripcionEPP(eppTipoEppDTO.getObjEpp().getDescripcionEPP());
        objEpp.setTipoEPPidTipoEPP(eppTipoEppDTO.getObjTipoepp());
        objEpp.setVigenteepp(eppTipoEppDTO.getObjEpp().getVigenteepp());
        em.merge(objEpp);
        
    }
    
    public Epp buscaEppXID(int id){
        Epp infoEppEntidad = null;
        try {
            infoEppEntidad =em.createNamedQuery("Epp.findByIdEPP",Epp.class)
                    .setParameter("idEPP", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoEppEntidad;
    }
    
    public Epp buscaEppXcodigo(int codigoFormato){
        return  em.createNamedQuery("Epp.findByIdEPP",Epp.class)
                .setParameter("idEPP", codigoFormato)
                .getSingleResult();
    }
    
    
    public void updateVigenteEpp(Epp epp)
    {
        Epp infoEpp = new Epp();
        String vigente = epp.getVigenteepp();
        if (vigente.equals("Si")) 
        {
            infoEpp.setIdEPP(epp.getIdEPP());
            infoEpp.setNombreEPPcol(epp.getNombreEPPcol());
            infoEpp.setDescripcionEPP(epp.getDescripcionEPP());
            infoEpp.setTipoEPPidTipoEPP(epp.getTipoEPPidTipoEPP());
            infoEpp.setVigenteepp("No");
        }
        else
        {
            infoEpp.setIdEPP(epp.getIdEPP());
            infoEpp.setNombreEPPcol(epp.getNombreEPPcol());
            infoEpp.setDescripcionEPP(epp.getDescripcionEPP());
            infoEpp.setTipoEPPidTipoEPP(epp.getTipoEPPidTipoEPP());
            infoEpp.setVigenteepp("Si");
        }
        
        em.merge(infoEpp);
    }
}
