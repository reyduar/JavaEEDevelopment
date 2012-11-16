package ar.iariel.siscom.servlet.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.faces.event.ActionEvent;

import ar.iariel.siscom.model.bean.Articulo;
import ar.iariel.siscom.model.bean.CabeceraCompra;
import ar.iariel.siscom.model.bean.DetalleCompra;
import ar.iariel.siscom.model.bean.Proveedor;
import ar.iariel.siscom.model.dao.ArticuloDAO;
import ar.iariel.siscom.model.dao.HibernateDAO;
import ar.iariel.siscom.model.dao.InterfaceDAO;
import ar.iariel.siscom.util.FacesContextUtil;



public class CompraBean {
	
	private CabeceraCompra compra = new CabeceraCompra();
	private String codigoProveedor;
	private HashMap<Integer, Boolean> articulosSelecionados = new HashMap<Integer, Boolean>();

	
	//-- Metodo para incluir un articulo al detalle --//
	public void selecionarArticulo(ActionEvent evt) {
		
		if(getCompra().getDetalle() == null)
			getCompra().setDetalle(new HashSet<DetalleCompra>());
		
		List<Serializable> ids = new ArrayList<Serializable>();
		for(Integer i : articulosSelecionados.keySet()){
			
			//-- Si el articulo esta seleccionado --//
			if(articulosSelecionados.get(i)){
				
				Articulo articulo = new Articulo();
				articulo.setCodigo(i);
				DetalleCompra detalle = new DetalleCompra();
				detalle.setArticulo(articulo);
				if(!compra.getDetalle().contains(detalle)){
					ids.add(i); 
				}
			}
		}
		ArticuloDAO articuloDAO = new ArticuloDAO(FacesContextUtil.getRequestSession());
		List<Articulo> articulos = articuloDAO.getBeansByIds("codigo", ids);
		for(Articulo art : articulos){
			DetalleCompra det = new DetalleCompra();
			det.setArticulo(art);
			getCompra().getDetalle().add(det);
		}
	}
	
	public String getCodigoProveedor() {
		return codigoProveedor;
	}
	public void setCodigoProveedor(String codigoProveedor) {
		this.codigoProveedor = codigoProveedor;
	}
	
	
	public String comfirmarProveedor(){
		InterfaceDAO<Proveedor> proveedorDAO = new HibernateDAO<Proveedor>(Proveedor.class, FacesContextUtil.getRequestSession());
		this.compra = new CabeceraCompra();
		this.compra.setProveedor(proveedorDAO.getBean(Integer.valueOf(codigoProveedor)));
		this.compra.setDetalle(new HashSet<DetalleCompra>());
		System.out.println("Proveedor Seleccionado : "+ compra.getProveedor().getCodigo());
		return null;
	}
	
	public void modificarProveedor(ActionEvent evt){
		this.codigoProveedor = null;
		this.compra = new CabeceraCompra();
	}
	
	public CabeceraCompra getCompra() {
		return compra;
	}
	/**
	 * @return the articulosSelecionados
	 */
	public HashMap<Integer, Boolean> getArticulosSelecionados() {
		return articulosSelecionados;
	}
	/**
	 * @param articulosSelecionados the articulosSelecionados to set
	 */
	public void setArticulosSelecionados(HashMap<Integer, Boolean> articulosSelecionados) {
		this.articulosSelecionados = articulosSelecionados;
	}
	
	

	
	
	

}
