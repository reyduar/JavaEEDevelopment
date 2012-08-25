package ar.iariel.siscom.model.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.model.DAO.ClienteDao;
import ar.iariel.siscom.model.DAO.InterfaceClienteDao;

public class EliminarCliente implements InterfaceCommand {

	
	private InterfaceClienteDao clienteDAO;
	
	//-- constructor --//
	public EliminarCliente(InterfaceClienteDao clienteDAO) {
		super();
		this.clienteDAO = clienteDAO;
	}

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		//-- Seteamos los parametros de este bean con los valores de los input de la pagina --//
		try {
			clienteDAO.eliminar(Integer.valueOf(request.getParameter("codigo")));
			request.setAttribute("mensagem", "¡Los datos del cliente  fueron eliminados con exito!");
		} catch (NumberFormatException er) {
			request.setAttribute("mensagem", "Valor invalido: "+er.getMessage());
		} catch (SQLException e) {
			request.setAttribute("mensagem", "Error al Eliminar cliente: "+e.getMessage()+"..."+Integer.valueOf(request.getParameter("codigo")));
		}
		request.setAttribute("titulo", "Consulta de Datos de Clientes");
		return "SiscomController?cmd=consultaCliente";
	}

}
