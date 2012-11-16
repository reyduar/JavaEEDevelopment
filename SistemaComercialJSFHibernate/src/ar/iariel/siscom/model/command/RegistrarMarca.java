package ar.iariel.siscom.model.command;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
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
public class RegistrarMarca implements InterfaceCommand {

	@Override
	public String execute(HttpServletRequest request,HttpServletResponse response) {
		Marca marcaBean = new Marca();
		try {
			BeanUtils.populate(marcaBean, request.getParameterMap());
			if(marcaBean.isValido()){
				InterfaceDAO<Marca> marcaDAO = new HibernateDAO<Marca>(Marca.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
				marcaDAO.salvar(marcaBean);
				request.setAttribute("mensagem", "Marca Registrado con éxito : "+marcaBean.getNombre());
			}else{
				request.setAttribute("mensagem", "Ingrese campos obligatorios");
			}
				
			
		} catch (IllegalAccessException e) {
			request.setAttribute("mensagem", "Un problema critico con el Bean"+e.getMessage());
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			request.setAttribute("mensagem", "Un problema critico con el Bean"+e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			request.setAttribute("mensagem", "Un problema critico con el Bean"+e.getMessage());
			e.printStackTrace();
		}
		
		return "registro_marca.jsp";
	}

}
