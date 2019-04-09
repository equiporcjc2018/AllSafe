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
    , @NamedQuery(name = "Persona.findByRutPasaportePersona", query = "SELECT p FROM Persona p WHERE p.rutPasaportePersona = :rutPasaportePersona")
    , @NamedQuery(name = "Persona.findByEmployeeId", query = "SELECT p FROM Persona p WHERE p.employeeId = :employeeId")
    , @NamedQuery(name = "Persona.findByNombresPersona", query = "SELECT p FROM Persona p WHERE p.nombresPersona = :nombresPersona")
    , @NamedQuery(name = "Persona.findByApePatPersona", query = "SELECT p FROM Persona p WHERE p.apePatPersona = :apePatPersona")
    , @NamedQuery(name = "Persona.findByApeMatPersona", query = "SELECT p FROM Persona p WHERE p.apeMatPersona = :apeMatPersona")
    , @NamedQuery(name = "Persona.findByFechaNacPersona", query = "SELECT p FROM Persona p WHERE p.fechaNacPersona = :fechaNacPersona")
    , @NamedQuery(name = "Persona.findByNacionalidadPersona", query = "SELECT p FROM Persona p WHERE p.nacionalidadPersona = :nacionalidadPersona")
    , @NamedQuery(name = "Persona.findByCorreoPersona", query = "SELECT p FROM Persona p WHERE p.correoPersona = :correoPersona")
    , @NamedQuery(name = "Persona.findByVigentepersona", query = "SELECT p FROM Persona p WHERE p.vigencia = :vigentepersona")})
public class Persona implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "rutPasaportePersona")
    private String rutPasaportePersona;
    @Column(name = "EmployeeId")
    private Integer employeeId;
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
    @Size(min = 1, max = 100)
    @Column(name = "correoPersona")
    private String correoPersona;
    @JoinColumn(name = "Cargo_idCargo", referencedColumnName = "idCargo")
    @ManyToOne(optional = false)
    private Cargo cargoidCargo;
    @JoinColumn(name = "TallaOberol_idTallaOberol", referencedColumnName = "idTallaOberol")
    @ManyToOne
    private Tallaoberol tallaOberolidTallaOberol;
    @JoinColumn(name = "TallaPantalon_idTallaPantalon", referencedColumnName = "idTallaPantalon")
    @ManyToOne
    private Tallapantalon tallaPantalonidTallaPantalon;
    @JoinColumn(name = "TipoPlanta_idTipoPlanta", referencedColumnName = "idTipoPlanta")
    @ManyToOne(optional = false)
    private Tipoplanta tipoPlantaidTipoPlanta;
    @JoinColumn(name = "tallaPoleraCamisa_idtallaPoleraCamisa", referencedColumnName = "idTallaPoleraCamisa")
    @ManyToOne
    private Tallapoleracamisa tallaPoleraCamisaidtallaPoleraCamisa;
    @JoinColumn(name = "tallaZApato_idtallaZApato", referencedColumnName = "idTallaZapato")
    @ManyToOne
    private Tallazapato tallaZApatoidtallaZApato;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "personarutPasaportePersona")
    private List<Eppterreno> eppterrenoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "personarutPasaportePersona")
    private List<Usuarioallsafe> usuarioallsafeList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "personarutPasaportePersona")
    private List<Asignatrabajadorproyecto> asignatrabajadorproyectoList;
    @Basic(optional = false)
    @Size(min = 1, max = 1)
    @Column(name = "vigencia")
    private String vigencia;

    public Persona() {
    }

    public Persona(String rutPasaportePersona) {
        this.rutPasaportePersona = rutPasaportePersona;
    }

    public Persona(String rutPasaportePersona, String nombresPersona, String apePatPersona, String apeMatPersona, String fechaNacPersona, String nacionalidadPersona, String correoPersona, String vigencia) {
        this.rutPasaportePersona = rutPasaportePersona;
        this.nombresPersona = nombresPersona;
        this.apePatPersona = apePatPersona;
        this.apeMatPersona = apeMatPersona;
        this.fechaNacPersona = fechaNacPersona;
        this.nacionalidadPersona = nacionalidadPersona;
        this.correoPersona = correoPersona;
        this.vigencia = vigencia;
    }

    public String getRutPasaportePersona() {
        return rutPasaportePersona;
    }

    public void setRutPasaportePersona(String rutPasaportePersona) {
        this.rutPasaportePersona = rutPasaportePersona;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
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

    public String getCorreoPersona() {
        return correoPersona;
    }

    public void setCorreoPersona(String correoPersona) {
        this.correoPersona = correoPersona;
    }

    public String getVigencia() {
        return vigencia;
    }

    public void setVigencia(String vigencia) {
        this.vigencia = vigencia;
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

    public Tipoplanta getTipoPlantaidTipoPlanta() {
        return tipoPlantaidTipoPlanta;
    }

    public void setTipoPlantaidTipoPlanta(Tipoplanta tipoPlantaidTipoPlanta) {
        this.tipoPlantaidTipoPlanta = tipoPlantaidTipoPlanta;
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
    public List<Asignatrabajadorproyecto> getAsignatrabajadorproyectoList() {
        return asignatrabajadorproyectoList;
    }

    public void setAsignatrabajadorproyectoList(List<Asignatrabajadorproyecto> asignatrabajadorproyectoList) {
        this.asignatrabajadorproyectoList = asignatrabajadorproyectoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (rutPasaportePersona != null ? rutPasaportePersona.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Persona)) {
            return false;
        }
        Persona other = (Persona) object;
        if ((this.rutPasaportePersona == null && other.rutPasaportePersona != null) || (this.rutPasaportePersona != null && !this.rutPasaportePersona.equals(other.rutPasaportePersona))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Persona[ rutPasaportePersona=" + rutPasaportePersona + " ]";
    }
    
    public boolean isVigente(){
        return this.getVigencia().equals("Y");
    }
}
