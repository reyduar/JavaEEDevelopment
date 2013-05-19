package ar.com.cgeolocator.model;

/**
 * @author Ariel Duarte
 * date 20/02/2017
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import ar.com.cgeolocator.conexion.InterfacePool;



public class ContactDao implements InterfaceDao {

	private InterfacePool pool;
	
	
	public ContactDao(InterfacePool pool) {
		super();
		this.pool = pool;
	}
	
	@Override
	public void save(ContactBean contact) throws SQLException {
		Connection con = pool.getConnection();
		PreparedStatement ps;
		String sqlInsert = "INSERT INTO contact (number, latitude, longitude, date, description) VALUES " +
				"(?, ?, ?, ?, ?" +
				"); ";
		try {
			ps = con.prepareStatement(sqlInsert);
			
			ps.setObject(1, contact.getNumber());
			ps.setObject(2, contact.getLatitude());
			ps.setObject(3, contact.getLongitude());
			ps.setObject(4, contact.getDate());
			ps.setObject(5, contact.getDescription());
			

			ps.executeUpdate();
			ps.close();
		} finally { 
			pool.liberateConnection(con);
		}
		

	}

	@Override
	public void delete(Integer number) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(ContactBean cliente) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public ContactBean getContact(Integer number) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContactBean> getContacts() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
