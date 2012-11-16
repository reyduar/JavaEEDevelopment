package ar.iariel.siscom.model.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import ar.iariel.siscom.model.bean.Articulo;

public class ArticuloDAO extends HibernateDAO<Articulo> {

	public ArticuloDAO(Session session) {
		super(Articulo.class,session);
	}
	
	public List<Articulo> getArticuloPorProveedor(Articulo art){
		Example example = getExample(art);
		
		Criteria criArt = session.createCriteria(Articulo.class);
		if(art.getMarca() != null){
			criArt.add(Restrictions.eq("marca.codigo", art.getMarca().getCodigo()));
		}
		return criArt.add(example).list();
		
		//return session.createCriteria(Articulo.class).add(example).list();
	}



}
