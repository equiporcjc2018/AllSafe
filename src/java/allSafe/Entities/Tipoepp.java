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
@Table(name = "tipoepp")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tipoepp.findAll", query = "SELECT t FROM Tipoepp t")
    , @NamedQuery(name = "Tipoepp.findByIdTipoEPP", query = "SELECT t FROM Tipoepp t WHERE t.idTipoEPP = :idTipoEPP")
    , @NamedQuery(name = "Tipoepp.findByDescripcionTipoEPP", query = "SELECT t FROM Tipoepp t WHERE t.descripcionTipoEPP = :descripcionTipoEPP")})
public class Tipoepp implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idTipoEPP")
    private Integer idTipoEPP;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "descripcionTipoEPP")
    private String descripcionTipoEPP;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoEPPidTipoEPP")
    private List<Epp> eppList;
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
    

    public Tipoepp() {
    }

    public Tipoepp(Integer idTipoEPP) {
        this.idTipoEPP = idTipoEPP;
    }

    public Tipoepp(Integer idTipoEPP, String descripcionTipoEPP) {
        this.idTipoEPP = idTipoEPP;
        this.descripcionTipoEPP = descripcionTipoEPP;
    }

    public Integer getIdTipoEPP() {
        return idTipoEPP;
    }

    public void setIdTipoEPP(Integer idTipoEPP) {
        this.idTipoEPP = idTipoEPP;
    }

    public String getDescripcionTipoEPP() {
        return descripcionTipoEPP;
    }

    public void setDescripcionTipoEPP(String descripcionTipoEPP) {
        this.descripcionTipoEPP = descripcionTipoEPP;
    }

    @XmlTransient
    public List<Epp> getEppList() {
        return eppList;
    }

    public void setEppList(List<Epp> eppList) {
        this.eppList = eppList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoEPP != null ? idTipoEPP.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tipoepp)) {
            return false;
        }
        Tipoepp other = (Tipoepp) object;
        if ((this.idTipoEPP == null && other.idTipoEPP != null) || (this.idTipoEPP != null && !this.idTipoEPP.equals(other.idTipoEPP))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Tipoepp[ idTipoEPP=" + idTipoEPP + " ]";
    }
    
    public boolean isVigente(){
        return this.getVigencia().equals("Y");
    }
}
