package sec_exam01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter writer= response.getWriter();
		
		String id= request.getParameter("user_id");
		String pw= request.getParameter("user_pw");
		String address= request.getParameter("user_address");
		
		System.out.println("ID: "+id);
		System.out.println("PW: "+pw);
		System.out.println("Address: "+ address);
		
		String data= "<html><head></head><body>";
		
		data+="ID : "+ id + "<br>";
		data+="PW : "+ pw + "<br>";
		data+= "Address : "+ address+ "<br>";
		data+= "</body></html>";
		
		writer.print(data);
	}

}
