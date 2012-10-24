package ar.iariel.siscom.model.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.model.bean.Proveedor;
import ar.iariel.siscom.model.dao.HibernateDAO;
import ar.iariel.siscom.model.dao.InterfaceDAO;
/**
 * 
 * @author Ariel Duarte
 *
 */
public class ConsultarProveedor implements InterfaceCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		InterfaceDAO<Proveedor> proveedorDAO = new HibernateDAO<Proveedor>(Proveedor.class);
		List<Proveedor> proveedores = proveedorDAO.getsBeans();
		request.setAttribute("proveedores", proveedores);
		return "consulta_proveedor.jsp";
	}

}
