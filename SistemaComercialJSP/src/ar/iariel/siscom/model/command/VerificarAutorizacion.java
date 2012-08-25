package ar.iariel.siscom.model.command;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.model.DAO.AccesoDao;
import ar.iariel.siscom.model.bean.Acceso;
import ar.iariel.siscom.model.bean.Funcionario;

public class VerificarAutorizacion implements InterfaceCommand {

	private AccesoDao accesoDAO;
	
	
	
	public VerificarAutorizacion(AccesoDao accesoDAO) {
		super();
		this.accesoDAO = accesoDAO;
	}



	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String cmd = request.getParameter("cmd");
		Funcionario usuario = (Funcionario) request.getSession().getAttribute("usuario");
		
		
		////Aca verificamos si login es null y comando es null no entra al sistema
		if(usuario == null)
			return "SiscomController?cmd=acessarUsuario";
		
		try {
			Map<String, Acceso> accesos = accesoDAO.getAccesosFuncionarios(usuario.getCodigo());
			Acceso acc = accesos.get(cmd);
			if(acc != null && acc.getFuncionario_codigo() != usuario.getCodigo()){
				request.setAttribute("titulo", "Acceso Denegado");
				request.setAttribute("mensagem", "Nombre/Codigo de transacción: "+ acc.getDescripcion()+" / " +acc.getComando());
				return "acceso_denegado.jsp";
			}
		} catch (SQLException er) {
			request.setAttribute("mensagem", "Problema con acceso a la Base de Datos "+er.getMessage() );
			er.printStackTrace();
		}
		return null; //////////Si todo estuviera ok retornamos null
	}

}
