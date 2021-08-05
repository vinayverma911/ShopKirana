<html>
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            String ctx=getServletContext().getContextPath();
        %>
        <form action="<%=ctx%>/ConfigurHibernate" enctype="multipart/form-data" method="post" >
            <input name="aadhar" type="file" multiple />
            <br>
             <input name="aa" type="file" multiple />
            <input type="submit" /><br>
            Click on the link to download: <a href="<%=ctx%>/DownloadFileServlet">Download Link</a>
        </form>
    </body>
</html>
