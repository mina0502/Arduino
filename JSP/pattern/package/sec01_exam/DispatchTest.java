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
		request.setAttribute("name", "donald"); // ���� ó��(name�� donald ������ �Ͽ���) 
		request.setAttribute("id", "abcde");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/hello");
		dispatcher.forward(request, response); //  /hello��� ���������� �Ǿ� �ִ� �������� request, response��ü�� ����
		
	}

}
