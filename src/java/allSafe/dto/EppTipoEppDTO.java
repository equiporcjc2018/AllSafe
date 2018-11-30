/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import allSafe.Entities.Epp;
import allSafe.Entities.Tipoepp;
import java.io.Serializable;

/**
 *
 * @author hachi
 */
public class EppTipoEppDTO implements Serializable{
    private Epp objEpp;
    private Tipoepp objTipoepp;

    public EppTipoEppDTO() {
    }

    public EppTipoEppDTO(Epp objEpp, Tipoepp objTipoepp) {
        this.objEpp = objEpp;
        this.objTipoepp = objTipoepp;
    }

    public Epp getObjEpp() {
        return objEpp;
    }

    public void setObjEpp(Epp objEpp) {
        this.objEpp = objEpp;
    }

    public Tipoepp getObjTipoepp() {
        return objTipoepp;
    }

    public void setObjTipoepp(Tipoepp objTipoepp) {
        this.objTipoepp = objTipoepp;
    }
    
    
}
