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
public class RegistrarGrupo implements InterfaceCommand {

	@Override
	public String execute(HttpServletRequest request,HttpServletResponse response) {
		Grupo GrupoBean = new Grupo();
		try {
			BeanUtils.populate(GrupoBean, request.getParameterMap());
			if(GrupoBean.isValido()){
				InterfaceDAO<Grupo> GrupoDAO = new HibernateDAO<Grupo>(Grupo.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
				GrupoDAO.salvar(GrupoBean);
				request.setAttribute("mensagem", "Grupo registrado con éxito. :) "+GrupoBean.getNombre());
			}else{
				request.setAttribute("mensagem", "Ingrese campos obligatorios.");
			}
			
		} catch (IllegalAccessException e) {
			request.setAttribute("mensagem", "Un problema critico con el Bean."+e.getMessage());
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			request.setAttribute("mensagem", "Un problema critico con el Bean."+e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			request.setAttribute("mensagem", "Falla al registrar el grupo. :("+e.getMessage());
			e.printStackTrace();
		}
		
		return "registro_grupo.jsp";
	}

}
