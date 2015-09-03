package user;
import user.hibernateWork1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DisplayServlet")
public class DisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DisplayServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 hibernateWork1 dataEntry=new hibernateWork1();
		 PrintWriter out = response.getWriter();
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		int empId = Integer.parseInt(request.getParameter("empId"));
		
		dataEntry.addUser(firstName,lastName,empId);
		
		
		
//		out.println("alert('You have entered same Id !Enter unique one ');");
		
		/*RequestDispatcher view =
			request.getRequestDispatcher("viewAllUserData.jsp");
				view.forward(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("checking<br>");*/
		response.sendRedirect("index.html");
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}

