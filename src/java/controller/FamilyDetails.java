package controller;

import dao.EmployeeDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FamilyDetails extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String ctx=getServletContext().getContextPath();
        try (PrintWriter out = response.getWriter()) 
        {
            String email=request.getParameter("email");
            String name=request.getParameter("name");
            String address=request.getParameter("address");
            String relation=request.getParameter("relation");
            String dob=request.getParameter("dob");
            System.out.print("----------------------->"+email+","+name+","+address+","+relation+","+dob);
            EmployeeDao ed=new EmployeeDao();
            if(ed.isUserVerified(email))
            {
               boolean b=ed.saveFamilyDetails(email,name,address,relation,dob);
               if(b)
               {        
                   if(request.getParameter("submit")==null)
                   {
                       System.out.println("----->User Saved and Add more Clicked---------------------------------");
                       response.sendRedirect(ctx+"/family.jsp");
                   }
                   else
                   {
                   System.out.println("----->User Saved and Submit Clicked---------------------------------");
                   response.sendRedirect(ctx+"/previous_employment.jsp");                   
                   }
               }
               else
               {
                   response.sendRedirect(ctx+"/index.jsp");
               }
            }
            else
            {
                out.print("User : "+email+" is Verified");
                response.sendRedirect(ctx+"/index.jsp");
            }
         }
        catch(Exception ex)
        {
            System.out.println("Exception ex : "+ex);
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
