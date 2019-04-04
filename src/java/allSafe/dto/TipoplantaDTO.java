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
public class TipoplantaDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idTipoPlanta;
    private String descripcionTipoPlanta;
    private List<PersonaDTO> personaList;

    public TipoplantaDTO() {
    }

    public TipoplantaDTO(Integer idTipoPlanta) {
        this.idTipoPlanta = idTipoPlanta;
    }

    public TipoplantaDTO(Integer idTipoPlanta, String descripcionTipoPlanta) {
        this.idTipoPlanta = idTipoPlanta;
        this.descripcionTipoPlanta = descripcionTipoPlanta;
    }

    public Integer getIdTipoPlanta() {
        return idTipoPlanta;
    }

    public void setIdTipoPlanta(Integer idTipoPlanta) {
        this.idTipoPlanta = idTipoPlanta;
    }

    public String getDescripcionTipoPlanta() {
        return descripcionTipoPlanta;
    }

    public void setDescripcionTipoPlanta(String descripcionTipoPlanta) {
        this.descripcionTipoPlanta = descripcionTipoPlanta;
    }

    public List<PersonaDTO> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<PersonaDTO> personaList) {
        this.personaList = personaList;
    }

    public TipoplantaDTO(Integer idTipoPlanta, String descripcionTipoPlanta, List<PersonaDTO> personaList) {
        this.idTipoPlanta = idTipoPlanta;
        this.descripcionTipoPlanta = descripcionTipoPlanta;
        this.personaList = personaList;
    }

    
}
