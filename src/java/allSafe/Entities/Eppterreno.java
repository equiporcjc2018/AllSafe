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
import javax.persistence.Lob;
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
@Table(name = "eppterreno")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Eppterreno.findAll", query = "SELECT e FROM Eppterreno e")
    , @NamedQuery(name = "Eppterreno.findByIdEppTerreno", query = "SELECT e FROM Eppterreno e WHERE e.idEppTerreno = :idEppTerreno")
    , @NamedQuery(name = "Eppterreno.findByFechaEppTerreno", query = "SELECT e FROM Eppterreno e WHERE e.fechaEppTerreno = :fechaEppTerreno")
    , @NamedQuery(name = "Eppterreno.findByEstadoEppTerreno", query = "SELECT e FROM Eppterreno e WHERE e.estadoEppTerreno = :estadoEppTerreno")
    , @NamedQuery(name = "Eppterreno.findByCantidadEppTerreno", query = "SELECT e FROM Eppterreno e WHERE e.cantidadEppTerreno = :cantidadEppTerreno")
    , @NamedQuery(name = "Eppterreno.findByTallaEppTerreno", query = "SELECT e FROM Eppterreno e WHERE e.tallaEppTerreno = :tallaEppTerreno")
    , @NamedQuery(name = "Eppterreno.findByObservacionEppTerreno", query = "SELECT e FROM Eppterreno e WHERE e.observacionEppTerreno = :observacionEppTerreno")
    , @NamedQuery(name = "Eppterreno.findByTipoEntregaEppTerreno", query = "SELECT e FROM Eppterreno e WHERE e.tipoEntregaEppTerreno = :tipoEntregaEppTerreno")})
public class Eppterreno implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idEppTerreno")
    private Integer idEppTerreno;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "fechaEppTerreno")
    private String fechaEppTerreno;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "EstadoEppTerreno")
    private String estadoEppTerreno;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CantidadEppTerreno")
    private int cantidadEppTerreno;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "TallaEppTerreno")
    private String tallaEppTerreno;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "observacionEppTerreno")
    private String observacionEppTerreno;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Column(name = "firmaEppTerreno")
    private byte[] firmaEppTerreno;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "tipoEntregaEppTerreno")
    private String tipoEntregaEppTerreno;
    @JoinColumn(name = "Persona_rutPasaportePersona", referencedColumnName = "rutPasaportePersona")
    @ManyToOne(optional = false)
    private Persona personarutPasaportePersona;
    @JoinColumn(name = "EPP_idEPP", referencedColumnName = "idEPP")
    @ManyToOne(optional = false)
    private Epp ePPidEPP;
    @JoinColumn(name = "Proyecto_idProyecto", referencedColumnName = "idProyecto")
    @ManyToOne(optional = false)
    private Proyecto proyectoidProyecto;
    @JoinColumn(name = "idUsuario", referencedColumnName = "idUsuarioAllSafe")
    @ManyToOne(optional = false)
    private Usuarioallsafe idUsuario;

    public Eppterreno() {
    }

    public Eppterreno(Integer idEppTerreno) {
        this.idEppTerreno = idEppTerreno;
    }

    public Eppterreno(Integer idEppTerreno, String fechaEppTerreno, String estadoEppTerreno, int cantidadEppTerreno, String tallaEppTerreno, String observacionEppTerreno, byte[] firmaEppTerreno, String tipoEntregaEppTerreno) {
        this.idEppTerreno = idEppTerreno;
        this.fechaEppTerreno = fechaEppTerreno;
        this.estadoEppTerreno = estadoEppTerreno;
        this.cantidadEppTerreno = cantidadEppTerreno;
        this.tallaEppTerreno = tallaEppTerreno;
        this.observacionEppTerreno = observacionEppTerreno;
        this.firmaEppTerreno = firmaEppTerreno;
        this.tipoEntregaEppTerreno = tipoEntregaEppTerreno;
    }

    public Integer getIdEppTerreno() {
        return idEppTerreno;
    }

    public void setIdEppTerreno(Integer idEppTerreno) {
        this.idEppTerreno = idEppTerreno;
    }

    public String getFechaEppTerreno() {
        return fechaEppTerreno;
    }

    public void setFechaEppTerreno(String fechaEppTerreno) {
        this.fechaEppTerreno = fechaEppTerreno;
    }

    public String getEstadoEppTerreno() {
        return estadoEppTerreno;
    }

    public void setEstadoEppTerreno(String estadoEppTerreno) {
        this.estadoEppTerreno = estadoEppTerreno;
    }

    public int getCantidadEppTerreno() {
        return cantidadEppTerreno;
    }

    public void setCantidadEppTerreno(int cantidadEppTerreno) {
        this.cantidadEppTerreno = cantidadEppTerreno;
    }

    public String getTallaEppTerreno() {
        return tallaEppTerreno;
    }

    public void setTallaEppTerreno(String tallaEppTerreno) {
        this.tallaEppTerreno = tallaEppTerreno;
    }

    public String getObservacionEppTerreno() {
        return observacionEppTerreno;
    }

    public void setObservacionEppTerreno(String observacionEppTerreno) {
        this.observacionEppTerreno = observacionEppTerreno;
    }

    public byte[] getFirmaEppTerreno() {
        return firmaEppTerreno;
    }

    public void setFirmaEppTerreno(byte[] firmaEppTerreno) {
        this.firmaEppTerreno = firmaEppTerreno;
    }

    public String getTipoEntregaEppTerreno() {
        return tipoEntregaEppTerreno;
    }

    public void setTipoEntregaEppTerreno(String tipoEntregaEppTerreno) {
        this.tipoEntregaEppTerreno = tipoEntregaEppTerreno;
    }

    public Persona getPersonarutPasaportePersona() {
        return personarutPasaportePersona;
    }

    public void setPersonarutPasaportePersona(Persona personarutPasaportePersona) {
        this.personarutPasaportePersona = personarutPasaportePersona;
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

    public Usuarioallsafe getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Usuarioallsafe idUsuario) {
        this.idUsuario = idUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEppTerreno != null ? idEppTerreno.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Eppterreno)) {
            return false;
        }
        Eppterreno other = (Eppterreno) object;
        if ((this.idEppTerreno == null && other.idEppTerreno != null) || (this.idEppTerreno != null && !this.idEppTerreno.equals(other.idEppTerreno))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Eppterreno[ idEppTerreno=" + idEppTerreno + " ]";
    }
    
}
