/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author alvarosmh
 */
public class CargoDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idCargo;
    private String descripcionCargo;
    private List<PersonaDTO> personaList;

    public CargoDTO() {
    }

    public CargoDTO(Integer idCargo) {
        this.idCargo = idCargo;
    }

    public CargoDTO(Integer idCargo, String descripcionCargo) {
        this.idCargo = idCargo;
        this.descripcionCargo = descripcionCargo;
    }

    public CargoDTO(Integer idCargo, String descripcionCargo, List<PersonaDTO> personaList) {
        this.idCargo = idCargo;
        this.descripcionCargo = descripcionCargo;
        this.personaList = personaList;
    }

    public Integer getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(Integer idCargo) {
        this.idCargo = idCargo;
    }

    public String getDescripcionCargo() {
        return descripcionCargo;
    }

    public void setDescripcionCargo(String descripcionCargo) {
        this.descripcionCargo = descripcionCargo;
    }

    public List<PersonaDTO> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<PersonaDTO> personaList) {
        this.personaList = personaList;
    }

    
    
}
