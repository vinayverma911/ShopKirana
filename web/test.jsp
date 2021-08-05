<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String ctx=getServletContext().getContextPath();
        %>
        <a href="<%=ctx%>/Data/otp.html" download>Download File</a>
        <hr>
        
        <form action="<%=ctx%>/Second">
            <input type="file" name="pancard"/>
            <input type="submit"/>
        </form>
        
        <hr>
    </body>
</html>
