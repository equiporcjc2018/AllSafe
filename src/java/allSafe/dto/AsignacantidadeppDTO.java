/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import java.io.Serializable;

/**
 *
 * @author alvarosmg
 */
public class AsignacantidadeppDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idEppProceso;
    private String fechaCreacionEppProceso;
    private String tallaEppProceso;
    private int unidadEppProceso;
    private Number cantidadEppProceso;
    private int precioUnitarioEppProceso;
    private EstadosproyectoDTO estadosProyectoidEstadosProyecto;
    private AsignaeppaproyectoDTO asignaeppaproyectoIdasignaeppaproyecto;
    private TipodecargaDTO tipodecargaIdtipodecarga;

    public AsignacantidadeppDTO() {
    }

    public AsignacantidadeppDTO(Integer idEppProceso, String fechaCreacionEppProceso, String tallaEppProceso, int unidadEppProceso, Number cantidadEppProceso, int precioUnitarioEppProceso, EstadosproyectoDTO estadosProyectoidEstadosProyecto, AsignaeppaproyectoDTO asignaeppaproyectoIdasignaeppaproyecto, TipodecargaDTO tipodecargaIdtipodecarga) {
        this.idEppProceso = idEppProceso;
        this.fechaCreacionEppProceso = fechaCreacionEppProceso;
        this.tallaEppProceso = tallaEppProceso;
        this.unidadEppProceso = unidadEppProceso;
        this.cantidadEppProceso = cantidadEppProceso;
        this.precioUnitarioEppProceso = precioUnitarioEppProceso;
        this.estadosProyectoidEstadosProyecto = estadosProyectoidEstadosProyecto;
        this.asignaeppaproyectoIdasignaeppaproyecto = asignaeppaproyectoIdasignaeppaproyecto;
        this.tipodecargaIdtipodecarga = tipodecargaIdtipodecarga;
    }

    public AsignacantidadeppDTO(Integer idEppProceso) {
        this.idEppProceso = idEppProceso;
    }

    public Integer getIdEppProceso() {
        return idEppProceso;
    }

    public void setIdEppProceso(Integer idEppProceso) {
        this.idEppProceso = idEppProceso;
    }

    public String getFechaCreacionEppProceso() {
        return fechaCreacionEppProceso;
    }

    public void setFechaCreacionEppProceso(String fechaCreacionEppProceso) {
        this.fechaCreacionEppProceso = fechaCreacionEppProceso;
    }

    public String getTallaEppProceso() {
        return tallaEppProceso;
    }

    public void setTallaEppProceso(String tallaEppProceso) {
        this.tallaEppProceso = tallaEppProceso;
    }

    public int getUnidadEppProceso() {
        return unidadEppProceso;
    }

    public void setUnidadEppProceso(int unidadEppProceso) {
        this.unidadEppProceso = unidadEppProceso;
    }

    public Number getCantidadEppProceso() {
        return cantidadEppProceso;
    }

    public void setCantidadEppProceso(Number cantidadEppProceso) {
        this.cantidadEppProceso = cantidadEppProceso;
    }

    public int getPrecioUnitarioEppProceso() {
        return precioUnitarioEppProceso;
    }

    public void setPrecioUnitarioEppProceso(int precioUnitarioEppProceso) {
        this.precioUnitarioEppProceso = precioUnitarioEppProceso;
    }

    public EstadosproyectoDTO getEstadosProyectoidEstadosProyecto() {
        return estadosProyectoidEstadosProyecto;
    }

    public void setEstadosProyectoidEstadosProyecto(EstadosproyectoDTO estadosProyectoidEstadosProyecto) {
        this.estadosProyectoidEstadosProyecto = estadosProyectoidEstadosProyecto;
    }

    public AsignaeppaproyectoDTO getAsignaeppaproyectoIdasignaeppaproyecto() {
        return asignaeppaproyectoIdasignaeppaproyecto;
    }

    public void setAsignaeppaproyectoIdasignaeppaproyecto(AsignaeppaproyectoDTO asignaeppaproyectoIdasignaeppaproyecto) {
        this.asignaeppaproyectoIdasignaeppaproyecto = asignaeppaproyectoIdasignaeppaproyecto;
    }

    public TipodecargaDTO getTipodecargaIdtipodecarga() {
        return tipodecargaIdtipodecarga;
    }

    public void setTipodecargaIdtipodecarga(TipodecargaDTO tipodecargaIdtipodecarga) {
        this.tipodecargaIdtipodecarga = tipodecargaIdtipodecarga;
    }

    
    
}
