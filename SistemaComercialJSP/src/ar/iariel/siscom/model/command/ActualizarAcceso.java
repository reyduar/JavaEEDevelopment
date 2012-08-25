package ar.iariel.siscom.model.command;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.model.DAO.AccesoDao;
import ar.iariel.siscom.model.bean.Acceso;

public class ActualizarAcceso implements InterfaceCommand {

	
	private AccesoDao accesoDAO;
	
	
	
	public ActualizarAcceso(AccesoDao accesoDAO) {
		super();
		this.accesoDAO = accesoDAO;
	}



	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {

		Enumeration parametros = request.getParameterNames();
		List<Acceso> accesos = new ArrayList<Acceso>();
		//-- Recibe todos los accesos de usuarios de los checkbox tildados --//
		while(parametros.hasMoreElements()){
			String paramAcceso = (String) parametros.nextElement();
			Acceso acc = new Acceso();
			try {
				acc.setAcceso_codigo(Integer.parseInt(paramAcceso));
				acc.setFuncionario_codigo(Integer.parseInt(request.getParameter("codigo")));
				accesos.add(acc);
			} catch (NumberFormatException e) {
				// Mientras que no sea un valor numerico va ocurrir una exception de formato numerico
				// Y no debe hacer nada y si es  un string que se puede parser a entero no entrara en la exception
			}
		}
		//-- Al finalizar de recuperar los accesos podemos guardar los cambios --//
		try {
			accesoDAO.eliminar(Integer.parseInt(request.getParameter("codigo")));
			accesoDAO.guardar(accesos);
			request.setAttribute("mensagem", "Los accesos del usuario se actualizaron con exito!");
		} catch (SQLException e) {
			request.setAttribute("mensagem", "Error al actualizar los accesos: "+e.getMessage());
			e.printStackTrace();
		}
		request.setAttribute("titulo", "Consulta de Datos de Funcionarios");
		return "SiscomController?cmd=consultaFuncionario";
	}

}
