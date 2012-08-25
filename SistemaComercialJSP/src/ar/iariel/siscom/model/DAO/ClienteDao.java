package ar.iariel.siscom.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ar.iariel.siscom.conexion.InterfacePool;
import ar.iariel.siscom.conexion.Pool;
import ar.iariel.siscom.model.bean.Cliente;
/**
 * @author reynaldo.duarte
 * date: 14/08/2012
 */

public class ClienteDao implements InterfaceClienteDao {
	
	private InterfacePool pool;
	
	//-- constructor --//
	public ClienteDao(InterfacePool pool) {
		this.pool = pool;
	}
	
	@Override
	public void guardar(Cliente cliente) throws SQLException {
		//-- Necesitamos una conexion para poder grabar los datos, se lo pedimos al pool --//
		Connection con = pool.getConnection();
		//-- Creamos declaracion para manipulacion --//
		PreparedStatement ps;
		
		String sqlInsert = "INSERT INTO cliente " +
				"(nombre, direccion, email, barrio, ciudad, dni, " +
				"estado, telefono, celular, cpf, obs, provincia, localidad, " +
				"nacimiento, desde, cnpj, insest, sexo, profesion, empresa, " +
				"telempresa, ingreso, referencia, teleref, auditoria " +
				") " +
				"VALUES " +
				"(?, ?, ?, ?, ?, ?, " +
				"?, ?, ?, ?, ?, ?, ?, " +
				"?, ?, ?, ?, ?, ?, ?, " +
				"?, ?, ?, ?, ? " +
				"); ";
		/* Creamos el try para que pueda siempre ejecutarse la liberacion de la conexion 
		 * por mas que exista una excepcion en el transcurso de la transaccion */
		try {
			//-- Creamos Prepared Statement --//
			ps = con.prepareStatement(sqlInsert);
			
			//setPreparedStatement(cliente, ps);
			
			ps.setString(1, cliente.getNombre());
			ps.setString(2, cliente.getDireccion());
			ps.setString(3, cliente.getEmail());
			ps.setString(4, cliente.getBarrio());
			ps.setString(5, cliente.getCiudad());
			ps.setString(6, cliente.getDni());
			ps.setString(7, cliente.getEstado());
			ps.setString(8, cliente.getTelefono());
			ps.setString(9, cliente.getCelular());
			ps.setString(10, cliente.getCpf());
			ps.setString(11, cliente.getObs());
			ps.setString(12, cliente.getProvincia());
			ps.setString(13, cliente.getLocalidad());
			ps.setDate(14, cliente.getNacimiento());
			ps.setDate(15, cliente.getDesde());
			ps.setString(16, cliente.getCnpj());
			ps.setString(17, cliente.getInsest());
			ps.setString(18, cliente.getSexo());
			ps.setString(19, cliente.getProfesion());
			ps.setString(20, cliente.getEmpresa());
			ps.setString(21, cliente.getTelempresa());
			ps.setObject(22, cliente.getIngreso());
			ps.setString(23, cliente.getReferencia());
			ps.setString(24, cliente.getTeleref());
			ps.setString(25, cliente.getAuditoria());

			ps.executeUpdate(); ///Ejecutamos las sentencias
			ps.close();///Cerramos la conexion
		} finally { 
			//-- Siempre se ejecutara la liberacion de la conexion --//
			pool.liberateConnection(con);///Devolvemos la conexion al pool para que la reutice
		}
	}

	private void setPreparedStatement(Cliente cliente, PreparedStatement ps)
			throws SQLException {
		//-- Porque estos campos son Object porque en su defincion de estos atributos no son del tipo primitivo --//
		ps.setObject(1, cliente.getNombre());
		ps.setObject(2, cliente.getDireccion());
		ps.setObject(3, cliente.getEmail());
		ps.setObject(4, cliente.getBarrio());
		ps.setObject(5, cliente.getCiudad());
		ps.setObject(6, cliente.getDni());
		ps.setObject(7, cliente.getEstado());
		ps.setObject(8, cliente.getTelefono());
		ps.setObject(9, cliente.getCelular());
		ps.setObject(10, cliente.getCpf());
		ps.setObject(11, cliente.getObs());
		ps.setObject(12, cliente.getProvincia());
		ps.setObject(13, cliente.getLocalidad());
		ps.setDate(14, cliente.getNacimiento());
		ps.setDate(15, cliente.getDesde());
		ps.setString(16, cliente.getCnpj());
		ps.setString(17, cliente.getInsest());
		ps.setString(18, cliente.getSexo());
		ps.setString(19, cliente.getProfesion());
		ps.setString(20, cliente.getEmpresa());
		ps.setObject(21, cliente.getTelempresa());
		ps.setObject(22, cliente.getIngreso());
		ps.setString(23, cliente.getReferencia());
		ps.setString(24, cliente.getTeleref());
		ps.setString(25, cliente.getAuditoria());
		ps.setObject(26, cliente.getCodigo());
	}

