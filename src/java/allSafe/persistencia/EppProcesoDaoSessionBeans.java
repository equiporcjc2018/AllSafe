/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Eppproceso;
import allSafe.dto.EppProcesoProyectoEPPPersonaEstadoProyectoDTO;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author hachi
 */
@Stateless
public class EppProcesoDaoSessionBeans {

    @PersistenceContext
    EntityManager em;
    
    public List<Eppproceso> getAllEppProceso() throws ControllerException{
        
        return em.createNamedQuery("Eppproceso.findAll", Eppproceso.class).getResultList();

    }
    
    public void addEppProceso(EppProcesoProyectoEPPPersonaEstadoProyectoDTO eppepppepDTO) throws ControllerException {
        Eppproceso objEppproceso = new Eppproceso();
        
        objEppproceso.setProyectoidProyecto(eppepppepDTO.getObjProyecto());
        objEppproceso.setEPPidEPP(eppepppepDTO.getObjEpp());
        objEppproceso.setFechaCreacionEppProceso(eppepppepDTO.getObjEppproceso().getFechaCreacionEppProceso());
        objEppproceso.setPersonarutPasaportePersona(eppepppepDTO.getObjPersona());
        objEppproceso.setTallaEppProceso(eppepppepDTO.getObjEppproceso().getTallaEppProceso());
        objEppproceso.setUnidadEppProceso(eppepppepDTO.getObjEppproceso().getUnidadEppProceso());
        objEppproceso.setCantidadEppProceso(eppepppepDTO.getObjEppproceso().getCantidadEppProceso());
        objEppproceso.setPrecioUnitarioEppProceso(eppepppepDTO.getObjEppproceso().getPrecioUnitarioEppProceso());
        objEppproceso.setDestinoDevolucionEppProceso(eppepppepDTO.getObjEppproceso().getDestinoDevolucionEppProceso());
        objEppproceso.setMotivoEppProceso(eppepppepDTO.getObjEppproceso().getMotivoEppProceso());
        objEppproceso.setEstadosProyectoidEstadosProyecto(eppepppepDTO.getObjEstadosproyecto());
        em.persist(objEppproceso);
    }
    
}
