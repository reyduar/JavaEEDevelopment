package ar.com.cgeolocator.controller;

import java.sql.SQLException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.com.cgeolocator.conexion.InterfacePool;
import ar.com.cgeolocator.conexion.Pool;
import ar.com.cgeolocator.model.ContactBean;
import ar.com.cgeolocator.model.ContactDao;
import ar.com.cgeolocator.model.InterfaceDao;


public class AddContact {
	
	private InterfacePool pool = new Pool();//Se implementa en el controlador pool
	private InterfaceDao contactDao = new ContactDao(pool);
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
	String message = "";
	try {
		ContactBean c = new ContactBean();
		c.setNumber(Integer.parseInt(request.getParameter("number")));
		c.setLatitude(Double.valueOf(request.getParameter("latitude")));
		c.setLongitude(Double.valueOf(request.getParameter("longitude")));
		c.setDate(String.valueOf(new Date()));
		c.setDescription(request.getParameter("description"));
		contactDao.save(c);
		message = "Save successfully";
	} catch (SQLException e) {
		e.printStackTrace();
		message = "Error SQL :"+e.getMessage();
	} catch (NumberFormatException e) {
		message = "Error Formato :"+e.getMessage();
		e.printStackTrace();
	} catch (Exception e) {
		message = "Error :"+e.getMessage();
		e.printStackTrace();
	}	
	
		return message;
	}

}