	@Override
	public void eliminar(Integer codigo) throws SQLException {
		//-- Necesitamos una conexion para poder grabar los datos, se lo pedimos al pool --//
		Connection con = pool.getConnection();
		//-- Creamos declaracion para manipulacion --//
		PreparedStatement ps = null;
		String sqlDelete = "DELETE FROM cliente WHERE codigo = ? ; ";
				try {
					ps = con.prepareStatement(sqlDelete);
					ps.setInt(1, codigo);
					ps.executeUpdate();
					ps.close();
				} finally {
					//-- Siempre se ejecutara la liberacion de la conexion --//
					pool.liberateConnection(con);///Devolvemos la conexion al pool para que la reutice
				}
	}

	@Override
	public void actualiza(Cliente cliente) throws SQLException {
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		String sqlAtualizar = " UPDATE cliente SET nombre = ?, direccion = ?, email = ?, barrio = ?, " +
				" ciudad = ?, dni = ?, estado = ?, telefono = ?, celular = ?, cpf = ?, obs = ?, provincia = ?," +
				" localidad = ?, nacimiento = ?, desde = ?, cnpj = ?, insest = ?, sexo = ?, profesion = ?, " +
				" empresa = ?, telempresa = ?, ingreso = ?, referencia = ?, teleref = ? , auditoria = ? WHERE " +
				" codigo = ? ;";
		try {
			
			ps = con.prepareStatement(sqlAtualizar);
			
			setPreparedStatement(cliente, ps);

			ps.executeUpdate(); ///Ejecutamos las sentencias
			ps.close();///Cerramos la conexion
			
		} finally {
			//-- Siempre se ejecutara la liberacion de la conexion --//
			pool.liberateConnection(con);///Devolvemos la conexion al pool para que la reutice
		}
	}

	@Override
	public Cliente getCliente(Integer codigo) throws SQLException {
		//-- Necesitamos una conexion para poder grabar los datos, se lo pedimos al pool --//
		Connection con = pool.getConnection();
		//-- Creamos declaracion para manipulacion --//
		PreparedStatement ps = null;
		System.out.println("Codigo :"+codigo);
		ResultSet rs = null;
		String sqlSelect = "SELECT * FROM cliente WHERE codigo = ? ; ";
		ps = con.prepareStatement(sqlSelect);
		ps.setInt(1, codigo);
		rs = ps.executeQuery();
		
		try {
			List<Cliente> resultado = getListaCliente(rs);
			//-- Verificamos si encontro resultado --//
			if(resultado.size() > 0){
				return resultado.get(0);
			}
			ps.close();
		} finally {
			//-- Siempre se ejecutara la liberacion de la conexion --//
			pool.liberateConnection(con);///Devolvemos la conexion al pool para que la reutice
		}
		
		return null;
	}

	@Override
	public List<Cliente> getClientes() throws SQLException {
		List<Cliente> resultado = new ArrayList<Cliente>();
				//-- Necesitamos una conexion para poder grabar los datos, se lo pedimos al pool --//
				Connection con = pool.getConnection();
				//-- Creamos declaracion para manipulacion --//
				PreparedStatement ps = null;
				//-- Preparamos el comando SQL --//
				String sqlSelect = "SELECT * FROM cliente; ";
				//-- Preparamos el el resultado de la consulta --//
				ResultSet rs = null;
				try {
					//-- Preparamos el Prepared Statement --//
					ps = con.prepareStatement(sqlSelect);
					rs = ps.executeQuery();
					resultado = getListaCliente(rs);
					
					rs.close();
					ps.close();
				} finally {
					//-- Siempre se ejecutara la liberacion de la conexion --//
					pool.liberateConnection(con);///Devolvemos la conexion al pool para que la reutice
				}
				
		return resultado;
	}
	
	
	private List<Cliente> getListaCliente(ResultSet rs) throws SQLException{
		List<Cliente> resultado = new ArrayList<Cliente>();
		while (rs.next()) {
			Cliente cliente = new Cliente();
			cliente.setCodigo(rs.getInt("codigo"));
			cliente.setNombre(rs.getString("nombre"));
			cliente.setDireccion(rs.getString("direccion"));
			cliente.setEmail(rs.getString("email"));
			cliente.setBarrio(rs.getString("barrio"));
			cliente.setCiudad(rs.getString("ciudad"));
			cliente.setDni(rs.getString("dni"));
			cliente.setEstado(rs.getString("estado"));
			cliente.setTelefono(rs.getString("telefono"));
			cliente.setCelular(rs.getString("celular"));
			cliente.setCpf(rs.getString("cpf"));
			cliente.setObs(rs.getString("obs"));
			cliente.setProvincia(rs.getString("provincia"));
			cliente.setLocalidad(rs.getString("localidad"));
			cliente.setNacimiento(rs.getDate("nacimiento"));
			cliente.setDesde(rs.getDate("desde"));
			cliente.setCnpj(rs.getString("cnpj"));
			cliente.setInsest(rs.getString("insest"));
			cliente.setSexo(rs.getString("sexo"));
			cliente.setProfesion(rs.getString("profesion"));
			cliente.setEmpresa(rs.getString("empresa"));
			cliente.setTelempresa(rs.getString("telempresa"));
			cliente.setIngreso(rs.getDouble("ingreso"));
			cliente.setReferencia(rs.getString("referencia"));
			cliente.setTeleref(rs.getString("teleref"));
			cliente.setAuditoria(rs.getString("auditoria"));
			resultado.add(cliente);
		}
		
		return resultado;
	}

}
