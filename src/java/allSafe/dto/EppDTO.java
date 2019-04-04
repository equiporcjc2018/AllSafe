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
public class EppDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idEPP;
    
    private String nombreEPPcol;
    private String descripcionEPP;
    private String vigenteepp;
    private TipoeppDTO tipoEPPidTipoEPP;
    private List<EppTerrenoDTO> eppterrenoList;
    private List<AsignaeppaproyectoDTO> asignaeppaproyectoList;
    private List<EppsolicitudterrenoDTO> eppsolicitudterrenoList;

    public EppDTO() {
    }

    public EppDTO(Integer idEPP) {
        this.idEPP = idEPP;
    }

    public EppDTO(Integer idEPP, String nombreEPPcol, String descripcionEPP, String vigenteepp) {
        this.idEPP = idEPP;
        this.nombreEPPcol = nombreEPPcol;
        this.descripcionEPP = descripcionEPP;
        this.vigenteepp = vigenteepp;
    }

    public Integer getIdEPP() {
        return idEPP;
    }

    public void setIdEPP(Integer idEPP) {
        this.idEPP = idEPP;
    }

    public String getNombreEPPcol() {
        return nombreEPPcol;
    }

    public void setNombreEPPcol(String nombreEPPcol) {
        this.nombreEPPcol = nombreEPPcol;
    }

    public String getDescripcionEPP() {
        return descripcionEPP;
    }

    public void setDescripcionEPP(String descripcionEPP) {
        this.descripcionEPP = descripcionEPP;
    }

    public String getVigenteepp() {
        return vigenteepp;
    }

    public void setVigenteepp(String vigenteepp) {
        this.vigenteepp = vigenteepp;
    }

    public TipoeppDTO getTipoEPPidTipoEPP() {
        return tipoEPPidTipoEPP;
    }

    public void setTipoEPPidTipoEPP(TipoeppDTO tipoEPPidTipoEPP) {
        this.tipoEPPidTipoEPP = tipoEPPidTipoEPP;
    }

    public List<EppTerrenoDTO> getEppterrenoList() {
        return eppterrenoList;
    }

    public void setEppterrenoList(List<EppTerrenoDTO> eppterrenoList) {
        this.eppterrenoList = eppterrenoList;
    }

    public List<AsignaeppaproyectoDTO> getAsignaeppaproyectoList() {
        return asignaeppaproyectoList;
    }

    public void setAsignaeppaproyectoList(List<AsignaeppaproyectoDTO> asignaeppaproyectoList) {
        this.asignaeppaproyectoList = asignaeppaproyectoList;
    }

    public List<EppsolicitudterrenoDTO> getEppsolicitudterrenoList() {
        return eppsolicitudterrenoList;
    }

    public void setEppsolicitudterrenoList(List<EppsolicitudterrenoDTO> eppsolicitudterrenoList) {
        this.eppsolicitudterrenoList = eppsolicitudterrenoList;
    }

    public EppDTO(Integer idEPP, String nombreEPPcol, String descripcionEPP, String vigenteepp, TipoeppDTO tipoEPPidTipoEPP, List<EppTerrenoDTO> eppterrenoList, List<AsignaeppaproyectoDTO> asignaeppaproyectoList, List<EppsolicitudterrenoDTO> eppsolicitudterrenoList) {
        this.idEPP = idEPP;
        this.nombreEPPcol = nombreEPPcol;
        this.descripcionEPP = descripcionEPP;
        this.vigenteepp = vigenteepp;
        this.tipoEPPidTipoEPP = tipoEPPidTipoEPP;
        this.eppterrenoList = eppterrenoList;
        this.asignaeppaproyectoList = asignaeppaproyectoList;
        this.eppsolicitudterrenoList = eppsolicitudterrenoList;
    }

    
}
