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

public class EstadosproyectoDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idEstadosProyecto;
    private String descripcionEstadosProyecto;
    private List<AsignacantidadeppDTO> asignacantidadeppList;

    public EstadosproyectoDTO() {
    }

    public EstadosproyectoDTO(Integer idEstadosProyecto) {
        this.idEstadosProyecto = idEstadosProyecto;
    }

    public EstadosproyectoDTO(Integer idEstadosProyecto, String descripcionEstadosProyecto) {
        this.idEstadosProyecto = idEstadosProyecto;
        this.descripcionEstadosProyecto = descripcionEstadosProyecto;
    }

    public Integer getIdEstadosProyecto() {
        return idEstadosProyecto;
    }

    public void setIdEstadosProyecto(Integer idEstadosProyecto) {
        this.idEstadosProyecto = idEstadosProyecto;
    }

    public String getDescripcionEstadosProyecto() {
        return descripcionEstadosProyecto;
    }

    public void setDescripcionEstadosProyecto(String descripcionEstadosProyecto) {
        this.descripcionEstadosProyecto = descripcionEstadosProyecto;
    }

    public List<AsignacantidadeppDTO> getAsignacantidadeppList() {
        return asignacantidadeppList;
    }

    public void setAsignacantidadeppList(List<AsignacantidadeppDTO> asignacantidadeppList) {
        this.asignacantidadeppList = asignacantidadeppList;
    }

    public EstadosproyectoDTO(Integer idEstadosProyecto, String descripcionEstadosProyecto, List<AsignacantidadeppDTO> asignacantidadeppList) {
        this.idEstadosProyecto = idEstadosProyecto;
        this.descripcionEstadosProyecto = descripcionEstadosProyecto;
        this.asignacantidadeppList = asignacantidadeppList;
    }

    
}
