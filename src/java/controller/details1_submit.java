package controller;

import dao.EmployeeDao;
import dto.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class details1_submit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ctx=request.getContextPath();
        try (PrintWriter out = response.getWriter()) 
        {
            String email=request.getParameter("email");
            String dob=request.getParameter("dob");
            String contact=request.getParameter("contact");
            int blood=Integer.parseInt(request.getParameter("blood"));
            int gender=Integer.parseInt(request.getParameter("gender"));
            int marital=Integer.parseInt(request.getParameter("merital"));
            String dom=request.getParameter("dom");
            System.out.print("\nEmail ->"+email);
            System.out.print("\ndom->"+dom);
            System.out.print("\ncontact->"+contact);
            System.out.print("\nblood->"+blood);
            System.out.print("\ngender->"+gender);
            System.out.print("\nmarital->"+marital);
            EmployeeDao ed=new EmployeeDao();
            if(ed.isUserVerified(email))
            {
                boolean b=ed.saveUserDetails_1(email,dob,contact,blood,gender,marital,dom);
                System.out.println("b-------------------------->>>"+b);
                if(b)
                {
                    System.out.println("Before Response to details2");
                    response.sendRedirect(ctx+"/details2.jsp");
                }
                else
                {
                    out.print("Not Saved : ---->"+b);
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
            System.out.println("------------------------------->Exceptionnn->"+ex);
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
