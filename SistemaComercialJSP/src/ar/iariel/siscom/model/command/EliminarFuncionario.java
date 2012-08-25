package ar.iariel.siscom.model.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.model.DAO.InterfaceClienteDao;
import ar.iariel.siscom.model.DAO.InterfaceFuncionarioDao;

public class EliminarFuncionario implements InterfaceCommand {

private InterfaceFuncionarioDao funcionarioDAO;
	
	//-- constructor --//
	public EliminarFuncionario(InterfaceFuncionarioDao funcionarioDAO) {
		super();
		this.funcionarioDAO = funcionarioDAO;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//-- Seteamos los parametros de este bean con los valores de los input de la pagina --//
				try {
					funcionarioDAO.eliminar(Integer.valueOf(request.getParameter("codigo")));
					request.setAttribute("mensagem", "¡Los datos del funcionario fueron eliminados con exito!");
				} catch (NumberFormatException er) {
					request.setAttribute("mensagem", "Valor invalido: "+er.getMessage());
				} catch (SQLException e) {
					request.setAttribute("mensagem", "Error al Eliminar funcionario: "+e.getMessage()+"..."+Integer.valueOf(request.getParameter("codigo")));
				}
				request.setAttribute("titulo", "Consulta de Datos de Funcionarios");
				return "SiscomController?cmd=consultaFuncionario";
	}

}
