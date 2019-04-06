/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import allSafe.Entities.*;
import java.io.Serializable;
import java.util.List;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author alvarosmh
 */
public class UsuarioDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idUsuarioAllSafe;
    private String loginUsuarioAllSafe;
    private String passUsuarioAllSafe;
    private List<Eppterreno> eppterrenoList;
    private Perfilallsafe perfilAllSafeidPerfilAllSafe;
    private Persona personarutPasaportePersona;
    private List<Eppsolicitudterreno> eppsolicitudterrenoList;

    public UsuarioDTO() {
    }

    public UsuarioDTO(Integer idUsuarioAllSafe) {
        this.idUsuarioAllSafe = idUsuarioAllSafe;
    }

    public UsuarioDTO(Integer idUsuarioAllSafe, String loginUsuarioAllSafe, String passUsuarioAllSafe) {
        this.idUsuarioAllSafe = idUsuarioAllSafe;
        this.loginUsuarioAllSafe = loginUsuarioAllSafe;
        this.passUsuarioAllSafe = passUsuarioAllSafe;
    }

    public Integer getIdUsuarioAllSafe() {
        return idUsuarioAllSafe;
    }

    public void setIdUsuarioAllSafe(Integer idUsuarioAllSafe) {
        this.idUsuarioAllSafe = idUsuarioAllSafe;
    }

    public String getLoginUsuarioAllSafe() {
        return loginUsuarioAllSafe;
    }

    public void setLoginUsuarioAllSafe(String loginUsuarioAllSafe) {
        this.loginUsuarioAllSafe = loginUsuarioAllSafe;
    }

    public String getPassUsuarioAllSafe() {
        return passUsuarioAllSafe;
    }

    public void setPassUsuarioAllSafe(String passUsuarioAllSafe) {
        this.passUsuarioAllSafe = passUsuarioAllSafe;
    }

    @XmlTransient
    public List<Eppterreno> getEppterrenoList() {
        return eppterrenoList;
    }

    public void setEppterrenoList(List<Eppterreno> eppterrenoList) {
        this.eppterrenoList = eppterrenoList;
    }

    public Perfilallsafe getPerfilAllSafeidPerfilAllSafe() {
        return perfilAllSafeidPerfilAllSafe;
    }

    public void setPerfilAllSafeidPerfilAllSafe(Perfilallsafe perfilAllSafeidPerfilAllSafe) {
        this.perfilAllSafeidPerfilAllSafe = perfilAllSafeidPerfilAllSafe;
    }

    public Persona getPersonarutPasaportePersona() {
        return personarutPasaportePersona;
    }

    public void setPersonarutPasaportePersona(Persona personarutPasaportePersona) {
        this.personarutPasaportePersona = personarutPasaportePersona;
    }

    @XmlTransient
    public List<Eppsolicitudterreno> getEppsolicitudterrenoList() {
        return eppsolicitudterrenoList;
    }

    public void setEppsolicitudterrenoList(List<Eppsolicitudterreno> eppsolicitudterrenoList) {
        this.eppsolicitudterrenoList = eppsolicitudterrenoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idUsuarioAllSafe != null ? idUsuarioAllSafe.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UsuarioDTO)) {
            return false;
        }
        UsuarioDTO other = (UsuarioDTO) object;
        if ((this.idUsuarioAllSafe == null && other.idUsuarioAllSafe != null) || (this.idUsuarioAllSafe != null && !this.idUsuarioAllSafe.equals(other.idUsuarioAllSafe))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "UsuarioDTO{" + "idUsuarioAllSafe=" + idUsuarioAllSafe + ", loginUsuarioAllSafe=" + loginUsuarioAllSafe + ", passUsuarioAllSafe=" + passUsuarioAllSafe + ", eppterrenoList=" + eppterrenoList + ", perfilAllSafeidPerfilAllSafe=" + perfilAllSafeidPerfilAllSafe + ", personarutPasaportePersona=" + personarutPasaportePersona + ", eppsolicitudterrenoList=" + eppsolicitudterrenoList + '}';
    }
    
    
    
}
