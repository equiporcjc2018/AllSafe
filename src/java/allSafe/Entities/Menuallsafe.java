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
@Table(name = "menuallsafe")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Menuallsafe.findAll", query = "SELECT m FROM Menuallsafe m")
    , @NamedQuery(name = "Menuallsafe.findByIdMenuAllsafe", query = "SELECT m FROM Menuallsafe m WHERE m.idMenuAllsafe = :idMenuAllsafe")
    , @NamedQuery(name = "Menuallsafe.findByNombreMenuAllsafe", query = "SELECT m FROM Menuallsafe m WHERE m.nombreMenuAllsafe = :nombreMenuAllsafe")
    , @NamedQuery(name = "Menuallsafe.findByPadreMenuAllsafe", query = "SELECT m FROM Menuallsafe m WHERE m.padreMenuAllsafe = :padreMenuAllsafe")
    , @NamedQuery(name = "Menuallsafe.findByDestinoMenuAllsafe", query = "SELECT m FROM Menuallsafe m WHERE m.destinoMenuAllsafe = :destinoMenuAllsafe")})
public class Menuallsafe implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idMenuAllsafe")
    private Integer idMenuAllsafe;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombreMenuAllsafe")
    private String nombreMenuAllsafe;
    @Basic(optional = false)
    @NotNull
    @Column(name = "padreMenuAllsafe")
    private int padreMenuAllsafe;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "destinoMenuAllsafe")
    private String destinoMenuAllsafe;
    @JoinColumn(name = "PerfilAllSafe_idPerfilAllSafe", referencedColumnName = "idPerfilAllSafe")
    @ManyToOne(optional = false)
    private Perfilallsafe perfilAllSafeidPerfilAllSafe;
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
    

    public Menuallsafe() {
    }

    public Menuallsafe(Integer idMenuAllsafe) {
        this.idMenuAllsafe = idMenuAllsafe;
    }

    public Menuallsafe(Integer idMenuAllsafe, String nombreMenuAllsafe, int padreMenuAllsafe, String destinoMenuAllsafe) {
        this.idMenuAllsafe = idMenuAllsafe;
        this.nombreMenuAllsafe = nombreMenuAllsafe;
        this.padreMenuAllsafe = padreMenuAllsafe;
        this.destinoMenuAllsafe = destinoMenuAllsafe;
    }

    public Integer getIdMenuAllsafe() {
        return idMenuAllsafe;
    }

    public void setIdMenuAllsafe(Integer idMenuAllsafe) {
        this.idMenuAllsafe = idMenuAllsafe;
    }

    public String getNombreMenuAllsafe() {
        return nombreMenuAllsafe;
    }

    public void setNombreMenuAllsafe(String nombreMenuAllsafe) {
        this.nombreMenuAllsafe = nombreMenuAllsafe;
    }

    public int getPadreMenuAllsafe() {
        return padreMenuAllsafe;
    }

    public void setPadreMenuAllsafe(int padreMenuAllsafe) {
        this.padreMenuAllsafe = padreMenuAllsafe;
    }

    public String getDestinoMenuAllsafe() {
        return destinoMenuAllsafe;
    }

    public void setDestinoMenuAllsafe(String destinoMenuAllsafe) {
        this.destinoMenuAllsafe = destinoMenuAllsafe;
    }

    public Perfilallsafe getPerfilAllSafeidPerfilAllSafe() {
        return perfilAllSafeidPerfilAllSafe;
    }

    public void setPerfilAllSafeidPerfilAllSafe(Perfilallsafe perfilAllSafeidPerfilAllSafe) {
        this.perfilAllSafeidPerfilAllSafe = perfilAllSafeidPerfilAllSafe;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idMenuAllsafe != null ? idMenuAllsafe.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Menuallsafe)) {
            return false;
        }
        Menuallsafe other = (Menuallsafe) object;
        if ((this.idMenuAllsafe == null && other.idMenuAllsafe != null) || (this.idMenuAllsafe != null && !this.idMenuAllsafe.equals(other.idMenuAllsafe))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Menuallsafe[ idMenuAllsafe=" + idMenuAllsafe + " ]";
    }
    
    public boolean isVigente(){
        return this.getVigencia().equals("Y");
    }
}
