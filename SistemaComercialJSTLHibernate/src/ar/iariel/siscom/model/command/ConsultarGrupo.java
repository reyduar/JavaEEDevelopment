package ar.iariel.siscom.model.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import ar.iariel.siscom.model.bean.Grupo;
import ar.iariel.siscom.model.dao.HibernateDAO;
import ar.iariel.siscom.model.dao.InterfaceDAO;
import ar.iariel.siscom.util.HibernateUtil;
/**
 * Date : 07/10/2012
 * @author Ariel Duarte
 *
 */
public class ConsultarGrupo implements InterfaceCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		InterfaceDAO<Grupo> grupoDAO = new HibernateDAO<Grupo>(Grupo.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
		List<Grupo> grupos = grupoDAO.getsBeans();
		request.setAttribute("grupos", grupos);
		return "consulta_grupo.jsp";
	}

}
