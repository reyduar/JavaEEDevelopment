package ar.iariel.siscom.model.command;

import java.util.List;

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
public class ConsultarMarca implements InterfaceCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		InterfaceDAO<Marca> marcaDAO = new HibernateDAO<Marca>(Marca.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
		List<Marca> marcas = marcaDAO.getsBeans();
		request.setAttribute("marcas", marcas);
		return "consulta_marca.jsp";
	}

}
