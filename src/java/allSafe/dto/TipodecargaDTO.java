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
public class TipodecargaDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idtipodecarga;
    private String nombretipodecargac;
    private List<AsignacantidadeppDTO> asignacantidadeppList;

    public TipodecargaDTO() {
    }

    public TipodecargaDTO(Integer idtipodecarga) {
        this.idtipodecarga = idtipodecarga;
    }

    public TipodecargaDTO(Integer idtipodecarga, String nombretipodecargac) {
        this.idtipodecarga = idtipodecarga;
        this.nombretipodecargac = nombretipodecargac;
    }

    public Integer getIdtipodecarga() {
        return idtipodecarga;
    }

    public void setIdtipodecarga(Integer idtipodecarga) {
        this.idtipodecarga = idtipodecarga;
    }

    public String getNombretipodecargac() {
        return nombretipodecargac;
    }

    public void setNombretipodecargac(String nombretipodecargac) {
        this.nombretipodecargac = nombretipodecargac;
    }

    public List<AsignacantidadeppDTO> getAsignacantidadeppList() {
        return asignacantidadeppList;
    }

    public void setAsignacantidadeppList(List<AsignacantidadeppDTO> asignacantidadeppList) {
        this.asignacantidadeppList = asignacantidadeppList;
    }

    public TipodecargaDTO(Integer idtipodecarga, String nombretipodecargac, List<AsignacantidadeppDTO> asignacantidadeppList) {
        this.idtipodecarga = idtipodecarga;
        this.nombretipodecargac = nombretipodecargac;
        this.asignacantidadeppList = asignacantidadeppList;
    }

    
}
