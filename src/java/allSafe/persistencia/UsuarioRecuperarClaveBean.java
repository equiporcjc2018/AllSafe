/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;


import allSafe.Entities.UsuarioClaveHistorial;
import allSafe.Entities.UsuarioClaveRecuperar;
import allSafe.Entities.Usuarioallsafe;
import allSafe.dto.UsuarioDTO;
import allSafe.util.Constantes;
import allSafe.util.Utilidades;
import java.security.SecureRandom;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.*;  
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;  
import javax.mail.internet.*;  

/**
 *
 * @author Ruben
 */
@Stateless
public class UsuarioRecuperarClaveBean {


    @PersistenceContext
    private EntityManager em;

    public Usuarioallsafe validaUsuario(String login, String password) {
        Usuarioallsafe objUsuario = null;

        try {
            objUsuario = this.em.createNamedQuery("Usuarioallsafe.validaUsuario", Usuarioallsafe.class)
                    .setParameter("loginUsuarioAllSafe", login)
                    .setParameter("passUsuarioAllSafe", password)
                    .getSingleResult();
        } catch (PersistenceException ex) {
            System.out.println("Error nro:" + ex.getMessage());
        }
        return objUsuario;
    }

    public List<Usuarioallsafe> getAllUser() {
        return em.createNamedQuery("Usuarioallsafe.findAll", Usuarioallsafe.class).getResultList();

    }
    
    public List<UsuarioClaveHistorial> getAllHistorial() {
        return em.createNamedQuery("UsuarioClaveHistorial.findAll", UsuarioClaveHistorial.class).getResultList();
    }
    
    
    public List<UsuarioClaveHistorial> getAllActivePasswordsByUser(Usuarioallsafe usuario) {
        return em.createNamedQuery("UsuarioClaveHistorial.findActivaByIdUsuario", UsuarioClaveHistorial.class)
                
                .setParameter("id", usuario.getIdUsuarioAllSafe())
                .setParameter("estado", "A")
                .getResultList();
    }
    
    public Usuarioallsafe getValidaUser(String user) {
        Usuarioallsafe objUsuario = null;

        try {
            objUsuario = this.em.createNamedQuery("Usuarioallsafe.findByLoginUsuarioAllSafe", Usuarioallsafe.class)
                    .setParameter("loginUsuarioAllSafe", user)
                    .getSingleResult();
        } catch (NoResultException ex) {
            System.out.println("Error nro:" + ex.getMessage());
            return null;

        } catch (NonUniqueResultException ex2) {
            System.out.println("Error nro:" + ex2.getMessage());
            return null;
        }
        return objUsuario;
    }
    
    public Usuarioallsafe buscaUsuarioXCodigo(int codigo) {
        Usuarioallsafe infoUsuario = null;
        try {
            infoUsuario = em.createNamedQuery("Usuarioallsafe.findByIdUsuarioAllSafe", Usuarioallsafe.class)
                    .setParameter("idUsuario", codigo)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        } catch (NonUniqueResultException ex) {
            throw ex;
        }
        return infoUsuario;
    }
    
    private String generarCodigoRecuperacionClave(){
        
        String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        SecureRandom rnd = new SecureRandom();

        StringBuilder sb = new StringBuilder( 50 );
        for( int i = 0; i < 50; i++ ){
            sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
        }
        return sb.toString();        
    }
    
    public int addCodigoRecuperacionYEnviarCorreo(String username) {
        int result = -1;
        UsuarioClaveRecuperar ucr = addCodigoRecuperacion(username);
        System.out.println("Codigo creado");
        if(null != ucr){
            try {
                result = sendEmailToUser(ucr.getUsuario(), ucr);
            } catch (MessagingException ex) {
                result = -3;
                Logger.getLogger(UsuarioRecuperarClaveBean.class.getName()).log(Level.SEVERE, null, ex);
                deleteCodigoRecuperacion(ucr);
            }
        }
        return result;
    }
    
