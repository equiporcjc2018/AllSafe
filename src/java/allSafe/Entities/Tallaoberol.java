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
@Table(name = "tallaoberol")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tallaoberol.findAll", query = "SELECT t FROM Tallaoberol t")
    , @NamedQuery(name = "Tallaoberol.findByIdTallaOberol", query = "SELECT t FROM Tallaoberol t WHERE t.idTallaOberol = :idTallaOberol")
    , @NamedQuery(name = "Tallaoberol.findByNumeroTallaOberol", query = "SELECT t FROM Tallaoberol t WHERE t.numeroTallaOberol = :numeroTallaOberol")
    , @NamedQuery(name = "Tallaoberol.findByLetraTallaOberol", query = "SELECT t FROM Tallaoberol t WHERE t.letraTallaOberol = :letraTallaOberol")})
public class Tallaoberol implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idTallaOberol")
    private Integer idTallaOberol;
    @Basic(optional = false)
    @NotNull
    @Column(name = "numeroTallaOberol")
    private int numeroTallaOberol;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 3)
    @Column(name = "letraTallaOberol")
    private String letraTallaOberol;
    @OneToMany(mappedBy = "tallaOberolidTallaOberol")
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
    

    public Tallaoberol() {
    }

    public Tallaoberol(Integer idTallaOberol) {
        this.idTallaOberol = idTallaOberol;
    }

    public Tallaoberol(Integer idTallaOberol, int numeroTallaOberol, String letraTallaOberol) {
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

    public String getLetraTallaOberol() {
        return letraTallaOberol;
    }

    public void setLetraTallaOberol(String letraTallaOberol) {
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
    
    public boolean isVigente(){
        return this.getVigencia().equals("Y");
    }
}
