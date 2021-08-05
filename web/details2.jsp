<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Personal Details </title>
    <link rel="stylesheet" href="details2.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<style>
     .drop{
  height: 45px;
  width: 100%;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
    }
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
    <div class="title">Personal Details</div>
    <div class="content">
        <form action="<%=ctx%>/details2_submit?email=<%=e%>" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Date Of Joining*</span>
            <input type="date" name="doj" required>
          </div>
          <div class="input-box">
            <span class="details">Department*</span>
            <select  name="department" id="dept" class="drop" onchange="design()">
              <option value="0"  disabled="disabled">Department</option>
              <option value="1">Admin</option>
              <option value="2">Customer Delight</option>
              <option value="3">Finance</option>
              <option value="4">Human Resources</option>
              <option value="5">Loss and Prevention</option>
              <option value="6">Marketing</option>
              <option value="7">Operations</option>
              <option value="8">Product</option>
              <option value="9">Sales</option>
              <option value="10">Sourcing</option>
              <option value="11">Business Development</option>
              <option value="12">Direct</option>
              <option value="13">MIS</option>
              <option value="14">Operations & Sourcing</option>
            </select>
          </div>
          <div class="input-box">
            <span class="details">Designation*</span>
            <select id="mySelect" class="drop" name="designation">
		
            </select>
          </div>
          <div class="input-box">
            <span class="details">Current Address*</span>
            <input type="text" placeholder="Number/Block" name="block" required>
          </div>
          <div class="input-box">
            <span class="details">Current Address*</span>
            <input type="text" placeholder="Street/Area"  name="area" required>
          </div>
          <div class="input-box">
            <span class="details">Current Adrress*</span>
            <input type="text" placeholder="City/State" name="state" required>
          </div>
          <div class="input-box">
            <span class="details">Current Address*</span>
            <input type="text" placeholder="pincode" name="pincode" required>
          </div>
          <div class="input-box">
            <span class="details">Permanent Address</span>
            <input type="text" name="permanentAddress" required>
          </div>
        </div>
        <div class="button">
          <input type="submit" value="Next" ></a>
        </div>
      </form>
        
        
    </div>
  </div>

        <script>
// self executing function here
(function() {
	design();
})();

 function design()
  {
  	let dept = document.getElementById("dept").value;
  	

  let adminArray=['Office Boy','Executive'];
  let customerDelightArray = ['Lead','Sr. Executive','Associate'];
  let financeArray = ['Associate','Executive','Junior Accountant','Key Executive','Purchase Associate','Senior Accountant'];
  let humanResourceArray = ['Associate','Executive','Head'];
  let lossAndPreventionArray = ['Executive','Lead'];
  let marketingArray = ['Marketing Executive'];
  let operationsArray = ['Cashier','Delivery Planner','Dispatch Supervisor','Head','Inbound Lead','Inventory Supervisor','Outbound Lead','Receiving Supervisor','Regional Inbound Lead','Regional Outbound Lead','Reverse ','Supervisor'];
  let productArray = ['Developer','Engineer','Executive','Junior Developer','Junior Engineer','Junior Developer-Angular','Project Manager','Software Developer','Solution Architect','Senior Developer','Senior Engineer','System Administrator','Tech Lead'];

  let salesArray = ['Associate','Associate- Group 2','Associate Sales Lead','Associate Sales Lead-Group 2','BDE-Direct','Digital Sales Associate','Executive','Graphic Designer','Junior UI','Lead','Lead-Group 2','Regional Manager','Regional Sales Lead','Sales Executive-SKP','Sales lead- KPP'];

  let sourcingArray = ['Associate','Executive','Key Executive','Lead','Purchase Associate','Sourcing Associate'];

  let businessDevelopmentArray = ['Area Sales Manager','ASM-Safoya','Associate','Associate-KK','Business Development Head','Executive','Executive- Safoya','Lead','Officer','Officer- Safoya','Quality Control Executive','Sales Associate','Sales Associate- KK','Sales Executive-Safoya','Sales Officer','Sales Officer-KK','Sales Officer-Safoya','Sr.Sales Officer- KK','Territory Sales Incharge','Territory Sales Incharge-KK'];

let directArray = ['Executive','Lead','Head','Associate','Sales Associate- C&B','Backend-Operation'];
let MISArray = ['Executive'];
let operationsSourcingArray = ['Vice President','Executive','Associate','Supervisor','Hub Lead'];


  	if (dept == 1) {
  	document.getElementById("mySelect").options.length = 0;
	adminArray.forEach(myFunction);
	}
	if (dept == 2) {
		document.getElementById("mySelect").options.length = 0;
		customerDelightArray.forEach(myFunction);
	}
	if (dept == 3) {
  	document.getElementById("mySelect").options.length = 0;
	financeArray.forEach(myFunction);
	}
	if (dept == 4) {
		document.getElementById("mySelect").options.length = 0;
		humanResourceArray.forEach(myFunction);
	}
	if (dept == 5) {
  	document.getElementById("mySelect").options.length = 0;
	lossAndPreventionArray.forEach(myFunction);
	}
	if (dept == 2) {
		document.getElementById("mySelect").options.length = 0;
		customerDelightArray.forEach(myFunction);
	}
	if (dept == 6) {
  	document.getElementById("mySelect").options.length = 0;
	marketingArray.forEach(myFunction);
	}
	if (dept == 7) {
		document.getElementById("mySelect").options.length = 0;
		operationsArray.forEach(myFunction);
	}
	if (dept == 8) {
		document.getElementById("mySelect").options.length = 0;
		productArray.forEach(myFunction);
	}
	if (dept == 9) {
  	document.getElementById("mySelect").options.length = 0;
	salesArray.forEach(myFunction);
	}
	if (dept == 10) {
		document.getElementById("mySelect").options.length = 0;
		sourcingArray.forEach(myFunction);
	}
	if (dept == 11) {
		document.getElementById("mySelect").options.length = 0;
		businessDevelopmentArray.forEach(myFunction);
	}
        if (dept == 12) {
  	document.getElementById("mySelect").options.length = 0;
	directArray.forEach(myFunction);
	}
	if (dept == 13) {
		document.getElementById("mySelect").options.length = 0;
		MISArray.forEach(myFunction);
	}
	if (dept == 14) {
		document.getElementById("mySelect").options.length = 0;
		operationsSourcingArray.forEach(myFunction);
	}

function myFunction(item, index) {
  	var x = document.getElementById("mySelect");
	var option = document.createElement("option");
	option.text = item;
	option.value =item;
	x.add(option);
}

  
  }
</script>
</body>
</html>
