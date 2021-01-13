package sec04_exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd= request.getParameter("passwd");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer= response.getWriter();
		
		writer.println("ID: "+ id + "<br/>");
		writer.println("Password: "+ passwd);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd= request.getParameter("passwd");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer= response.getWriter();
		
		writer.println("ID: "+ id + "<br/>");
		writer.println("Password: "+ passwd);
	}

}
