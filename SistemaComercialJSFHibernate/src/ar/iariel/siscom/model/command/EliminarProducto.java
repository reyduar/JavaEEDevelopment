package ar.iariel.siscom.model.command;

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
public class EliminarProducto implements InterfaceCommand {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		InterfaceDAO<Articulo> articuloDAO = new HibernateDAO<Articulo>(Articulo.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
		Integer codigo = Integer.valueOf(request.getParameter("codigo"));
		Articulo articuloBean = articuloDAO.getBean(codigo);
		try {
			articuloDAO.eliminar(articuloBean);
			request.setAttribute("mensagem", "Producto eliminado con exito. :) ");
		} catch (Exception e) {
			request.setAttribute("mensagem", "El producto" + articuloBean.getArtnomreal() +" no pudo ser eliminado. :( ");
			e.printStackTrace();
		}
		
		
		return "SiscomServletController?cmd=consultaProducto";
	}

}
