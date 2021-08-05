package controller;

import dao.EmployeeDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class details2_submit extends HttpServlet 
{    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        String ctx=request.getContextPath();
        try (PrintWriter out = response.getWriter()) 
        {
           String dateOfJoining=request.getParameter("doj");
           int department=Integer.parseInt(request.getParameter("department"));
           String designation=request.getParameter("designation");
           String block=request.getParameter("block");
           String area=request.getParameter("area");
           String state=request.getParameter("state");
           String pin=request.getParameter("pincode");
           String permanentAddress=request.getParameter("permanentAddress");
           String email=request.getParameter("email");
           String currentFullAdress=block+" "+area+" "+state;
           out.print("DOJ : "+dateOfJoining);
           out.print("\nDepartment : "+department);
           out.print("\nDesignation : "+designation);
           out.print("\nBlock : "+block);
           out.print("\nArea : "+area);
           out.print("\nState : "+state);
           out.print("\npin : "+pin);
           out.print("\nPermanent Address : "+permanentAddress);
           out.print("\nEmail : "+email);
           EmployeeDao ed=new EmployeeDao();
            if(ed.isUserVerified(email))
            {
                boolean b=ed.saveUserDetails_2(email,department,designation,block,area,state,pin,permanentAddress,currentFullAdress,dateOfJoining);
                if(b)
                {
                    System.out.println("Email :-----> "+email);
                   response.sendRedirect(ctx+"/family.jsp");
                }
                else
                {
                    out.print("Boolean----->"+b);
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
            response.sendRedirect(ctx);
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
