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
@Table(name = "usuarioclaverecuperar")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UsuarioClaveRecuperar.findAll", query = "SELECT a FROM UsuarioClaveRecuperar a")
    , @NamedQuery(name = "UsuarioClaveRecuperar.findByIdUsuario", query = "SELECT a FROM UsuarioClaveRecuperar a WHERE a.usuario = :id")
    , @NamedQuery(name = "UsuarioClaveRecuperar.findByCodigoAndIdUsuario", query = "SELECT a FROM UsuarioClaveRecuperar a WHERE a.usuario.idUsuarioAllSafe = :id AND a.codigo = :codigo")})
public class UsuarioClaveRecuperar implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idusuarioclaverecuperar")
    private Integer idUsuarioClaveRecuperar;
    @Basic(optional = false)
    @Column(name = "fecha", insertable = false, updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date fecha;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "codigo")
    private String codigo;
    @JoinColumn(name = "usuario", referencedColumnName = "idUsuarioAllSafe")
    @ManyToOne(optional = false)
    private Usuarioallsafe usuario;

    public UsuarioClaveRecuperar() {
    }

    public Integer getIdUsuarioClaveRecuperar() {
        return idUsuarioClaveRecuperar;
    }

    public void setIdUsuarioClaveRecuperar(Integer idUsuarioClaveRecuperar) {
        this.idUsuarioClaveRecuperar = idUsuarioClaveRecuperar;
    }


    public Usuarioallsafe getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuarioallsafe usuario) {
        this.usuario = usuario;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public UsuarioClaveRecuperar(Integer idUsuarioClaveRecuperar, Date fecha, String codigo, Usuarioallsafe usuario) {
        this.idUsuarioClaveRecuperar = idUsuarioClaveRecuperar;
        this.fecha = fecha;
        this.codigo = codigo;
        this.usuario = usuario;
    }

    @Override
    public String toString() {
        return "UsuarioClaveRecuperar{" + "idUsuarioClaveRecuperar=" + idUsuarioClaveRecuperar + ", fecha=" + fecha + ", codigo=" + codigo + ", usuario=" + usuario + '}';
    }
    
    

}
