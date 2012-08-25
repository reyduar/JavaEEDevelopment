package ar.iariel.siscom.model.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.model.DAO.ClienteDao;
import ar.iariel.siscom.model.DAO.InterfaceClienteDao;

public class EditarCliente implements InterfaceCommand {

private InterfaceClienteDao clienteDAO;
	
	
	//-- Constructor --//
	public EditarCliente(InterfaceClienteDao clienteDAO) {
		super();
		this.clienteDAO = clienteDAO;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		if(request.getParameter("codigo") == null){
			request.setAttribute("titulo", "Registro de Datos de Clientes");
			return "ingreso_cliente.jsp";
		}
		//-- En el caso de que se editar --//
		try {
			request.setAttribute("cliente", clienteDAO.getCliente(Integer.valueOf(request.getParameter("codigo"))));
		} catch (NumberFormatException e) {
			request.setAttribute("mensagem", "Valor de codigo invalido :"+request.getParameter("codigo"));
			e.printStackTrace();
		}catch (SQLException er) {
			request.setAttribute("mensagem", "Error en el acceso a la Base de Datos : "+er.getMessage());
			er.printStackTrace();
		}
		request.setAttribute("titulo", "Actualización de Datos de Clientes");
		
		
		
		return "modificar_cliente.jsp";
	}

}
