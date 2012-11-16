package ar.iariel.siscom.model.command;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
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
public class ActualizarGrupo implements InterfaceCommand {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		Grupo grupoBean = new Grupo();
		try {
			BeanUtils.populate(grupoBean, request.getParameterMap());
			if(grupoBean.isValido()){
				
				InterfaceDAO<Grupo> grupoDAO = new HibernateDAO<Grupo>(Grupo.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
				grupoDAO.actualizar(grupoBean);
				request.setAttribute("mensagem", "Grupo actualizado con exito. :) ");
			}else if(request.getMethod().equalsIgnoreCase("post")){
				request.setAttribute("grupo", grupoBean);
				request.setAttribute("mensagem", "Ingrese campos obligatorios");
				return "actualizar_grupo.jsp";
			}else{
				InterfaceDAO<Grupo> grupoDAO = new HibernateDAO<Grupo>(Grupo.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
				Integer codigo = Integer.valueOf(request.getParameter("codigo"));
				request.setAttribute("grupo", grupoDAO.getBean(codigo));
				return "actualizar_grupo.jsp";
			}
		} catch (IllegalAccessException e) {
			request.setAttribute("mensagem", "Un problema critico en la actualización. x( "+e.getMessage());
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			request.setAttribute("mensagem", "Un problema critico en la actualización. x("+e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			request.setAttribute("mensagem", "Falla en la actualización. :("+e.getMessage());
			e.printStackTrace();
		}
		
		
		
		return "SiscomServletController?cmd=consultaGrupo";
	}

}
