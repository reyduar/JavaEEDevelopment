package ar.iariel.siscom.model.command;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.Session;

import ar.iariel.siscom.model.bean.Proveedor;
import ar.iariel.siscom.model.dao.HibernateDAO;
import ar.iariel.siscom.model.dao.InterfaceDAO;
import ar.iariel.siscom.util.HibernateUtil;
/**
 * Date : 07/10/2012
 * @author Ariel Duarte
 *
 */
public class BuscarProveedor implements InterfaceCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		Proveedor proveedorBean = new Proveedor();
		try {
			BeanUtils.populate(proveedorBean, request.getParameterMap());
			InterfaceDAO<Proveedor> proveedorDAO = new HibernateDAO<Proveedor>(Proveedor.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
			List<Proveedor> proveedores = proveedorDAO.getBeansByExample(proveedorBean);
			request.setAttribute("proveedor", proveedorBean);
			request.setAttribute("proveedores", proveedores);
		} catch (IllegalAccessException e) {
			request.setAttribute("mensagem", "Problema critico con el acceso al Bean proveedor. x( "+ e.getMessage());
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			request.setAttribute("mensagem", "Problema critico con el acceso al Bean proveedor. x( "+ e.getMessage());
			e.printStackTrace();
		}catch (Exception e) {
			request.setAttribute("mensagem", "Problema al buscar el proveedor. :( "+ e.getMessage());
			e.printStackTrace();
		}
		
		
		
		
		return "buscar_proveedor.jsp";
	}

}
