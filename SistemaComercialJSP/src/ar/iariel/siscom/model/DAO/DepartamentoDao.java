package ar.iariel.siscom.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ar.iariel.siscom.conexion.InterfacePool;
import ar.iariel.siscom.model.bean.Departamento;

/**
 * 
 * @author Ariel Duarte
 *
 */
public class DepartamentoDao {
	
private InterfacePool pool;
	
	//-- constructor --//
	public DepartamentoDao(InterfacePool pool) {
		super();
		this.pool = pool;
	}

	public List<Departamento> getDepartamentos() throws SQLException{
		List<Departamento> resultado = new ArrayList<Departamento>();
		//-- Necesitamos una conexion para poder grabar los datos, se lo pedimos al pool --//
		Connection con = pool.getConnection();
		//-- Creamos declaracion para manipulacion --//
		PreparedStatement ps = null;
		//-- Preparamos el comando SQL --//
		String sqlSelect = "SELECT * FROM departamento; ";
		//-- Preparamos el el resultado de la consulta --//
		ResultSet rs = null;
		try {
			//-- Preparamos el Prepared Statement --//
			ps = con.prepareStatement(sqlSelect);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Departamento departamento = new Departamento();
				departamento.setCodigo(rs.getInt("codigo"));
				departamento.setNombre(rs.getString("nombre"));
				departamento.setGerente(rs.getString("gerente"));

				resultado.add(departamento);
			}
			
			rs.close();
			ps.close();
		} finally {
			//-- Siempre se ejecutara la liberacion de la conexion --//
			pool.liberateConnection(con);///Devolvemos la conexion al pool para que la reutice
		}
		
		return resultado;
		
	}

}
