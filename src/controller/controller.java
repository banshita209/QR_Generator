package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import functionality.QRgenerator;

/**
 * Servlet implementation class controller
 */
@WebServlet("/controller")
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public controller() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("do post");

		QRgenerator generateQr = new QRgenerator();
		RequestDispatcher requestDispatcher;

		String action = request.getParameter("action"); // getting the value of action parameter to determine which
														// action we needs to perform
		System.out.println("action = " + action);

		String name, link, path;
		if (action.equals("Generate QR")) {

			name = request.getParameter("name");
			link = request.getParameter("link");
			
			System.out.println("name = "+name+" \nlink ="+link);
			if (name == null || link == null) {
				name="myQR";
				link="https://www.linkedin.com/in/banshita-gangwar-744790183/";
			}

			path = generateQr.createQRImage(link, name);
			
			
			if (path != null) {
				
				request.setAttribute("values", "set");
				request.setAttribute("name", name);
				request.setAttribute("path", path);
				request.setAttribute("link", link);
				requestDispatcher = request.getRequestDispatcher("homepage.jsp");
				requestDispatcher.forward(request, response);
			} else {
				requestDispatcher = request.getRequestDispatcher("homepage.jsp");
				requestDispatcher.forward(request, response);
			}

		}

	}

}
