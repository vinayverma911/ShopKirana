<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Personal Details </title>
    <link rel="stylesheet" href="details1.css">
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
        String ctx = getServletContext().getContextPath();
        String email="";
        try
        {
            HttpSession ses=request.getSession();
            if(ses==null)
            {
                response.sendRedirect(ctx+"/index.jsp");
            }
            email=ses.getAttribute("e").toString();
        }
        catch(Exception ex)
        {
            response.sendRedirect(ctx+"/index.jsp");
        }
    %>

  <div class="container">
    <div class="title">Personal Details</div>
    <div class="content">
        <form action="<%=ctx%>/details1_submit?email=<%=email%>" method="post">
        <div class="user-details">
          <div class="input-box">            
          </div>
          <div class="input-box">           
          </div>
          <div class="input-box">
            <span class="details" >Date Of Birth*</span>
            <input type="date" placeholder="Enter your email" name="dob" required>
          </div>
          <div class="input-box">
            <span class="details">Contact Number*</span>
            <input type="text" placeholder="Enter your number" name="contact" required>
          </div>
           <div class="input-box">
            <span class="details">Blood Group*</span>
            <select  name="blood">
              <option value="0" disabled="disabled" >Enter your Blood Group</option>
              <option value="1">A+</option>
              <option value="-1">A-</option>
              <option value="2">B+</option>
              <option value="-2">B-</option>
              <option value="3">AB+</option>
              <option value="-3">AB-</option>
              <option value="4">O+</option>
              <option value="-4">O-</option>
            </select>
            <!-- <input type="text" placeholder="Enter your Blood Group" required> -->
          </div>
          <div class="input-box">
            <span class="details">Gender*</span>
            <select id="gender" name="gender" class="dropdown">
              <option value="0"  disabled="disabled ">Gender</option>
              <option value="1">Male</option>
              <option value="2">Female</option>
              <option value="3">Others</option>
            </select>
            <!-- <input type="text"  required> -->
          </div>
          <div class="input-box">
              <span class="details">Marital Status*</span>
              <select name="merital" id="MaritalStatus" class="dropdown" onchange="check()">
              <option value="0"   disabled="disabled"> Marital Status</option>
              <option value="1">Married</option>
              <option value="2">Unmarried</option>
              <option value="3">Divorced</option>
            </select>
            <!-- <input type="text" placeholder="Confirm your Marital Status" required> -->
          </div>
           <div class="input-box" id="dom">
            <span class="details">Date of Marriage*</span>
            <input type="date" name="dom" id="dateOfM"  required>
          </div>
        </div>
        <div class="button">
          <input type="submit"></a>
        </div>
      </form>
    </div>
  </div>
        
        <script>
            
            function check(){
                let ms=document.getElementById("MaritalStatus").value;
                if(ms==2)
                {
                    document.getElementById("dom").style.display = "none";
                    document.getElementById("dateOfM").value=" ";
                    document.getElementById("dateOfM").required = false;
                }
                
                if(ms==3)
                {
                    document.getElementById("dom").style.display="none";
                    document.getElementById("dateOfM").value=" ";
                    document.getElementById("dateOfM").required = false;
                } 
                
                if(ms == 1)
                     document.getElementById("dom").style.display="block";
            }
            
        </script>

</body>
</html>

