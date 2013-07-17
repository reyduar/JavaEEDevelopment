package ar.iariel.siscom.servlet.controller;

import java.util.Collection;
import java.util.Date;

import javax.faces.component.html.HtmlDataTable;

import ar.iariel.siscom.model.bean.Ajuste;
import ar.iariel.siscom.model.dao.AjusteStockDAO;
import ar.iariel.siscom.model.dao.HibernateDAO;
import ar.iariel.siscom.model.dao.InterfaceDAO;
import ar.iariel.siscom.util.FacesContextUtil;

/**
 * @author Ariel Duarte
 * Backing Bean : AjusteAutorizaBackingBean
 */


public class AjusteAutorizaBackingBean {
	public LoginBean login; //Necesitamos saber que usuario esta logueado y el que realizara la autorizacion
	private HtmlDataTable dataTableAutorizar;
	
	
	public Collection<Ajuste> getPendientesAutorizacion(){
		AjusteStockDAO ajSrockDAO = new AjusteStockDAO(FacesContextUtil.getRequestSession(), new HibernateDAO<Ajuste>(Ajuste.class, FacesContextUtil.getRequestSession()));
		return ajSrockDAO.getPendientesAutorizacion();
	}

	public String autorizar(){
		Ajuste BAStock = (Ajuste) dataTableAutorizar.getRowData();
		BAStock.setFun_autorizante(login.getUsuario());
		BAStock.setAjautorizado(1);
		BAStock.setAjfecha_autorizada(new Date());
		InterfaceDAO<Ajuste> BAStockDAO = new HibernateDAO<Ajuste>(Ajuste.class, FacesContextUtil.getRequestSession());
		BAStockDAO.actualizar(BAStock);
		return null;
	}
	
	public String cancelar(){
		Ajuste BAStock = (Ajuste) dataTableAutorizar.getRowData();
		BAStock.setFun_autorizante(login.getUsuario());
		BAStock.setAjautorizado(0);
		BAStock.setAjfecha_autorizada(new Date());
		InterfaceDAO<Ajuste> BAStockDAO = new HibernateDAO<Ajuste>(Ajuste.class, FacesContextUtil.getRequestSession());
		BAStockDAO.actualizar(BAStock);
		return null;
	}

	public LoginBean getLogin() {
		return login;
	}

	public void setLogin(LoginBean login) {
		this.login = login;
	}

	public HtmlDataTable getDataTableAutorizar() {
		return dataTableAutorizar;
	}

	public void setDataTableAutorizar(HtmlDataTable dataTableAutorizar) {
		this.dataTableAutorizar = dataTableAutorizar;
	}
	
	
	
	
}
