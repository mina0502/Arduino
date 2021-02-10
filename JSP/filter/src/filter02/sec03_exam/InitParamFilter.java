package sec03_exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class InitParamFilter implements Filter {

	private FilterConfig filterconfig= null;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("FIlter02 �ʱ�ȭ");
		this.filterconfig=filterConfig;
		
		
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter02 ����");
		
		String id= request.getParameter("id");
		String pw= request.getParameter("pw");
		
		// web.xml���� <initParam>�±׷� ������ ���� �޾ƿ��� �ڵ�
		String param1= filterconfig.getInitParameter("param1");
		String param2= filterconfig.getInitParameter("param2");
		
		String message;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out= response.getWriter();
		
		if(id.equals(param1)&& pw.equals(param2)) {
			message="�α��� ����";
		}
		else {
			message="�α��� ����";
		}
		out.println(message);
		chain.doFilter(request, response);
		System.out.println("Filter02 �Ϸ�...");
	}
	
	@Override
	public void destroy() {
		System.out.println("Filter02 ����");
		
	}
}
