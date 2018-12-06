/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import allSafe.Entities.Ciudad;
import allSafe.Entities.Empresa;
import allSafe.Entities.Proyecto;
import java.io.Serializable;

/**
 *
 * @author hachi
 */
public class ProyectoCiudadEmpresaDTO implements Serializable{
    
    private Proyecto objProyecto;
    private Ciudad objCiudad;
    private Empresa objEmpresa;

    public ProyectoCiudadEmpresaDTO() {
    }

    public ProyectoCiudadEmpresaDTO(Proyecto objProyecto, Ciudad objCiudad, Empresa objEmpresa) {
        this.objProyecto = objProyecto;
        this.objCiudad = objCiudad;
        this.objEmpresa = objEmpresa;
    }

    public Proyecto getObjProyecto() {
        return objProyecto;
    }

    public void setObjProyecto(Proyecto objProyecto) {
        this.objProyecto = objProyecto;
    }

    public Ciudad getObjCiudad() {
        return objCiudad;
    }

    public void setObjCiudad(Ciudad objCiudad) {
        this.objCiudad = objCiudad;
    }

    public Empresa getObjEmpresa() {
        return objEmpresa;
    }

    public void setObjEmpresa(Empresa objEmpresa) {
        this.objEmpresa = objEmpresa;
    }
    
    
            
}
