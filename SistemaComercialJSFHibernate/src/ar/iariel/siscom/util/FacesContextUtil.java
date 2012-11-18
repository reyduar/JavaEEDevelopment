/**
 * 
 */
package ar.iariel.siscom.util;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.webapp.FacesServlet;

import org.hibernate.classic.Session;

/**
 * @author Ariel Duarte
 *
 */
public class FacesContextUtil {

	private static final String HIBERNATE_SESSION = "hibernate_session";
	
	//-- Metodo que recibe una session de hibernate --//
	public static void setRequestSession(Session session){
		FacesContext.getCurrentInstance().getExternalContext().getRequestMap().put(HIBERNATE_SESSION, session);
	}
	
	//-- Metodo que administra las sessiones de hibernate --//
	public static Session getRequestSession(){
		return (Session) FacesContext.getCurrentInstance().getExternalContext().getRequestMap().get(HIBERNATE_SESSION);
	}

	//-- Metodo para adicionar mensajes personalizados al faces contex --//
	public static void setMessageError(String msg) {
		FacesMessage fm = new FacesMessage(FacesMessage.SEVERITY_FATAL,msg,msg);
		FacesContext.getCurrentInstance().addMessage(null, fm);
		
	}
	
	
}
