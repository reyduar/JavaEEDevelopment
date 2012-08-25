package ar.iariel.siscom.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.conexion.InterfacePool;
import ar.iariel.siscom.conexion.Pool;
import ar.iariel.siscom.model.command.InterfaceCommand;
import ar.iariel.siscom.model.helper.SiscomHelper;

/**
 * @author Ariel Duarte
 * Servlet implementation class SiscomController
 */

//-- El servlet SiscomController sera encargado del tratamiento de las peticiones que tuvieran lugar en la aplicacion web --//
//-- Todas las peticiones van a circular por este Servlet, el va procesar esa peticiony va delegar para SiscomHelper para que
//-- el decida que va hacer con esa peticion. Cuado SiscomHelper decide que va hacer con esa peticion el va a transferir a la
//-- ejecucion de ese procesamiento para algun comando. Lo que recibe SiscomController es una pagina de destino para aquella peticion 
//-- Osea SiscomController recibe la peticion llama a Helper y Helper va a definir que comando sera ejecutado y va a retornar para controller
//-- la pagina para la cual esa peticion fue direccionado.
@WebServlet("/SiscomController")
public class SiscomController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private InterfacePool pool = new Pool();//Se implementa en el controlador pool
	
	private SiscomHelper siscomHelper = new SiscomHelper(pool);//Necesitamos el pool para los filtros
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SiscomController() {
        super();
       
    }
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	// TODO Auto-generated method stub
    	super.init(config);
    	this.pool = (InterfacePool)getServletContext().getAttribute("pool"); //Asigamos el pool en el contexto de la aplicacion
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		procesarPeticion(request, response);
	}

	private void procesarPeticion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("Procesamiento de Peticiones Funcionando.... ... ..");
		//-- Instanciamos la clase Helper que recibe como parametro la peticion --//
		siscomHelper.setRequest(request);
		//-- SiscomHelper retorna un Objeto del tipo interface comando --//
		InterfaceCommand comando = siscomHelper.getCommand();
		//-- Ejecuto ese comando con ayuda del metodo execute que se encutra en la interfaz InterfaceCommand --//
		String pagina = comando.execute(request, response); //--> retorna un String que es la pagina de destino
		//-- Voy a utilizar la pagina y direccinar la peticion  --//
		request.getRequestDispatcher(pagina).include(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		procesarPeticion(request, response);
	}

}
