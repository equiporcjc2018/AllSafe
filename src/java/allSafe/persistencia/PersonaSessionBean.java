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
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
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
    
    public Persona buscaPersonaXRut(String rut){
        Persona infoPersonaEntidad = null;
        try {
            infoPersonaEntidad =em.createNamedQuery("Persona.findByRutPasaportePersona",Persona.class)
                    .setParameter("rutPasaportePersona", rut)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoPersonaEntidad;
    }
    
   
    public List<Persona> buscaPersonaXRut2(String rut) {
        try {
                return em.createNamedQuery("Persona.findByRutPasaportePersona", Persona.class)
                .setParameter("rutPasaportePersona", rut)
                .getResultList();
                
            } catch (NoResultException ex) {
                return null;
            }catch(NonUniqueResultException ex)
                {
                    throw ex;
                }
        
    }
    
}
