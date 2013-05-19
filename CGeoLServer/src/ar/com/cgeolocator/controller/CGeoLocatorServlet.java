package ar.com.cgeolocator.controller;
/**
 * @author Ariel Duarte
 * date : 20/02/2013
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CGeoLocatorServlet
 */
@WebServlet("/CGeoLocatorServlet")
public class CGeoLocatorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CGeoLocatorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Numero : "+ request.getParameter("number"));
		System.out.println("latitude : "+ request.getParameter("latitude"));
		System.out.println("longitude : "+ request.getParameter("longitude"));
		System.out.println("description : "+ request.getParameter("description"));
		
		AddContact addContact = new AddContact();
		String result = addContact.execute(request, response);
		responseXML(response, result);
		
	}
	
	private void responseXML(HttpServletResponse resp, String msg)	throws IOException {
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<t1>" + msg + "</t1>");
		out.println("</body>");
		out.println("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
