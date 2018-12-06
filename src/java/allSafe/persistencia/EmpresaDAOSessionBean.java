/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Empresa;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;

/**
 *
 * @author JuanCarlos
 */
@Stateless
public class EmpresaDAOSessionBean {
 
    
    @PersistenceContext
    EntityManager em;
    
      public List<Empresa> getAllEmpresa()
    {
        return em.createNamedQuery("Empresa.findAll",Empresa.class)
                .getResultList();
    }
    
    public void guardarProyecto (Empresa empresa) throws ControllerException
    {
        em.persist(empresa);
    }
    
    
            
    public Empresa buscaEmpresaXID(int id){
        Empresa infoTallaEmpresaEntidad = null;
        try {
            infoTallaEmpresaEntidad =em.createNamedQuery("Empresa.findByIdEmpresa",Empresa.class)
                    .setParameter("idEmpresa", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }catch(NonUniqueResultException ex){
            throw  ex;
        }
        return infoTallaEmpresaEntidad;
    }
    
}
