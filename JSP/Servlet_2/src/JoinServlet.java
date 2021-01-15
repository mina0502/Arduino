package sec_exam02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/join")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()");
		
		request.setCharacterEncoding("utf-8");
		
		String name= request.getParameter("name");
		String id= request.getParameter("id");
		String pw= request.getParameter("pw");
		
		String[] hobby= request.getParameterValues("hobby");
		String gender= request.getParameter("gender");
		String protocol = request.getParameter("protocol");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer= response.getWriter();
		writer.println("<html><head></head><body>");
		writer.println("name: "+name+"<br>");
		writer.println("id: "+id+"<br>");
		writer.println("pasword: "+pw+"<br>");
		writer.println("hobby: "+ Arrays.toString(hobby)+"<br>");
		writer.println("gender: "+gender+"<br>");
		writer.println("protocol: "+ protocol+"<br>");
		writer.close();
	}

}
