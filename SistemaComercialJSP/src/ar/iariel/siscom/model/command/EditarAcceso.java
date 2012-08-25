package ar.iariel.siscom.model.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.model.DAO.AccesoDao;
import ar.iariel.siscom.model.DAO.InterfaceClienteDao;
import ar.iariel.siscom.model.DAO.InterfaceFuncionarioDao;

public class EditarAcceso implements InterfaceCommand {

	private InterfaceFuncionarioDao funcionarioDAO;
	private AccesoDao accesoDAO;

	public EditarAcceso(InterfaceFuncionarioDao funcionarioDAO,
			AccesoDao accesoDAO) {
		super();
		this.funcionarioDAO = funcionarioDAO;
		this.accesoDAO = accesoDAO;
	}

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			Integer codigo = Integer.parseInt(request.getParameter("codigo"));
			request.setAttribute("funcionario", funcionarioDAO.getFuncionario(codigo));
			request.setAttribute("accesos", accesoDAO.getAccesosFuncionarios(codigo).values());
		} catch (NumberFormatException e) {
			request.setAttribute("mensagem", "Valor de codigo invalido :"+request.getParameter("codigo"));
			e.printStackTrace();
			return "SiscomController?cmd=editarFuncionario";
		}catch (SQLException er) {
			request.setAttribute("mensagem", "Error en el acceso a la Base de Datos : "+er.getMessage());
			er.printStackTrace();
			return "SiscomController?cmd=editarFuncionario";
		}
		request.setAttribute("titulo", "Actualización de Acceso de Ususarios");
		return "actualiza_acceso.jsp";
	}

}
