/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author alvarosmh
 */
public class AsignaeppaproyectoDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idasignaeppaproyecto;
    private EppDTO eppidEPP;
    private ProyectoDTO proyectoidProyecto;
    private List<AsignacantidadeppDTO> asignacantidadeppList;

    public AsignaeppaproyectoDTO() {
    }

    public AsignaeppaproyectoDTO(Integer idasignaeppaproyecto) {
        this.idasignaeppaproyecto = idasignaeppaproyecto;
    }

    public AsignaeppaproyectoDTO(Integer idasignaeppaproyecto, EppDTO eppidEPP, ProyectoDTO proyectoidProyecto, List<AsignacantidadeppDTO> asignacantidadeppList) {
        this.idasignaeppaproyecto = idasignaeppaproyecto;
        this.eppidEPP = eppidEPP;
        this.proyectoidProyecto = proyectoidProyecto;
        this.asignacantidadeppList = asignacantidadeppList;
    }

    public Integer getIdasignaeppaproyecto() {
        return idasignaeppaproyecto;
    }

    public void setIdasignaeppaproyecto(Integer idasignaeppaproyecto) {
        this.idasignaeppaproyecto = idasignaeppaproyecto;
    }

    public EppDTO getEppidEPP() {
        return eppidEPP;
    }

    public void setEppidEPP(EppDTO eppidEPP) {
        this.eppidEPP = eppidEPP;
    }

    public ProyectoDTO getProyectoidProyecto() {
        return proyectoidProyecto;
    }

    public void setProyectoidProyecto(ProyectoDTO proyectoidProyecto) {
        this.proyectoidProyecto = proyectoidProyecto;
    }

    public List<AsignacantidadeppDTO> getAsignacantidadeppList() {
        return asignacantidadeppList;
    }

    public void setAsignacantidadeppList(List<AsignacantidadeppDTO> asignacantidadeppList) {
        this.asignacantidadeppList = asignacantidadeppList;
    }
    
    
    
}
