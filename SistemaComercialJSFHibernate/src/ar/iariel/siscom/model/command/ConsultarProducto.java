package ar.iariel.siscom.model.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import ar.iariel.siscom.model.bean.Articulo;
import ar.iariel.siscom.model.dao.HibernateDAO;
import ar.iariel.siscom.model.dao.InterfaceDAO;
import ar.iariel.siscom.util.HibernateUtil;
/**
 * Date : 07/10/2012
 * @author Ariel Duarte
 *
 */
public class ConsultarProducto implements InterfaceCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		InterfaceDAO<Articulo> articuloDAO = new HibernateDAO<Articulo>(Articulo.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
		List<Articulo> articulos = articuloDAO.getsBeans();
		request.setAttribute("articulos", articulos);
		return "consulta_producto.jsp";
	}

}
