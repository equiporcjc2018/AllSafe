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
@Table(name = "proyecto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Proyecto.findAll", query = "SELECT p FROM Proyecto p")
    , @NamedQuery(name = "Proyecto.findByIdProyecto", query = "SELECT p FROM Proyecto p WHERE p.idProyecto = :idProyecto")
    , @NamedQuery(name = "Proyecto.findByNombreProyecto", query = "SELECT p FROM Proyecto p WHERE p.nombreProyecto = :nombreProyecto")
    , @NamedQuery(name = "Proyecto.findByUbicacionProyecto", query = "SELECT p FROM Proyecto p WHERE p.ubicacionProyecto = :ubicacionProyecto")
    , @NamedQuery(name = "Proyecto.findByFechaInicioProyecto", query = "SELECT p FROM Proyecto p WHERE p.fechaInicioProyecto = :fechaInicioProyecto")
    , @NamedQuery(name = "Proyecto.findByFechaTerminoProyecto", query = "SELECT p FROM Proyecto p WHERE p.fechaTerminoProyecto = :fechaTerminoProyecto")})
public class Proyecto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idProyecto")
    private Integer idProyecto;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "nombreProyecto")
    private String nombreProyecto;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "ubicacionProyecto")
    private String ubicacionProyecto;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "fechaInicioProyecto")
    private String fechaInicioProyecto;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "fechaTerminoProyecto")
    private String fechaTerminoProyecto;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "proyectoidProyecto")
    private List<Eppterreno> eppterrenoList;
    @JoinColumn(name = "Ciudad_idCiudad", referencedColumnName = "idCiudad")
    @ManyToOne(optional = false)
    private Ciudad ciudadidCiudad;
    @JoinColumn(name = "Empresa_idEmpresa", referencedColumnName = "idEmpresa")
    @ManyToOne(optional = false)
    private Empresa empresaidEmpresa;
    @JoinColumn(name = "Pais_idPais", referencedColumnName = "idPais")
    @ManyToOne(optional = false)
    private Pais paisidPais;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "proyectoidProyecto")
    private List<Eppsolicitudterreno> eppsolicitudterrenoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "proyectoidProyecto")
    private List<Eppproceso> eppprocesoList;

    public Proyecto() {
    }

    public Proyecto(Integer idProyecto) {
        this.idProyecto = idProyecto;
    }

    public Proyecto(Integer idProyecto, String nombreProyecto, String ubicacionProyecto, String fechaInicioProyecto, String fechaTerminoProyecto) {
        this.idProyecto = idProyecto;
        this.nombreProyecto = nombreProyecto;
        this.ubicacionProyecto = ubicacionProyecto;
        this.fechaInicioProyecto = fechaInicioProyecto;
        this.fechaTerminoProyecto = fechaTerminoProyecto;
    }

    public Integer getIdProyecto() {
        return idProyecto;
    }

    public void setIdProyecto(Integer idProyecto) {
        this.idProyecto = idProyecto;
    }

    public String getNombreProyecto() {
        return nombreProyecto;
    }

    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    public String getUbicacionProyecto() {
        return ubicacionProyecto;
    }

    public void setUbicacionProyecto(String ubicacionProyecto) {
        this.ubicacionProyecto = ubicacionProyecto;
    }

    public String getFechaInicioProyecto() {
        return fechaInicioProyecto;
    }

    public void setFechaInicioProyecto(String fechaInicioProyecto) {
        this.fechaInicioProyecto = fechaInicioProyecto;
    }

    public String getFechaTerminoProyecto() {
        return fechaTerminoProyecto;
    }

    public void setFechaTerminoProyecto(String fechaTerminoProyecto) {
        this.fechaTerminoProyecto = fechaTerminoProyecto;
    }

    @XmlTransient
    public List<Eppterreno> getEppterrenoList() {
        return eppterrenoList;
    }

    public void setEppterrenoList(List<Eppterreno> eppterrenoList) {
        this.eppterrenoList = eppterrenoList;
    }

    public Ciudad getCiudadidCiudad() {
        return ciudadidCiudad;
    }

    public void setCiudadidCiudad(Ciudad ciudadidCiudad) {
        this.ciudadidCiudad = ciudadidCiudad;
    }

    public Empresa getEmpresaidEmpresa() {
        return empresaidEmpresa;
    }

    public void setEmpresaidEmpresa(Empresa empresaidEmpresa) {
        this.empresaidEmpresa = empresaidEmpresa;
    }

    public Pais getPaisidPais() {
        return paisidPais;
    }

    public void setPaisidPais(Pais paisidPais) {
        this.paisidPais = paisidPais;
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
        hash += (idProyecto != null ? idProyecto.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Proyecto)) {
            return false;
        }
        Proyecto other = (Proyecto) object;
        if ((this.idProyecto == null && other.idProyecto != null) || (this.idProyecto != null && !this.idProyecto.equals(other.idProyecto))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Proyecto[ idProyecto=" + idProyecto + " ]";
    }
    
}
