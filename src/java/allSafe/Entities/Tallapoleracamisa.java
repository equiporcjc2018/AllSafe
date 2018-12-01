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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author hachi
 */
@Entity
@Table(name = "tallapoleracamisa")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tallapoleracamisa.findAll", query = "SELECT t FROM Tallapoleracamisa t")
    , @NamedQuery(name = "Tallapoleracamisa.findByIdTallaPoleraCamisa", query = "SELECT t FROM Tallapoleracamisa t WHERE t.idTallaPoleraCamisa = :idTallaPoleraCamisa")
    , @NamedQuery(name = "Tallapoleracamisa.findByNumeroPoleraCamisa", query = "SELECT t FROM Tallapoleracamisa t WHERE t.numeroPoleraCamisa = :numeroPoleraCamisa")
    , @NamedQuery(name = "Tallapoleracamisa.findByLetraPoleraCamisa", query = "SELECT t FROM Tallapoleracamisa t WHERE t.letraPoleraCamisa = :letraPoleraCamisa")})
public class Tallapoleracamisa implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idTallaPoleraCamisa")
    private Integer idTallaPoleraCamisa;
    @Basic(optional = false)
    @NotNull
    @Column(name = "numeroPoleraCamisa")
    private int numeroPoleraCamisa;
    @Basic(optional = false)
    @NotNull
    @Column(name = "letraPoleraCamisa")
    private Character letraPoleraCamisa;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tallaPoleraCamisaidtallaPoleraCamisa")
    private List<Persona> personaList;

    public Tallapoleracamisa() {
    }

    public Tallapoleracamisa(Integer idTallaPoleraCamisa) {
        this.idTallaPoleraCamisa = idTallaPoleraCamisa;
    }

    public Tallapoleracamisa(Integer idTallaPoleraCamisa, int numeroPoleraCamisa, Character letraPoleraCamisa) {
        this.idTallaPoleraCamisa = idTallaPoleraCamisa;
        this.numeroPoleraCamisa = numeroPoleraCamisa;
        this.letraPoleraCamisa = letraPoleraCamisa;
    }

    public Integer getIdTallaPoleraCamisa() {
        return idTallaPoleraCamisa;
    }

    public void setIdTallaPoleraCamisa(Integer idTallaPoleraCamisa) {
        this.idTallaPoleraCamisa = idTallaPoleraCamisa;
    }

    public int getNumeroPoleraCamisa() {
        return numeroPoleraCamisa;
    }

    public void setNumeroPoleraCamisa(int numeroPoleraCamisa) {
        this.numeroPoleraCamisa = numeroPoleraCamisa;
    }

    public Character getLetraPoleraCamisa() {
        return letraPoleraCamisa;
    }

    public void setLetraPoleraCamisa(Character letraPoleraCamisa) {
        this.letraPoleraCamisa = letraPoleraCamisa;
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
        hash += (idTallaPoleraCamisa != null ? idTallaPoleraCamisa.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tallapoleracamisa)) {
            return false;
        }
        Tallapoleracamisa other = (Tallapoleracamisa) object;
        if ((this.idTallaPoleraCamisa == null && other.idTallaPoleraCamisa != null) || (this.idTallaPoleraCamisa != null && !this.idTallaPoleraCamisa.equals(other.idTallaPoleraCamisa))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Tallapoleracamisa[ idTallaPoleraCamisa=" + idTallaPoleraCamisa + " ]";
    }
    
}
