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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "persona")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Persona.findAll", query = "SELECT p FROM Persona p")
    , @NamedQuery(name = "Persona.findByIdPersona", query = "SELECT p FROM Persona p WHERE p.idPersona = :idPersona")
    , @NamedQuery(name = "Persona.findByRutPasaportePersona", query = "SELECT p FROM Persona p WHERE p.rutPasaportePersona = :rutPasaportePersona")
    , @NamedQuery(name = "Persona.findByNombresPersona", query = "SELECT p FROM Persona p WHERE p.nombresPersona = :nombresPersona")
    , @NamedQuery(name = "Persona.findByApePatPersona", query = "SELECT p FROM Persona p WHERE p.apePatPersona = :apePatPersona")
    , @NamedQuery(name = "Persona.findByApeMatPersona", query = "SELECT p FROM Persona p WHERE p.apeMatPersona = :apeMatPersona")
    , @NamedQuery(name = "Persona.findByFechaNacPersona", query = "SELECT p FROM Persona p WHERE p.fechaNacPersona = :fechaNacPersona")
    , @NamedQuery(name = "Persona.findByNacionalidadPersona", query = "SELECT p FROM Persona p WHERE p.nacionalidadPersona = :nacionalidadPersona")
    , @NamedQuery(name = "Persona.findByTipoPlanta", query = "SELECT p FROM Persona p WHERE p.tipoPlanta = :tipoPlanta")
    , @NamedQuery(name = "Persona.findByCorreoPersona", query = "SELECT p FROM Persona p WHERE p.correoPersona = :correoPersona")})
