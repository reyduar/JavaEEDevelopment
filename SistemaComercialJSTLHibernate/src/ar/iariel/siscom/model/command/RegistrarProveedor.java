package ar.iariel.siscom.model.command;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import ar.iariel.siscom.model.bean.Ciudad;
import ar.iariel.siscom.model.bean.Proveedor;
import ar.iariel.siscom.model.dao.HibernateDAO;
import ar.iariel.siscom.model.dao.InterfaceDAO;
/**
 * 
 * @author Ariel Duarte
 *
 */
public class RegistrarProveedor implements InterfaceCommand {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
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
				InterfaceDAO<Proveedor> proveedorDAO = new HibernateDAO<Proveedor>(Proveedor.class);
				proveedorDAO.salvar(proveedorBean);
				request.setAttribute("mensagem", "Proveedor Registrado con éxito : "+proveedorBean.getNombre());
			}else{
				request.setAttribute("mensagem", "Ingrese campos obligatorios");
			}
				
			
		} catch (IllegalAccessException | InvocationTargetException e) {
			request.setAttribute("mensagem", "Un problema critico con el Bean"+e.getMessage());
			e.printStackTrace();
		}
		return "registro_proveedor.jsp";
	}

}
