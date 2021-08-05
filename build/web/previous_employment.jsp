<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Details </title>
    <link rel="stylesheet" href="education.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<style>
    body{
        background-image: url(img/homepage.png);
        background-repeat: no-repeat;
        background-size: cover;
    }
</style>

<body>
    
    <%
        String ctx=getServletContext().getContextPath();
        String e="";
        try
        {
            HttpSession ses=request.getSession();
            if(ses==null)
            {
                response.sendRedirect(ctx+"/index.jsp");
            }
            e=ses.getAttribute("e").toString();
        }
        catch(Exception ex)
        {
            response.sendRedirect(ctx+"/index.jsp");
        }
        if(e==null)
        {
            response.sendRedirect(ctx+"/index.jsp");
        }
    %>

  <div class="container">
    <div class="title">Previous Employment Details</div>
    <div class="content">
        
        <form action="<%=ctx%>/PreviousEmloyment_submit?e=<%=e%>" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Organization Name</span>
            <input type="text" name="organization_name"  required>
          </div>
          <div class="input-box">
            <span class="details">Address</span>
            <input type="text" name="address" required>
          </div>
          <div class="input-box">
            <span class="details">Date of Joining</span>
            <input type="date" name="doj" required>
          </div>
          <div class="input-box">
            <span class="details">Date of Leaving</span>
            <input type="date" name="dol" required>
          </div>
          <div class="input-box">
            <span class="details">Designation</span>
            <input type="text" name="designation" required>
          </div>
        </div>
        <div class="button">
            <input type="submit" value=" Submit " name="submit" ></a>
        </div>
        <div class="button">
         <input type="submit" value="Add More" name="add_more1" ></a>
        </div>
         <div class="button">
             <a href="<%=ctx%>/kyc.jsp"> <input type="button"  value="Frasher"  ></a>
            
        </div>
      </form>
    </div>
  </div>

</body>
</html>

