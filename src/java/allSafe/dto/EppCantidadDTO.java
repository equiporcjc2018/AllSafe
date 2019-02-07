/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import allSafe.Entities.Asignacantidadepp;
import allSafe.Entities.Asignaeppaproyecto;
import allSafe.Entities.Estadosproyecto;
import allSafe.Entities.Tipodecarga;

import java.io.Serializable;

/**
 *
 * @author Ruben
 */
public class EppCantidadDTO implements Serializable{
    private Asignacantidadepp objAsignacantidadepp;
    private Asignaeppaproyecto objAsignaeppaproyecto;
    private String fecha;
    private String talla;
    private int unidad;
    private int cantidad;
    private int precio;
    private Tipodecarga objTipodecarga;
    private Estadosproyecto objEstadosproyecto;

    public EppCantidadDTO() {
    }

    public EppCantidadDTO(Asignacantidadepp objAsignacantidadepp, Asignaeppaproyecto objAsignaeppaproyecto, String fecha, String talla, int unidad, int cantidad, int precio, Tipodecarga objTipodecarga, Estadosproyecto objEstadosproyecto) {
        this.objAsignacantidadepp = objAsignacantidadepp;
        this.objAsignaeppaproyecto = objAsignaeppaproyecto;
        this.fecha = fecha;
        this.talla = talla;
        this.unidad = unidad;
        this.cantidad = cantidad;
        this.precio = precio;
        this.objTipodecarga = objTipodecarga;
        this.objEstadosproyecto = objEstadosproyecto;
    }

    public Asignacantidadepp getObjAsignacantidadepp() {
        return objAsignacantidadepp;
    }

    public void setObjAsignacantidadepp(Asignacantidadepp objAsignacantidadepp) {
        this.objAsignacantidadepp = objAsignacantidadepp;
    }

    public Asignaeppaproyecto getObjAsignaeppaproyecto() {
        return objAsignaeppaproyecto;
    }

    public void setObjAsignaeppaproyecto(Asignaeppaproyecto objAsignaeppaproyecto) {
        this.objAsignaeppaproyecto = objAsignaeppaproyecto;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public int getUnidad() {
        return unidad;
    }

    public void setUnidad(int unidad) {
        this.unidad = unidad;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public Tipodecarga getObjTipodecarga() {
        return objTipodecarga;
    }

    public void setObjTipodecarga(Tipodecarga objTipodecarga) {
        this.objTipodecarga = objTipodecarga;
    }

    public Estadosproyecto getObjEstadosproyecto() {
        return objEstadosproyecto;
    }

    public void setObjEstadosproyecto(Estadosproyecto objEstadosproyecto) {
        this.objEstadosproyecto = objEstadosproyecto;
    }

    
   
    

    

    
    
    
}
