package sec02_exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.PersonListService;
import command.Service;
import dto.PersonDto;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public FrontController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()호출");
		actionDo(request,response);
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()호출");
		actionDo(request,response);
	}


	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("actionDo() 호출");

		String uri= request.getRequestURI();
		System.out.println("URI: "+ uri);
		
		String contextPath = request.getContextPath();
		System.out.println("contextPath: "+contextPath);
		
		String command =uri.substring(contextPath.length());
		System.out.println("command: "+command);
		
		if(command.equals("/insert.do"))
		{
			System.out.println("--------------");
			System.out.println("insert.do 호출");
			System.out.println("--------------");
		}
		else if(command.equals("/update.do"))
		{
			System.out.println("--------------");
			System.out.println("update.do 호출");
			System.out.println("--------------");
		}
		else if(command.equals("/select.do"))
		{
			System.out.println("select.do 호출");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html charset=utf-8");
			PrintWriter out=response.getWriter();
			out.println("<html><head></head><body>");
			
			Service service = new PersonListService(); //인터페이스의 다형성
			ArrayList<PersonDto>dtos=service.execute(request, response);
			for(int i=0;i<dtos.size();i++)
			{
				PersonDto dto = dtos.get(i);
				String id=dto.getId();
				String pw=dto.getPw();
				String name=dto.getName();
				String email=dto.getEmail();
				String address=dto.getAddress();
				
				out.println(id +", "+pw+", "+name+", "+email+", "+address+"<br/><hr/>");
			}
			out.println("</body></html>");
			out.close();
		}
			else if(command.equals("/delete.do"))
		{
			System.out.println("--------------");
			System.out.println("delete.do 호출");
			System.out.println("--------------");
		}
	}

	
}
