/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.Entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ruben
 */
@Entity
@Table(name = "usuarioallsafe", catalog = "bdallsafe2", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuarioallsafe.validaUsuario", query = "SELECT u FROM Usuarioallsafe u WHERE u.loginUsuarioAllSafe = :loginUsuarioAllSafe AND u.passUsuarioAllSafe = :passUsuarioAllSafe")
    ,@NamedQuery(name = "Usuarioallsafe.findAll", query = "SELECT u FROM Usuarioallsafe u")
    , @NamedQuery(name = "Usuarioallsafe.findByIdUsuarioAllSafe", query = "SELECT u FROM Usuarioallsafe u WHERE u.idUsuarioAllSafe = :idUsuarioAllSafe")
    , @NamedQuery(name = "Usuarioallsafe.findByLoginUsuarioAllSafe", query = "SELECT u FROM Usuarioallsafe u WHERE u.loginUsuarioAllSafe = :loginUsuarioAllSafe")
    , @NamedQuery(name = "Usuarioallsafe.findByPassUsuarioAllSafe", query = "SELECT u FROM Usuarioallsafe u WHERE u.passUsuarioAllSafe = :passUsuarioAllSafe")})
public class Usuarioallsafe implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idUsuarioAllSafe", nullable = false)
    private Integer idUsuarioAllSafe;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "loginUsuarioAllSafe", nullable = false, length = 45)
    private String loginUsuarioAllSafe;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "passUsuarioAllSafe", nullable = false, length = 45)
    private String passUsuarioAllSafe;
    @JoinColumn(name = "PerfilAllSafe_idPerfilAllSafe", referencedColumnName = "idPerfilAllSafe", nullable = false)
    @ManyToOne(optional = false)
    private Perfilallsafe perfilAllSafeidPerfilAllSafe;
    @JoinColumn(name = "Persona_idPersona", referencedColumnName = "idPersona", nullable = false)
    @ManyToOne(optional = false)
    private Persona personaidPersona;

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

    public Perfilallsafe getPerfilAllSafeidPerfilAllSafe() {
        return perfilAllSafeidPerfilAllSafe;
    }

    public void setPerfilAllSafeidPerfilAllSafe(Perfilallsafe perfilAllSafeidPerfilAllSafe) {
        this.perfilAllSafeidPerfilAllSafe = perfilAllSafeidPerfilAllSafe;
    }

    public Persona getPersonaidPersona() {
        return personaidPersona;
    }

    public void setPersonaidPersona(Persona personaidPersona) {
        this.personaidPersona = personaidPersona;
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
        return "allSafe.Entities.Usuarioallsafe[ idUsuarioAllSafe=" + idUsuarioAllSafe + " ]";
    }
    
}