public class Persona implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idPersona")
    private Integer idPersona;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "rutPasaportePersona")
    private String rutPasaportePersona;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombresPersona")
    private String nombresPersona;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "apePatPersona")
    private String apePatPersona;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "apeMatPersona")
    private String apeMatPersona;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "fechaNacPersona")
    private String fechaNacPersona;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nacionalidadPersona")
    private String nacionalidadPersona;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "tipoPlanta")
    private String tipoPlanta;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "correoPersona")
    private String correoPersona;
    @JoinColumn(name = "Cargo_idCargo", referencedColumnName = "idCargo")
    @ManyToOne(optional = false)
    private Cargo cargoidCargo;
    @JoinColumn(name = "TallaOberol_idTallaOberol", referencedColumnName = "idTallaOberol")
    @ManyToOne(optional = false)
    private Tallaoberol tallaOberolidTallaOberol;
    @JoinColumn(name = "TallaPantalon_idTallaPantalon", referencedColumnName = "idTallaPantalon")
    @ManyToOne(optional = false)
    private Tallapantalon tallaPantalonidTallaPantalon;
    @JoinColumn(name = "tallaPoleraCamisa_idtallaPoleraCamisa", referencedColumnName = "idTallaPoleraCamisa")
    @ManyToOne(optional = false)
    private Tallapoleracamisa tallaPoleraCamisaidtallaPoleraCamisa;
    @JoinColumn(name = "tallaZApato_idtallaZApato", referencedColumnName = "idTallaZapato")
    @ManyToOne(optional = false)
    private Tallazapato tallaZApatoidtallaZApato;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "personaidPersona")
    private List<Eppterreno> eppterrenoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "personaidPersona")
    private List<Usuarioallsafe> usuarioallsafeList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "personaidPersona")
    private List<Eppproceso> eppprocesoList;

    public Persona() {
    }

    public Persona(Integer idPersona) {
        this.idPersona = idPersona;
    }

    public Persona(Integer idPersona, String rutPasaportePersona, String nombresPersona, String apePatPersona, String apeMatPersona, String fechaNacPersona, String nacionalidadPersona, String tipoPlanta, String correoPersona) {
        this.idPersona = idPersona;
        this.rutPasaportePersona = rutPasaportePersona;
        this.nombresPersona = nombresPersona;
        this.apePatPersona = apePatPersona;
        this.apeMatPersona = apeMatPersona;
        this.fechaNacPersona = fechaNacPersona;
        this.nacionalidadPersona = nacionalidadPersona;
        this.tipoPlanta = tipoPlanta;
        this.correoPersona = correoPersona;
    }

    public Integer getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(Integer idPersona) {
        this.idPersona = idPersona;
    }

    public String getRutPasaportePersona() {
        return rutPasaportePersona;
    }

    public void setRutPasaportePersona(String rutPasaportePersona) {
        this.rutPasaportePersona = rutPasaportePersona;
    }

    public String getNombresPersona() {
        return nombresPersona;
    }

    public void setNombresPersona(String nombresPersona) {
        this.nombresPersona = nombresPersona;
    }

    public String getApePatPersona() {
        return apePatPersona;
    }

    public void setApePatPersona(String apePatPersona) {
        this.apePatPersona = apePatPersona;
    }

    public String getApeMatPersona() {
        return apeMatPersona;
    }

    public void setApeMatPersona(String apeMatPersona) {
        this.apeMatPersona = apeMatPersona;
    }

    public String getFechaNacPersona() {
        return fechaNacPersona;
    }

    public void setFechaNacPersona(String fechaNacPersona) {
        this.fechaNacPersona = fechaNacPersona;
    }

    public String getNacionalidadPersona() {
        return nacionalidadPersona;
    }

    public void setNacionalidadPersona(String nacionalidadPersona) {
        this.nacionalidadPersona = nacionalidadPersona;
    }

    public String getTipoPlanta() {
        return tipoPlanta;
    }

    public void setTipoPlanta(String tipoPlanta) {
        this.tipoPlanta = tipoPlanta;
    }

    public String getCorreoPersona() {
        return correoPersona;
    }

    public void setCorreoPersona(String correoPersona) {
        this.correoPersona = correoPersona;
    }

    public Cargo getCargoidCargo() {
        return cargoidCargo;
    }

    public void setCargoidCargo(Cargo cargoidCargo) {
        this.cargoidCargo = cargoidCargo;
    }

    public Tallaoberol getTallaOberolidTallaOberol() {
        return tallaOberolidTallaOberol;
    }

    public void setTallaOberolidTallaOberol(Tallaoberol tallaOberolidTallaOberol) {
        this.tallaOberolidTallaOberol = tallaOberolidTallaOberol;
    }

    public Tallapantalon getTallaPantalonidTallaPantalon() {
        return tallaPantalonidTallaPantalon;
    }

    public void setTallaPantalonidTallaPantalon(Tallapantalon tallaPantalonidTallaPantalon) {
        this.tallaPantalonidTallaPantalon = tallaPantalonidTallaPantalon;
    }

    public Tallapoleracamisa getTallaPoleraCamisaidtallaPoleraCamisa() {
        return tallaPoleraCamisaidtallaPoleraCamisa;
    }

    public void setTallaPoleraCamisaidtallaPoleraCamisa(Tallapoleracamisa tallaPoleraCamisaidtallaPoleraCamisa) {
        this.tallaPoleraCamisaidtallaPoleraCamisa = tallaPoleraCamisaidtallaPoleraCamisa;
    }

    public Tallazapato getTallaZApatoidtallaZApato() {
        return tallaZApatoidtallaZApato;
    }

    public void setTallaZApatoidtallaZApato(Tallazapato tallaZApatoidtallaZApato) {
        this.tallaZApatoidtallaZApato = tallaZApatoidtallaZApato;
    }

    @XmlTransient
    public List<Eppterreno> getEppterrenoList() {
        return eppterrenoList;
    }

    public void setEppterrenoList(List<Eppterreno> eppterrenoList) {
        this.eppterrenoList = eppterrenoList;
    }

    @XmlTransient
    public List<Usuarioallsafe> getUsuarioallsafeList() {
        return usuarioallsafeList;
    }

    public void setUsuarioallsafeList(List<Usuarioallsafe> usuarioallsafeList) {
        this.usuarioallsafeList = usuarioallsafeList;
    }

    @XmlTransient
    public List<Eppproceso> getEppprocesoList() {
        return eppprocesoList;
    }

    public void setEppprocesoList(List<Eppproceso> eppprocesoList) {
        this.eppprocesoList = eppprocesoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPersona != null ? idPersona.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Persona)) {
            return false;
        }
        Persona other = (Persona) object;
        if ((this.idPersona == null && other.idPersona != null) || (this.idPersona != null && !this.idPersona.equals(other.idPersona))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Persona[ idPersona=" + idPersona + " ]";
    }
    
}
