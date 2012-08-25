package ar.iariel.siscom.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ar.iariel.siscom.conexion.InterfacePool;
import ar.iariel.siscom.model.bean.Acceso;

public class AccesoDao {

	private InterfacePool pool;

	// -- constructor --//
	public AccesoDao(InterfacePool pool) {
		this.pool = pool;
	}

	public void guardar(List<Acceso> accesos) throws SQLException {
		// -- Necesitamos una conexion para poder grabar los datos, se lo
		// pedimos al pool --//
		Connection con = pool.getConnection();
		// -- Creamos declaracion para manipulacion --//
		PreparedStatement ps;

		String sqlInsert = "INSERT INTO acesso_funcionario "
				+ "(funcionario_codigo, acesso_codigo " + ") " + "VALUES "
				+ "(?, ? " + "); ";
		try {
			ps = con.prepareStatement(sqlInsert);

			for (Acceso acceso : accesos) {
				ps.setInt(1, acceso.getFuncionario_codigo());
				ps.setInt(2, acceso.getAcceso_codigo());
				ps.addBatch(); // Añade una sentencia a la lista de sentencias
								// por lotes.
			}
			ps.executeBatch();// Retorna un array de enteros con el resultado de
								// cada sentencia.
			ps.close();
		} finally {
			// -- Siempre se ejecutara la liberacion de la conexion --//
			pool.liberateConnection(con);// /Devolvemos la conexion al pool para
											// que la reutice
		}
	}

	public void eliminar(Integer codigoFuncionario) throws SQLException {
		// -- Necesitamos una conexion para poder grabar los datos, se lo
		// pedimos al pool --//
		Connection con = pool.getConnection();
		// -- Creamos declaracion para manipulacion --//
		PreparedStatement ps;

		try {
			String sqlDelete = "DELETE FROM acesso_funcionario  WHERE funcionario_codigo = ?;";
			ps = con.prepareStatement(sqlDelete);
			ps.setInt(1, codigoFuncionario);
			ps.executeUpdate();
			ps.close();
		} finally {
			// -- Siempre se ejecutara la liberacion de la conexion --//
			pool.liberateConnection(con);// /Devolvemos la conexion al pool para
											// que la reutice
		}
	}

	public Map<String, Acceso> getAccesosFuncionarios(Integer codigoFuncionario)
			throws SQLException {
		Map<String, Acceso> resultado = new HashMap<String, Acceso>();
		// -- Necesitamos una conexion para poder grabar los datos, se lo
		// pedimos al pool --//
		Connection con = pool.getConnection();
		// -- Creamos declaracion para manipulacion --//
		PreparedStatement ps;

		String sqlSelect = "SELECT * FROM acesso AS a LEFT JOIN acesso_funcionario AS f "
				+ "ON a.codigo = f.acesso_codigo AND f.funcionario_codigo = ? ORDER BY a.codigo ;";
		try {
			ps = con.prepareStatement(sqlSelect);
			ps.setInt(1, codigoFuncionario);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Acceso acc = new Acceso();
				acc.setAcceso_codigo(rs.getInt("codigo"));
				acc.setComando(rs.getString("comando"));
				acc.setDescripcion(rs.getString("descripcion"));
				acc.setFuncionario_codigo(rs.getInt("funcionario_codigo"));
				resultado.put(acc.getComando(), acc);
			}
			rs.close();
			ps.close();
			return resultado;
		} finally {
			// -- Siempre se ejecutara la liberacion de la conexion --//
			pool.liberateConnection(con);// /Devolvemos la conexion al pool para
											// que la reutice
		}
		

		
	}
}
