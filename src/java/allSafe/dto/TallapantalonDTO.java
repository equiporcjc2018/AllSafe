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
 * @author hachi
 */
public class TallapantalonDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idTallaPantalon;
    private int numeroTallaPantalon;
    private String letraTallaPantalon;
    private List<PersonaDTO> personaList;

    public TallapantalonDTO() {
    }

    public TallapantalonDTO(Integer idTallaPantalon) {
        this.idTallaPantalon = idTallaPantalon;
    }

    public TallapantalonDTO(Integer idTallaPantalon, int numeroTallaPantalon, String letraTallaPantalon) {
        this.idTallaPantalon = idTallaPantalon;
        this.numeroTallaPantalon = numeroTallaPantalon;
        this.letraTallaPantalon = letraTallaPantalon;
    }

    public Integer getIdTallaPantalon() {
        return idTallaPantalon;
    }

    public void setIdTallaPantalon(Integer idTallaPantalon) {
        this.idTallaPantalon = idTallaPantalon;
    }

    public int getNumeroTallaPantalon() {
        return numeroTallaPantalon;
    }

    public void setNumeroTallaPantalon(int numeroTallaPantalon) {
        this.numeroTallaPantalon = numeroTallaPantalon;
    }

    public String getLetraTallaPantalon() {
        return letraTallaPantalon;
    }

    public void setLetraTallaPantalon(String letraTallaPantalon) {
        this.letraTallaPantalon = letraTallaPantalon;
    }

    public List<PersonaDTO> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<PersonaDTO> personaList) {
        this.personaList = personaList;
    }

    public TallapantalonDTO(Integer idTallaPantalon, int numeroTallaPantalon, String letraTallaPantalon, List<PersonaDTO> personaList) {
        this.idTallaPantalon = idTallaPantalon;
        this.numeroTallaPantalon = numeroTallaPantalon;
        this.letraTallaPantalon = letraTallaPantalon;
        this.personaList = personaList;
    }

}
