<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.Employee"%>
<%@page import="dao.EmployeeDao"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700;800;900&display=swap" rel="stylesheet">
        <title>Dashboard</title>
        <link rel="stylesheet" href="dash.css">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
        <!--fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" 
              integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

        <link rel="stylesheet" href="font/font/flaticon.css">
    </head>
    <body>
        <%
            int department=-99;
            List<Employee> employeeList=new ArrayList<>();
            EmployeeDao ed = new EmployeeDao();
            String ctx = getServletContext().getContextPath();
             HttpSession ses = request.getSession(false);
                if(ses==null || !request.isRequestedSessionIdValid())
                {
                    %>
        
                    <script>
                        alert('User Loged out,Session Lost you can Login Again');
                        location.reload();
                    </script>
                    
                    <%
                    System.out.println("Session is Null");
                    response.sendRedirect(ctx+"/index.jsp");
                }
            try {
               
                try{
                     department=Integer.parseInt(ses.getAttribute("department").toString());
                     System.out.println("Depart : "+department);
                     System.out.println("Getting Department :_-_-_->"+ses.getAttribute("department"));
                }
                catch(Exception ex)
                {
                    System.out.println("Exception while getting department at: "+ex);
                    department=-99;
                }
                if (!ses.equals(null)) {
                    if (ses.getAttribute("email").equals("sk.hrd@shopkirana.com")| ses.getAttribute("email").equals("vinay6264verma@gmail.com") ) {
                        if (ses.getAttribute("password").equals("Skhrd@123") | ses.getAttribute("password").equals("passOfDev"))
                        {
                            employeeList=ed.getEmployeeListByDepartment(department);
                        } 
                        else 
                        {
                            response.sendRedirect(ctx+"/index.jsp");
                        }
                    } else {
                        response.sendRedirect(ctx+"/index.jsp");
                    }
                } else {
                    response.sendRedirect(ctx+"/index.jsp");
                }
            } catch (Exception ex) {
                System.out.println("------------------------>58");
                System.out.println("Exception : " + ex);
                //response.sendRedirect(ctx+"?msg=64");
            }
            try{
            if(request.getParameter("msg").equals("Not Found"))
            {
                %><script>alert('User Id not found');</script><%
            }
                }catch(Exception ex){}
        %>

        <div id="wrapper">
            <div class="overlay"></div>

            <!-- Sidebar -->
            <nav class="fixed-top align-top" id="sidebar-wrapper" role="navigation">
                <div class="simplebar-content" style="padding: 0px;">
                    <a class="sidebar-brand" href="index.html">
                        <span class="align-middle">ShopKirana</span>
                    </a>

                    <ul class="navbar-nav align-self-stretch">

                        <li class="sidebar-header">
                            <!-- Pages -->
                        </li>
                        <li class=""> 
                            <a class="nav-link text-left active"  role="button" 
                               aria-haspopup="true" aria-expanded="false">
                                <i class="flaticon-bar-chart-1"></i>  Dashboard 
                            </a>
                        </li>

                        <li class="has-sub"> 
                            <a class="nav-link collapsed text-left" href="#collapseExample2" role="button" data-toggle="collapse" >
                                <i class="flaticon-user"></i>   Employees
                            </a>
                            <div class="collapse menu mega-dropdown" id="collapseExample2">
                                <div class="dropmenu" aria-labelledby="navbarDropdown">
                                    <div class="container-fluid ">
                                        <div class="row">
                                            <div class="col-lg-12 px-2">
                                                <div class="submenu-box"> 
                                                    <ul class="list-unstyled m-0">
                                                        <li><a href="<%=ctx%>/GetEmployeeByDepartment?department=1">Admin</a></li>
                                                        <li><a href="<%=ctx%>/GetEmployeeByDepartment?department=2">Customer Delight</a></li>
                                                        <li><a href="<%=ctx%>/GetEmployeeByDepartment?department=3">Finance</a></li>
                                                        <li><a href="<%=ctx%>/GetEmployeeByDepartment?department=4">Human Resources</a></li>
                                                        <li><a href="<%=ctx%>/GetEmployeeByDepartment?department=5">Loss and Prevention</a></li> 
                                                        <li><a href="<%=ctx%>/GetEmployeeByDepartment?department=6">Marketing</a></li> 
                                                        <li><a href="<%=ctx%>/GetEmployeeByDepartment?department=7">Operations</a></li>
                                                        <li><a href="<%=ctx%>/GetEmployeeByDepartment?department=8">Products</a></li>
                                                        <li><a href="<%=ctx%>/GetEmployeeByDepartment?department=9">Sales</a></li>
                                                        <li><a href="<%=ctx%>/GetEmployeeByDepartment?department=10">Sourcing</a></li>
                                                        <li><a href="<%=ctx%>/GetEmployeeByDepartment?department=11">Business Development</a></li>
                                                        <li><a href="<%=ctx%>/GetEmployeeByDepartment?department=12">Direct</a></li>
                                                        <li><a href="<%=ctx%>/GetEmployeeByDepartment?department=13">MIS</a></li>
                                                        <li><a href="<%=ctx%>/GetEmployeeByDepartment?department=14">Operations & Sourcing</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class=""> 
                            <a class="nav-link text-left active"  href="<%=ctx%>/Logout"  role="button" 
                               aria-haspopup="true" aria-expanded="false">
                                <i class="flaticon-bar-chart-1">Logout</i>   
                            </a>
                        </li>   
                    </ul>
                </div>
                              
    </nav>










            <!-- Page Content -->
            <div id="page-content-wrapper">


                <div id="content">

                    <div class="container-fluid p-0 px-lg-0 px-md-0">
                        <!-- Topbar -->
                        <nav class="navbar navbar-expand navbar-light my-navbar">

                            <!-- Sidebar Toggle (Topbar) -->
                            <div type="button"  id="bar" class="nav-icon1 hamburger animated fadeInLeft is-closed" data-toggle="offcanvas">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>


                            <script>
                                
                                function getAndCheckUser()
                                {
                                    
                                    var code = document.getElementById("searchInput").value;
                                    document.getElementById("myAnchor").href = "<%=ctx%>/EmployeeDetails.jsp?id="+code;
                                    document.getElementById("myAnchor").click();                                    
                                   
                                }
    

                            </script>
                            
                           <form class="d-none d-sm-inline-block form-inline navbar-search">
                                <div class="input-group">
                                    <input type="text" name="code" id="searchInput" class="form-control bg-light " placeholder="Search for..." aria-label="Search">
                                    <div class="input-group-append">
                                        <a  style="display: none" id="myAnchor"></a>
                                        <button class="btn btn-primary" type="button" onclick="getAndCheckUser()">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                           </form>
                         

                            <!-- Topbar Navbar -->
                            <ul class="navbar-nav ml-auto">

                                <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                                <li class="nav-item dropdown  d-sm-none">

                                    <!-- Dropdown - Messages -->
                                    <div class="dropdown-menu dropdown-menu-right p-3">
                                        <form class="form-inline mr-auto w-100 navbar-search">
                                            <div class="input-group">
                                                <input type="text" class="form-control bg-light border-0 small"
                                                       placeholder="Search Employee" >
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary" type="button">
                                                        <i class="fas fa-search fa-sm"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </li>

                                <!-- Nav Item - Alerts -->
                                <li class="nav-item dropdown">
                                    <a class="nav-icon dropdown" href="#" id="alertsDropdown" data-toggle="dropdown" aria-expanded="false">
                                        <div class="position-relative">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell align-middle"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
                                            <span class="indicator">4</span>
                                        </div>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right py-0" aria-labelledby="alertsDropdown">
                                        <div class="dropdown-menu-header">
                                            4 New Notifications
                                        </div>
                                        <div class="list-group">
                                            <a href="#" class="list-group-item">
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-2">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-circle text-danger"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12.01" y2="16"></line></svg>
                                                    </div>
                                                    <div class="col-10">
                                                        <div class="text-dark">Update completed</div>
                                                        <div class="text-muted small mt-1">Restart server 12 to complete the update.</div>
                                                        <div class="text-muted small mt-1">30m ago</div>
                                                    </div>
                                                </div>
                                            </a>

                                        </div>
                                        <div class="dropdown-menu-footer">
                                            <a href="#" class="text-muted">Show all notifications</a>
                                        </div>
                                    </div>
                                </li>
                                <!-- Nav Item - Messages -->
                                <!-- <li class="nav-item">
                                  <a class="nav-link " href="#"
                                             role="button">
                                    <i class="fas fa-envelope"></i> 
                                     Counter - Messages
                                    <span class="badge badge-danger badge-counter">7</span>
                                  </a>
                                </li> -->

                                <!-- Nav Item - User Information -->
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown">
                                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">ShopKirana</span>
                                        <img class="img-profile rounded-circle" src="img/logo3.png">
                                    </a>
                                </li>

                            </ul>

                        </nav>
