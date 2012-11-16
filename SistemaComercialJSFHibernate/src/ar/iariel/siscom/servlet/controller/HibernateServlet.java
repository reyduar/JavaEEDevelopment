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

import ar.iariel.siscom.model.bean.Articulo;
import ar.iariel.siscom.model.bean.Ciudad;
import ar.iariel.siscom.model.bean.FormaPago;
import ar.iariel.siscom.model.bean.Proveedor;
import ar.iariel.siscom.model.dao.HibernateDAO;
import ar.iariel.siscom.util.HibernateUtil;

/**
 * Date 11/10/2012
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
        
        Session session = HibernateUtil.getSessionfactory().openSession();
        session.beginTransaction();
         
        HibernateDAO<Proveedor> proveedorDAO = new HibernateDAO<Proveedor>(Proveedor.class, session);
        HibernateDAO<Ciudad> ciudadDAO = new HibernateDAO<Ciudad>(Ciudad.class, session);
        HibernateDAO<Articulo> articuloDAO = new HibernateDAO<Articulo>(Articulo.class, session);
        HibernateDAO<FormaPago> formaDAO = new HibernateDAO<FormaPago>(FormaPago.class, session);

      
        

       //-- Consulta de proveedores --//
        List<Proveedor> proveedores = proveedorDAO.getsBeans();
        System.out.println("Proveedores-----");
        for (Proveedor p : proveedores) {
			System.out.println(p.getCodigo()+" - "+p.getNombre());
		}
        
        //-- Consulta de Forma de pago --//
        List<FormaPago> pagos = formaDAO.getsBeans();
        System.out.println("Forma de pagos-----");
        for (FormaPago fp : pagos) {
			System.out.println(fp.getCodigo()+" - "+fp.getNombre());
		}
        
      //-- Consulta de Articulos --//
        List<Articulo> articulos = articuloDAO.getsBeans();
        System.out.println("Articulos-----");
        for (Articulo a : articulos) {
			System.out.println(a.getCodigo()+" - "+a.getArtnomreal());
		}
        
        //-- Consulta de Forma de pago con QBE --//
        FormaPago cp = new FormaPago();
        cp.setNombre("TARJETA");
        List<FormaPago> lpagos = formaDAO.getBeansByExample(cp);
        System.out.println("Forma de pagos con Tarjeta-----");
        for (FormaPago fp : lpagos) {
			System.out.println(fp.getCodigo()+" - "+fp.getNombre());
		}
        session.getTransaction().commit();
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
