<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Otp </title>
    <link rel="stylesheet" href="otp.css">
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
        
        
        String msg="";
        try
        {
            msg=request.getParameter("");
        }
        catch(Exception ex)
        {
            msg=" ";
        }
        if(msg==null)
        {
            msg=" ";
        }   
        
        
        
        String email=" ";
        try
        {
            email=request.getParameter("email");
        }
        catch(Exception ex)
        {
            email=" ";
        }
        if(email==null)
        {
            email=" ";      
        }
    %>
    

  <div class="container">
    <!-- <div class="title">Enter One Time Password(Otp)</div> -->
    <div class="content">
        <form action="<%=ctx%>/OtpVerify">
        <div class="user-details">
        	<div class="input-box">
            <span class="details">Enter your E-mail</span>
            <input type="email" required placeholder="Enter the Email " value="<%=email%>" name="email" >
          </div>
          <div class="input-box">
            <span class="details">Enter One Time Password(OTP)</span>
            <input type="text" placeholder="Otp has been sent to your e-mail."  name="otp" required>
          </div>
          <!--<div class="input-box">
            <span class="details">Date of Joining</span>
            <input type="date" required>
          </div>
          <div class="input-box">
            <span class="details">Date of Leaving</span>
            <input type="date" required>
          </div>
          <div class="input-box">
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
          <input type="submit" value="Submit" >
        </div>
          
          <p align="center">Check OTP in Spam also...!</p>
      </form>
    </div>
  </div>
<%
               
                try
                {
                    if(request.getParameter("msg").equals("Invalid OTP"))
                    {
                        %>
                            
                            <script>
                            
                                window.alert("Invalid OTP");
                                
                            </script>
                        
                        <%
                    }
                }
                
                catch(Exception ex)
                {
                
                }
            %>
</body>
</html>

