package ar.iariel.siscom.model.helper;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.com.siscom.model.command.AccesarUsuario;
import ar.iariel.siscom.conexion.InterfacePool;
import ar.iariel.siscom.conexion.Pool;
import ar.iariel.siscom.model.DAO.AccesoDao;
import ar.iariel.siscom.model.DAO.ClienteDao;
import ar.iariel.siscom.model.DAO.DepartamentoDao;
import ar.iariel.siscom.model.DAO.FuncionarioDao;
import ar.iariel.siscom.model.command.ActualizarAcceso;
import ar.iariel.siscom.model.command.ConsultaCliente;
import ar.iariel.siscom.model.command.ConsultaFuncionario;
import ar.iariel.siscom.model.command.EditarAcceso;
import ar.iariel.siscom.model.command.EditarCliente;
import ar.iariel.siscom.model.command.EditarFuncionario;
import ar.iariel.siscom.model.command.EliminarCliente;
import ar.iariel.siscom.model.command.EliminarFuncionario;
import ar.iariel.siscom.model.command.IngresoCliente;
import ar.iariel.siscom.model.command.IngresoFuncionario;
import ar.iariel.siscom.model.command.IniciarSistema;
import ar.iariel.siscom.model.command.InterfaceCommand;
import ar.iariel.siscom.model.command.ModificarCliente;
import ar.iariel.siscom.model.command.ModificarFuncionario;

/**
 * @author Ariel Duarte
 */

/*
 * Esta clase se encargara de hacer el control de la reglas de negocio Y va a
 * controlar tambien el destino de las peticiones HTTP Los que implmenten esta
 * clase van a recibir la peticion HTTP y apartir de la peticion el va a
 * retornar un comando a ha ser ejecutado
 */

public class SiscomHelper {
	private HashMap<String, InterfaceCommand> mapaComandos;
	private HttpServletRequest request;

	private InterfacePool pool; // /Necesitamos una variable pool

	// -- Constructor --//
	public SiscomHelper(InterfacePool pool) {
		this.pool = new Pool();
		
		
		
		mapaComandos = new HashMap<String, InterfaceCommand>();
		// -- Le agregamos al hash el comando recibido de la pagina que realiza
		// la peticion --//
		mapaComandos.put("ingresoCliente", new IngresoCliente(new ClienteDao(pool)));
		mapaComandos.put("consultaCliente", new ConsultaCliente(new ClienteDao(pool)));
		mapaComandos.put("modificarCliente", new ModificarCliente(new ClienteDao(pool)));
		mapaComandos.put("editarCliente", new EditarCliente(new ClienteDao(pool)));
		mapaComandos.put("eliminarCliente", new EliminarCliente(new ClienteDao(	pool)));
		
		//-- Comandos para la gestion de datos funcionarios --//
		mapaComandos.put("ingresoFuncionario", new IngresoFuncionario(new FuncionarioDao(pool)));
		mapaComandos.put("editarFuncionario", new EditarFuncionario(new FuncionarioDao(pool), new DepartamentoDao(pool)));
		mapaComandos.put("consultaFuncionario", new ConsultaFuncionario(new FuncionarioDao(pool)));
		mapaComandos.put("modificaFuncionario", new ModificarFuncionario(new FuncionarioDao(pool)));
		mapaComandos.put("eliminaFuncionario", new EliminarFuncionario(new FuncionarioDao(	pool)));

		mapaComandos.put("iniciarSistema", new IniciarSistema());
		mapaComandos.put("accesarUsuario", new AccesarUsuario(new FuncionarioDao(pool)));
		mapaComandos.put("editarAcceso", new EditarAcceso(new FuncionarioDao(pool), new AccesoDao(pool)));
		mapaComandos.put("actualizarAcceso", new ActualizarAcceso(new AccesoDao(pool)));
	}

	// -- Este metodo devolvera un objeto del tipo InterfaceCommand --//
	public InterfaceCommand getCommand() {
		
		String cmd = request.getParameter("cmd");
		if(cmd == null || request.getSession().getAttribute("usuario") == null)
			return mapaComandos.get("accesarUsuario");
		return mapaComandos.get(cmd);
	}

	// -- Se crea un setter para request --//
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

}
