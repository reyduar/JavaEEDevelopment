package ar.iariel.siscom.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ar.iariel.siscom.conexion.InterfacePool;
import ar.iariel.siscom.model.bean.Cliente;
import ar.iariel.siscom.model.bean.Funcionario;
/**
 * 
 * @author Ariel Duarte
 * date : 20/08/2012
 */
public class FuncionarioDao implements InterfaceFuncionarioDao {

	private InterfacePool pool;

	public FuncionarioDao(InterfacePool pool) {
		this.pool = pool;
	}

	@Override
	public void guardar(Funcionario funcionario) throws SQLException {
		//-- Necesitamos una conexion para poder grabar los datos, se lo pedimos al pool --//
		Connection con = pool.getConnection();
		//-- Creamos declaracion para manipulacion --//
		PreparedStatement ps;

		String sqlInsert = "INSERT INTO funcionario " +
				"(departamento_codigo, nombre, direccion, email, barrio, ciudad, dni, " +
				"estado, telefono, celular, provincia, nacionalidad, profesion, fechanacimiento, " +
				"cargo, sueldo, login, pass, auditoria, actotal " +
				") " +
				"VALUES " +
				"(?, ?, ?, ?, ?, ?, " +
				"?, ?, ?, ?, ?, ?, ?, " +
				"?, ?, ?, ?, ?, ?, ? " +
				"); ";
		/* Creamos el try para que pueda siempre ejecutarse la liberacion de la conexion 
		 * por mas que exista una excepcion en el transcurso de la transaccion */
		try {
			//-- Creamos Prepared Statement --//
			ps = con.prepareStatement(sqlInsert);
			//setPreparedStatement(cliente, ps);

			ps.setInt(1, funcionario.getDepartamento_codigo());
			ps.setString(2, funcionario.getNombre());
			ps.setString(3, funcionario.getDireccion());
			ps.setString(4, funcionario.getEmail());
			ps.setString(5, funcionario.getBarrio());
			ps.setString(6, funcionario.getCiudad());
			ps.setString(7, funcionario.getDni());
			ps.setString(8, funcionario.getEstado());
			ps.setString(9, funcionario.getTelefono());
			ps.setString(10, funcionario.getCelular());
			ps.setString(11, funcionario.getProvincia());
			ps.setString(12, funcionario.getNacionalidad());
			ps.setString(13, funcionario.getProfesion());
			ps.setDate(14, funcionario.getFechanacimiento());
			ps.setString(15, funcionario.getCargo());
			ps.setDouble(16, funcionario.getSueldo());
			ps.setString(17, funcionario.getLogin());
			ps.setString(18, funcionario.getPass());
			ps.setString(19, funcionario.getAuditoria());
			ps.setString(20, funcionario.getActotal());

			ps.executeUpdate(); ///Ejecutamos las sentencias
			ps.close();///Cerramos la conexion
		} finally { 
			//-- Siempre se ejecutara la liberacion de la conexion --//
			pool.liberateConnection(con);///Devolvemos la conexion al pool para que la reutice
		}

	}

	@Override
	public Funcionario getFuncionario(Integer codigo) throws SQLException {
		
		Funcionario funcionario = null;
		Connection con = null;
		
		try {
		con = pool.getConnection();
		PreparedStatement ps ;

		String sqlSelect = "SELECT * FROM funcionario WHERE codigo = ? ; ";
		
		ps = con.prepareStatement(sqlSelect);
		ps.setInt(1, codigo);
		ResultSet rs = ps.executeQuery();

			List<Funcionario> resultado = getListaFuncionario(rs);
			//-- Verificamos si encontro resultado --//
			if(resultado.size() > 0){
				return resultado.get(0);
			}
			ps.close();
		} finally {
			pool.liberateConnection(con);///Devolvemos la conexion al pool para que la reutice
		}

		return funcionario;
	}

	//-- Este metodo se encarga de exista el login ingresa por el usuario --//
	@Override
	public Funcionario getFuncionario(String login) throws SQLException {
		Funcionario funcionario = null;
		Connection con = null;
		try {
			con = pool.getConnection();
			PreparedStatement ps;
			String sqlSelect ="SELECT * FROM funcionario WHERE login = ? ;";
			ps = con.prepareStatement(sqlSelect);
			ps.setString(1, login);
			ResultSet rs = ps.executeQuery();

			List<Funcionario> resultado = getListaFuncionario(rs);
			if(resultado.size() > 0 )
				funcionario = resultado.get(0);

			rs.close();
			ps.close();
		}finally
		{
			//-- Siempre se ejecutara la liberacion de la conexion --//
			pool.liberateConnection(con);///Devolvemos la conexion al pool para que la reutice
		}
		return funcionario;	
	}

