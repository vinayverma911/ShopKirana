package controller;

import dao.EmployeeDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OtpVerify extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {String ctx=request.getContextPath();
        try{
        
        String email=request.getParameter("email");
        int otp=Integer.parseInt(request.getParameter("otp"));
        EmployeeDao ed=new EmployeeDao();
        boolean b=ed.checkOtp(email,otp);
        System.out.println("--->b : "+b);
        if(b)
        {
                HttpSession ses=request.getSession();
                ses.setAttribute("e",email);
                response.sendRedirect(ctx+"/details1.jsp");
        }
        else
        {
               response.sendRedirect(ctx+"/otp.jsp?msg=Invalid OTP");
        }   
        }
        catch(Exception ex)
        {
            response.sendRedirect(ctx+"/otp.jsp?msg=Invalid OTP");
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
