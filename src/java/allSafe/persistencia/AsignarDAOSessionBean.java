/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Asignacantidadepp;
import allSafe.Entities.Asignaeppaproyecto;
import allSafe.Entities.Asignatrabajadorproyecto;
import allSafe.Entities.Estadosproyecto;
import allSafe.Entities.Proyecto;
import allSafe.Entities.Tipodecarga;
import allSafe.dto.EppProyectoDTO;
import allSafe.dto.PersonaProyectoDTO;
import allSafe.dto.EppCantidadDTO;
import java.util.List;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Ruben
 */
@Stateless
public class AsignarDAOSessionBean {
    @PersistenceContext
    EntityManager em;
    
    public List<Asignatrabajadorproyecto> getAllAsignaTrabAProy() throws ControllerException{
        
        return em.createNamedQuery("Asignatrabajadorproyecto.findAll", Asignatrabajadorproyecto.class).getResultList();

    }
    public List<Asignaeppaproyecto> getAllAsignaEppAProy() throws ControllerException{
        
        return em.createNamedQuery("Asignaeppaproyecto.findAll", Asignaeppaproyecto.class).getResultList();

    }
    public List<Asignacantidadepp> getAllAsignaCantidadEppAProy() throws ControllerException{
        
        return em.createNamedQuery("Asignacantidadepp.findAll", Asignacantidadepp.class).getResultList();

    }
    public List<Asignacantidadepp> getAllDevolucion() throws ControllerException{
        
        return em.createNamedQuery("Asignacantidadepp.findDevolucion", Asignacantidadepp.class).getResultList();

    }
    
    @TransactionAttribute(TransactionAttributeType.NOT_SUPPORTED)
    public List<Asignacantidadepp> NewEncontarSqlArmado(int codProy) {
        List<Asignacantidadepp> archivosList= null;

        Query query = em.createNamedQuery("Asignacantidadepp.findDevolucion")
        .setParameter("asignaeppaproyectoIdasignaeppaproyecto", codProy);
        //query.setParameter("asignatura", asignatura);
        archivosList= query.getResultList();

        return archivosList;
    }
    @TransactionAttribute(TransactionAttributeType.NOT_SUPPORTED)
    public List<Asignacantidadepp> getEppXidXproy(int codProy,int codEpp) {
        List<Asignacantidadepp> eppXidxProy= null;

        Query query = em.createNamedQuery("Asignacantidadepp.findDevolucionXidXproy")
        .setParameter("asignaeppaproyectoIdasignaeppaproyecto", codProy)
        .setParameter("asignaeppaproyectoIdasignaeppaproyecto2", codEpp);
        //query.setParameter("asignatura", asignatura);
        eppXidxProy= query.getResultList();

        return eppXidxProy;
    }
    
