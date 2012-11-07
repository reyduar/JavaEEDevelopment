package ar.iariel.siscom.servlet.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import ar.iariel.siscom.util.HibernateUtil;
/**
 * Date : 07/10/2012
 * @author Ariel Duarte
 *
 */
public class FilterTransactionHibernate implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		// Va a ser el encargado de administrar la session
		Session session = null;
		try {
			// Genera una session que es administrada por hibernate el se encarga de cerrar la session //
			session = HibernateUtil.getSessionfactory().openSession();
			session.beginTransaction();
			//Aca se coloca alguna operacion hecha por el Dao
			((HttpServletRequest)request).setAttribute(HibernateUtil.HIBERNATE_SESSION, session);
			filterChain.doFilter(request, response);
			session = (Session) ((HttpServletRequest)request).getAttribute(HibernateUtil.HIBERNATE_SESSION);
			session.flush();
			// Despues de alguna operacion se hace el commit de la transaccion y se cerra la session//
			session.getTransaction().commit();
		} catch (HibernateException e) {
			session.getTransaction().rollback();//En caso de problema hacemos un rollback de todo
			request.setAttribute("mensagem", "Existio un problema critico en la transacción vuelva a intentarlo");
			e.printStackTrace();
		}finally{
			session.close();
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
