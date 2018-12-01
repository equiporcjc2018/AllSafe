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
@Table(name = "empresa")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Empresa.findAll", query = "SELECT e FROM Empresa e")
    , @NamedQuery(name = "Empresa.findByIdEmpresa", query = "SELECT e FROM Empresa e WHERE e.idEmpresa = :idEmpresa")
    , @NamedQuery(name = "Empresa.findByRutEmpresa", query = "SELECT e FROM Empresa e WHERE e.rutEmpresa = :rutEmpresa")
    , @NamedQuery(name = "Empresa.findByRazonSocialEmpresa", query = "SELECT e FROM Empresa e WHERE e.razonSocialEmpresa = :razonSocialEmpresa")
    , @NamedQuery(name = "Empresa.findByDireccionEmpresa", query = "SELECT e FROM Empresa e WHERE e.direccionEmpresa = :direccionEmpresa")
    , @NamedQuery(name = "Empresa.findBySitioWebEmpresa", query = "SELECT e FROM Empresa e WHERE e.sitioWebEmpresa = :sitioWebEmpresa")
    , @NamedQuery(name = "Empresa.findByTelefonoEmpresa", query = "SELECT e FROM Empresa e WHERE e.telefonoEmpresa = :telefonoEmpresa")
    , @NamedQuery(name = "Empresa.findByGiroEmpresa", query = "SELECT e FROM Empresa e WHERE e.giroEmpresa = :giroEmpresa")})
public class Empresa implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idEmpresa")
    private Integer idEmpresa;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "rutEmpresa")
    private String rutEmpresa;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "razonSocialEmpresa")
    private String razonSocialEmpresa;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "direccionEmpresa")
    private String direccionEmpresa;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "sitioWebEmpresa")
    private String sitioWebEmpresa;
    @Basic(optional = false)
    @NotNull
    @Column(name = "telefonoEmpresa")
    private int telefonoEmpresa;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "giroEmpresa")
    private String giroEmpresa;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "empresaidEmpresa")
    private List<Proyecto> proyectoList;

    public Empresa() {
    }

    public Empresa(Integer idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public Empresa(Integer idEmpresa, String rutEmpresa, String razonSocialEmpresa, String direccionEmpresa, String sitioWebEmpresa, int telefonoEmpresa, String giroEmpresa) {
        this.idEmpresa = idEmpresa;
        this.rutEmpresa = rutEmpresa;
        this.razonSocialEmpresa = razonSocialEmpresa;
        this.direccionEmpresa = direccionEmpresa;
        this.sitioWebEmpresa = sitioWebEmpresa;
        this.telefonoEmpresa = telefonoEmpresa;
        this.giroEmpresa = giroEmpresa;
    }

    public Integer getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(Integer idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getRutEmpresa() {
        return rutEmpresa;
    }

    public void setRutEmpresa(String rutEmpresa) {
        this.rutEmpresa = rutEmpresa;
    }

    public String getRazonSocialEmpresa() {
        return razonSocialEmpresa;
    }

    public void setRazonSocialEmpresa(String razonSocialEmpresa) {
        this.razonSocialEmpresa = razonSocialEmpresa;
    }

    public String getDireccionEmpresa() {
        return direccionEmpresa;
    }

    public void setDireccionEmpresa(String direccionEmpresa) {
        this.direccionEmpresa = direccionEmpresa;
    }

    public String getSitioWebEmpresa() {
        return sitioWebEmpresa;
    }

    public void setSitioWebEmpresa(String sitioWebEmpresa) {
        this.sitioWebEmpresa = sitioWebEmpresa;
    }

    public int getTelefonoEmpresa() {
        return telefonoEmpresa;
    }

    public void setTelefonoEmpresa(int telefonoEmpresa) {
        this.telefonoEmpresa = telefonoEmpresa;
    }

    public String getGiroEmpresa() {
        return giroEmpresa;
    }

    public void setGiroEmpresa(String giroEmpresa) {
        this.giroEmpresa = giroEmpresa;
    }

    @XmlTransient
    public List<Proyecto> getProyectoList() {
        return proyectoList;
    }

    public void setProyectoList(List<Proyecto> proyectoList) {
        this.proyectoList = proyectoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEmpresa != null ? idEmpresa.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Empresa)) {
            return false;
        }
        Empresa other = (Empresa) object;
        if ((this.idEmpresa == null && other.idEmpresa != null) || (this.idEmpresa != null && !this.idEmpresa.equals(other.idEmpresa))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Empresa[ idEmpresa=" + idEmpresa + " ]";
    }
    
}
