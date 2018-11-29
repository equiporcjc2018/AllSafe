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
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ruben
 */
@Entity
@Table(name = "tallaoberol", catalog = "bdallsafe2", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tallaoberol.findAll", query = "SELECT t FROM Tallaoberol t")
    , @NamedQuery(name = "Tallaoberol.findByIdTallaOberol", query = "SELECT t FROM Tallaoberol t WHERE t.idTallaOberol = :idTallaOberol")
    , @NamedQuery(name = "Tallaoberol.findByNumeroTallaOberol", query = "SELECT t FROM Tallaoberol t WHERE t.numeroTallaOberol = :numeroTallaOberol")
    , @NamedQuery(name = "Tallaoberol.findByLetraTallaOberol", query = "SELECT t FROM Tallaoberol t WHERE t.letraTallaOberol = :letraTallaOberol")})
public class Tallaoberol implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idTallaOberol", nullable = false)
    private Integer idTallaOberol;
    @Basic(optional = false)
    @NotNull
    @Column(name = "numeroTallaOberol", nullable = false)
    private int numeroTallaOberol;
    @Basic(optional = false)
    @NotNull
    @Column(name = "letraTallaOberol", nullable = false)
    private Character letraTallaOberol;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tallaOberolidTallaOberol")
    private List<Persona> personaList;

    public Tallaoberol() {
    }

    public Tallaoberol(Integer idTallaOberol) {
        this.idTallaOberol = idTallaOberol;
    }

    public Tallaoberol(Integer idTallaOberol, int numeroTallaOberol, Character letraTallaOberol) {
        this.idTallaOberol = idTallaOberol;
        this.numeroTallaOberol = numeroTallaOberol;
        this.letraTallaOberol = letraTallaOberol;
    }

    public Integer getIdTallaOberol() {
        return idTallaOberol;
    }

    public void setIdTallaOberol(Integer idTallaOberol) {
        this.idTallaOberol = idTallaOberol;
    }

    public int getNumeroTallaOberol() {
        return numeroTallaOberol;
    }

    public void setNumeroTallaOberol(int numeroTallaOberol) {
        this.numeroTallaOberol = numeroTallaOberol;
    }

    public Character getLetraTallaOberol() {
        return letraTallaOberol;
    }

    public void setLetraTallaOberol(Character letraTallaOberol) {
        this.letraTallaOberol = letraTallaOberol;
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
        hash += (idTallaOberol != null ? idTallaOberol.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tallaoberol)) {
            return false;
        }
        Tallaoberol other = (Tallaoberol) object;
        if ((this.idTallaOberol == null && other.idTallaOberol != null) || (this.idTallaOberol != null && !this.idTallaOberol.equals(other.idTallaOberol))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Tallaoberol[ idTallaOberol=" + idTallaOberol + " ]";
    }
    
}