    @TransactionAttribute(TransactionAttributeType.NOT_SUPPORTED)
    public List<Asignacantidadepp> getReasignacion(int codTipoCarga) {
        List<Asignacantidadepp> archivosList2= null;

        //Query query = em.createNamedQuery("Asignacantidadepp.findReasignacion")
          //      .setParameter("tipodecargaIdtipodecarga", codTipoCarga);
        //.setParameter("asignaeppaproyectoIdasignaeppaproyecto", codProy);
        //query.setParameter("asignatura", asignatura);
        //archivosList2= query.getResultList();

       // return archivosList2;
        
        try {
            archivosList2 =em.createNamedQuery("Asignacantidadepp.findReasignaci",Asignacantidadepp.class)
                    .setParameter("tipodecargaIdtipodecarga", codTipoCarga)
                    .getResultList();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return archivosList2;
        
        
    }
    
    public List<Proyecto> getGrafico() throws ControllerException{
        
        return em.createNamedQuery("Proyecto.findAll", Proyecto.class).getResultList();

    }
    public List<Asignacantidadepp> getInventario() throws ControllerException{
        
        return em.createNamedQuery("Asignacantidadepp.findByInventario", Asignacantidadepp.class).getResultList();

    }
    public List<Asignacantidadepp> getAllAsignaCantidadEppAProy2() throws ControllerException{
        
        return em.createNamedQuery("Asignacantidadepp.findByCantidad", Asignacantidadepp.class).getResultList();

    }
    public List<Asignacantidadepp> getGraficoAsignaCantidadEppAProy() throws ControllerException{
        
        return em.createNamedQuery("AsignacantidadeppGrafico.findAll", Asignacantidadepp.class).getResultList();

    }
    
    public void addTrabProy(PersonaProyectoDTO trabProyDTO) throws ControllerException {
        
        Asignatrabajadorproyecto objAsignatrabajadorproyecto = new Asignatrabajadorproyecto();
        
        objAsignatrabajadorproyecto.setProyectoidProyecto(trabProyDTO.getObjProyecto());
        objAsignatrabajadorproyecto.setPersonarutPasaportePersona(trabProyDTO.getObjPersona());
        
        em.persist(objAsignatrabajadorproyecto);
    }
    
    public void addEppProy (EppProyectoDTO eppProyDTO) throws ControllerException{
        Asignaeppaproyecto objAsignaeppaproyecto = new Asignaeppaproyecto();
        objAsignaeppaproyecto.setProyectoidProyecto(eppProyDTO.getObjProyecto());
        objAsignaeppaproyecto.setEppidEPP(eppProyDTO.getObjEpp());
        em.persist(objAsignaeppaproyecto);
    }
    
    public Asignaeppaproyecto buscaAsigEppProyXID(int id){
        Asignaeppaproyecto infoAsignaeppaproyecto = null;
        try {
            infoAsignaeppaproyecto =em.createNamedQuery("Asignaeppaproyecto.findByIdasignaeppaproyecto",Asignaeppaproyecto.class)
                    .setParameter("idasignaeppaproyecto", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoAsignaeppaproyecto;
    }
    
    public Asignaeppaproyecto buscaAsigEppXID(int id, int proy){
        Asignaeppaproyecto infoAsignaeppaproyecto = null;
        try {
            infoAsignaeppaproyecto =em.createNamedQuery("Asignaeppaproyecto.findByEpp",Asignaeppaproyecto.class)
                    .setParameter("eppidEPP", id)
                    .setParameter("proyectoidProyecto", proy)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoAsignaeppaproyecto;
    }
    
    
    
    public Estadosproyecto buscaEstadoProy(int id){
        Estadosproyecto infoEstadosproyecto = null;
        try {
            infoEstadosproyecto =em.createNamedQuery("Estadosproyecto.findByIdEstadosProyecto",Estadosproyecto.class)
                    .setParameter("idEstadosProyecto", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoEstadosproyecto;
    }
    
    public Tipodecarga buscaTipoDeCarga(int id){
        Tipodecarga infoTipodecarga = null;
        try {
            infoTipodecarga =em.createNamedQuery("Tipodecarga.findByIdtipodecarga",Tipodecarga.class)
                    .setParameter("idtipodecarga", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoTipodecarga;
    }
    
    public void addCantidadEpp(EppCantidadDTO objEppCantidadDTO) throws ControllerException {
        
        Asignacantidadepp objAsignacantidadepp = new Asignacantidadepp();
        
        objAsignacantidadepp.setFechaCreacionEppProceso(objEppCantidadDTO.getFecha());
        objAsignacantidadepp.setTallaEppProceso(objEppCantidadDTO.getTalla());
        objAsignacantidadepp.setUnidadEppProceso(objEppCantidadDTO.getUnidad());
        objAsignacantidadepp.setCantidadEppProceso(objEppCantidadDTO.getCantidad());
        objAsignacantidadepp.setPrecioUnitarioEppProceso(objEppCantidadDTO.getPrecio());
        objAsignacantidadepp.setEstadosProyectoidEstadosProyecto(objEppCantidadDTO.getObjEstadosproyecto());
        objAsignacantidadepp.setTipodecargaIdtipodecarga(objEppCantidadDTO.getObjTipodecarga());
        objAsignacantidadepp.setAsignaeppaproyectoIdasignaeppaproyecto(objEppCantidadDTO.getObjAsignaeppaproyecto());
        
        
        em.persist(objAsignacantidadepp);
    }
    
    
    public Asignatrabajadorproyecto findAsignatrabajadorproyectoById(int idAsignacion){
        Asignatrabajadorproyecto asignacion = null;
        try {
            asignacion =em.createNamedQuery("Asignatrabajadorproyecto.findByIdasignatrabajadorproyecto",Asignatrabajadorproyecto.class)
                    .setParameter("idasignatrabajadorproyecto", idAsignacion)
                    .getSingleResult();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return asignacion;
    }
    
    public Asignaeppaproyecto findAsignaeppaproyectoById(int idAsignacion){
        Asignaeppaproyecto asignacion = null;
        try {
            asignacion =em.createNamedQuery("Asignaeppaproyecto.findById",Asignaeppaproyecto.class)
                    .setParameter("idasignaeppaproyecto", idAsignacion)
                    .getSingleResult();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return asignacion;
    }
    
    
    public Asignatrabajadorproyecto cambiarVigenciaAsigProyTrab(int idAsignacion)
    {
        Asignatrabajadorproyecto asignacion = findAsignatrabajadorproyectoById(idAsignacion);
        if(null != asignacion){
            if (asignacion.isVigente())
            {
                asignacion.setVigencia("N");
            }
            else
            {
                asignacion.setVigencia("Y");
            }
        }
        em.merge(asignacion);
        return asignacion;
    }
    
    public Asignaeppaproyecto cambiarVigenciaAsigProyEpp(int idAsignacion)
    {
        Asignaeppaproyecto asignacion = findAsignaeppaproyectoById(idAsignacion);
        if(null != asignacion){
            if (asignacion.isVigente())
            {
                asignacion.setVigencia("N");
            }
            else
            {
                asignacion.setVigencia("Y");
            }
        }
        em.merge(asignacion);
        return asignacion;
    }
    
}
