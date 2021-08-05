<%@page import="dao.RelativesDao"%>
<%@page import="dto.FamilyPerson"%>
<%@page import="dto.PreviousEmployment"%>
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
            String buildPath = request.getServletContext().getRealPath("");
            RelativesDao fpd=new RelativesDao(); 
            Employee em=new Employee();
            EmployeeDao ed=new EmployeeDao();
            List<FamilyPerson> familyPersonList=new ArrayList();
            String email=" ";
            String ctx=getServletContext().getContextPath();
            try
            {
                HttpSession ses=request.getSession();
                if(ses.equals(null))
                {
                    response.sendRedirect(ctx+"/index.jsp");
                }
                else
                {
                    if(ses.getAttribute("email").toString().equals("vinay6264verma@gmail.com") | ses.getAttribute("email").toString().equals("sk.hrd@shopkirana.com") )
                    {
                        if(ses.getAttribute("password").toString().equals("passOfDev") | ses.getAttribute("password").toString().equals("Skhrd@123"))
                        {
                           email=request.getParameter("email");
                           System.out.println("Email at RelativesDetails "+email);
                           em= ed.getEmployee(email);
                           System.out.println("After Employee at Relatives Email : "+em.toString());
                           familyPersonList=fpd.getRelatives(email);
                           System.err.println("After Getting List : "+familyPersonList);
                        }
                        else
                        {
                            response.sendRedirect(ctx+"/index.jsp");   
                        }
                    }
                    else
                    {
                        response.sendRedirect(ctx+"/index.jsp");
                    }
                }
            }
            catch(Exception ex)
            {
                response.sendRedirect(ctx+"/index.jsp");
            }
        %>

        <div id="wrapper">
            <div class="overlay"></div>

           <!-- Page Content -->
            <div id="page-content-wrapper">


                <div id="content">

                    <div class="container-fluid p-0 px-lg-0 px-md-0">

 
                        <!-- Begin Page Content -->
                        <div class="container-fluid px-lg-4">
                            <div class="row">
                                <div class="col-md-12 mt-lg-4 mt-4">
                                </div>
                                <div class="col-md-12">
                                    <div class="row">
                                        
                                        <div class="col-sm-3">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title mb-4">Name : <%=em.getName()%></h5>
                                                    <h3 class="display-5 mt-1 mb-3" style="color: red"><%=em.getName()%></h3>
                                                </div>
                                            </div>
                                        </div>
                                                <div class="col-sm-3">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title mb-4">Employee Code</h5>
                                                    <h3 class="display-5 mt-1 mb-3" style="color: red"><%= em.getUserId() %></h3>
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
                                            
                                            
                                            
                                            <%
                                            
                                            for(FamilyPerson fp : familyPersonList )
                                            {
                                                
                                            %>                                          
                                            <table class="table v-middle">
                                                <thead>
                                                     <tr class="bg-light">
                                                         <th class="border-top-0"><h2><%=fp.getFamilyPersonName()%></h2></th>
                                                    </tr>
                                                    
                                                </thead>
                                                <tbody>
                                                  
                                                    <tr>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <div class="">
                                                                    <h2 class="m-b-0 font-16">Address</h2>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <label class="label label-danger" style="color: red"><%=fp.getFamilyPersonAddress()%></label>
                                                        <td></td>
                                                        <td></td>
                                                        <td>
                                                            <h5 class="m-b-0"></h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <div class="">
                                                                    <h4 class="m-b-0 font-16">Date of Birth</h4>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <label class="label label-danger"><%= fp.getFamilyPersonDateOfBirth() %></label>
                                                        <td></td>
                                                        <td></td>
                                                        <td>
                                                            <h5 class="m-b-0"></h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <div class="">
                                                                    <h4 class="m-b-0 font-16">Relation</h4>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <label class="label label-danger"><%=fp.getRelation()%></label>
                                                        <td></td>
                                                        <td></td>
                                                        <td>
                                                            <h5 class="m-b-0"></h5>
                                                        </td>
                                                    </tr>       
                                                </tbody>
                                            </table>
                                             <%
                                             
                                                    }
                                             
                                             %>           
                                                        
                                                        
                                                        
                                                        
                                                        
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
