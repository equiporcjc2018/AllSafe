/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import allSafe.Entities.*;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author alvarosmh
 */
public class ProyectoDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idProyecto;
    private int numeroProyecto;
    private String nombreProyecto;
    private String ubicacionProyecto;
    private String fechaInicioProyecto;
    private String fechaTerminoProyecto;
    private String vigenteproyecto;
    private List<EppTerrenoDTO> eppterrenoList;
    private List<AsignaeppaproyectoDTO> asignaeppaproyectoList;
    private Ciudad ciudadidCiudad;
    private Empresa empresaidEmpresa;
    private List<Eppsolicitudterreno> eppsolicitudterrenoList;
    private List<Asignatrabajadorproyecto> asignatrabajadorproyectoList;

    public ProyectoDTO() {
    }

    public ProyectoDTO(Integer idProyecto) {
        this.idProyecto = idProyecto;
    }

    public ProyectoDTO(Integer idProyecto, int numeroProyecto, String nombreProyecto, String ubicacionProyecto, String fechaInicioProyecto, String fechaTerminoProyecto, String vigenteproyecto) {
        this.idProyecto = idProyecto;
        this.numeroProyecto = numeroProyecto;
        this.nombreProyecto = nombreProyecto;
        this.ubicacionProyecto = ubicacionProyecto;
        this.fechaInicioProyecto = fechaInicioProyecto;
        this.fechaTerminoProyecto = fechaTerminoProyecto;
        this.vigenteproyecto = vigenteproyecto;
    }

    public ProyectoDTO(Integer idProyecto, int numeroProyecto, String nombreProyecto, String ubicacionProyecto, String fechaInicioProyecto, String fechaTerminoProyecto, String vigenteproyecto, List<EppTerrenoDTO> eppterrenoList, List<AsignaeppaproyectoDTO> asignaeppaproyectoList, Ciudad ciudadidCiudad, Empresa empresaidEmpresa, List<Eppsolicitudterreno> eppsolicitudterrenoList, List<Asignatrabajadorproyecto> asignatrabajadorproyectoList) {
        this.idProyecto = idProyecto;
        this.numeroProyecto = numeroProyecto;
        this.nombreProyecto = nombreProyecto;
        this.ubicacionProyecto = ubicacionProyecto;
        this.fechaInicioProyecto = fechaInicioProyecto;
        this.fechaTerminoProyecto = fechaTerminoProyecto;
        this.vigenteproyecto = vigenteproyecto;
        this.eppterrenoList = eppterrenoList;
        this.asignaeppaproyectoList = asignaeppaproyectoList;
        this.ciudadidCiudad = ciudadidCiudad;
        this.empresaidEmpresa = empresaidEmpresa;
        this.eppsolicitudterrenoList = eppsolicitudterrenoList;
        this.asignatrabajadorproyectoList = asignatrabajadorproyectoList;
    }

    public Integer getIdProyecto() {
        return idProyecto;
    }

    public void setIdProyecto(Integer idProyecto) {
        this.idProyecto = idProyecto;
    }

    public int getNumeroProyecto() {
        return numeroProyecto;
    }

    public void setNumeroProyecto(int numeroProyecto) {
        this.numeroProyecto = numeroProyecto;
    }

    public String getNombreProyecto() {
        return nombreProyecto;
    }

    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    public String getUbicacionProyecto() {
        return ubicacionProyecto;
    }

    public void setUbicacionProyecto(String ubicacionProyecto) {
        this.ubicacionProyecto = ubicacionProyecto;
    }

    public String getFechaInicioProyecto() {
        return fechaInicioProyecto;
    }

    public void setFechaInicioProyecto(String fechaInicioProyecto) {
        this.fechaInicioProyecto = fechaInicioProyecto;
    }

    public String getFechaTerminoProyecto() {
        return fechaTerminoProyecto;
    }

    public void setFechaTerminoProyecto(String fechaTerminoProyecto) {
        this.fechaTerminoProyecto = fechaTerminoProyecto;
    }

    public String getVigenteproyecto() {
        return vigenteproyecto;
    }

    public void setVigenteproyecto(String vigenteproyecto) {
        this.vigenteproyecto = vigenteproyecto;
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

    public Ciudad getCiudadidCiudad() {
        return ciudadidCiudad;
    }

    public void setCiudadidCiudad(Ciudad ciudadidCiudad) {
        this.ciudadidCiudad = ciudadidCiudad;
    }

    public Empresa getEmpresaidEmpresa() {
        return empresaidEmpresa;
    }

    public void setEmpresaidEmpresa(Empresa empresaidEmpresa) {
        this.empresaidEmpresa = empresaidEmpresa;
    }

    public List<Eppsolicitudterreno> getEppsolicitudterrenoList() {
        return eppsolicitudterrenoList;
    }

    public void setEppsolicitudterrenoList(List<Eppsolicitudterreno> eppsolicitudterrenoList) {
        this.eppsolicitudterrenoList = eppsolicitudterrenoList;
    }

    public List<Asignatrabajadorproyecto> getAsignatrabajadorproyectoList() {
        return asignatrabajadorproyectoList;
    }

    public void setAsignatrabajadorproyectoList(List<Asignatrabajadorproyecto> asignatrabajadorproyectoList) {
        this.asignatrabajadorproyectoList = asignatrabajadorproyectoList;
    }

}
