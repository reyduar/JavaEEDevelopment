package ar.iariel.siscom.model.helper;

import javax.servlet.http.HttpServletRequest;

import ar.iariel.siscom.model.command.ActualizarGrupo;
import ar.iariel.siscom.model.command.ActualizarMarca;
import ar.iariel.siscom.model.command.ActualizarProducto;
import ar.iariel.siscom.model.command.ActualizarProveedor;
import ar.iariel.siscom.model.command.BuscarProveedor;
import ar.iariel.siscom.model.command.ConsultarGrupo;
import ar.iariel.siscom.model.command.ConsultarMarca;
import ar.iariel.siscom.model.command.ConsultarProducto;
import ar.iariel.siscom.model.command.ConsultarProveedor;
import ar.iariel.siscom.model.command.EliminarGrupo;
import ar.iariel.siscom.model.command.EliminarMarca;
import ar.iariel.siscom.model.command.EliminarProducto;
import ar.iariel.siscom.model.command.EliminarProveedor;
import ar.iariel.siscom.model.command.InterfaceCommand;
import ar.iariel.siscom.model.command.RegistrarGrupo;
import ar.iariel.siscom.model.command.RegistrarMarca;
import ar.iariel.siscom.model.command.RegistrarProducto;
import ar.iariel.siscom.model.command.RegistrarProveedor;
/**
 * Date : 07/10/2012
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
		
		if (cmd == null || cmd.equals("buscaProveedor")) 
			return new BuscarProveedor();
		
		if (cmd == null || cmd.equals("registrarMarca")) 
			return new RegistrarMarca();
		
		if (cmd == null || cmd.equals("consultaMarca")) 
			return new ConsultarMarca();
		
		if (cmd == null || cmd.equals("eliminarMarca")) 
			return new EliminarMarca();
		
		if (cmd == null || cmd.equals("actualizarMarca")) 
			return new ActualizarMarca();
		
		if (cmd == null || cmd.equals("registrarGrupo")) 
			return new RegistrarGrupo();
		
		if (cmd == null || cmd.equals("consultaGrupo")) 
			return new ConsultarGrupo();
		
		if (cmd == null || cmd.equals("eliminarGrupo")) 
			return new EliminarGrupo();
		
		if (cmd == null || cmd.equals("actualizarGrupo")) 
			return new ActualizarGrupo();
		
		if (cmd == null || cmd.equals("registrarProducto")) 
			return new RegistrarProducto();
		
		if (cmd == null || cmd.equals("actualizarProducto")) 
			return new ActualizarProducto();
		
		if (cmd == null || cmd.equals("eliminarProducto")) 
			return new EliminarProducto();
		
		if (cmd == null || cmd.equals("consultaProducto")) 
			return new  ConsultarProducto();
		
		return new ConsultarProveedor();
	}
	
}
