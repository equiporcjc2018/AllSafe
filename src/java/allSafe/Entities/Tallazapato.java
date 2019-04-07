/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.Entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
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
@Table(name = "tallazapato")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tallazapato.findAll", query = "SELECT t FROM Tallazapato t")
    , @NamedQuery(name = "Tallazapato.findByIdTallaZapato", query = "SELECT t FROM Tallazapato t WHERE t.idTallaZapato = :idTallaZapato")
    , @NamedQuery(name = "Tallazapato.findByNumeroZapato", query = "SELECT t FROM Tallazapato t WHERE t.numeroZapato = :numeroZapato")})
public class Tallazapato implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idTallaZapato")
    private Integer idTallaZapato;
    @Basic(optional = false)
    @NotNull
    @Column(name = "numeroZapato")
    private int numeroZapato;
    @OneToMany(mappedBy = "tallaZApatoidtallaZApato")
    private List<Persona> personaList;
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
    

    public Tallazapato() {
    }

    public Tallazapato(Integer idTallaZapato) {
        this.idTallaZapato = idTallaZapato;
    }

    public Tallazapato(Integer idTallaZapato, int numeroZapato) {
        this.idTallaZapato = idTallaZapato;
        this.numeroZapato = numeroZapato;
    }

    public Integer getIdTallaZapato() {
        return idTallaZapato;
    }

    public void setIdTallaZapato(Integer idTallaZapato) {
        this.idTallaZapato = idTallaZapato;
    }

    public int getNumeroZapato() {
        return numeroZapato;
    }

    public void setNumeroZapato(int numeroZapato) {
        this.numeroZapato = numeroZapato;
    }

    @XmlTransient
    public List<Persona> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<Persona> personaList) {
        this.personaList = personaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTallaZapato != null ? idTallaZapato.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tallazapato)) {
            return false;
        }
        Tallazapato other = (Tallazapato) object;
        if ((this.idTallaZapato == null && other.idTallaZapato != null) || (this.idTallaZapato != null && !this.idTallaZapato.equals(other.idTallaZapato))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Tallazapato[ idTallaZapato=" + idTallaZapato + " ]";
    }
    
}
