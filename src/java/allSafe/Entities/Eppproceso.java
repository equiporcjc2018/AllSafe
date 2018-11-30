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
 * @author hachi
 */
@Entity
@Table(name = "eppproceso")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Eppproceso.findAll", query = "SELECT e FROM Eppproceso e")
    , @NamedQuery(name = "Eppproceso.findByIdEppProceso", query = "SELECT e FROM Eppproceso e WHERE e.idEppProceso = :idEppProceso")
    , @NamedQuery(name = "Eppproceso.findByFechaCreacionEppProceso", query = "SELECT e FROM Eppproceso e WHERE e.fechaCreacionEppProceso = :fechaCreacionEppProceso")
    , @NamedQuery(name = "Eppproceso.findByTallaEppProceso", query = "SELECT e FROM Eppproceso e WHERE e.tallaEppProceso = :tallaEppProceso")
    , @NamedQuery(name = "Eppproceso.findByUnidadEppProceso", query = "SELECT e FROM Eppproceso e WHERE e.unidadEppProceso = :unidadEppProceso")
    , @NamedQuery(name = "Eppproceso.findByCantidadEppProceso", query = "SELECT e FROM Eppproceso e WHERE e.cantidadEppProceso = :cantidadEppProceso")
    , @NamedQuery(name = "Eppproceso.findByPrecioUnitarioEppProceso", query = "SELECT e FROM Eppproceso e WHERE e.precioUnitarioEppProceso = :precioUnitarioEppProceso")
    , @NamedQuery(name = "Eppproceso.findByDestinoDevolucionEppProceso", query = "SELECT e FROM Eppproceso e WHERE e.destinoDevolucionEppProceso = :destinoDevolucionEppProceso")
    , @NamedQuery(name = "Eppproceso.findByMotivoEppProceso", query = "SELECT e FROM Eppproceso e WHERE e.motivoEppProceso = :motivoEppProceso")
    , @NamedQuery(name = "Eppproceso.findByUsuarioEppProceso", query = "SELECT e FROM Eppproceso e WHERE e.usuarioEppProceso = :usuarioEppProceso")})
