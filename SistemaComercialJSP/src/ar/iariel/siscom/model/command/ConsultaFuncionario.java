package ar.iariel.siscom.model.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.model.DAO.InterfaceClienteDao;
import ar.iariel.siscom.model.DAO.InterfaceFuncionarioDao;

/**
 * 
 * @author Ariel Duarte
 *
 */
public class ConsultaFuncionario implements InterfaceCommand {

	private InterfaceFuncionarioDao funcionarioDAO;

	// -- Constructor --//
	public ConsultaFuncionario(InterfaceFuncionarioDao funcionarioDAO) {
		super();
		this.funcionarioDAO = funcionarioDAO;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("titulo", "Consulta de Datos de Funcionarios");

		try {
			request.setAttribute("funcionarios", funcionarioDAO.getFuncionarios());
		} catch (SQLException e) {
			request.setAttribute("mensagem", "Ocurrio un error en la consulta de datos de funcionarios");
			e.printStackTrace();
		}
		return "consulta_funcionario.jsp";
	}

}
