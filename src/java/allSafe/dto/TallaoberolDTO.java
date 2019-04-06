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
public class TallaoberolDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idTallaOberol;
    private int numeroTallaOberol;
    private String letraTallaOberol;
    private List<PersonaDTO> personaList;

    public TallaoberolDTO() {
    }

    public TallaoberolDTO(Integer idTallaOberol) {
        this.idTallaOberol = idTallaOberol;
    }

    public TallaoberolDTO(Integer idTallaOberol, int numeroTallaOberol, String letraTallaOberol) {
        this.idTallaOberol = idTallaOberol;
        this.numeroTallaOberol = numeroTallaOberol;
        this.letraTallaOberol = letraTallaOberol;
    }

    public TallaoberolDTO(Integer idTallaOberol, int numeroTallaOberol, String letraTallaOberol, List<PersonaDTO> personaList) {
        this.idTallaOberol = idTallaOberol;
        this.numeroTallaOberol = numeroTallaOberol;
        this.letraTallaOberol = letraTallaOberol;
        this.personaList = personaList;
    }

    public Integer getIdTallaOberol() {
        return idTallaOberol;
    }

    public void setIdTallaOberol(Integer idTallaOberol) {
        this.idTallaOberol = idTallaOberol;
    }

    public int getNumeroTallaOberol() {
        return numeroTallaOberol;
    }

    public void setNumeroTallaOberol(int numeroTallaOberol) {
        this.numeroTallaOberol = numeroTallaOberol;
    }

    public String getLetraTallaOberol() {
        return letraTallaOberol;
    }

    public void setLetraTallaOberol(String letraTallaOberol) {
        this.letraTallaOberol = letraTallaOberol;
    }

    public List<PersonaDTO> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<PersonaDTO> personaList) {
        this.personaList = personaList;
    }

}
