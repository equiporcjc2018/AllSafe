/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Persona;
import allSafe.dto.PersonaCargoTipoPlantaOberolPantalonPoleraZapatoDTO;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author hachi
 */
@Stateless
public class PersonaSessionBean {

    @PersistenceContext
    EntityManager em;

    public List<Persona> getAllPersonas() throws ControllerException {
        Persona objPersona = null;
        return em.createNamedQuery("Persona.findAll", Persona.class).getResultList();

    }
    
    public void addPerdona(PersonaCargoTipoPlantaOberolPantalonPoleraZapatoDTO pctpoppzDTO) throws ControllerException {
        Persona objPersona = new Persona();
        objPersona.setRutPasaportePersona(pctpoppzDTO.getObjPersona().getRutPasaportePersona());
        objPersona.setNombresPersona(pctpoppzDTO.getObjPersona().getNombresPersona());
        objPersona.setApePatPersona(pctpoppzDTO.getObjPersona().getApePatPersona());
        objPersona.setApeMatPersona(pctpoppzDTO.getObjPersona().getApeMatPersona());
        objPersona.setFechaNacPersona(pctpoppzDTO.getObjPersona().getFechaNacPersona());
        objPersona.setNacionalidadPersona(pctpoppzDTO.getObjPersona().getNacionalidadPersona());
        objPersona.setCorreoPersona(pctpoppzDTO.getObjPersona().getCorreoPersona());
        objPersona.setCargoidCargo(pctpoppzDTO.getObjCargo());
        objPersona.setTipoPlantaidTipoPlanta(pctpoppzDTO.getObjTipoplanta());
        objPersona.setTallaOberolidTallaOberol(pctpoppzDTO.getObjTallaoberol());
        objPersona.setTallaPantalonidTallaPantalon(pctpoppzDTO.getObjTallapantalon());
        objPersona.setTallaPoleraCamisaidtallaPoleraCamisa(pctpoppzDTO.getObjTallapoleracamisa());
        objPersona.setTallaZApatoidtallaZApato(pctpoppzDTO.getObjTallazapato());
        em.persist(objPersona);
    }
}
