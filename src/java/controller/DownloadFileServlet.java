package controller;

import java.io.DataInputStream; 
import java.io.File; 
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext; 
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadFileServlet extends HttpServlet 
{
    static final long serialVersionUID = 1L;
    private static final int BUFSIZE = 4096;
    private String filePath;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            filePath=getServletContext().getRealPath("")  + File.separator;
            File file = new File(filePath);
            int length = 0;
            ServletOutputStream outStream = response.getOutputStream();
            ServletContext context = getServletConfig().getServletContext();
            String mimetype = context.getMimeType(filePath);
            if (mimetype == null) {
                mimetype = "application/octet-stream";
            }
            response.setContentType(mimetype);
            response.setContentLength((int) file.length());
            String fileName = (new File(filePath)).getName();
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
            byte[] byteBuffer = new byte[BUFSIZE];
            DataInputStream in = new DataInputStream(new FileInputStream(file));
            while ((in != null) && ((length = in.read(byteBuffer)) != -1)) 
            {
                outStream.write(byteBuffer, 0, length);
            }

            in.close();
            outStream.close();
        }
        catch(Exception ex)
        {
            
        }
            
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
