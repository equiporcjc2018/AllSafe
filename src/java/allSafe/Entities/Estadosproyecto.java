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
@Table(name = "estadosproyecto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Estadosproyecto.findAll", query = "SELECT e FROM Estadosproyecto e")
    , @NamedQuery(name = "Estadosproyecto.findByIdEstadosProyecto", query = "SELECT e FROM Estadosproyecto e WHERE e.idEstadosProyecto = :idEstadosProyecto")
    , @NamedQuery(name = "Estadosproyecto.findByDescripcionEstadosProyecto", query = "SELECT e FROM Estadosproyecto e WHERE e.descripcionEstadosProyecto = :descripcionEstadosProyecto")})
public class Estadosproyecto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idEstadosProyecto")
    private Integer idEstadosProyecto;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "descripcionEstadosProyecto")
    private String descripcionEstadosProyecto;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estadosProyectoidEstadosProyecto")
    private List<Asignacantidadepp> asignacantidadeppList;
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
    

    public Estadosproyecto() {
    }

    public Estadosproyecto(Integer idEstadosProyecto) {
        this.idEstadosProyecto = idEstadosProyecto;
    }

    public Estadosproyecto(Integer idEstadosProyecto, String descripcionEstadosProyecto) {
        this.idEstadosProyecto = idEstadosProyecto;
        this.descripcionEstadosProyecto = descripcionEstadosProyecto;
    }

    public Integer getIdEstadosProyecto() {
        return idEstadosProyecto;
    }

    public void setIdEstadosProyecto(Integer idEstadosProyecto) {
        this.idEstadosProyecto = idEstadosProyecto;
    }

    public String getDescripcionEstadosProyecto() {
        return descripcionEstadosProyecto;
    }

    public void setDescripcionEstadosProyecto(String descripcionEstadosProyecto) {
        this.descripcionEstadosProyecto = descripcionEstadosProyecto;
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
        hash += (idEstadosProyecto != null ? idEstadosProyecto.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Estadosproyecto)) {
            return false;
        }
        Estadosproyecto other = (Estadosproyecto) object;
        if ((this.idEstadosProyecto == null && other.idEstadosProyecto != null) || (this.idEstadosProyecto != null && !this.idEstadosProyecto.equals(other.idEstadosProyecto))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Estadosproyecto[ idEstadosProyecto=" + idEstadosProyecto + " ]";
    }
    
    public boolean isVigente(){
        return this.getVigencia().equals("Y");
    }
}
