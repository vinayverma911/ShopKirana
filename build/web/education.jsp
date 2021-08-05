<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Education Form </title>
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
    <div class="title">Education Details</div>
    <div class="content">
      <form action="<%=ctx%>/Second?e=<%=e%>&page=2" enctype="multipart/form-data" method="post">
        <div class="user-details">
          <div class="input-box" id="tenD">
            <span class="details">10th CGPA/Percentage*</span>
            <input type="file" name="TENTH" id="ten" class="upload" required>
          </div>
          <div class="input-box" id="twefthD">
            <span class="details">12th Percentage*</span>
            <input type="file" name="TWELFTH" id="twefth" class="upload" >
          </div>
          <div class="input-box" id="graduationD">
            <span class="details">Graduation</span>
            <input type="file" name="GRADUATION" id="graduation" class="upload" >
          </div>
          <div class="input-box" id="pgD">
            <span class="details">Post Graduation</span>
            <input type="file" name="POST_GRADUATION" id="pg" class="upload" >
          </div>
          <div class="input-box" id="diplomaD">
            <span class="details">Diploma/Certificate</span>
            <input type="file" name="DIPLOMA" id="diploma" class="upload" >
          </div>
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
          <input type="submit" value="Next" >
        </div>
      </form>
    </div>
  </div>
        
        <script>
        
        function check() {
             ""==document.getElementById("ten").value ?document.getElementById("tenD").remove() : "file selected";            
             ""==document.getElementById("twefth").value ?document.getElementById("twefthD").remove() : "file selected";          
             ""==document.getElementById("pg").value ?document.getElementById("pgD").remove() : "file selected";          
             ""==document.getElementById("diploma").value ?document.getElementById("diplomaD").remove() : "file selected"; 
             ""==document.getElementById("graduation").value ?document.getElementById("graduationD").remove() : "file selected"; 
            return true;
            
        }
            
        </script>

</body>
</html>
