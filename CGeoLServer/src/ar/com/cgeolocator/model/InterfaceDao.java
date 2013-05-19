package ar.com.cgeolocator.model;

import java.sql.SQLException;
import java.util.List;
/**
 * 
 * @author Ariel Duarte
 * date : 20/02/2013
 */
public interface InterfaceDao {
	public abstract void save(ContactBean contact) throws SQLException;
	public abstract void delete(Integer number) throws SQLException;
	public abstract void update(ContactBean cliente) throws SQLException;
	public abstract ContactBean getContact(Integer number) throws SQLException;
	public abstract List<ContactBean> getContacts() throws SQLException; 

}
