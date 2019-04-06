/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;


import allSafe.Entities.Parametro;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ruben
 */
@Stateless
public class ParametroBean {


    @PersistenceContext
    private EntityManager em;

    public List<Parametro> getAll() {
        return em.createNamedQuery("Parametro.findAll", Parametro.class).getResultList();
    }
    
    public Parametro findByLlave(int llave) {
        Parametro parametro = null;
        try {
            parametro = this.em.createNamedQuery("Parametro.findByLlave", Parametro.class)
                    .setParameter("llave", llave)
                    .getSingleResult();
        } catch (NoResultException ex) {
            ex.printStackTrace();

        } catch (NonUniqueResultException ex2) {
            ex2.printStackTrace();
        }
        return parametro;
    }
    
    public Parametro findById(int id) {
        Parametro parametro = null;
        try {
            parametro = em.createNamedQuery("Parametro.findByIdParametro", Parametro.class)
                    .setParameter("idParametro", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            ex.printStackTrace();
        } catch (NonUniqueResultException ex) {
            ex.printStackTrace();
        }
        return parametro;
    }
    
    public Parametro addParametro(Parametro parametro) {
        try{
            if(null != parametro){
                em.persist(parametro);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return parametro;
    }
    
    public boolean deleteParametro(Parametro parametro) {
        try{
            em.remove(parametro);
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    public String getValorByParamLlave(int llave) {
        Parametro parametro = null;
        try {
            parametro = this.em.createNamedQuery("Parametro.findByLlave", Parametro.class)
                    .setParameter("llave", llave)
                    .getSingleResult();
        } catch (NoResultException ex) {
            ex.printStackTrace();

        } catch (NonUniqueResultException ex2) {
            ex2.printStackTrace();
        }
        if(null != parametro){
            return parametro.getValor();
        }else{
            return "";
        }
        
        
    }
}
