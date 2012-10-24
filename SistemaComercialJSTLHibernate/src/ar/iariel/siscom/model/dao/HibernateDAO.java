package ar.iariel.siscom.model.dao;

import java.io.Serializable;
import java.util.List;
import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;

import ar.iariel.siscom.util.HibernateUtil;
/**
 * 
 * @author Ariel Duarte
 *
 * @param <T>
 */

/*
 * Implementamos la InterfaceDAO que se encargara de la manipulacion de datos 
 * Hibernate tiene su propia forma de manipulacion de datos sin necesidad de SQL
 */
public class HibernateDAO<T> implements InterfaceDAO<T> {

	
	private Class<T> classe; 
	
	/*
	 * Es necesario pasarle la clase para la cual se va a usar el HibernateDAO
	 */
	public HibernateDAO(Class<T> classe) {
		super();
		this.classe = classe;
	}
	
	@Override
	public void salvar(T bean) {
		Session session = HibernateUtil.getSessionfactory().getCurrentSession();
		session.beginTransaction();
		session.save(bean);
		session.getTransaction().commit();//Ya cierra la session,  no es necesario usar close()
		
	}

	@Override
	public void actualizar(T bean) {
		Session session = HibernateUtil.getSessionfactory().getCurrentSession();
		session.beginTransaction();
		session.update(bean);
		session.getTransaction().commit();//Ya cierra la session,  no es necesario usar close()
		
	}

	@Override
	public void eliminar(T bean) {
		Session session = HibernateUtil.getSessionfactory().getCurrentSession();
		session.beginTransaction();
		session.delete(bean);
		session.getTransaction().commit();//Ya cierra la session,  no es necesario usar close()
		
	}

	@Override
	public T getBean(Serializable codigo) {
		Session session = HibernateUtil.getSessionfactory().getCurrentSession();
		session.beginTransaction();
		T bean = (T)session.get(classe, codigo);
		session.getTransaction().commit();//Ya cierra la session,  no es necesario usar close()
		return bean;
	}

	@Override
	public List<T> getsBeans() {
		Session session = HibernateUtil.getSessionfactory().getCurrentSession();
		session.beginTransaction();
		List<T> beans = (List<T>)session.createCriteria(classe).list();
		session.getTransaction().commit();//Ya cierra la session,  no es necesario usar close()
		return beans;
	}

}
