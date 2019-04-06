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
public class TipoeppDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idTipoEPP;
    private String descripcionTipoEPP;
    private List<EppDTO> eppList;

    public TipoeppDTO() {
    }

    public TipoeppDTO(Integer idTipoEPP) {
        this.idTipoEPP = idTipoEPP;
    }

    public TipoeppDTO(Integer idTipoEPP, String descripcionTipoEPP) {
        this.idTipoEPP = idTipoEPP;
        this.descripcionTipoEPP = descripcionTipoEPP;
    }

    public Integer getIdTipoEPP() {
        return idTipoEPP;
    }

    public void setIdTipoEPP(Integer idTipoEPP) {
        this.idTipoEPP = idTipoEPP;
    }

    public String getDescripcionTipoEPP() {
        return descripcionTipoEPP;
    }

    public void setDescripcionTipoEPP(String descripcionTipoEPP) {
        this.descripcionTipoEPP = descripcionTipoEPP;
    }

    public List<EppDTO> getEppList() {
        return eppList;
    }

    public void setEppList(List<EppDTO> eppList) {
        this.eppList = eppList;
    }

    public TipoeppDTO(Integer idTipoEPP, String descripcionTipoEPP, List<EppDTO> eppList) {
        this.idTipoEPP = idTipoEPP;
        this.descripcionTipoEPP = descripcionTipoEPP;
        this.eppList = eppList;
    }

}
