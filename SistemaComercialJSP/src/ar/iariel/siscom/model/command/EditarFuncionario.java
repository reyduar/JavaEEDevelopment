package ar.iariel.siscom.model.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.model.DAO.ClienteDao;
import ar.iariel.siscom.model.DAO.DepartamentoDao;
import ar.iariel.siscom.model.DAO.FuncionarioDao;
import ar.iariel.siscom.model.DAO.InterfaceFuncionarioDao;

public class EditarFuncionario implements InterfaceCommand {

	private InterfaceFuncionarioDao funcionarioDAO;
	private DepartamentoDao departamentoDAO;
	
	//-- Constructor --//
		public EditarFuncionario(InterfaceFuncionarioDao funcionarioDAO, DepartamentoDao departamentoDAO) {
			super();
			this.funcionarioDAO = funcionarioDAO;
			this.departamentoDAO = departamentoDAO;
		}
		
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		//-- En el caso de que se editar --//
		try {
			request.setAttribute("departamentos", departamentoDAO.getDepartamentos()); //Es para obtener la lista con los departamentos
			if(request.getParameter("codigo") == null){
				request.setAttribute("titulo", "Registro de Datos de Funcionarios");
				return "ingreso_funcionario.jsp";
			}
			
			request.setAttribute("funcionario", funcionarioDAO.getFuncionario(Integer.valueOf(request.getParameter("codigo"))));
		} catch (NumberFormatException e) {
			request.setAttribute("mensagem", "Valor de codigo invalido :"+request.getParameter("codigo"));
			e.printStackTrace();
		}catch (SQLException er) {
			request.setAttribute("mensagem", "Error en el acceso a la Base de Datos : "+er.getMessage());
			er.printStackTrace();
		}
		
		return "modificar_funcionario.jsp";
	}

}
