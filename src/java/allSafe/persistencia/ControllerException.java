/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.persistencia;

import javax.ejb.ApplicationException;

/**
 *
 * @author Ignacio
 */

@ApplicationException(rollback = true)
public class ControllerException extends Exception{
    public ControllerException(String msg) {
        super(msg);
    }
    
}
