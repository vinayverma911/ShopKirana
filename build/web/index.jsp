<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="https://kit.fontawesome.com/64d58efce2.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="style.css" />
    <title>Sign in & Sign up Form</title>
    <style>
        /* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 10; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
    text-align: center;
    color: white;
    font-size: 25px;
    font-weight: bold;
  background-color: #d50000;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 30px;
  border-radius: 5px;
  border: 1px solid #d50000;
  width: 70%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
  color:black;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
    </style>
  </head>
  <body >
      <!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>Email Already Exist !</p>
  </div>
  <script>
      
      function validate() 
      { 
          var length=document.getElementById("password_value").value.length;
          if(length>12 | length<4 )
          {
            window.alert("Password must be grate than 4 and less than 12..!");
            return false
          }
          return true;    
       }
      
      </script>

</div>
      
      <%
          String ctx=getServletContext().getContextPath();
          try
          {
            HttpSession hs=request.getSession();
            if(hs==null)
                {
          
                }
            else
                {
                    hs.invalidate();
                    System.out.println("Sessoion Destroyed User Loged Out");
                }
          }
          catch(Exception ex)
          {
          
          }
      %>
      
    <div class="container">
      <div class="forms-container">
        <div class="signin-signup">
            
            
            <form action="<%=ctx%>/Login" method="post" class="sign-in-form">
              
            <h2 class="title">Sign in</h2>
            
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="email" placeholder="Email" name="email" required />
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Password" name="password" required/>
            </div>
            <input type="submit" value="Sign In" class="btn solid" />
            <!-- <p class="social-text">Or Sign in with social platforms</p>
                     <div class="social-media">
                       <a href="#" class="social-icon">
                         <i class="fab fa-facebook-f"></i>
                       </a>
                       <a href="#" class="social-icon">
                         <i class="fab fa-twitter"></i>
                       </a>
                       <a href="#" class="social-icon">
                         <i class="fab fa-google"></i>
                       </a>
                       <a href="#" class="social-icon">
                         <i class="fab fa-linkedin-in"></i>
                       </a>
                     </div> -->
          
          </form>
            <form action="<%=ctx%>/Register?type=0" class="sign-up-form" method="POST" onsubmit="return validate()" >
            <h2 class="title">Create Account</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" placeholder="Username" name="name" />
            </div>
            <div class="input-field">
              <i class="fas fa-envelope"></i>
              <input type="email" placeholder="Email" name="email" />
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" id="password_value" placeholder="Password" name="password" required/>
              
            </div>
           
            <input type="submit" class="btn" href="#" value="Create Account" />
            <p class="social-text"  id="err_password"></p>           
            <!--
            <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div> -->
          </form>
        </div>
      </div>
    <script>
       function preback(){window.history.forward();}
       setTimeout("preback()",0);
       window.onunload=function(){null};
    </script>
      <div class="panels-container">
        <div class="panel left-panel">
          <div class="content">
            <h3>New here ?</h3>
            <p>
            </p>
            <button class="btn transparent" id="sign-up-btn"> 
              Create Account
            </button>
          </div>
          <img src="img/log.svg" class="image" alt="" />
        </div>
        <div class="panel right-panel">
          <div class="content">
            <h3>One of us ?</h3>
            <p>
            
            </p>
            <button class="btn transparent" id="sign-in-btn">
              Sign in
            </button>
          </div>
          <img src="img/register.svg" class="image" alt="" />
        </div>
      </div>
    </div>

    <script src="app.js"></script>
    <script>
        // Get the modal
var modal = document.getElementById("myModal");


// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];


// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}



    </script>
      <%
               
                try
                {
                    if(request.getParameter("msg").equals("Email already exist"))
                    {
                        %>
                            
                            <script>
                            
                                window.alert("Email already exist");
                                
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

