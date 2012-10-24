package ar.iariel.siscom.model.dao;

import java.io.Serializable;
import java.util.List;
/**
 * 
 * @author Ariel Duarte
 *
 * @param <T>
 */
public interface InterfaceDAO<T> {
	void salvar(T bean);
	void actualizar(T bean);
	void eliminar(T bean);
	T getBean(Serializable codigo);
	List<T> getsBeans();
}
