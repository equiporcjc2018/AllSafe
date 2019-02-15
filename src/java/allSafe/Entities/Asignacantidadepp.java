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
 * @author Ruben
 */
@Entity
@Table(name = "asignacantidadepp")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Asignacantidadepp.findAll", query = "SELECT a FROM Asignacantidadepp a")
    , @NamedQuery(name = "Asignacantidadepp.findByIdEppProceso", query = "SELECT a FROM Asignacantidadepp a WHERE a.idEppProceso = :idEppProceso")
    , @NamedQuery(name = "Asignacantidadepp.findByGrafico", query = "SELECT a.asignaeppaproyectoIdasignaeppaproyecto.proyectoidProyecto.idProyecto FROM Asignacantidadepp a")
    , @NamedQuery(name = "Asignacantidadepp.findByCantidad", query = "SELECT SUM(a.cantidadEppProceso) as Cantidad FROM Asignacantidadepp a GROUP BY a.asignaeppaproyectoIdasignaeppaproyecto.proyectoidProyecto.nombreProyecto")
    , @NamedQuery(name = "Asignacantidadepp.findByFechaCreacionEppProceso", query = "SELECT a FROM Asignacantidadepp a WHERE a.fechaCreacionEppProceso = :fechaCreacionEppProceso")
    , @NamedQuery(name = "Asignacantidadepp.findByTallaEppProceso", query = "SELECT a FROM Asignacantidadepp a WHERE a.tallaEppProceso = :tallaEppProceso")
    , @NamedQuery(name = "Asignacantidadepp.findByUnidadEppProceso", query = "SELECT a FROM Asignacantidadepp a WHERE a.unidadEppProceso = :unidadEppProceso")
    , @NamedQuery(name = "Asignacantidadepp.findByCantidadEppProceso", query = "SELECT a FROM Asignacantidadepp a WHERE a.cantidadEppProceso = :cantidadEppProceso")
    , @NamedQuery(name = "Asignacantidadepp.findByIdEpp", query = "SELECT a FROM Asignacantidadepp a WHERE a.asignaeppaproyectoIdasignaeppaproyecto.eppidEPP.idEPP = :asignaeppaproyectoIdasignaeppaproyecto")
    , @NamedQuery(name = "AsignacantidadeppGrafico.findByIdEpp", query = "SELECT a FROM Asignacantidadepp a WHERE a.asignaeppaproyectoIdasignaeppaproyecto.eppidEPP.idEPP = :asignaeppaproyectoIdasignaeppaproyecto")
    , @NamedQuery(name = "Asignacantidadepp.findByPrecioUnitarioEppProceso", query = "SELECT a FROM Asignacantidadepp a WHERE a.precioUnitarioEppProceso = :precioUnitarioEppProceso")})
public class Asignacantidadepp implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idEppProceso")
    private Integer idEppProceso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "fechaCreacionEppProceso")
    private String fechaCreacionEppProceso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "tallaEppProceso")
    private String tallaEppProceso;
    @Basic(optional = false)
    @NotNull
    @Column(name = "unidadEppProceso")
    private int unidadEppProceso;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cantidadEppProceso")
    private Number cantidadEppProceso;
    @Basic(optional = false)
    @NotNull
    @Column(name = "precioUnitarioEppProceso")
    private int precioUnitarioEppProceso;
    @JoinColumn(name = "EstadosProyecto_idEstadosProyecto", referencedColumnName = "idEstadosProyecto")
    @ManyToOne(optional = false)
    private Estadosproyecto estadosProyectoidEstadosProyecto;
    @JoinColumn(name = "asignaeppaproyecto_idasignaeppaproyecto", referencedColumnName = "idasignaeppaproyecto")
    @ManyToOne(optional = false)
    private Asignaeppaproyecto asignaeppaproyectoIdasignaeppaproyecto;
    @JoinColumn(name = "tipodecarga_idtipodecarga", referencedColumnName = "idtipodecarga")
    @ManyToOne(optional = false)
    private Tipodecarga tipodecargaIdtipodecarga;

    public Asignacantidadepp() {
    }

    public Asignacantidadepp(Integer idEppProceso) {
        this.idEppProceso = idEppProceso;
    }

    public Asignacantidadepp(Integer idEppProceso, String fechaCreacionEppProceso, String tallaEppProceso, int unidadEppProceso, int cantidadEppProceso, int precioUnitarioEppProceso) {
        this.idEppProceso = idEppProceso;
        this.fechaCreacionEppProceso = fechaCreacionEppProceso;
        this.tallaEppProceso = tallaEppProceso;
        this.unidadEppProceso = unidadEppProceso;
        this.cantidadEppProceso = cantidadEppProceso;
        this.precioUnitarioEppProceso = precioUnitarioEppProceso;
    }

    public Integer getIdEppProceso() {
        return idEppProceso;
    }

    public void setIdEppProceso(Integer idEppProceso) {
        this.idEppProceso = idEppProceso;
    }

    public String getFechaCreacionEppProceso() {
        return fechaCreacionEppProceso;
    }

    public void setFechaCreacionEppProceso(String fechaCreacionEppProceso) {
        this.fechaCreacionEppProceso = fechaCreacionEppProceso;
    }

    public String getTallaEppProceso() {
        return tallaEppProceso;
    }

    public void setTallaEppProceso(String tallaEppProceso) {
        this.tallaEppProceso = tallaEppProceso;
    }

    public int getUnidadEppProceso() {
        return unidadEppProceso;
    }

    public void setUnidadEppProceso(int unidadEppProceso) {
        this.unidadEppProceso = unidadEppProceso;
    }

    public Number getCantidadEppProceso() {
        return cantidadEppProceso;
    }

    public void setCantidadEppProceso(Number cantidadEppProceso) {
        this.cantidadEppProceso = cantidadEppProceso;
    }

    public int getPrecioUnitarioEppProceso() {
        return precioUnitarioEppProceso;
    }

    public void setPrecioUnitarioEppProceso(int precioUnitarioEppProceso) {
        this.precioUnitarioEppProceso = precioUnitarioEppProceso;
    }

    public Estadosproyecto getEstadosProyectoidEstadosProyecto() {
        return estadosProyectoidEstadosProyecto;
    }

    public void setEstadosProyectoidEstadosProyecto(Estadosproyecto estadosProyectoidEstadosProyecto) {
        this.estadosProyectoidEstadosProyecto = estadosProyectoidEstadosProyecto;
    }

    public Asignaeppaproyecto getAsignaeppaproyectoIdasignaeppaproyecto() {
        return asignaeppaproyectoIdasignaeppaproyecto;
    }

    public void setAsignaeppaproyectoIdasignaeppaproyecto(Asignaeppaproyecto asignaeppaproyectoIdasignaeppaproyecto) {
        this.asignaeppaproyectoIdasignaeppaproyecto = asignaeppaproyectoIdasignaeppaproyecto;
    }

    public Tipodecarga getTipodecargaIdtipodecarga() {
        return tipodecargaIdtipodecarga;
    }

    public void setTipodecargaIdtipodecarga(Tipodecarga tipodecargaIdtipodecarga) {
        this.tipodecargaIdtipodecarga = tipodecargaIdtipodecarga;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEppProceso != null ? idEppProceso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Asignacantidadepp)) {
            return false;
        }
        Asignacantidadepp other = (Asignacantidadepp) object;
        if ((this.idEppProceso == null && other.idEppProceso != null) || (this.idEppProceso != null && !this.idEppProceso.equals(other.idEppProceso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "allSafe.Entities.Asignacantidadepp[ idEppProceso=" + idEppProceso + " ]";
    }
    
}
