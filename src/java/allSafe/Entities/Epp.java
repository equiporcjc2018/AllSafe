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
@Table(name = "epp")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Epp.findAll", query = "SELECT e FROM Epp e")
    , @NamedQuery(name = "Epp.findByIdEPP", query = "SELECT e FROM Epp e WHERE e.idEPP = :idEPP")
    , @NamedQuery(name = "Epp.findByNombreEPPcol", query = "SELECT e FROM Epp e WHERE e.nombreEPPcol = :nombreEPPcol")
    , @NamedQuery(name = "Epp.findByDescripcionEPP", query = "SELECT e FROM Epp e WHERE e.descripcionEPP = :descripcionEPP")})
public class Epp implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idEPP")
    private Integer idEPP;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombreEPPcol")
    private String nombreEPPcol;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "descripcionEPP")
    private String descripcionEPP;
    @JoinColumn(name = "TipoEPP_idTipoEPP", referencedColumnName = "idTipoEPP")
    @ManyToOne(optional = false)
    private Tipoepp tipoEPPidTipoEPP;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ePPidEPP")
    private List<Eppterreno> eppterrenoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ePPidEPP")
    private List<Eppsolicitudterreno> eppsolicitudterrenoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ePPidEPP")
    private List<Eppproceso> eppprocesoList;

    public Epp() {
    }

    public Epp(Integer idEPP) {
        this.idEPP = idEPP;
    }

    public Epp(Integer idEPP, String nombreEPPcol, String descripcionEPP) {
        this.idEPP = idEPP;
        this.nombreEPPcol = nombreEPPcol;
        this.descripcionEPP = descripcionEPP;
    }

    public Integer getIdEPP() {
        return idEPP;
    }

    public void setIdEPP(Integer idEPP) {
        this.idEPP = idEPP;
    }

    public String getNombreEPPcol() {
        return nombreEPPcol;
    }

    public void setNombreEPPcol(String nombreEPPcol) {
        this.nombreEPPcol = nombreEPPcol;
    }

    public String getDescripcionEPP() {
        return descripcionEPP;
    }

    public void setDescripcionEPP(String descripcionEPP) {
        this.descripcionEPP = descripcionEPP;
    }

    public Tipoepp getTipoEPPidTipoEPP() {
        return tipoEPPidTipoEPP;
    }

    public void setTipoEPPidTipoEPP(Tipoepp tipoEPPidTipoEPP) {
        this.tipoEPPidTipoEPP = tipoEPPidTipoEPP;
    }

    @XmlTransient
    public List<Eppterreno> getEppterrenoList() {
        return eppterrenoList;
    }

    public void setEppterrenoList(List<Eppterreno> eppterrenoList) {
        this.eppterrenoList = eppterrenoList;
    }

    @XmlTransient
    public List<Eppsolicitudterreno> getEppsolicitudterrenoList() {
        return eppsolicitudterrenoList;
    }

    public void setEppsolicitudterrenoList(List<Eppsolicitudterreno> eppsolicitudterrenoList) {
        this.eppsolicitudterrenoList = eppsolicitudterrenoList;
    }

    @XmlTransient
    public List<Eppproceso> getEppprocesoList() {
        return eppprocesoList;
    }

    public void setEppprocesoList(List<Eppproceso> eppprocesoList) {
        this.eppprocesoList = eppprocesoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEPP != null ? idEPP.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Epp)) {
            return false;
        }
        Epp other = (Epp) object;
        if ((this.idEPP == null && other.idEPP != null) || (this.idEPP != null && !this.idEPP.equals(other.idEPP))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Epp[ idEPP=" + idEPP + " ]";
    }
    
}
