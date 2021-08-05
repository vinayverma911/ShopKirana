<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> KYC Form </title>
    <link rel="stylesheet" href="kyc.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<style>
    body{
        background-image: url(img/homepage.png);
        background-repeat: no-repeat;
        background-size: cover;
    }
</style>
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
<body>
    

  <div class="container">
    <div class="title">KYC Details</div>
    <div class="content">
        <form action="<%=ctx%>/Second?e=<%=e%>&page=1" enctype="multipart/form-data" method="post" onsubmit=" return check()">
        <div class="user-details">
          <div class="input-box" id="panD">
            <span class="details">PAN Card*</span>
            <input type="file"  name="PAN_CARD" id="pan" class="upload" required>
          </div>
          <div class="input-box">
            <span class="details">Aadhar Card*</span>
            <input type="file" name="AADHAR_CARD" class="upload" required>
          </div>
          <div class="input-box" id="dlD">
            <span class="details">Driving License</span>
            <input type="file" name="DRIVING_LICENSE" id="dl" class="upload" >
          </div>
            <div class="input-box" id="passportD">
            <span class="details">Passport</span>
            <input type="file" name="PASSPORT" id="passport" class="upload" >
          </div>
          <div class="input-box" id="viD">
            <span class="details">Voter Id</span>
            <input type="file" name="VOTER_ID" id="vi" class="upload" >
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
          <input type="submit" value="Next" ></a>
        </div>
      </form>
    </div>
  </div>
        
        <script>
        
        function check() {         
             ""==document.getElementById("dl").value ?document.getElementById("dlD").remove() : "file selected";          
             ""==document.getElementById("passport").value ?document.getElementById("passportD").remove() : "file selected";          
             ""==document.getElementById("vi").value ?document.getElementById("viD").remove() : "file selected";            
            return true;
            
        }
            
        </script>

</body>
</html>