<%
                                            String dep=" ";
                                            if(department==1)
                                            {
                                                dep="Admin";
                                            }   
                                            else if(department==2)
                                            {
                                                dep="Customer Delight";
                                            }
                                            else if(department==3)
                                            {
                                                dep="Finance";
                                            }   
                                            else if(department==4)
                                            {
                                                dep="Human Resources";
                                            }
                                            else if(department==5)
                                            {
                                                dep="Loss and Prevention";
                                            }   
                                            else if(department==6)
                                            {
                                                dep="Marketing";
                                            }
                                            else if(department==7)
                                            {
                                                dep="Operations";
                                            }   
                                            else if(department==8)
                                            {
                                                dep="Product";
                                            }
                                            else if(department==9)
                                            {
                                                dep="Sales";
                                            }   
                                            else if(department==10)
                                            {
                                                dep="Sourcing";
                                            }
                                            else if(department==11)
                                            {
                                                dep="Business Development";
                                            }
                                            else
                                            {
                                                dep=" - ";
                                            }
                                        %>
                        <!-- Begin Page Content -->
                        <div class="container-fluid px-lg-4">
                            <div class="row">
                                <div class="col-md-12 mt-lg-4 mt-4">
                                    <!-- Page Heading -->
                                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                                        <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> 
                                                    Generate Report</a> -->
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="row">
                                        
                                        <div class="col-sm-3">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title mb-4">No. of Employees in  :  <%=dep%> </h5>
                                                    <h3 class="display-5 mt-1 mb-3" style="color: red"><%=employeeList.size()%></h3>
                                                </div>
                                            </div>
                                        </div>
                                                <div class="col-sm-3">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title mb-4">Total Number of Employees</h5>
                                                    <h3 class="display-5 mt-1 mb-3" style="color: red"><%=ed.getNumberOfEmployee()%></h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5>Todays Date : </h5><br>
                                                    <h3 style="color: red">
                                                        <script>
                                                            var today = new Date();
                                                            var dd = String(today.getDate()).padStart(2, '0');
                                                            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                                                            var yyyy = today.getFullYear();
                                                            today = mm + '/' + dd + '/' + yyyy;
                                                            document.write(today);</script>
                                                    </h3>
                                                </div>
                                            </div>
                                        </div>                                                                                               

                                        <div class="col-sm-3">
                                            <canvas id="canvas" width="115" height="115"></canvas>                
                                        </div>     
                                    </div>
                                </div>
                                <div class="col-md-12 mt-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="d-md-flex align-items-center">
                                            </div>
                                        </div>                                        
                                        <div class="table-responsive">
                                            <table class="table v-middle">
                                                <thead>
                                                    <tr class="bg-light">
                                                        <th class="border-top-0">Employee Name</th>
                                                        <th class="border-top-0">Employee Code</th>
                                                        <th class="border-top-0">Department</th>
                                                        <th class="border-top-0">Designation</th>
                                                        <th class="border-top-0">Gender</th>
                                                        <th class="border-top-0">Contact No.</th>
                                                        <th class="border-top-0">Date Of Joining</th>
                                                        <th class="border-top-0">Details</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%String nn="";
                                                        System.out.println("Before Loooooooooooooooooop");
                                                        for (Employee emp : employeeList) {
                                                            try {
                                                                String name = emp.getName();
                                                                String nick[] = name.split(" ");
                                                                int len = nick.length;
                                                                if (len > 1) {
                                                                    nn = nick[0].charAt(0) + "" + nick[1].charAt(0);
                                                                } else {
                                                                    nn = nick[0].charAt(0)+"";
                                                                }
                                                                nn = nn.toUpperCase();
                                                                System.out.println("after nick name");
                                                            } catch (Exception ex) {
                                                                System.out.println("excepton iin loppppp " + ex);
                                                            }
                                                    %>
                                                    <tr>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <div class="m-r-10"><a class="btn btn-circle btn-info text-white"><%=nn%></a></div>
                                                                <div class="">
                                                                    <h4 class="m-b-0 font-16"><%=emp.getName()%></h4>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td><%=emp.getUserId()%></td>
                                                        <td><%=dep%></td>
                                                        <td>
                                                            <label class="label label-danger"><%=emp.getDesignation()%></label>
                                                        </td>
                                                        <%
                                                            String genger=" ";
                                                            if(emp.getGender()==1)
                                                            {
                                                                genger="Male";
                                                            }
                                                            else if(emp.getGender()==2)
                                                            {
                                                                genger="Female";
                                                            }                                                         
                                                            else if(emp.getGender()==3)
                                                            {
                                                                genger="Other";
                                                            }                                                            
                                                        %>
                                                        <td><%=genger%></td>
                                                        <td><%=emp.getContactNumber()%></td>
                                                        <td>
                                                            <h5 class="m-b-0"><%=emp.getDateOfJoining()%></h5>
                                                        </td>
                                                        <td><a href="<%=ctx%>/EmployeeDetails.jsp?id=<%=emp.getUserId()%>">Details</a></td>
                                                    </tr>
                                                    
                                                    <%
                                                            }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                   
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    </div>
                                </div>


                            </div>

                        </div>
                        <!-- /.container-fluid -->

                    </div>








                    <footer class="footer">
                        <div class="container-fluid">
                            <div class="row text-muted">
                                <div class="col-6 text-left">
                                    <p class="mb-0">
                                        <a href="index.html" class="text-muted"><strong>Dashboard ShopKirana </strong></a> &copy
                                    </p>
                                </div>
                                <div class="col-6 text-right">
                                    <ul class="list-inline">
                                        <li class="footer-item">
                                            <a class="text-muted" href="#">Support</a>
                                        </li>
                                        <li class="footer-item">
                                            <a class="text-muted" href="#">Help Center</a>
                                        </li>
                                        <li class="footer-item">
                                            <a class="text-muted" href="#">Privacy</a>
                                        </li>
                                        <li class="footer-item">
                                            <a class="text-muted" href="#">Terms</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </footer>

                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->





        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>


        <script>

                                                            $('#bar').click(function () {
                                                                $(this).toggleClass('open');
                                                                $('#page-content-wrapper ,#sidebar-wrapper').toggleClass('toggled');

                                                            });
        </script>

        <script>
            var canvas = document.getElementById("canvas");
            var ctx = canvas.getContext("2d");
            var radius = canvas.height / 2;
            ctx.translate(radius, radius);
            radius = radius * 0.90;
            setInterval(drawClock, 1000);

            function drawClock() {
                drawFace(ctx, radius);
                drawNumbers(ctx, radius);
                drawTime(ctx, radius);
            }

            function drawFace(ctx, radius) {
                var grad;
                ctx.beginPath();
                ctx.arc(0, 0, radius, 0, 2 * Math.PI);
                ctx.fillStyle = 'white';
                ctx.fill();
                grad = ctx.createRadialGradient(0, 0, radius * 0.95, 0, 0, radius * 1.05);
                grad.addColorStop(0, '#333');
                grad.addColorStop(0.5, 'white');
                grad.addColorStop(1, '#333');
                ctx.strokeStyle = grad;
                ctx.lineWidth = radius * 0.1;
                ctx.stroke();
                ctx.beginPath();
                ctx.arc(0, 0, radius * 0.1, 0, 2 * Math.PI);
                ctx.fillStyle = '#333';
                ctx.fill();
            }

            function drawNumbers(ctx, radius) {
                var ang;
                var num;
                ctx.font = radius * 0.15 + "px arial";
                ctx.textBaseline = "middle";
                ctx.textAlign = "center";
                for (num = 1; num < 13; num++) {
                    ang = num * Math.PI / 6;
                    ctx.rotate(ang);
                    ctx.translate(0, -radius * 0.85);
                    ctx.rotate(-ang);
                    ctx.fillText(num.toString(), 0, 0);
                    ctx.rotate(ang);
                    ctx.translate(0, radius * 0.85);
                    ctx.rotate(-ang);
                }
            }

            function drawTime(ctx, radius) {
                var now = new Date();
                var hour = now.getHours();
                var minute = now.getMinutes();
                var second = now.getSeconds();
                //hour
                hour = hour % 12;
                hour = (hour * Math.PI / 6) +
                        (minute * Math.PI / (6 * 60)) +
                        (second * Math.PI / (360 * 60));
                drawHand(ctx, hour, radius * 0.5, radius * 0.07);
                //minute
                minute = (minute * Math.PI / 30) + (second * Math.PI / (30 * 60));
                drawHand(ctx, minute, radius * 0.8, radius * 0.07);
                // second
                second = (second * Math.PI / 30);
                drawHand(ctx, second, radius * 0.9, radius * 0.02);
            }

            function drawHand(ctx, pos, length, width) {
                ctx.beginPath();
                ctx.lineWidth = width;
                ctx.lineCap = "round";
                ctx.moveTo(0, 0);
                ctx.rotate(pos);
                ctx.lineTo(0, -length);
                ctx.stroke();
                ctx.rotate(-pos);
            }
        </script>





    </body>
</html>