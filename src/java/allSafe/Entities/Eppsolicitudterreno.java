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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "eppsolicitudterreno")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Eppsolicitudterreno.findAll", query = "SELECT e FROM Eppsolicitudterreno e")
    , @NamedQuery(name = "Eppsolicitudterreno.findByIdEppSolicitudTerreno", query = "SELECT e FROM Eppsolicitudterreno e WHERE e.idEppSolicitudTerreno = :idEppSolicitudTerreno")
    , @NamedQuery(name = "Eppsolicitudterreno.findByFechaEppSolicitudTerreno", query = "SELECT e FROM Eppsolicitudterreno e WHERE e.fechaEppSolicitudTerreno = :fechaEppSolicitudTerreno")
    , @NamedQuery(name = "Eppsolicitudterreno.findByIdUsuario", query = "SELECT e FROM Eppsolicitudterreno e WHERE e.idUsuario = :idUsuario")
    , @NamedQuery(name = "Eppsolicitudterreno.findByEstadoEppSolicitudTerreno", query = "SELECT e FROM Eppsolicitudterreno e WHERE e.estadoEppSolicitudTerreno = :estadoEppSolicitudTerreno")
    , @NamedQuery(name = "Eppsolicitudterreno.findByCantidadEppSolicitudTerreno", query = "SELECT e FROM Eppsolicitudterreno e WHERE e.cantidadEppSolicitudTerreno = :cantidadEppSolicitudTerreno")
    , @NamedQuery(name = "Eppsolicitudterreno.findByObervacionEppSolicitudTerreno", query = "SELECT e FROM Eppsolicitudterreno e WHERE e.obervacionEppSolicitudTerreno = :obervacionEppSolicitudTerreno")})
public class Eppsolicitudterreno implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idEppSolicitudTerreno")
    private Integer idEppSolicitudTerreno;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "fechaEppSolicitudTerreno")
    private String fechaEppSolicitudTerreno;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "idUsuario")
    private String idUsuario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "estadoEppSolicitudTerreno")
    private String estadoEppSolicitudTerreno;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cantidadEppSolicitudTerreno")
    private int cantidadEppSolicitudTerreno;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "obervacionEppSolicitudTerreno")
    private String obervacionEppSolicitudTerreno;
    @JoinColumn(name = "EPP_idEPP", referencedColumnName = "idEPP")
    @ManyToOne(optional = false)
    private Epp ePPidEPP;
    @JoinColumn(name = "Proyecto_idProyecto", referencedColumnName = "idProyecto")
    @ManyToOne(optional = false)
    private Proyecto proyectoidProyecto;

    public Eppsolicitudterreno() {
    }

    public Eppsolicitudterreno(Integer idEppSolicitudTerreno) {
        this.idEppSolicitudTerreno = idEppSolicitudTerreno;
    }

    public Eppsolicitudterreno(Integer idEppSolicitudTerreno, String fechaEppSolicitudTerreno, String idUsuario, String estadoEppSolicitudTerreno, int cantidadEppSolicitudTerreno, String obervacionEppSolicitudTerreno) {
        this.idEppSolicitudTerreno = idEppSolicitudTerreno;
        this.fechaEppSolicitudTerreno = fechaEppSolicitudTerreno;
        this.idUsuario = idUsuario;
        this.estadoEppSolicitudTerreno = estadoEppSolicitudTerreno;
        this.cantidadEppSolicitudTerreno = cantidadEppSolicitudTerreno;
        this.obervacionEppSolicitudTerreno = obervacionEppSolicitudTerreno;
    }

    public Integer getIdEppSolicitudTerreno() {
        return idEppSolicitudTerreno;
    }

    public void setIdEppSolicitudTerreno(Integer idEppSolicitudTerreno) {
        this.idEppSolicitudTerreno = idEppSolicitudTerreno;
    }

    public String getFechaEppSolicitudTerreno() {
        return fechaEppSolicitudTerreno;
    }

    public void setFechaEppSolicitudTerreno(String fechaEppSolicitudTerreno) {
        this.fechaEppSolicitudTerreno = fechaEppSolicitudTerreno;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getEstadoEppSolicitudTerreno() {
        return estadoEppSolicitudTerreno;
    }

    public void setEstadoEppSolicitudTerreno(String estadoEppSolicitudTerreno) {
        this.estadoEppSolicitudTerreno = estadoEppSolicitudTerreno;
    }

    public int getCantidadEppSolicitudTerreno() {
        return cantidadEppSolicitudTerreno;
    }

    public void setCantidadEppSolicitudTerreno(int cantidadEppSolicitudTerreno) {
        this.cantidadEppSolicitudTerreno = cantidadEppSolicitudTerreno;
    }

    public String getObervacionEppSolicitudTerreno() {
        return obervacionEppSolicitudTerreno;
    }

    public void setObervacionEppSolicitudTerreno(String obervacionEppSolicitudTerreno) {
        this.obervacionEppSolicitudTerreno = obervacionEppSolicitudTerreno;
    }

    public Epp getEPPidEPP() {
        return ePPidEPP;
    }

    public void setEPPidEPP(Epp ePPidEPP) {
        this.ePPidEPP = ePPidEPP;
    }

    public Proyecto getProyectoidProyecto() {
        return proyectoidProyecto;
    }

    public void setProyectoidProyecto(Proyecto proyectoidProyecto) {
        this.proyectoidProyecto = proyectoidProyecto;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEppSolicitudTerreno != null ? idEppSolicitudTerreno.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Eppsolicitudterreno)) {
            return false;
        }
        Eppsolicitudterreno other = (Eppsolicitudterreno) object;
        if ((this.idEppSolicitudTerreno == null && other.idEppSolicitudTerreno != null) || (this.idEppSolicitudTerreno != null && !this.idEppSolicitudTerreno.equals(other.idEppSolicitudTerreno))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Eppsolicitudterreno[ idEppSolicitudTerreno=" + idEppSolicitudTerreno + " ]";
    }
    
}
