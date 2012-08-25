package ar.iariel.siscom.model.DAO;

import java.sql.SQLException;
import java.util.List;

import ar.iariel.siscom.model.bean.Cliente;
import ar.iariel.siscom.model.bean.Funcionario;

/**
 * 
 * @author Ariel Duarte
 * date : 20/08/2012
 */
public interface InterfaceFuncionarioDao {
	Funcionario getFuncionario(Integer codigo) throws SQLException;//Devuelve un solo funcionario
	Funcionario getFuncionario(String login) throws SQLException;//Devuelve un solo funcionario
	void eliminar(Integer codigo) throws SQLException;//Elimina funcionario
	void actualiza(Funcionario funcionario) throws SQLException;//Actualiza funcionario
	void guardar(Funcionario funcionario) throws SQLException;//Ingresa un nuevo funcionario
	List<Funcionario> getFuncionarios() throws SQLException; ///Devuelve una lista de funcionario 
}
