/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import java.io.Serializable;

/**
 *
 * @author alvarosmh
 */
public class AsignatrabajadorproyectoDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idasignatrabajadorproyecto;
    private PersonaDTO personarutPasaportePersona;
    private ProyectoDTO proyectoidProyecto;

    public AsignatrabajadorproyectoDTO(Integer idasignatrabajadorproyecto) {
        this.idasignatrabajadorproyecto = idasignatrabajadorproyecto;
    }

    public AsignatrabajadorproyectoDTO(Integer idasignatrabajadorproyecto, PersonaDTO personarutPasaportePersona, ProyectoDTO proyectoidProyecto) {
        this.idasignatrabajadorproyecto = idasignatrabajadorproyecto;
        this.personarutPasaportePersona = personarutPasaportePersona;
        this.proyectoidProyecto = proyectoidProyecto;
    }

    public Integer getIdasignatrabajadorproyecto() {
        return idasignatrabajadorproyecto;
    }

    public void setIdasignatrabajadorproyecto(Integer idasignatrabajadorproyecto) {
        this.idasignatrabajadorproyecto = idasignatrabajadorproyecto;
    }

    public PersonaDTO getPersonarutPasaportePersona() {
        return personarutPasaportePersona;
    }

    public void setPersonarutPasaportePersona(PersonaDTO personarutPasaportePersona) {
        this.personarutPasaportePersona = personarutPasaportePersona;
    }

    public ProyectoDTO getProyectoidProyecto() {
        return proyectoidProyecto;
    }

    public void setProyectoidProyecto(ProyectoDTO proyectoidProyecto) {
        this.proyectoidProyecto = proyectoidProyecto;
    }

    public AsignatrabajadorproyectoDTO() {
    }

}
