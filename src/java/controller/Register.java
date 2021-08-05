package controller;

import dao.EmployeeDao;
import dto.Employee;
import dto.OTP;
import dto.UserIdGenerator;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String ctx=request.getContextPath();
        try (PrintWriter out = response.getWriter()) 
        {
            out.println("Name : "+request.getParameter("name"));
            out.println("\nEmail : "+request.getParameter("email"));
            out.println("\npassword : "+request.getParameter("password"));
            out.println("\ntype : "+request.getParameter("type"));
            Employee employee=new Employee();
            EmployeeDao ed=new EmployeeDao();
            employee.setName(request.getParameter("name"));
            employee.setEmail(request.getParameter("email"));
            employee.setPassword(request.getParameter("password"));
            employee.setType(Integer.parseInt(request.getParameter("type")));
            String uId=new UserIdGenerator().GenerateUserId();
            employee.setUserId(uId);
            String otp=OTP.getOtp();
            employee.setOtp(Integer.parseInt(otp));
            boolean saved=ed.saveEmpployee(employee);
            if(saved)
            {
                out.print("SAVED");
                mail.SendMail.SendeMail(request.getParameter("email"),Integer.parseInt(otp),request.getParameter("name"),uId);
                response.sendRedirect(ctx+"/otp.jsp?email="+request.getParameter("email"));
            }
            else
            {
                out.print("NOT SAVED");
                response.sendRedirect(ctx+"/index.jsp?msg=Email already exist");
            }
            
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
