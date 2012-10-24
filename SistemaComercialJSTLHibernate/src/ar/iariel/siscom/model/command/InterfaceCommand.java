package ar.iariel.siscom.model.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @author Ariel Duarte
 * 
 *
 */
public interface InterfaceCommand {
	String execute(HttpServletRequest request, HttpServletResponse response);
}
