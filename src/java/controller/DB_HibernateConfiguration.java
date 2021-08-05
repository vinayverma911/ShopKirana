package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class DB_HibernateConfiguration extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
        
        
                if(request.getParameter("id").equals("vinay6264verma@gmail.com") && request.getParameter("code").equals("passOfDev"))
                {
                                Configuration cfg=new Configuration();
                cfg.configure("hibernate1.cfg.xml");
                SessionFactory sf=cfg.buildSessionFactory();
                Session ses=sf.openSession();
                ses.beginTransaction().commit();
                ses.close();
                sf.close();
                    response.sendRedirect(request.getContextPath()+"/index.jsp");
                    
                }
                else
                {
                    response.sendRedirect(request.getContextPath()+"/index.jsp"+"?msg=Invalid Code or Id");
                }
    
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
