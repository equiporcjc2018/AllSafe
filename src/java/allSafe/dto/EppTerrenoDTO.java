/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import java.io.Serializable;

/**
 *
 * @author hachi
 */
public class EppTerrenoDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idEppTerreno;
    private String fechaEppTerreno;
    private String estadoEppTerreno;
    private int cantidadEppTerreno;
    private String tallaEppTerreno;
    private String observacionEppTerreno;
    private byte[] firmaEppTerreno;
    private String tipoEntregaEppTerreno;
    private PersonaDTO personarutPasaportePersona;
    private EppDTO ePPidEPP;
    private ProyectoDTO proyectoidProyecto;
    private UsuarioDTO idUsuario;

    public EppTerrenoDTO() {
    }

    public EppTerrenoDTO(Integer idEppTerreno) {
        this.idEppTerreno = idEppTerreno;
    }

    public EppTerrenoDTO(Integer idEppTerreno, String fechaEppTerreno, String estadoEppTerreno, int cantidadEppTerreno, String tallaEppTerreno, String observacionEppTerreno, byte[] firmaEppTerreno, String tipoEntregaEppTerreno) {
        this.idEppTerreno = idEppTerreno;
        this.fechaEppTerreno = fechaEppTerreno;
        this.estadoEppTerreno = estadoEppTerreno;
        this.cantidadEppTerreno = cantidadEppTerreno;
        this.tallaEppTerreno = tallaEppTerreno;
        this.observacionEppTerreno = observacionEppTerreno;
        this.firmaEppTerreno = firmaEppTerreno;
        this.tipoEntregaEppTerreno = tipoEntregaEppTerreno;
    }

    public Integer getIdEppTerreno() {
        return idEppTerreno;
    }

    public void setIdEppTerreno(Integer idEppTerreno) {
        this.idEppTerreno = idEppTerreno;
    }

    public String getFechaEppTerreno() {
        return fechaEppTerreno;
    }

    public void setFechaEppTerreno(String fechaEppTerreno) {
        this.fechaEppTerreno = fechaEppTerreno;
    }

    public String getEstadoEppTerreno() {
        return estadoEppTerreno;
    }

    public void setEstadoEppTerreno(String estadoEppTerreno) {
        this.estadoEppTerreno = estadoEppTerreno;
    }

    public int getCantidadEppTerreno() {
        return cantidadEppTerreno;
    }

    public void setCantidadEppTerreno(int cantidadEppTerreno) {
        this.cantidadEppTerreno = cantidadEppTerreno;
    }

    public String getTallaEppTerreno() {
        return tallaEppTerreno;
    }

    public void setTallaEppTerreno(String tallaEppTerreno) {
        this.tallaEppTerreno = tallaEppTerreno;
    }

    public String getObservacionEppTerreno() {
        return observacionEppTerreno;
    }

    public void setObservacionEppTerreno(String observacionEppTerreno) {
        this.observacionEppTerreno = observacionEppTerreno;
    }

    public byte[] getFirmaEppTerreno() {
        return firmaEppTerreno;
    }

    public void setFirmaEppTerreno(byte[] firmaEppTerreno) {
        this.firmaEppTerreno = firmaEppTerreno;
    }

    public String getTipoEntregaEppTerreno() {
        return tipoEntregaEppTerreno;
    }

    public void setTipoEntregaEppTerreno(String tipoEntregaEppTerreno) {
        this.tipoEntregaEppTerreno = tipoEntregaEppTerreno;
    }

    public PersonaDTO getPersonarutPasaportePersona() {
        return personarutPasaportePersona;
    }

    public void setPersonarutPasaportePersona(PersonaDTO personarutPasaportePersona) {
        this.personarutPasaportePersona = personarutPasaportePersona;
    }

    public EppDTO getePPidEPP() {
        return ePPidEPP;
    }

    public void setePPidEPP(EppDTO ePPidEPP) {
        this.ePPidEPP = ePPidEPP;
    }

    public ProyectoDTO getProyectoidProyecto() {
        return proyectoidProyecto;
    }

    public void setProyectoidProyecto(ProyectoDTO proyectoidProyecto) {
        this.proyectoidProyecto = proyectoidProyecto;
    }

    public UsuarioDTO getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(UsuarioDTO idUsuario) {
        this.idUsuario = idUsuario;
    }

    public EppTerrenoDTO(Integer idEppTerreno, String fechaEppTerreno, String estadoEppTerreno, int cantidadEppTerreno, String tallaEppTerreno, String observacionEppTerreno, byte[] firmaEppTerreno, String tipoEntregaEppTerreno, PersonaDTO personarutPasaportePersona, EppDTO ePPidEPP, ProyectoDTO proyectoidProyecto, UsuarioDTO idUsuario) {
        this.idEppTerreno = idEppTerreno;
        this.fechaEppTerreno = fechaEppTerreno;
        this.estadoEppTerreno = estadoEppTerreno;
        this.cantidadEppTerreno = cantidadEppTerreno;
        this.tallaEppTerreno = tallaEppTerreno;
        this.observacionEppTerreno = observacionEppTerreno;
        this.firmaEppTerreno = firmaEppTerreno;
        this.tipoEntregaEppTerreno = tipoEntregaEppTerreno;
        this.personarutPasaportePersona = personarutPasaportePersona;
        this.ePPidEPP = ePPidEPP;
        this.proyectoidProyecto = proyectoidProyecto;
        this.idUsuario = idUsuario;
    }

}
