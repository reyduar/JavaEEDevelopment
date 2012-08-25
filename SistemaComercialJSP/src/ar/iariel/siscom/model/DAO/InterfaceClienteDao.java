package ar.iariel.siscom.model.DAO;

import java.sql.SQLException;
import java.util.List;

import ar.iariel.siscom.model.bean.Cliente;
/**
 * @author reynaldo.duarte
 * date: 14/08/2012
 */

/* Esta interface definira los metodos que seran esperados por una clase que sera 
   responsable del acceso a los datos referente a los clientes*/
public interface InterfaceClienteDao {
	public abstract void guardar(Cliente cliente) throws SQLException;//Ingresa un nuevo cliente
	public abstract void eliminar(Integer codigo) throws SQLException;//Elimina cliente
	public abstract void actualiza(Cliente cliente) throws SQLException;//Actualiza Cliente
	public abstract Cliente getCliente(Integer codigo) throws SQLException;//Devuelve un solo cliente
	public abstract List<Cliente> getClientes() throws SQLException; ///Devuelve una lista de clientes
}
