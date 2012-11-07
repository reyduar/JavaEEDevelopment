package ar.iariel.siscom.model.command;

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
public class EliminarGrupo implements InterfaceCommand {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		InterfaceDAO<Grupo> grupoDAO = new HibernateDAO<Grupo>(Grupo.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
		try {
			Integer codigo = Integer.valueOf(request.getParameter("codigo"));
			Grupo grupoBean = new Grupo();
			grupoBean.setCodigo(codigo);
			grupoDAO.eliminar(grupoBean);
			request.setAttribute("mensagem", "Marca eliminada con éxito :)");
		} catch (Exception e) {
			request.setAttribute("mensagem", "Falla en la eliminacion :( "+e.getMessage());
		}
		
		
		return "SiscomServletController?cmd=consultaMarca";
	}

}
