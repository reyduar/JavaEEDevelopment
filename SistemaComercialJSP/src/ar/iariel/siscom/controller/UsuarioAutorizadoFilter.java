package ar.iariel.siscom.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.conexion.InterfacePool;
import ar.iariel.siscom.conexion.Pool;
import ar.iariel.siscom.model.DAO.AccesoDao;
import ar.iariel.siscom.model.command.InterfaceCommand;
import ar.iariel.siscom.model.command.VerificarAutorizacion;

/**
 * 
 * @author Ariel Duarte
 *
 */
//-- Este servlet se implementa con la finalidad de filtrar los permisos de usurios
//-- aunque es bastante confusa su interpretacion se lo utiliza para el motivo para el cual fue hecho
public class UsuarioAutorizadoFilter implements Filter {

	public InterfaceCommand verificarAutorizacion;
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		String destino = verificarAutorizacion.execute((HttpServletRequest)request, (HttpServletResponse)response);
		if(destino != null){
			((HttpServletRequest)request).getRequestDispatcher(destino).include(request, response);
		}else{
			filterChain.doFilter(request, response);
		}
	}
	
	//-- En el metodo init obtenemos un pool del getServletContext el cual le pasamos en el constructor de la Servler SiscomController --//
    //-- Creamos un objeto del tipo verificarAutorizacion que inicialmente sera el encargado de realizar las retricciones a los usuarios 
	//-- con permisos limitados
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		InterfacePool pool = new Pool();
		filterConfig.getServletContext().setAttribute("pool", pool); //Asigamos el pool en el contexto de la aplicacion
		verificarAutorizacion = new VerificarAutorizacion(new AccesoDao(pool));
	}

}
