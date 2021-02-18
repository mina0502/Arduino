package sec01_exam;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DispatchTest")
public class DispatchTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DispatchTest() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.setAttribute("name", "donald"); // 사전 처리(name에 donald 저장을 하였음) 
		request.setAttribute("id", "abcde");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/hello");
		dispatcher.forward(request, response); //  /hello라고 서블릿맵핑이 되어 있는 곳에서도 request, response객체가 사용됨
		
	}

}
