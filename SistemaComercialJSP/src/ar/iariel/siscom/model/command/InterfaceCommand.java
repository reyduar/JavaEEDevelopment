package ar.iariel.siscom.model.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Ariel Duarte
 * date: 12/08/2012
 */
public interface InterfaceCommand {
	// -- Se encargara de responder peticiones del protocolo HTTP --//
	public String execute(HttpServletRequest request, HttpServletResponse response);
}
