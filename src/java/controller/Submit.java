package controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Submit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    {
        String fileName=request.getParameter("name");
        PrintWriter out=null;
        try {
            out = response.getWriter();
        } catch (IOException ex) {
            Logger.getLogger(Submit.class.getName()).log(Level.SEVERE, null, ex);
        }
        try 
        {
            ServletFileUpload sf=new ServletFileUpload(new DiskFileItemFactory());
            List<FileItem> files=sf.parseRequest(request);
            for(FileItem i:files)
            {
               
                char fname[]=i.getName().toCharArray();
                out.println(fname[0]);
               
                File f=new File("/Users/vinay/Desktop/Project/WebApplication/web/Data/");
                i.write(new File("/Users/vinay/Desktop/Project/WebApplication/web/Data/"+fname));
                out.print("File saved \n");
                out.print("item.getFieldName() : "+i.getFieldName()+"\n");
            }
        } catch (Exception ex) {
            out.print("--->"+ex);
            System.out.println("Exception : "+ex.getMessage());
            out.print("File not saved : "+ex.getMessage());
            out.print("File Name : "+fileName);
        }
        System.out.println("File uploaded");
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
