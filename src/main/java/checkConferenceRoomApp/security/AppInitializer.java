package checkConferenceRoomApp.security;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

public class AppInitializer implements WebApplicationInitializer {
    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        AnnotationConfigWebApplicationContext webApplicationContext = null;
        webApplicationContext = new AnnotationConfigWebApplicationContext();
        webApplicationContext.setConfigLocation("checkConferenceRoomApp");

        DispatcherServlet dispatcherServlet = null;
        dispatcherServlet = new DispatcherServlet(webApplicationContext);

        ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcherServlet);
        servlet.addMapping("*.mvc");
        servlet.setLoadOnStartup(2);
    }
}
