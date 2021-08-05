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
    <div class="title">Family Details</div>
    <div class="content">
        <form action="<%=ctx%>/FamilyDetails?email=<%=e%>" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Name*</span>
            <input type="text"  name="name" required>
          </div>
          <div class="input-box">
            <span class="details">Address*</span>
            <input type="text"  name="address" required>
          </div>
          <div class="input-box">
            <span class="details">Relation*</span>
            <input type="text" name="relation" required>
          </div>
          <div class="input-box">
            <span class="details">Date of Birth*</span>
            <input type="date" name="dob" required>
          </div>
          <!-- <div class="input-box">
            <span class="details">Designation</span>
            <input type="text" required>
          </div> -->
          <!-- <div class="input-box">
            <span class="details">Marital Status</span>
            <input type="text" placeholder="Confirm your Marital Status" required>
          </div>
          <div class="input-box">
            <span class="details">Gender</span>
            <input type="text" placeholder="Male/Female/Other" required>
          </div>
          <div class="input-box">
            <span class="details">Date of Marriage</span>
            <input type="date" placeholder="Confirm your Marital Status" required>
          </div> -->
        </div>
        <div class="button">
          <input type="submit" value="Submit" name="submit"/>
        </div>
        <div class="button">
         <input type="submit" value="Add More" name="add_more"/>
        </div>
      </form>
    </div>
  </div>

</body>
</html>
