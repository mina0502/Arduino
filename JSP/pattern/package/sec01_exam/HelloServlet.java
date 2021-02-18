package sec01_exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HelloServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("<HTML><HEAD></HEAD><BODY>");
		//RequestDispatcher�������̽��� �̿��Ͽ� forward()�� �ϰ� �Ǹ� �������� �ߴ� ���� request��ü��
		//�������� �ʰ� �Ӽ� �״�� �����Ͽ� �ٸ� ������Ʈ���� ����� �� ����
		out.println("<H1>Hello: " + request.getAttribute("name")+"</H1>");
		out.println("<H1>Hello: "+request.getAttribute("id")+"</H1>");
		out.println("</BODY></HTML>");
		out.close();
	}
}
