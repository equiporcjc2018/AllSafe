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
public class TallazapatoDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    private Integer idTallaZapato;
    private int numeroZapato;
    private List<PersonaDTO> personaList;

    public TallazapatoDTO() {
    }

    public TallazapatoDTO(Integer idTallaZapato) {
        this.idTallaZapato = idTallaZapato;
    }

    public TallazapatoDTO(Integer idTallaZapato, int numeroZapato) {
        this.idTallaZapato = idTallaZapato;
        this.numeroZapato = numeroZapato;
    }

    public Integer getIdTallaZapato() {
        return idTallaZapato;
    }

    public void setIdTallaZapato(Integer idTallaZapato) {
        this.idTallaZapato = idTallaZapato;
    }

    public int getNumeroZapato() {
        return numeroZapato;
    }

    public void setNumeroZapato(int numeroZapato) {
        this.numeroZapato = numeroZapato;
    }

    public List<PersonaDTO> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<PersonaDTO> personaList) {
        this.personaList = personaList;
    }

    public TallazapatoDTO(Integer idTallaZapato, int numeroZapato, List<PersonaDTO> personaList) {
        this.idTallaZapato = idTallaZapato;
        this.numeroZapato = numeroZapato;
        this.personaList = personaList;
    }

    
}
