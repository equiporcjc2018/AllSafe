/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import allSafe.Entities.Asignatrabajadorproyecto;
import allSafe.Entities.Persona;
import allSafe.Entities.Proyecto;
import java.io.Serializable;

/**
 *
 * @author Ruben
 */
public class PersonaProyectoDTO implements Serializable{
    private Asignatrabajadorproyecto objTrabAProy;
    private Proyecto objProyecto;
    private Persona objPersona;

    public PersonaProyectoDTO() {
    }

    public PersonaProyectoDTO(Asignatrabajadorproyecto objTrabAProy, Proyecto objProyecto, Persona objPersona) {
        this.objTrabAProy = objTrabAProy;
        this.objProyecto = objProyecto;
        this.objPersona = objPersona;
    }

    public Asignatrabajadorproyecto getObjTrabAProy() {
        return objTrabAProy;
    }

    public void setObjTrabAProy(Asignatrabajadorproyecto objTrabAProy) {
        this.objTrabAProy = objTrabAProy;
    }

    public Proyecto getObjProyecto() {
        return objProyecto;
    }

    public void setObjProyecto(Proyecto objProyecto) {
        this.objProyecto = objProyecto;
    }

    public Persona getObjPersona() {
        return objPersona;
    }

    public void setObjPersona(Persona objPersona) {
        this.objPersona = objPersona;
    }
    
    
}
