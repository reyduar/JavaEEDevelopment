package ar.iariel.siscom.model.command;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import ar.iariel.siscom.model.bean.Proveedor;
import ar.iariel.siscom.model.dao.HibernateDAO;
import ar.iariel.siscom.model.dao.InterfaceDAO;
/**
 * 
 * @author Ariel Duarte
 *
 */
public class ActualizarProveedor implements InterfaceCommand {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		Proveedor proveedorBean = new Proveedor();
		try {
			BeanUtils.populate(proveedorBean, request.getParameterMap());
			if(proveedorBean.isValido()){
				
				InterfaceDAO<Proveedor> proveedorDAO = new HibernateDAO<Proveedor>(Proveedor.class);
				//Integer codigo = Integer.valueOf(request.getParameter("codigo"));
				//proveedorBean.setCodigo(codigo);
				proveedorDAO.actualizar(proveedorBean);
				request.setAttribute("mensagem", "Proveedor actualizado con exito");
			}else if(request.getMethod().equalsIgnoreCase("post")){
				request.setAttribute("proveedor", proveedorBean);
				request.setAttribute("mensagem", "Ingrese campos obligatorios");
				return "actualizar_proveedor.jsp";
			}else{
				InterfaceDAO<Proveedor> proveedorDAO = new HibernateDAO<Proveedor>(Proveedor.class);
				Integer codigo = Integer.valueOf(request.getParameter("codigo"));
				request.setAttribute("proveedor", proveedorDAO.getBean(codigo));
				return "actualizar_proveedor.jsp";
			}
		} catch (IllegalAccessException e) {
			request.setAttribute("mensagem", "Un problema critico en la actualización"+e.getMessage());
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			request.setAttribute("mensagem", "Un problema critico en la actualización"+e.getMessage());
			e.printStackTrace();
		}
		
		
		
		return "SiscomServletController?cmd=consultaProveedor";
	}

}
