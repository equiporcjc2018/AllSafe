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
@Table(name = "tipodecarga")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tipodecarga.findAll", query = "SELECT t FROM Tipodecarga t")
    , @NamedQuery(name = "Tipodecarga.findByIdtipodecarga", query = "SELECT t FROM Tipodecarga t WHERE t.idtipodecarga = :idtipodecarga")
    , @NamedQuery(name = "Tipodecarga.findByNombretipodecargac", query = "SELECT t FROM Tipodecarga t WHERE t.nombretipodecargac = :nombretipodecargac")})
public class Tipodecarga implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idtipodecarga")
    private Integer idtipodecarga;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombretipodecargac")
    private String nombretipodecargac;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipodecargaIdtipodecarga")
    private List<Asignacantidadepp> asignacantidadeppList;

    public Tipodecarga() {
    }

    public Tipodecarga(Integer idtipodecarga) {
        this.idtipodecarga = idtipodecarga;
    }

    public Tipodecarga(Integer idtipodecarga, String nombretipodecargac) {
        this.idtipodecarga = idtipodecarga;
        this.nombretipodecargac = nombretipodecargac;
    }

    public Integer getIdtipodecarga() {
        return idtipodecarga;
    }

    public void setIdtipodecarga(Integer idtipodecarga) {
        this.idtipodecarga = idtipodecarga;
    }

    public String getNombretipodecargac() {
        return nombretipodecargac;
    }

    public void setNombretipodecargac(String nombretipodecargac) {
        this.nombretipodecargac = nombretipodecargac;
    }

    @XmlTransient
    public List<Asignacantidadepp> getAsignacantidadeppList() {
        return asignacantidadeppList;
    }

    public void setAsignacantidadeppList(List<Asignacantidadepp> asignacantidadeppList) {
        this.asignacantidadeppList = asignacantidadeppList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtipodecarga != null ? idtipodecarga.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tipodecarga)) {
            return false;
        }
        Tipodecarga other = (Tipodecarga) object;
        if ((this.idtipodecarga == null && other.idtipodecarga != null) || (this.idtipodecarga != null && !this.idtipodecarga.equals(other.idtipodecarga))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Tipodecarga[ idtipodecarga=" + idtipodecarga + " ]";
    }
    
}
