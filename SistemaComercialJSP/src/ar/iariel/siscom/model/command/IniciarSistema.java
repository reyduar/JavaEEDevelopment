package ar.iariel.siscom.model.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IniciarSistema implements InterfaceCommand {

	public IniciarSistema() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String execute(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("Hasta Aca llegue");
		return "menu_principal.jsp";
	}

}
