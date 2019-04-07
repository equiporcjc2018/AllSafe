/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Proyecto;
import allSafe.dto.ProyectoCiudadEmpresaDTO;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;

@Stateless
public class ProyectoDAOSessionBean {
    
    @PersistenceContext
    EntityManager em;
    
      public List<Proyecto> getAllProyecto()
    {
        return em.createNamedQuery("Proyecto.findAll",Proyecto.class)
                .getResultList();
    }
    
    public void guardarProyecto (ProyectoCiudadEmpresaDTO pceDTO) throws ControllerException
    {
        Proyecto objProyecto = new Proyecto();
        objProyecto.setNumeroProyecto(pceDTO.getObjProyecto().getNumeroProyecto());
        objProyecto.setNombreProyecto(pceDTO.getObjProyecto().getNombreProyecto());
        objProyecto.setUbicacionProyecto(pceDTO.getObjProyecto().getUbicacionProyecto());
        objProyecto.setFechaInicioProyecto(pceDTO.getObjProyecto().getFechaInicioProyecto());
        objProyecto.setFechaTerminoProyecto(pceDTO.getObjProyecto().getFechaTerminoProyecto());
        objProyecto.setCiudadidCiudad(pceDTO.getObjCiudad());
        objProyecto.setEmpresaidEmpresa(pceDTO.getObjEmpresa());
        objProyecto.setVigencia(pceDTO.getObjProyecto().getVigencia());
        em.persist(objProyecto);
    }
    
    public Proyecto buscaProyectoXID(int id){
        Proyecto infoProyectoEntidad = null;
        try {
            infoProyectoEntidad =em.createNamedQuery("Proyecto.findByIdProyecto",Proyecto.class)
                    .setParameter("idProyecto", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoProyectoEntidad;
    }
    
}