	@Override
	public void eliminar(Integer codigo) throws SQLException {
		//-- Necesitamos una conexion para poder grabar los datos, se lo pedimos al pool --//
		Connection con = null;
		try {
			con = pool.getConnection();
			//-- Creamos declaracion para manipulacion --//
			PreparedStatement ps;
			String sqlDelete = "DELETE FROM funcionario WHERE codigo = ? ; ";
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
	public void actualiza(Funcionario funcionario) throws SQLException {
		Connection con = null;
		try {
		
		con = pool.getConnection();
		PreparedStatement ps;
		
		String sqlAtualizar = "UPDATE funcionario SET departamento_codigo = ?, nombre = ?, direccion = ?, email = ?, barrio = ?, " +
				" ciudad = ?, dni = ?, estado = ?, telefono = ?, celular = ?, provincia = ?, nacionalidad = ?, profesion = ?," +
				" fechanacimiento = ?, cargo = ?, sueldo = ?, login = ?, pass = ?, auditoria = ?, actotal = ? " +
				" WHERE " +
				" codigo = ? ;";

			ps = con.prepareStatement(sqlAtualizar);


			setPreparedStatement(funcionario, ps);

			ps.executeUpdate(); ///Ejecutamos las sentencias

			ps.close();///Cerramos la conexion

		} finally {
			//-- Siempre se ejecutara la liberacion de la conexion --//
			pool.liberateConnection(con);///Devolvemos la conexion al pool para que la reutice
		}

	}


	@Override
	public List<Funcionario> getFuncionarios() throws SQLException {
		List<Funcionario> resultado = null;
		//-- Necesitamos una conexion para poder grabar los datos, se lo pedimos al pool --//
		Connection con = null;


		try {
			con = pool.getConnection();
			//-- Creamos declaracion para manipulacion --//
			PreparedStatement ps;
			//-- Preparamos el comando SQL --//
			String sqlSelect = "SELECT * FROM funcionario; ";
			//-- Preparamos el Prepared Statement --//
			ps = con.prepareStatement(sqlSelect);
			ResultSet rs = ps.executeQuery();

			resultado = getListaFuncionario(rs);

			rs.close();
			ps.close();

		} finally {
			//-- Siempre se ejecutara la liberacion de la conexion --//
			pool.liberateConnection(con);///Devolvemos la conexion al pool para que la reutice
		}

		return resultado;
	}

	private void setPreparedStatement(Funcionario funcionario, PreparedStatement ps)
			throws SQLException {
		ps.setInt(1, funcionario.getDepartamento_codigo());
		ps.setString(2, funcionario.getNombre());
		ps.setString(3, funcionario.getDireccion());
		ps.setString(4, funcionario.getEmail());
		ps.setString(5, funcionario.getBarrio());
		ps.setString(6, funcionario.getCiudad());
		ps.setString(7, funcionario.getDni());
		ps.setString(8, funcionario.getEstado());
		ps.setString(9, funcionario.getTelefono());
		ps.setString(10, funcionario.getCelular());
		ps.setString(11, funcionario.getProvincia());
		ps.setString(12, funcionario.getNacionalidad());
		ps.setString(13, funcionario.getProfesion());
		ps.setDate(14, funcionario.getFechanacimiento());
		ps.setString(15, funcionario.getCargo());
		ps.setDouble(16, funcionario.getSueldo());
		ps.setString(17, funcionario.getLogin());
		ps.setString(18, funcionario.getPass());
		ps.setString(19, funcionario.getAuditoria());
		ps.setString(20, funcionario.getActotal());
		ps.setObject(21, funcionario.getCodigo());
	}

	private List<Funcionario> getListaFuncionario(ResultSet rs) throws SQLException{
		List<Funcionario> resultado = new ArrayList<Funcionario>();
		while (rs.next()) {
			Funcionario funcionario = new Funcionario();
			funcionario.setCodigo(rs.getInt("codigo"));
			funcionario.setDepartamento_codigo(rs.getInt("departamento_codigo"));
			funcionario.setNombre(rs.getString("nombre"));
			funcionario.setDireccion(rs.getString("direccion"));
			funcionario.setEmail(rs.getString("email"));
			funcionario.setBarrio(rs.getString("barrio"));
			funcionario.setCiudad(rs.getString("ciudad"));
			funcionario.setDni(rs.getString("dni"));
			funcionario.setEstado(rs.getString("estado"));
			funcionario.setTelefono(rs.getString("telefono"));
			funcionario.setCelular(rs.getString("celular"));
			funcionario.setProvincia(rs.getString("provincia"));
			funcionario.setNacionalidad(rs.getString("nacionalidad"));
			funcionario.setProfesion(rs.getString("profesion"));
			funcionario.setFechanacimiento(rs.getDate("fechanacimiento"));
			funcionario.setCargo(rs.getString("cargo"));
			funcionario.setSueldo(rs.getDouble("sueldo"));
			funcionario.setLogin(rs.getString("login"));
			funcionario.setPass(rs.getString("pass"));
			funcionario.setAuditoria(rs.getString("auditoria"));
			funcionario.setActotal(rs.getString("actotal"));
			resultado.add(funcionario);
		}

		return resultado;
	}

}
