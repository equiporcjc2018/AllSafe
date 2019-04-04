/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import java.io.Serializable;

/**
 *
 * @author alvarosmh
 */
public class EppsolicitudterrenoDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idEppSolicitudTerreno;
    private String fechaEppSolicitudTerreno;
    private String estadoEppSolicitudTerreno;
    private int cantidadEppSolicitudTerreno;
    private String obervacionEppSolicitudTerreno;
    private EppDTO ePPidEPP;
    private ProyectoDTO proyectoidProyecto;
    private UsuarioDTO idUsuario;

    public EppsolicitudterrenoDTO() {
    }

    public EppsolicitudterrenoDTO(Integer idEppSolicitudTerreno) {
        this.idEppSolicitudTerreno = idEppSolicitudTerreno;
    }

    public EppsolicitudterrenoDTO(Integer idEppSolicitudTerreno, String fechaEppSolicitudTerreno, String estadoEppSolicitudTerreno, int cantidadEppSolicitudTerreno, String obervacionEppSolicitudTerreno) {
        this.idEppSolicitudTerreno = idEppSolicitudTerreno;
        this.fechaEppSolicitudTerreno = fechaEppSolicitudTerreno;
        this.estadoEppSolicitudTerreno = estadoEppSolicitudTerreno;
        this.cantidadEppSolicitudTerreno = cantidadEppSolicitudTerreno;
        this.obervacionEppSolicitudTerreno = obervacionEppSolicitudTerreno;
    }

    public Integer getIdEppSolicitudTerreno() {
        return idEppSolicitudTerreno;
    }

    public void setIdEppSolicitudTerreno(Integer idEppSolicitudTerreno) {
        this.idEppSolicitudTerreno = idEppSolicitudTerreno;
    }

    public String getFechaEppSolicitudTerreno() {
        return fechaEppSolicitudTerreno;
    }

    public void setFechaEppSolicitudTerreno(String fechaEppSolicitudTerreno) {
        this.fechaEppSolicitudTerreno = fechaEppSolicitudTerreno;
    }

    public String getEstadoEppSolicitudTerreno() {
        return estadoEppSolicitudTerreno;
    }

    public void setEstadoEppSolicitudTerreno(String estadoEppSolicitudTerreno) {
        this.estadoEppSolicitudTerreno = estadoEppSolicitudTerreno;
    }

    public int getCantidadEppSolicitudTerreno() {
        return cantidadEppSolicitudTerreno;
    }

    public void setCantidadEppSolicitudTerreno(int cantidadEppSolicitudTerreno) {
        this.cantidadEppSolicitudTerreno = cantidadEppSolicitudTerreno;
    }

    public String getObervacionEppSolicitudTerreno() {
        return obervacionEppSolicitudTerreno;
    }

    public void setObervacionEppSolicitudTerreno(String obervacionEppSolicitudTerreno) {
        this.obervacionEppSolicitudTerreno = obervacionEppSolicitudTerreno;
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

    public EppsolicitudterrenoDTO(Integer idEppSolicitudTerreno, String fechaEppSolicitudTerreno, String estadoEppSolicitudTerreno, int cantidadEppSolicitudTerreno, String obervacionEppSolicitudTerreno, EppDTO ePPidEPP, ProyectoDTO proyectoidProyecto, UsuarioDTO idUsuario) {
        this.idEppSolicitudTerreno = idEppSolicitudTerreno;
        this.fechaEppSolicitudTerreno = fechaEppSolicitudTerreno;
        this.estadoEppSolicitudTerreno = estadoEppSolicitudTerreno;
        this.cantidadEppSolicitudTerreno = cantidadEppSolicitudTerreno;
        this.obervacionEppSolicitudTerreno = obervacionEppSolicitudTerreno;
        this.ePPidEPP = ePPidEPP;
        this.proyectoidProyecto = proyectoidProyecto;
        this.idUsuario = idUsuario;
    }

}
