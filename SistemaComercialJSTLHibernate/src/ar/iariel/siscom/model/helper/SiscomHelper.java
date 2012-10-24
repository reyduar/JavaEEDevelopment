package ar.iariel.siscom.model.helper;

import javax.servlet.http.HttpServletRequest;

import ar.iariel.siscom.model.command.ActualizarProveedor;
import ar.iariel.siscom.model.command.ConsultarProveedor;
import ar.iariel.siscom.model.command.EliminarProveedor;
import ar.iariel.siscom.model.command.InterfaceCommand;
import ar.iariel.siscom.model.command.RegistrarProveedor;
/**
 * 
 * @author Ariel Duarte
 *
 */
public class SiscomHelper {
	
	private HttpServletRequest request;

	public SiscomHelper(HttpServletRequest request) {
		super();
		this.request = request;
	}
	
	public InterfaceCommand getCommand(){
		String cmd = request.getParameter("cmd");
		if (cmd == null || cmd.equals("registrarProveedor")) 
			return new RegistrarProveedor();
		
		if (cmd == null || cmd.equals("consultaProveedor")) 
			return new ConsultarProveedor();
		
		if (cmd == null || cmd.equals("eliminarProveedor")) 
			return new EliminarProveedor();
		
		if (cmd == null || cmd.equals("actualizarProveedor")) 
			return new ActualizarProveedor();
		
		return null;
	}

}
