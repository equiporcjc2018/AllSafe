/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import allSafe.Entities.Epp;
import allSafe.Entities.Eppproceso;
import allSafe.Entities.Estadosproyecto;
import allSafe.Entities.Persona;
import allSafe.Entities.Proyecto;
import java.io.Serializable;

/**
 *
 * @author hachi
 */
public class EppProcesoProyectoEPPPersonaEstadoProyectoDTO implements Serializable{
    
    private Eppproceso objEppproceso;
    private Proyecto objProyecto;
    private Epp objEpp;
    private Persona objPersona;
    private Estadosproyecto objEstadosproyecto;

    public EppProcesoProyectoEPPPersonaEstadoProyectoDTO() {
    }

    public EppProcesoProyectoEPPPersonaEstadoProyectoDTO(Eppproceso objEppproceso, Proyecto objProyecto, Epp objEpp, Persona objPersona, Estadosproyecto objEstadosproyecto) {
        this.objEppproceso = objEppproceso;
        this.objProyecto = objProyecto;
        this.objEpp = objEpp;
        this.objPersona = objPersona;
        this.objEstadosproyecto = objEstadosproyecto;
    }

    public Eppproceso getObjEppproceso() {
        return objEppproceso;
    }

    public void setObjEppproceso(Eppproceso objEppproceso) {
        this.objEppproceso = objEppproceso;
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

    public Persona getObjPersona() {
        return objPersona;
    }

    public void setObjPersona(Persona objPersona) {
        this.objPersona = objPersona;
    }

    public Estadosproyecto getObjEstadosproyecto() {
        return objEstadosproyecto;
    }

    public void setObjEstadosproyecto(Estadosproyecto objEstadosproyecto) {
        this.objEstadosproyecto = objEstadosproyecto;
    }
    
    
}
