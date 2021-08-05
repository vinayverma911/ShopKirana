package controller;

import dao.EmployeeDao;
import dto.Employee;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class Second extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String ctx=request.getContextPath();
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                try {

                    String email=request.getParameter("e");
                    EmployeeDao ed=new EmployeeDao();
                    Employee em=ed.getEmployee(email);
                    String EmpId=em.getUserId();
                    Collection<Part> partList;
                    partList = request.getParts();
                    Iterator<Part> it = partList.iterator();
                    String buildPath = request.getServletContext().getRealPath("");
                    System.out.println("BUILD PATH:" + buildPath);

                    while (it.hasNext()) 
                    {
                        Part filepart;
                        filepart = it.next();
                        String fieldName = filepart.getName();
                        System.out.println("fieldname = "+fieldName);
                        String filename = filepart.getSubmittedFileName();
                        System.out.println("whole filename:" + filename);
                        if (filename != null) {
                            // String components[]=filename.split("\\\\");
                            //  System.out.println("Length of components: "+components.length);
                            // filename=components[components.length-1];
                            // System.out.println("filename : "+filename);
                        if (filename.length() <= 0) {
                            break;
                        }
                        String filenameComponent[] = filename.split("\\.");
                        System.out.println("Filename component length:" + filenameComponent.length);
                        String ext = filenameComponent[filenameComponent.length - 1];
                        System.out.println("extension: " + ext);
                       
                        String newFileName = EmpId+"_"+fieldName+"."+ext;
                       
                        InputStream fin = filepart.getInputStream();
                        String pathFolder = buildPath.concat("\\Data\\");
                        pathFolder= pathFolder.concat(EmpId);
                        pathFolder = pathFolder.concat("\\");
                        System.out.println(pathFolder);
                        File f = new File(pathFolder);
                        if (!f.exists()) {
                            f.mkdir();
                            f.setReadable(true);
                        }
                        //PrintWriter out=resp.getWriter();
                        String absolutePath = pathFolder +newFileName;
                        int i;
                        FileOutputStream fout = new FileOutputStream(absolutePath);
                        while ((i = fin.read()) != -1) {
                            fout.write(i);
                        }
                        File fread = new File(absolutePath);
                        int filesize = (int) fread.length();
                        byte b[] = new byte[filesize];
                        if(fieldName.equals("PAN_CARD"))
                        {
                            em.setPanCard(newFileName);
                        }
                        if(fieldName.equals("AADHAR_CARD"))
                        {
                            em.setAadharCard(newFileName);
                        }
                        if(fieldName.equals("DRIVING_LICENSE"))
                        {
                            em.setDrivingLicence(newFileName);
                        }
                        if(fieldName.equals("PASSPORT"))
                        {
                            em.setPassport(newFileName);
                        }
                        if(fieldName.equals("VOTER_ID"))
                        {
                            em.setVoterId(newFileName);
                        }
                        if(fieldName.equals("TENTH"))
                        {
                            em.setTenthMarks(newFileName);
                        }
                        if(fieldName.equals("TWELFTH"))
                        {
                            em.setTwelfthMarks(newFileName);
                        }
                        if(fieldName.equals("GRADUATION"))
                        {
                            em.setGraduationMarks(newFileName);
                        }
                        if(fieldName.equals("POST_GRADUATION"))
                        {
                            em.setPostGraduationMarks(newFileName);
                        }
                        if(fieldName.equals("DIPLOMA"))
                        {
                            em.setDiplomaMarks(newFileName);
                        }
                        }
                    }
                if(ed.updateUser(em))
                {
                    if(request.getParameter("page").equals("1"))
                    {
                        response.sendRedirect(ctx+"/education.jsp");
                    }
                    else if(request.getParameter("page").equals("2"))
                    {
                        response.sendRedirect(ctx+"/Last.jsp");
                    }
                    
                }
                else
                {   
                    response.sendRedirect(ctx+"/index.jsp");
                }
                } 
                catch (Exception e) 
                {
                   response.sendRedirect(ctx+"/index.jsp");
                }

            }//data+empid+filename
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