public class Eppproceso implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idEppProceso")
    private Integer idEppProceso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "fechaCreacionEppProceso")
    private String fechaCreacionEppProceso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "tallaEppProceso")
    private String tallaEppProceso;
    @Basic(optional = false)
    @NotNull
    @Column(name = "unidadEppProceso")
    private int unidadEppProceso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "cantidadEppProceso")
    private String cantidadEppProceso;
    @Basic(optional = false)
    @NotNull
    @Column(name = "precioUnitarioEppProceso")
    private int precioUnitarioEppProceso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "destinoDevolucionEppProceso")
    private String destinoDevolucionEppProceso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "motivoEppProceso")
    private String motivoEppProceso;
    @Size(max = 45)
    @Column(name = "usuarioEppProceso")
    private String usuarioEppProceso;
    @JoinColumn(name = "EPP_idEPP", referencedColumnName = "idEPP")
    @ManyToOne(optional = false)
    private Epp ePPidEPP;
    @JoinColumn(name = "EstadosProyecto_idEstadosProyecto", referencedColumnName = "idEstadosProyecto")
    @ManyToOne(optional = false)
    private Estadosproyecto estadosProyectoidEstadosProyecto;
    @JoinColumn(name = "Persona_idPersona", referencedColumnName = "idPersona")
    @ManyToOne(optional = false)
    private Persona personaidPersona;
    @JoinColumn(name = "Proyecto_idProyecto", referencedColumnName = "idProyecto")
    @ManyToOne(optional = false)
    private Proyecto proyectoidProyecto;

    public Eppproceso() {
    }

    public Eppproceso(Integer idEppProceso) {
        this.idEppProceso = idEppProceso;
    }

    public Eppproceso(Integer idEppProceso, String fechaCreacionEppProceso, String tallaEppProceso, int unidadEppProceso, String cantidadEppProceso, int precioUnitarioEppProceso, String destinoDevolucionEppProceso, String motivoEppProceso) {
        this.idEppProceso = idEppProceso;
        this.fechaCreacionEppProceso = fechaCreacionEppProceso;
        this.tallaEppProceso = tallaEppProceso;
        this.unidadEppProceso = unidadEppProceso;
        this.cantidadEppProceso = cantidadEppProceso;
        this.precioUnitarioEppProceso = precioUnitarioEppProceso;
        this.destinoDevolucionEppProceso = destinoDevolucionEppProceso;
        this.motivoEppProceso = motivoEppProceso;
    }

    public Integer getIdEppProceso() {
        return idEppProceso;
    }

    public void setIdEppProceso(Integer idEppProceso) {
        this.idEppProceso = idEppProceso;
    }

    public String getFechaCreacionEppProceso() {
        return fechaCreacionEppProceso;
    }

    public void setFechaCreacionEppProceso(String fechaCreacionEppProceso) {
        this.fechaCreacionEppProceso = fechaCreacionEppProceso;
    }

    public String getTallaEppProceso() {
        return tallaEppProceso;
    }

    public void setTallaEppProceso(String tallaEppProceso) {
        this.tallaEppProceso = tallaEppProceso;
    }

    public int getUnidadEppProceso() {
        return unidadEppProceso;
    }

    public void setUnidadEppProceso(int unidadEppProceso) {
        this.unidadEppProceso = unidadEppProceso;
    }

    public String getCantidadEppProceso() {
        return cantidadEppProceso;
    }

    public void setCantidadEppProceso(String cantidadEppProceso) {
        this.cantidadEppProceso = cantidadEppProceso;
    }

    public int getPrecioUnitarioEppProceso() {
        return precioUnitarioEppProceso;
    }

    public void setPrecioUnitarioEppProceso(int precioUnitarioEppProceso) {
        this.precioUnitarioEppProceso = precioUnitarioEppProceso;
    }

    public String getDestinoDevolucionEppProceso() {
        return destinoDevolucionEppProceso;
    }

    public void setDestinoDevolucionEppProceso(String destinoDevolucionEppProceso) {
        this.destinoDevolucionEppProceso = destinoDevolucionEppProceso;
    }

    public String getMotivoEppProceso() {
        return motivoEppProceso;
    }

    public void setMotivoEppProceso(String motivoEppProceso) {
        this.motivoEppProceso = motivoEppProceso;
    }

    public String getUsuarioEppProceso() {
        return usuarioEppProceso;
    }

    public void setUsuarioEppProceso(String usuarioEppProceso) {
        this.usuarioEppProceso = usuarioEppProceso;
    }

    public Epp getEPPidEPP() {
        return ePPidEPP;
    }

    public void setEPPidEPP(Epp ePPidEPP) {
        this.ePPidEPP = ePPidEPP;
    }

    public Estadosproyecto getEstadosProyectoidEstadosProyecto() {
        return estadosProyectoidEstadosProyecto;
    }

    public void setEstadosProyectoidEstadosProyecto(Estadosproyecto estadosProyectoidEstadosProyecto) {
        this.estadosProyectoidEstadosProyecto = estadosProyectoidEstadosProyecto;
    }

    public Persona getPersonaidPersona() {
        return personaidPersona;
    }

    public void setPersonaidPersona(Persona personaidPersona) {
        this.personaidPersona = personaidPersona;
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
        hash += (idEppProceso != null ? idEppProceso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Eppproceso)) {
            return false;
        }
        Eppproceso other = (Eppproceso) object;
        if ((this.idEppProceso == null && other.idEppProceso != null) || (this.idEppProceso != null && !this.idEppProceso.equals(other.idEppProceso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Eppproceso[ idEppProceso=" + idEppProceso + " ]";
    }
    
}
