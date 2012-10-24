package ar.iariel.siscom.servlet.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import ar.iariel.siscom.model.bean.Ciudad;
import ar.iariel.siscom.model.bean.Proveedor;
import ar.iariel.siscom.model.dao.HibernateDAO;
import ar.iariel.siscom.util.HibernateUtil;

/**
 * @author Ariel Duarte
 * Servlet implementation class HibernateServlet
 */
@WebServlet("/HibernateServlet")
public class HibernateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HibernateServlet() {
        super();
        HibernateDAO<Proveedor> proveedorDAO = new HibernateDAO<Proveedor>(Proveedor.class);
        HibernateDAO<Ciudad> ciudadDAO = new HibernateDAO<Ciudad>(Ciudad.class);
        Ciudad ciudadBean = new Ciudad();

          /* Para Proveedores */
//        ciudadBean.setCodigo(10);
//        Proveedor proveedorBean = new Proveedor();
//        proveedorBean.setCiudad(ciudadBean);
//        proveedorBean.setNombre("Proveedor Fontana");
//        proveedorBean.setRuc("00000000");
//        proveedorBean.setDireccion("Fontana");
//        proveedorBean.setTelefono("00000000");
//        proveedorBean.setFax("0000000");
//        proveedorBean.setEmail("lcity@gmail.com");
//        proveedorBean.setTipo(1);
//        proveedorBean.setPais(2);
//        proveedorDAO.salvar(proveedorBean);
        
        
        /* Para ciudades */
//        ciudadBean.setNombre("Fontana");
//        ciudadDAO.salvar(ciudadBean);
        
//        Ciudad ciudadList = ciudadDAO.getBean(10);
//        List<Proveedor> proveedores = ciudadList.getProveedores();
//        for (Proveedor proveedor : proveedores) {
//			System.out.println("Proveedor: "+proveedor.getNombre()+" Ciudad : "+proveedor.getCiudad().getCodigo());
//		}
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