    private int sendEmailToUser(Usuarioallsafe usuario, UsuarioClaveRecuperar ucr) throws AddressException, MessagingException {
        int result = -1;
        Properties mailServerProperties;
	Session getMailSession;
	MimeMessage generateMailMessage;     
        
        System.out.println("Enviando mail");
        mailServerProperties = System.getProperties();
        mailServerProperties.put("mail.smtp.port", "587");
        mailServerProperties.put("mail.smtp.auth", "true");
        mailServerProperties.put("mail.smtp.starttls.enable", "true");

        getMailSession = Session.getDefaultInstance(mailServerProperties, null);
        generateMailMessage = new MimeMessage(getMailSession);
        generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(usuario.getPersonarutPasaportePersona().getCorreoPersona()));
        generateMailMessage.setSubject(Constantes.asuntoCorreoRecuperacion);
        String emailBody = Utilidades.generarCuerpoCorreoRecuperacion(ucr, usuario);
        generateMailMessage.setContent(emailBody, "text/html");

        Transport transport = getMailSession.getTransport("smtp");

        result = -2;
        transport.connect("smtp.gmail.com", Constantes.correoRecuperacion, Constantes.claveRecuperacion);
        transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
        transport.close();
        result = 0;
        return result;
    }
    
    public UsuarioClaveRecuperar addCodigoRecuperacion(String username) {
        UsuarioClaveRecuperar ucr = null;
        try{
            Usuarioallsafe usuario = this.getValidaUser(username);
            if(null != usuario){
                ucr = new UsuarioClaveRecuperar();
                ucr.setCodigo(generarCodigoRecuperacionClave());
                ucr.setUsuario(usuario);
                ucr.setIdUsuarioClaveRecuperar(ucr.getUsuario().getIdUsuarioAllSafe());
                System.out.println(ucr.toString()); 

                em.persist(ucr);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return ucr;
    }
    
    public boolean deleteCodigoRecuperacion(UsuarioClaveRecuperar ucr) {
        try{
            em.remove(ucr);
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    //TODO
    public boolean validarCodigoRecuperacionClave(String codigo, Integer idUsuario){
        boolean resultado = false;
        try {
            UsuarioClaveRecuperar ucr = em.createNamedQuery("UsuarioClaveRecuperar.findByCodigoAndIdUsuario", UsuarioClaveRecuperar.class)
                    .setParameter("id", idUsuario)
                    .setParameter("codigo", codigo)
                    .getSingleResult();
            if(null != ucr){
                long milisegundosDeUnDia = 24 * 60 * 60 * 1000L;
                System.out.println("new date "+new Date().getTime());
                boolean vigenciaCodigo = Math.abs(ucr.getFecha().getTime() - new Date().getTime()) < milisegundosDeUnDia;
                System.out.println("Codigo vigente: "+vigenciaCodigo);
                resultado = vigenciaCodigo;
            }
        } catch (NoResultException ex) {
            ex.printStackTrace();
        } catch (NonUniqueResultException ex) {
            throw ex;
        }
        return resultado;
    }
    
    public boolean addHistorialClave(Usuarioallsafe user){
        boolean result = false;
        UsuarioClaveHistorial uch = new UsuarioClaveHistorial();
        
        uch.setEstado("A");
        uch.setIdUsuarioClaveHistorial(user.getIdUsuarioAllSafe());
        uch.setUsuario(user);
        uch.setClave(user.getPassUsuarioAllSafe());
        
        try{
            em.persist(uch); 
        }catch (ConstraintViolationException ex) {
        // Aqui tira los errores de constraint
            for (ConstraintViolation actual : ex.getConstraintViolations()) {
                System.out.println(actual.toString());
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
    
    public int desactivarTodasLasClavesDelHistorial(Usuarioallsafe user){
        int result = -1;
        try{
            for(UsuarioClaveHistorial clave : this.getAllActivePasswordsByUser(user)){
                clave.setEstado("I");
                em.merge(clave);
            }
        result = 0;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }

}
