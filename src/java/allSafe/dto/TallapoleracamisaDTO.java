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
public class TallapoleracamisaDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    private Integer idTallaPoleraCamisa;
    private int numeroPoleraCamisa;
    private String letraPoleraCamisa;
    private List<PersonaDTO> personaList;

    public TallapoleracamisaDTO() {
    }

    public TallapoleracamisaDTO(Integer idTallaPoleraCamisa) {
        this.idTallaPoleraCamisa = idTallaPoleraCamisa;
    }

    public TallapoleracamisaDTO(Integer idTallaPoleraCamisa, int numeroPoleraCamisa, String letraPoleraCamisa) {
        this.idTallaPoleraCamisa = idTallaPoleraCamisa;
        this.numeroPoleraCamisa = numeroPoleraCamisa;
        this.letraPoleraCamisa = letraPoleraCamisa;
    }

    public Integer getIdTallaPoleraCamisa() {
        return idTallaPoleraCamisa;
    }

    public void setIdTallaPoleraCamisa(Integer idTallaPoleraCamisa) {
        this.idTallaPoleraCamisa = idTallaPoleraCamisa;
    }

    public int getNumeroPoleraCamisa() {
        return numeroPoleraCamisa;
    }

    public void setNumeroPoleraCamisa(int numeroPoleraCamisa) {
        this.numeroPoleraCamisa = numeroPoleraCamisa;
    }

    public String getLetraPoleraCamisa() {
        return letraPoleraCamisa;
    }

    public void setLetraPoleraCamisa(String letraPoleraCamisa) {
        this.letraPoleraCamisa = letraPoleraCamisa;
    }

    public List<PersonaDTO> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<PersonaDTO> personaList) {
        this.personaList = personaList;
    }

    public TallapoleracamisaDTO(Integer idTallaPoleraCamisa, int numeroPoleraCamisa, String letraPoleraCamisa, List<PersonaDTO> personaList) {
        this.idTallaPoleraCamisa = idTallaPoleraCamisa;
        this.numeroPoleraCamisa = numeroPoleraCamisa;
        this.letraPoleraCamisa = letraPoleraCamisa;
        this.personaList = personaList;
    }

    
}
