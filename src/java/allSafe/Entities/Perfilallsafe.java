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
 * @author Ruben
 */
@Entity
@Table(name = "perfilallsafe")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Perfilallsafe.findAll", query = "SELECT p FROM Perfilallsafe p")
    , @NamedQuery(name = "Perfilallsafe.findByIdPerfilAllSafe", query = "SELECT p FROM Perfilallsafe p WHERE p.idPerfilAllSafe = :idPerfilAllSafe")
    , @NamedQuery(name = "Perfilallsafe.findByNombrePerfilAllSafe", query = "SELECT p FROM Perfilallsafe p WHERE p.nombrePerfilAllSafe = :nombrePerfilAllSafe")})
public class Perfilallsafe implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idPerfilAllSafe")
    private Integer idPerfilAllSafe;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombrePerfilAllSafe")
    private String nombrePerfilAllSafe;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "perfilAllSafeidPerfilAllSafe")
    private List<Usuarioallsafe> usuarioallsafeList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "perfilAllSafeidPerfilAllSafe")
    private List<Menuallsafe> menuallsafeList;

    public Perfilallsafe() {
    }

    public Perfilallsafe(Integer idPerfilAllSafe) {
        this.idPerfilAllSafe = idPerfilAllSafe;
    }

    public Perfilallsafe(Integer idPerfilAllSafe, String nombrePerfilAllSafe) {
        this.idPerfilAllSafe = idPerfilAllSafe;
        this.nombrePerfilAllSafe = nombrePerfilAllSafe;
    }

    public Integer getIdPerfilAllSafe() {
        return idPerfilAllSafe;
    }

    public void setIdPerfilAllSafe(Integer idPerfilAllSafe) {
        this.idPerfilAllSafe = idPerfilAllSafe;
    }

    public String getNombrePerfilAllSafe() {
        return nombrePerfilAllSafe;
    }

    public void setNombrePerfilAllSafe(String nombrePerfilAllSafe) {
        this.nombrePerfilAllSafe = nombrePerfilAllSafe;
    }

    @XmlTransient
    public List<Usuarioallsafe> getUsuarioallsafeList() {
        return usuarioallsafeList;
    }

    public void setUsuarioallsafeList(List<Usuarioallsafe> usuarioallsafeList) {
        this.usuarioallsafeList = usuarioallsafeList;
    }

    @XmlTransient
    public List<Menuallsafe> getMenuallsafeList() {
        return menuallsafeList;
    }

    public void setMenuallsafeList(List<Menuallsafe> menuallsafeList) {
        this.menuallsafeList = menuallsafeList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPerfilAllSafe != null ? idPerfilAllSafe.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Perfilallsafe)) {
            return false;
        }
        Perfilallsafe other = (Perfilallsafe) object;
        if ((this.idPerfilAllSafe == null && other.idPerfilAllSafe != null) || (this.idPerfilAllSafe != null && !this.idPerfilAllSafe.equals(other.idPerfilAllSafe))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Perfilallsafe[ idPerfilAllSafe=" + idPerfilAllSafe + " ]";
    }
    
}
