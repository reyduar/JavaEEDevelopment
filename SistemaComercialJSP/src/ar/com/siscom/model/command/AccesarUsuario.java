package ar.com.siscom.model.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.model.DAO.InterfaceFuncionarioDao;
import ar.iariel.siscom.model.bean.Funcionario;
import ar.iariel.siscom.model.command.InterfaceCommand;



public class AccesarUsuario implements InterfaceCommand {

	private InterfaceFuncionarioDao funcionarioDAO;


	public AccesarUsuario(InterfaceFuncionarioDao funcionarioDAO) {
		super();
		this.funcionarioDAO = funcionarioDAO;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		Funcionario funcionario = null;
		String login = request.getParameter("login");
		String clave = request.getParameter("pass");
		System.out.println(login+" / "+clave);
		request.setAttribute("titulo", "Acceso al Sistema Comercial");

		if(login == null)
			return "login_usuario.jsp";
		try {
			funcionario = funcionarioDAO.getFuncionario(login);//Se devuelve la consulta en una variable del tipo funcinario
		} catch (SQLException e) {
			request.setAttribute("mensagem", "Problema en el acceso a la Base de Datos: "+e);
			e.printStackTrace();
		}
		//-- Si lo que devuelve la consulta es funcionario es nulo
		if(funcionario == null || !funcionario.getPass().equals(clave)){
			request.setAttribute("mensagem", "El usuario o la contraseña no corresponden");
			return "login_usuario.jsp";
		}	

		request.getSession().setAttribute("usuario", funcionario);
		return "SiscomController?cmd=iniciarSistema";
	}

}
