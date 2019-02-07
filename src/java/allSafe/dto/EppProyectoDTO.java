/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import allSafe.Entities.Asignaeppaproyecto;
import allSafe.Entities.Epp;
import allSafe.Entities.Proyecto;
import java.io.Serializable;

/**
 *
 * @author Ruben
 */
public class EppProyectoDTO implements Serializable{
    private Asignaeppaproyecto objAsignaeppaproyecto;
    private Proyecto objProyecto;
    private Epp objEpp;

    public EppProyectoDTO() {
    }

    public EppProyectoDTO(Asignaeppaproyecto objAsignaeppaproyecto, Proyecto objProyecto, Epp objEpp) {
        this.objAsignaeppaproyecto = objAsignaeppaproyecto;
        this.objProyecto = objProyecto;
        this.objEpp = objEpp;
    }

    public Asignaeppaproyecto getObjAsignaeppaproyecto() {
        return objAsignaeppaproyecto;
    }

    public void setObjAsignaeppaproyecto(Asignaeppaproyecto objAsignaeppaproyecto) {
        this.objAsignaeppaproyecto = objAsignaeppaproyecto;
    }

    public Proyecto getObjProyecto() {
        return objProyecto;
    }

    public void setObjProyecto(Proyecto objProyecto) {
        this.objProyecto = objProyecto;
    }

    public Epp getObjEpp() {
        return objEpp;
    }

    public void setObjEpp(Epp objEpp) {
        this.objEpp = objEpp;
    }
    
    
}
