/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import allSafe.Entities.Cargo;
import allSafe.Entities.Persona;
import allSafe.Entities.Tallaoberol;
import allSafe.Entities.Tallapantalon;
import allSafe.Entities.Tallapoleracamisa;
import allSafe.Entities.Tallazapato;
import allSafe.Entities.Tipoplanta;
import java.io.Serializable;

/**
 *
 * @author hachi
 */
public class PersonaCargoTipoPlantaOberolPantalonPoleraZapatoDTO implements Serializable{
     private Persona objPersona;
     private Cargo objCargo;
     private Tipoplanta objTipoplanta;
     private Tallaoberol objTallaoberol;
     private Tallapantalon objTallapantalon;
     private Tallapoleracamisa objTallapoleracamisa;
     private Tallazapato objTallazapato;

    public PersonaCargoTipoPlantaOberolPantalonPoleraZapatoDTO() {
    }

    public PersonaCargoTipoPlantaOberolPantalonPoleraZapatoDTO(Persona objPersona, Cargo objCargo, Tipoplanta objTipoplanta, Tallaoberol objTallaoberol, Tallapantalon objTallapantalon, Tallapoleracamisa objTallapoleracamisa, Tallazapato objTallazapato) {
        this.objPersona = objPersona;
        this.objCargo = objCargo;
        this.objTipoplanta = objTipoplanta;
        this.objTallaoberol = objTallaoberol;
        this.objTallapantalon = objTallapantalon;
        this.objTallapoleracamisa = objTallapoleracamisa;
        this.objTallazapato = objTallazapato;
    }

    public Persona getObjPersona() {
        return objPersona;
    }

    public void setObjPersona(Persona objPersona) {
        this.objPersona = objPersona;
    }

    public Cargo getObjCargo() {
        return objCargo;
    }

    public void setObjCargo(Cargo objCargo) {
        this.objCargo = objCargo;
    }

    public Tipoplanta getObjTipoplanta() {
        return objTipoplanta;
    }

    public void setObjTipoplanta(Tipoplanta objTipoplanta) {
        this.objTipoplanta = objTipoplanta;
    }

    public Tallaoberol getObjTallaoberol() {
        return objTallaoberol;
    }

    public void setObjTallaoberol(Tallaoberol objTallaoberol) {
        this.objTallaoberol = objTallaoberol;
    }

    public Tallapantalon getObjTallapantalon() {
        return objTallapantalon;
    }

    public void setObjTallapantalon(Tallapantalon objTallapantalon) {
        this.objTallapantalon = objTallapantalon;
    }

    public Tallapoleracamisa getObjTallapoleracamisa() {
        return objTallapoleracamisa;
    }

    public void setObjTallapoleracamisa(Tallapoleracamisa objTallapoleracamisa) {
        this.objTallapoleracamisa = objTallapoleracamisa;
    }

    public Tallazapato getObjTallazapato() {
        return objTallazapato;
    }

    public void setObjTallazapato(Tallazapato objTallazapato) {
        this.objTallazapato = objTallazapato;
    }
     
     
}
