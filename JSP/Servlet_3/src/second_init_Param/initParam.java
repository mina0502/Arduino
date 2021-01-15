package sec_exam02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns= {"/IP"}, 
			initParams= {
					@WebInitParam(name = "id",value="admin"),
					@WebInitParam(name = "pw", value="1234abcd!!"),
					@WebInitParam(name = "path", value= "C://Temp")
			})
public class initParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public initParam() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
		
		String id= this.getInitParameter("id");
		String pw= this.getInitParameter("pw");
		String path= this.getInitParameter("path");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer= response.getWriter();
		
		writer.println("<html><head></head><body>");
		writer.println("ID: "+id+"<br>");
		writer.println("PW: "+pw+"<br>");
		writer.println("Path: "+path+"<br>");
		writer.println("</body></html>");
		writer.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
