/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import allSafe.Entities.Empresa;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author JuanCarlos
 */
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
    
    
            
   public List<Empresa> getEmpresaXID(int idEmpresa) {
        return em.createNamedQuery("Pais.findByIdEmpresa", Empresa.class)
                .setParameter("idEmpresa", idEmpresa)
                .getResultList();
    }
    
}
