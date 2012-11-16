package ar.iariel.siscom.model.command;

import java.lang.reflect.InvocationTargetException;

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
public class RegistrarProveedor implements InterfaceCommand {

	@Override
	public String execute(HttpServletRequest request,HttpServletResponse response) {
		Proveedor proveedorBean = new Proveedor();
		//Ciudad ciudadBean = new Ciudad();
		 //ciudadBean.setCodigo(Integer.valueOf(request.getParameter("ciu_codigo")));
		/* Necesito capturar los valores que vienen de la peticion 
		 * lo vamos hacer utilizando commons beanUtils
		 */
		try {
			BeanUtils.populate(proveedorBean, request.getParameterMap());
			if(proveedorBean.isValido()){
				//proveedorBean.setCiudad(ciudadBean);
				InterfaceDAO<Proveedor> proveedorDAO = new HibernateDAO<Proveedor>(Proveedor.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
				proveedorDAO.salvar(proveedorBean);
				request.setAttribute("mensagem", "Proveedor "+proveedorBean.getNombre()+" registrado con éxito. :) ");
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
			request.setAttribute("mensagem", "No se pudo guardar el proveedor. :( "+e.getMessage());
			e.printStackTrace();
		}
		return "registro_proveedor.jsp";
	}

}
