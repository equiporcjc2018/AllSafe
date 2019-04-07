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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author hachi
 */
@Entity
@Table(name = "asignatrabajadorproyecto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Asignatrabajadorproyecto.findAll", query = "SELECT a FROM Asignatrabajadorproyecto a")
    , @NamedQuery(name = "Asignatrabajadorproyecto.findByIdasignatrabajadorproyecto", query = "SELECT a FROM Asignatrabajadorproyecto a WHERE a.idasignatrabajadorproyecto = :idasignatrabajadorproyecto")})
public class Asignatrabajadorproyecto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idasignatrabajadorproyecto")
    private Integer idasignatrabajadorproyecto;
    @JoinColumn(name = "persona_rutPasaportePersona", referencedColumnName = "rutPasaportePersona")
    @ManyToOne(optional = false)
    private Persona personarutPasaportePersona;
    @JoinColumn(name = "proyecto_idProyecto", referencedColumnName = "idProyecto")
    @ManyToOne(optional = false)
    private Proyecto proyectoidProyecto;
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
    

    public Asignatrabajadorproyecto() {
    }

    public Asignatrabajadorproyecto(Integer idasignatrabajadorproyecto) {
        this.idasignatrabajadorproyecto = idasignatrabajadorproyecto;
    }

    public Integer getIdasignatrabajadorproyecto() {
        return idasignatrabajadorproyecto;
    }

    public void setIdasignatrabajadorproyecto(Integer idasignatrabajadorproyecto) {
        this.idasignatrabajadorproyecto = idasignatrabajadorproyecto;
    }

    public Persona getPersonarutPasaportePersona() {
        return personarutPasaportePersona;
    }

    public void setPersonarutPasaportePersona(Persona personarutPasaportePersona) {
        this.personarutPasaportePersona = personarutPasaportePersona;
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
        hash += (idasignatrabajadorproyecto != null ? idasignatrabajadorproyecto.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Asignatrabajadorproyecto)) {
            return false;
        }
        Asignatrabajadorproyecto other = (Asignatrabajadorproyecto) object;
        if ((this.idasignatrabajadorproyecto == null && other.idasignatrabajadorproyecto != null) || (this.idasignatrabajadorproyecto != null && !this.idasignatrabajadorproyecto.equals(other.idasignatrabajadorproyecto))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Asignatrabajadorproyecto[ idasignatrabajadorproyecto=" + idasignatrabajadorproyecto + " ]";
    }
    
}
