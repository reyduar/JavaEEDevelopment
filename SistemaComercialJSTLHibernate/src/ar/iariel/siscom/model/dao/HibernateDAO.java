package ar.iariel.siscom.model.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import ar.iariel.siscom.model.bean.Proveedor;
/**
 * Date : 07/10/2012
 * @author Ariel Duarte
 * @param <T>
 */

/*
 * Implementamos la InterfaceDAO que se encargara de la manipulacion de datos 
 * Hibernate tiene su propia forma de manipulacion de datos sin necesidad de SQL
 */
public class HibernateDAO<T> implements InterfaceDAO<T> {

	
	private Class<T> classe; 
	private Session session;
	
	/*
	 * Es necesario pasarle la clase para la cual se va a usar el HibernateDAO
	 */
	public HibernateDAO(Class<T> classe, Session session) {
		super();
		this.classe = classe;
		this.session = session;
	}
	
	@Override
	public void salvar(T bean) {
		session.save(bean);
		
	}

	@Override
	public void actualizar(T bean) {
		session.update(bean);
		
	}

	@Override
	public void eliminar(T bean) {
		session.delete(bean);
		
	}

	@Override
	public T getBean(Serializable codigo) {
		T bean = (T)session.get(classe, codigo);
		return bean;
	}

	@Override
	public List<T> getsBeans() {
		List<T> beans = (List<T>)session.createCriteria(classe).list();
		return beans;
	}

	@Override
	public List<T> getBeansByExample(T Bean) {
		Example example = Example.create(Bean); 
		example.enableLike(MatchMode.ANYWHERE);
		example.ignoreCase();
		return session.createCriteria(classe).add(example).list();
	}
	
	//TODO : Implementacion de codigo HQL
	public List<Proveedor> getProveedorListHQL(){
		 String queryHQL = "from Proveedor P order by P.nombre" ;
		// session.createSQLQuery(queryHQL);//Crea un SQL conveciona
		 return (List<Proveedor>) session.createQuery(queryHQL).list();//Crea un HQL
	}
	
	//TODO : Implementacion de codigo con Query Criteria
	public List<Proveedor> getProveedorSinDireccion(){
		
		Criteria criteria = session.createCriteria(Proveedor.class);
		criteria.add(Restrictions.or(Restrictions.isNull("direccion"), Restrictions.eq("direccion", "")));
		 return (List<Proveedor>) criteria.list();//Crea un HQL
	}

	
}
