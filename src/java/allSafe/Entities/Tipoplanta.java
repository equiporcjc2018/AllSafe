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
 * @author hachi
 */
@Entity
@Table(name = "tipoplanta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tipoplanta.findAll", query = "SELECT t FROM Tipoplanta t")
    , @NamedQuery(name = "Tipoplanta.findByIdTipoPlanta", query = "SELECT t FROM Tipoplanta t WHERE t.idTipoPlanta = :idTipoPlanta")
    , @NamedQuery(name = "Tipoplanta.findByDescripcionTipoPlanta", query = "SELECT t FROM Tipoplanta t WHERE t.descripcionTipoPlanta = :descripcionTipoPlanta")})
public class Tipoplanta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idTipoPlanta")
    private Integer idTipoPlanta;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "descripcionTipoPlanta")
    private String descripcionTipoPlanta;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoPlantaidTipoPlanta")
    private List<Persona> personaList;
    @Basic(optional = false)
    @Size(min = 1, max = 1)
    @Column(name = "vigencia")
    private String vigencia;

    public String getVigencia() {
        return vigencia;
    }

    public void setVigencia(String vigencia) {
        this.vigencia = vigencia;
    }
    

    public Tipoplanta() {
    }

    public Tipoplanta(Integer idTipoPlanta) {
        this.idTipoPlanta = idTipoPlanta;
    }

    public Tipoplanta(Integer idTipoPlanta, String descripcionTipoPlanta) {
        this.idTipoPlanta = idTipoPlanta;
        this.descripcionTipoPlanta = descripcionTipoPlanta;
    }

    public Integer getIdTipoPlanta() {
        return idTipoPlanta;
    }

    public void setIdTipoPlanta(Integer idTipoPlanta) {
        this.idTipoPlanta = idTipoPlanta;
    }

    public String getDescripcionTipoPlanta() {
        return descripcionTipoPlanta;
    }

    public void setDescripcionTipoPlanta(String descripcionTipoPlanta) {
        this.descripcionTipoPlanta = descripcionTipoPlanta;
    }

    @XmlTransient
    public List<Persona> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<Persona> personaList) {
        this.personaList = personaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoPlanta != null ? idTipoPlanta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tipoplanta)) {
            return false;
        }
        Tipoplanta other = (Tipoplanta) object;
        if ((this.idTipoPlanta == null && other.idTipoPlanta != null) || (this.idTipoPlanta != null && !this.idTipoPlanta.equals(other.idTipoPlanta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Tipoplanta[ idTipoPlanta=" + idTipoPlanta + " ]";
    }
    
}
