/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.Entities;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author alvarosmh
 */
@Entity
@Table(name = "usuarioclavehistorial")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UsuarioClaveHistorial.findAll", query = "SELECT a FROM UsuarioClaveHistorial a")
    , @NamedQuery(name = "UsuarioClaveHistorial.findByIdUsuario", query = "SELECT a FROM UsuarioClaveHistorial a WHERE a.usuario = :id")
    , @NamedQuery(name = "UsuarioClaveHistorial.findActivaByIdUsuario", query = "SELECT a FROM UsuarioClaveHistorial a WHERE a.usuario.idUsuarioAllSafe = :id AND a.estado = :estado")})
public class UsuarioClaveHistorial implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idusuarioclavehistorial")
    private Integer idUsuarioClaveHistorial;
    @Basic(optional = false)
    @Column(name = "fechaCreacion", insertable = false, updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaCreacion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "estado")
    private String estado;
    @JoinColumn(name = "usuario", referencedColumnName = "idUsuarioAllSafe")
    @ManyToOne(optional = false)
    private Usuarioallsafe usuario;
    @Basic(optional = false)
    @Column(name = "clave")
    private String clave;    

    public UsuarioClaveHistorial() {
    }

    public Integer getIdUsuarioClaveHistorial() {
        return idUsuarioClaveHistorial;
    }

    public void setIdUsuarioClaveHistorial(Integer idUsuarioClaveHistorial) {
        this.idUsuarioClaveHistorial = idUsuarioClaveHistorial;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Usuarioallsafe getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuarioallsafe usuario) {
        this.usuario = usuario;
    }

    public UsuarioClaveHistorial(Integer idUsuarioClaveHistorial, Date fechaCreacion, String estado, Usuarioallsafe usuario) {
        this.idUsuarioClaveHistorial = idUsuarioClaveHistorial;
        this.fechaCreacion = fechaCreacion;
        this.estado = estado;
        this.usuario = usuario;
    }

    public UsuarioClaveHistorial(Integer idUsuarioClaveHistorial) {
        this.idUsuarioClaveHistorial = idUsuarioClaveHistorial;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    
}
