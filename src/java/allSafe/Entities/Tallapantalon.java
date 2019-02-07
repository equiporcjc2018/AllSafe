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
 * @author Ruben
 */
@Entity
@Table(name = "tallapantalon")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tallapantalon.findAll", query = "SELECT t FROM Tallapantalon t")
    , @NamedQuery(name = "Tallapantalon.findByIdTallaPantalon", query = "SELECT t FROM Tallapantalon t WHERE t.idTallaPantalon = :idTallaPantalon")
    , @NamedQuery(name = "Tallapantalon.findByNumeroTallaPantalon", query = "SELECT t FROM Tallapantalon t WHERE t.numeroTallaPantalon = :numeroTallaPantalon")
    , @NamedQuery(name = "Tallapantalon.findByLetraTallaPantalon", query = "SELECT t FROM Tallapantalon t WHERE t.letraTallaPantalon = :letraTallaPantalon")})
public class Tallapantalon implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idTallaPantalon")
    private Integer idTallaPantalon;
    @Basic(optional = false)
    @NotNull
    @Column(name = "numeroTallaPantalon")
    private int numeroTallaPantalon;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 3)
    @Column(name = "letraTallaPantalon")
    private String letraTallaPantalon;
    @OneToMany(mappedBy = "tallaPantalonidTallaPantalon")
    private List<Persona> personaList;

    public Tallapantalon() {
    }

    public Tallapantalon(Integer idTallaPantalon) {
        this.idTallaPantalon = idTallaPantalon;
    }

    public Tallapantalon(Integer idTallaPantalon, int numeroTallaPantalon, String letraTallaPantalon) {
        this.idTallaPantalon = idTallaPantalon;
        this.numeroTallaPantalon = numeroTallaPantalon;
        this.letraTallaPantalon = letraTallaPantalon;
    }

    public Integer getIdTallaPantalon() {
        return idTallaPantalon;
    }

    public void setIdTallaPantalon(Integer idTallaPantalon) {
        this.idTallaPantalon = idTallaPantalon;
    }

    public int getNumeroTallaPantalon() {
        return numeroTallaPantalon;
    }

    public void setNumeroTallaPantalon(int numeroTallaPantalon) {
        this.numeroTallaPantalon = numeroTallaPantalon;
    }

    public String getLetraTallaPantalon() {
        return letraTallaPantalon;
    }

    public void setLetraTallaPantalon(String letraTallaPantalon) {
        this.letraTallaPantalon = letraTallaPantalon;
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
        hash += (idTallaPantalon != null ? idTallaPantalon.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tallapantalon)) {
            return false;
        }
        Tallapantalon other = (Tallapantalon) object;
        if ((this.idTallaPantalon == null && other.idTallaPantalon != null) || (this.idTallaPantalon != null && !this.idTallaPantalon.equals(other.idTallaPantalon))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Tallapantalon[ idTallaPantalon=" + idTallaPantalon + " ]";
    }
    
}
