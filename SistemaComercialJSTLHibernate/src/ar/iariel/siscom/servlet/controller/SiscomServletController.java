package ar.iariel.siscom.servlet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.model.command.InterfaceCommand;
import ar.iariel.siscom.model.helper.SiscomHelper;

/**
 * Date 11/10/2012
 * @author Ariel Duarte
 * Servlet implementation class SiscomServletController
 */
@WebServlet("/SiscomServletController")
public class SiscomServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SiscomServletController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private void procesarPeticion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	SiscomHelper siscomHelper = new SiscomHelper(request);
    	InterfaceCommand command = siscomHelper.getCommand();
    	String pagina = command.execute(request, response);
    	request.getRequestDispatcher(pagina).forward(request, response);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.procesarPeticion(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.procesarPeticion(request, response);
	}

}
