package sec03_exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetorPost")
public class GetorPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetorPostServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doget");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer=  response.getWriter();
		writer.print("Test");
		writer.println("<HTML>");
		writer.println("<HEAD>");
		writer.println("</HEAD>");
		writer.println("<BODY>");
		writer.println("<h1>doGet 방식입니다</h1>");
		writer.println("</BODY>");
		writer.println("</HTML>");
		writer.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
