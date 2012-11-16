package ar.iariel.siscom.model.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import ar.iariel.siscom.model.bean.Marca;
import ar.iariel.siscom.model.dao.HibernateDAO;
import ar.iariel.siscom.model.dao.InterfaceDAO;
import ar.iariel.siscom.util.HibernateUtil;
/**
 * Date : 07/10/2012
 * @author Ariel Duarte
 *
 */
public class EliminarMarca implements InterfaceCommand {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		InterfaceDAO<Marca> marcaDAO = new HibernateDAO<Marca>(Marca.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
		try {
			Integer codigo = Integer.valueOf(request.getParameter("codigo"));
			Marca marcaBean = new Marca();
			marcaBean.setCodigo(codigo);
			marcaDAO.eliminar(marcaBean);
			request.setAttribute("mensagem", "Marca eliminada con éxito :)");
		} catch (Exception e) {
			request.setAttribute("mensagem", "Falla en la elimianacion :( "+e.getMessage());
		}
		
		
		return "SiscomServletController?cmd=consultaMarca";
	}

}
