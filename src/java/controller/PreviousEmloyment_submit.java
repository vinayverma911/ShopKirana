package controller;

import dao.EmployeeDao;
import dao.PreviousEmployementDao;
import dto.Employee;
import dto.PreviousEmployment;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PreviousEmloyment_submit extends HttpServlet 
{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        String ctx=getServletContext().getContextPath();
        try (PrintWriter out = response.getWriter()) 
        {
            String email=request.getParameter("e");
            String nameOfOrganization=request.getParameter("organization_name");
            String address=request.getParameter("address");
            String doj=request.getParameter("doj");
            String dol=request.getParameter("dol");
            String designation=request.getParameter("designation");
            EmployeeDao ed=new EmployeeDao();
            boolean res=ed.isUserVerified(email);
            if(res)
            {
                Employee em=ed.getEmployee(email);
                int id=em.getId();                
                PreviousEmployementDao ped=new PreviousEmployementDao();
                PreviousEmployment pe=new PreviousEmployment(id,nameOfOrganization,address,doj,dol,designation);
                pe.setUserId(id);
                ped.save(pe);
                if(request.getParameter("submit") == null)
                {
                    response.sendRedirect(ctx+"/previous_employment.jsp");
                }
                response.sendRedirect(ctx+"/kyc.jsp");
            }
            else
            {
                response.sendRedirect(ctx+"/index.jsp");
            }            
        }
        catch(Exception ex)
        {
            
            System.out.println("Exception : "+ex);
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
