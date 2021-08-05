package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet 
{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
        {
            String ctx=request.getContextPath();
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            if(email.equals("vinay6264verma@gmail.com") | email.equals("sk.hrd@shopkirana.com"))
            {
                System.out.println("Email Ryyyyyyttttttttttttttttttttttt");
                if(password.equals("passOfDev") | password.equals("Skhrd@123"))
                {
                    System.out.println("password Ryyyyyyyytttttttttttttttt");
                    HttpSession ses=request.getSession();
                    ses.setAttribute("email",email);
                    ses.setAttribute("password",password);
                    ses.setAttribute("department",-99);
                    System.out.println("Redirecting to Dash.jsp");
                    response.sendRedirect(ctx+"/dash.jsp");
                }
                else
                {
                    System.out.println("password not matched");
                    response.sendRedirect(ctx+"/index.jsp");
                }
            }
            else
            {
                System.out.println("Email not matched");
                response.sendRedirect(ctx+"/index.jsp");
            }
        }
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
