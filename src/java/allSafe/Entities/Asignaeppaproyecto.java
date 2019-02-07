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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ruben
 */
@Entity
@Table(name = "asignaeppaproyecto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Asignaeppaproyecto.findAll", query = "SELECT a FROM Asignaeppaproyecto a")
    ,@NamedQuery(name = "Asignaeppaproyecto.findByEpp", query = "SELECT a FROM Asignaeppaproyecto a WHERE a.eppidEPP.idEPP = :eppidEPP")
    , @NamedQuery(name = "Asignaeppaproyecto.findByIdasignaeppaproyecto", query = "SELECT a FROM Asignaeppaproyecto a WHERE a.idasignaeppaproyecto = :idasignaeppaproyecto")})
public class Asignaeppaproyecto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idasignaeppaproyecto")
    private Integer idasignaeppaproyecto;
    @JoinColumn(name = "epp_idEPP", referencedColumnName = "idEPP")
    @ManyToOne(optional = false)
    private Epp eppidEPP;
    @JoinColumn(name = "proyecto_idProyecto", referencedColumnName = "idProyecto")
    @ManyToOne(optional = false)
    private Proyecto proyectoidProyecto;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "asignaeppaproyectoIdasignaeppaproyecto")
    private List<Asignacantidadepp> asignacantidadeppList;

    public Asignaeppaproyecto() {
    }

    public Asignaeppaproyecto(Integer idasignaeppaproyecto) {
        this.idasignaeppaproyecto = idasignaeppaproyecto;
    }

    public Integer getIdasignaeppaproyecto() {
        return idasignaeppaproyecto;
    }

    public void setIdasignaeppaproyecto(Integer idasignaeppaproyecto) {
        this.idasignaeppaproyecto = idasignaeppaproyecto;
    }

    public Epp getEppidEPP() {
        return eppidEPP;
    }

    public void setEppidEPP(Epp eppidEPP) {
        this.eppidEPP = eppidEPP;
    }

    public Proyecto getProyectoidProyecto() {
        return proyectoidProyecto;
    }

    public void setProyectoidProyecto(Proyecto proyectoidProyecto) {
        this.proyectoidProyecto = proyectoidProyecto;
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
        hash += (idasignaeppaproyecto != null ? idasignaeppaproyecto.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Asignaeppaproyecto)) {
            return false;
        }
        Asignaeppaproyecto other = (Asignaeppaproyecto) object;
        if ((this.idasignaeppaproyecto == null && other.idasignaeppaproyecto != null) || (this.idasignaeppaproyecto != null && !this.idasignaeppaproyecto.equals(other.idasignaeppaproyecto))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Asignaeppaproyecto[ idasignaeppaproyecto=" + idasignaeppaproyecto + " ]";
    }
    
}
