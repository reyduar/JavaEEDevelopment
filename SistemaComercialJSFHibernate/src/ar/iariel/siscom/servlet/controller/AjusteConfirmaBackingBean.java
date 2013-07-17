package ar.iariel.siscom.servlet.controller;

import java.util.Collection;

import javax.faces.component.html.HtmlDataTable;

import ar.iariel.siscom.model.bean.Ajuste;
import ar.iariel.siscom.model.dao.AjusteStockDAO;
import ar.iariel.siscom.model.dao.HibernateDAO;
import ar.iariel.siscom.util.FacesContextUtil;
//TODO : Aca me quedo con el video 18.4 04:48
public class AjusteConfirmaBackingBean {
	
	private LoginBean login;
	private HtmlDataTable dataTableConfirmarAjuste;
	
	public String confirmarAjusteStock(){
		Ajuste ajusteBean = (Ajuste) dataTableConfirmarAjuste.getRowData();
		if(ajusteBean.getAjcant_confirmada() <= ajusteBean.getArticulo().getArtstockmin()){
			FacesContextUtil.setMessageError("Cantidad solicitada superior a la del Stock");
			return null;
		}else if(ajusteBean.getAjcant_confirmada() > ajusteBean.getAjcant_solicitada()){
			FacesContextUtil.setMessageError("Cantidad de entrega no puede ser superior a la solicitada");
			return null;
		}
		
		return null;
	}
	
	public Collection<Ajuste> getPendientesConfirmar(){
		AjusteStockDAO ajusteDAO = new AjusteStockDAO(FacesContextUtil.getRequestSession(),new HibernateDAO<Ajuste>(Ajuste.class, FacesContextUtil.getRequestSession()));
		
		return ajusteDAO.getPendientesConfirmar();
	}


	public LoginBean getLogin() {
		return login;
	}


	public void setLogin(LoginBean login) {
		this.login = login;
	}


	public HtmlDataTable getDataTableConfirmarAjuste() {
		return dataTableConfirmarAjuste;
	}


	public void setDataTableConfirmarAjuste(HtmlDataTable dataTableConfirmarAjuste) {
		this.dataTableConfirmarAjuste = dataTableConfirmarAjuste;
	}

}
