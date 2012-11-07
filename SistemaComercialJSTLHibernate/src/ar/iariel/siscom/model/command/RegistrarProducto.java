package ar.iariel.siscom.model.command;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.Session;

import ar.iariel.siscom.model.bean.Articulo;
import ar.iariel.siscom.model.bean.Grupo;
import ar.iariel.siscom.model.bean.Marca;
import ar.iariel.siscom.model.bean.Pais;
import ar.iariel.siscom.model.bean.TipoGrupo;
import ar.iariel.siscom.model.bean.Ubicacion;
import ar.iariel.siscom.model.dao.HibernateDAO;
import ar.iariel.siscom.model.dao.InterfaceDAO;
import ar.iariel.siscom.util.HibernateUtil;
/**
 * Date : 07/10/2012
 * @author Ariel Duarte
 *
 */
public class RegistrarProducto implements InterfaceCommand {

	@Override
	public String execute(HttpServletRequest request,HttpServletResponse response) {
		Articulo articuloBean = new Articulo();
		try {
			BeanUtils.populate(articuloBean, request.getParameterMap());
			InterfaceDAO<Marca> marcaDAO = new HibernateDAO<Marca>(Marca.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
			request.setAttribute("marcas", marcaDAO.getsBeans());
			InterfaceDAO<Grupo> grupoDAO = new HibernateDAO<Grupo>(Grupo.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
			request.setAttribute("grupos", grupoDAO.getsBeans());
			InterfaceDAO<TipoGrupo> tipogrupoDAO = new HibernateDAO<TipoGrupo>(TipoGrupo.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
			request.setAttribute("tipoGrupos", tipogrupoDAO.getsBeans());
			InterfaceDAO<Pais> paisDAO = new HibernateDAO<Pais>(Pais.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
			request.setAttribute("paises", paisDAO.getsBeans());
			InterfaceDAO<Ubicacion> ubicacionDAO = new HibernateDAO<Ubicacion>(Ubicacion.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
			request.setAttribute("ubicaciones", ubicacionDAO.getsBeans());
			
			//-- Para que los dropdown no pierda el valor seleccionado cuando los campos obligatorios no fueron ingresados --//
			if(request.getMethod().equalsIgnoreCase("post")){
				articuloBean.setMarca(marcaDAO.getBean(Integer.valueOf(request.getParameter("mar_codigo"))));
				articuloBean.setGrupo(grupoDAO.getBean(Integer.valueOf(request.getParameter("gru_codigo"))));
				articuloBean.setTipoGrupo(tipogrupoDAO.getBean(Integer.valueOf(request.getParameter("tg_codigo"))));
				articuloBean.setPais(paisDAO.getBean(Integer.valueOf(request.getParameter("pais_codigo"))));
				articuloBean.setUbicacion(ubicacionDAO.getBean(Integer.valueOf(request.getParameter("ubica_codigo"))));
				request.setAttribute("mensagem", "Ingrese campos obligatorios");
			}
			request.setAttribute("articulo", articuloBean);
			if(articuloBean.isValido()){
				InterfaceDAO<Articulo> articuloDAO = new HibernateDAO<Articulo>(Articulo.class, (Session) request.getAttribute(HibernateUtil.HIBERNATE_SESSION));
				articuloDAO.salvar(articuloBean);
				request.setAttribute("mensagem", "Producto " +articuloBean.getArtnomreal()+" registrado con éxito :) ");
				request.removeAttribute("articulo");
			}
				
			
		} catch (IllegalAccessException e) {
			request.setAttribute("mensagem", "Un problema critico con el Bean. x( "+e.getMessage());
			e.printStackTrace();
		}catch (InvocationTargetException e) {
			request.setAttribute("mensagem", "Un problema critico con el Bean. x( "+e.getMessage());
			e.printStackTrace();
		}catch (Exception e) {
			request.setAttribute("mensagem", "No se pudo guardar el producto. :( "+e.getMessage());
			e.printStackTrace();
		}
		return "registro_producto.jsp";
	}

}
