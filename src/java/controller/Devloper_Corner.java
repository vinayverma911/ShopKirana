package controller;

import dto.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Devloper_Corner extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  //http://111.118.252.170:8090/
        int i = 0;
        String ctx = getServletContext().getContextPath();
        String id = request.getParameter("id");
        String code = request.getParameter("code");
        String q = request.getParameter("q");
        if (id.equals("vinay6264verma@gmail.com")) 
        {    
         if (code.equals("passOfDev")) 
            {
                i = 1;
            } 
            else 
            {
                response.sendRedirect(ctx + "?msg=code");
            }
        } 
        else 
        {
            response.sendRedirect(ctx + "?msg=id");
        }
        try (PrintWriter out = response.getWriter()) 
        {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Devloper_Corner</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<hr/>");
            if (i == 1) {
                Configuration cfg = new Configuration();
                cfg.configure();
                SessionFactory sf = cfg.buildSessionFactory();
                Session ses = sf.openSession();
                out.println("<h1>Beforer : "+q+"</h1>");
                Query query = ses.createQuery(q);
                out.println("<h1>Beforer</h1>");
                List<Employee> results = query.list();
                for (Employee e : results) {
                    out.print("<hr>" + e);
                }
                ses.close();
                sf.close();
            }
            out.println("<hr/>");
            out.println("</body>");
            out.println("</html>");
        } catch (Exception ex) {
            response.sendRedirect(ctx+"/index.jsp?msg=Id code matched exception in try..!");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
