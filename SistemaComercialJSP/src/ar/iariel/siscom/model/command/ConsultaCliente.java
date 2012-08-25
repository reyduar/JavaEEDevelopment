package ar.iariel.siscom.model.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.model.DAO.ClienteDao;
import ar.iariel.siscom.model.DAO.InterfaceClienteDao;

/**
 * 
 * @author reynaldo.duarte
 * 
 */
public class ConsultaCliente implements InterfaceCommand {

	private InterfaceClienteDao clienteDAO;

	// -- Constructor --//
	public ConsultaCliente(InterfaceClienteDao clienteDAO) {
		super();
		this.clienteDAO = clienteDAO;
	}

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		request.setAttribute("titulo", "Consulta de Datos de Clientes");
		
		try {
			request.setAttribute("clientes", clienteDAO.getClientes());
		} catch (SQLException e) {
			request.setAttribute("mensagem", "Ocurrio un error en la consulta de datos de clientes");
			e.printStackTrace();
		}
		return "consulta_cliente.jsp";
	}

}
