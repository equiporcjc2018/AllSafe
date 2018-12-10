/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Eppterreno;
import allSafe.dto.EppTerrenoProyectoEPPPErsonalDTO;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ruben
 */
@Stateless
public class EppTerrenoDaoSessionsBeans {
    @PersistenceContext
    EntityManager em;
    
    public List<Eppterreno> getAllEppTerreno() throws ControllerException{
        
        return em.createNamedQuery("Eppterreno.findAll", Eppterreno.class).getResultList();

    }
    
    public void addEppTerreno(EppTerrenoProyectoEPPPErsonalDTO eppterrenoDTO) throws ControllerException {
        Eppterreno objEppterreno = new Eppterreno();
        
        objEppterreno.setProyectoidProyecto(eppterrenoDTO.getObjProyecto());
        objEppterreno.setEPPidEPP(eppterrenoDTO.getObjEpp());
        objEppterreno.setFechaEppTerreno(eppterrenoDTO.getObjEppterreno().getFechaEppTerreno());
        objEppterreno.setPersonarutPasaportePersona(eppterrenoDTO.getObjPersona());
        objEppterreno.setTallaEppTerreno(eppterrenoDTO.getObjEppterreno().getTallaEppTerreno());
        objEppterreno.setCantidadEppTerreno(eppterrenoDTO.getObjEppterreno().getCantidadEppTerreno());
        
        em.persist(objEppterreno);
    }
}
