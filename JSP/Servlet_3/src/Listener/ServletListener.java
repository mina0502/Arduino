package sec_exam04;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;



public class ServletListener implements ServletContextListener
{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("contextDestoryed()");
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("contextInitialized()");
		
	}

}
