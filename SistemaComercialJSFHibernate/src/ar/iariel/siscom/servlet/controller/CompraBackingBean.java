package ar.iariel.siscom.servlet.controller;

import java.util.ArrayList;
import java.util.List;

import javax.faces.model.SelectItem;

import org.hibernate.classic.Session;

import ar.iariel.siscom.model.bean.Articulo;
import ar.iariel.siscom.model.bean.Ciudad;
import ar.iariel.siscom.model.bean.Proveedor;
import ar.iariel.siscom.model.dao.ArticuloDAO;
import ar.iariel.siscom.model.dao.HibernateDAO;
import ar.iariel.siscom.model.dao.InterfaceDAO;
import ar.iariel.siscom.util.FacesContextUtil;

public class CompraBackingBean {
	
	private Proveedor proveedor = new Proveedor();
	private Articulo articulo = new Articulo();
	private Ciudad ciudad = new Ciudad();
	private CompraBean compraBean;
	

	//-- Metodos que permite hacer la busqueda de proveedor --//
	public Proveedor getProveedor() {
		return proveedor;
	}

	public void setProveedor(Proveedor proveedor) {
		this.proveedor = proveedor;
	}

	//-- Metodo para rellenar el DropDown con los Proveedores --//
	public List<SelectItem> getProveedores(){
		Session session = FacesContextUtil.getRequestSession(); 
		
		InterfaceDAO<Proveedor> proveedorDAO = new HibernateDAO<Proveedor>(Proveedor.class, session);
		
		//-- En el caso de que algun elemento este null el lo pueda encontrar igual pero como vacio --//
		if(proveedor.getNombre() != null && proveedor.getNombre().equals("")){
			proveedor.setNombre(null);
		}
		if(proveedor.getRuc() != null && proveedor.getRuc().equals("")){
			proveedor.setRuc(null);
		}
		
		List<Proveedor> proveedores = proveedorDAO.getBeansByExample(proveedor);
		
		List<SelectItem> selectProveedor = new ArrayList<SelectItem>();
		selectProveedor.add(new SelectItem(null, "Seleccione proveedor..."));
		 for (Proveedor p : proveedores) {
			 selectProveedor.add(new SelectItem(p.getCodigo().toString(), p.getNombre()));
		}
		return selectProveedor;
	}
	
	//-- Para listado de articulos de la tabla JSF --//
	public List<Articulo> getArticulos(){
		List<Articulo> resultado = new ArrayList<Articulo>();
		Session session = FacesContextUtil.getRequestSession(); 
		InterfaceDAO<Articulo> articuloDAO = new HibernateDAO<Articulo>(Articulo.class, session);
		if(getArticulo().getArtnomreal() != null && getArticulo().getArtnomreal().equals("")){
			articulo.setArtnomreal(null);
		}
		
		List<Articulo> articulos = articuloDAO.getBeansByExample(articulo);
		for (Articulo a : articulos) {
			resultado.add(a);
		}
		//TODO: Este codigo es para un filtro de proveedor por producto, pero que no lo tenemos en implementado en esta aplicacion
		/*
		ArticuloDAO articuloDAO = new ArticuloDAO(session); -----para usar la clase ArticuloDAO
		if(compraBean.getCompra().getProveedor() != ){
			getArticulo().setProveedor(compraBean.getCompra().getProveedor());
			return articuloDAO.getArticuloPorProveedor(getArticulo());
		}
		*/
		
		return resultado;
		//return articuloDAO.getsBeans();
	}

	//-- Getter y Setter de compraBean -//
	public CompraBean getCompraBean() {
		return compraBean;
	}

	public void setCompraBean(CompraBean compraBean) {
		this.compraBean = compraBean;
	}

	public Articulo getArticulo() {
		return articulo;
	}

	public void setArticulo(Articulo articulo) {
		this.articulo = articulo;
	}
	
}
