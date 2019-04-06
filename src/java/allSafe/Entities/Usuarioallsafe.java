/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.Entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author hachi
 */
@Entity
@Table(name = "usuarioallsafe")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuarioallsafe.validaUsuario", query = "SELECT u FROM Usuarioallsafe u WHERE u.loginUsuarioAllSafe = :loginUsuarioAllSafe AND u.passUsuarioAllSafe = :passUsuarioAllSafe")
    ,@NamedQuery(name = "Usuarioallsafe.findAll", query = "SELECT u FROM Usuarioallsafe u")
    , @NamedQuery(name = "Usuarioallsafe.findByIdUsuarioAllSafe", query = "SELECT u FROM Usuarioallsafe u WHERE u.idUsuarioAllSafe = :idUsuarioAllSafe")
    , @NamedQuery(name = "Usuarioallsafe.findByLoginUsuarioAllSafe", query = "SELECT u FROM Usuarioallsafe u WHERE u.loginUsuarioAllSafe = :loginUsuarioAllSafe")
    , @NamedQuery(name = "Usuarioallsafe.updateClave", query = "UPDATE Usuarioallsafe u SET u.passUsuarioAllSafe=:clave where u.idUsuarioAllSafe = :id")
    , @NamedQuery(name = "Usuarioallsafe.findByPassUsuarioAllSafe", query = "SELECT u FROM Usuarioallsafe u WHERE u.passUsuarioAllSafe = :passUsuarioAllSafe")})
public class Usuarioallsafe implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idUsuarioAllSafe")
    private Integer idUsuarioAllSafe;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "loginUsuarioAllSafe")
    private String loginUsuarioAllSafe;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "passUsuarioAllSafe")
    private String passUsuarioAllSafe;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idUsuario")
    private List<Eppterreno> eppterrenoList;
    @JoinColumn(name = "PerfilAllSafe_idPerfilAllSafe", referencedColumnName = "idPerfilAllSafe")
    @ManyToOne(optional = false)
    private Perfilallsafe perfilAllSafeidPerfilAllSafe;
    @JoinColumn(name = "Persona_rutPasaportePersona", referencedColumnName = "rutPasaportePersona")
    @ManyToOne(optional = false)
    private Persona personarutPasaportePersona;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idUsuario")
    private List<Eppsolicitudterreno> eppsolicitudterrenoList;

    public Usuarioallsafe() {
    }

    public Usuarioallsafe(Integer idUsuarioAllSafe) {
        this.idUsuarioAllSafe = idUsuarioAllSafe;
    }

    public Usuarioallsafe(Integer idUsuarioAllSafe, String loginUsuarioAllSafe, String passUsuarioAllSafe) {
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
        if (!(object instanceof Usuarioallsafe)) {
            return false;
        }
        Usuarioallsafe other = (Usuarioallsafe) object;
        if ((this.idUsuarioAllSafe == null && other.idUsuarioAllSafe != null) || (this.idUsuarioAllSafe != null && !this.idUsuarioAllSafe.equals(other.idUsuarioAllSafe))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Usuarioallsafe{" + "idUsuarioAllSafe=" + idUsuarioAllSafe + ", loginUsuarioAllSafe=" + loginUsuarioAllSafe + ", passUsuarioAllSafe=" + passUsuarioAllSafe + ", eppterrenoList=" + eppterrenoList + ", perfilAllSafeidPerfilAllSafe=" + perfilAllSafeidPerfilAllSafe + ", personarutPasaportePersona=" + personarutPasaportePersona + ", eppsolicitudterrenoList=" + eppsolicitudterrenoList + '}';
    }

    
}
