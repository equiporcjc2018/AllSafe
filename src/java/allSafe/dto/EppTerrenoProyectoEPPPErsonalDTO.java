/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import allSafe.Entities.Epp;
import allSafe.Entities.Eppterreno;
import allSafe.Entities.Persona;
import allSafe.Entities.Proyecto;
import java.io.Serializable;

/**
 *
 * @author Ruben
 */
public class EppTerrenoProyectoEPPPErsonalDTO implements Serializable{
    private Eppterreno objEppterreno;
    private Proyecto objProyecto;
    private Epp objEpp;
    private Persona objPersona;

    public EppTerrenoProyectoEPPPErsonalDTO() {
        
    }
    public EppTerrenoProyectoEPPPErsonalDTO(Eppterreno objEppterreno, Proyecto objProyecto, Epp objEpp, Persona objPersona) {
        this.objEppterreno = objEppterreno;
        this.objProyecto = objProyecto;
        this.objEpp = objEpp;
        this.objPersona = objPersona;
    }

    public Eppterreno getObjEppterreno() {
        return objEppterreno;
    }

    public void setObjEppterreno(Eppterreno objEppterreno) {
        this.objEppterreno = objEppterreno;
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
    
    
    
}
