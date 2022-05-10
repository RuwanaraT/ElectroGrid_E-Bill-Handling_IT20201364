<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "model.EBill" %>
    
<% 
//Submit---------------------------------
if (request.getParameter("eaNumber") != null) { 
	
    EBill ebill = new EBill(); 
         
    String stsMsg = ""; 
//Insert--------------------------
             if (request.getParameter("hidItemIDSave") == "") { 
                   stsMsg = ebill.createEBill(request.getParameter("eaNumber"), 
                            request.getParameter("cusName"), 
                            request.getParameter("address"), 
                            request.getParameter("billingDat+e"),
                            request.getParameter("amount")); 
             } 
             else { //Update----------------------

                    stsMsg = ebill.updateEBill(request.getParameter("hidItemIDSave"), 
                             request.getParameter("eaNumber"), 
                             request.getParameter("cusName"), 
                             request.getParameter("address"), 
                             request.getParameter("billingDate"),
                             request.getParameter("amount")); 
             } 

             session.setAttribute("statusMsg", stsMsg);  
}


//Delete-----------------------------
if (request.getParameter("hidItemIDDelete") != null) 
{ 
	EBill ebill = new EBill();  
	
    String stsMsg = ebill.deleteEBill(request.getParameter("hidItemIDDelete")); 

    session.setAttribute("statusMsg", stsMsg); 
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">
<title>E-Bill</title>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/EBill.js"></script>

</head>

<body>


    <div class = "container-fluid" style="background-color: whitesmoke;">

            <br>
            <h1 style=" color: seagreen;">ElectroGrid~</h1>


            <br/>



            <div class="container" style="align-items: center;"> 

                
            <div class="row" >

                <div class="group col-md-4">


                    <i><h5>&nbsp;Meet Us</h5></i>
                    <i><h6>ElectroGrid, <br> No : 138/1, <br> Bishop Street, <br> Rajagiriya, <br> Sri Lanka.</h6></i>

                </div>


                <div class="group col-md-4">

                    <i><h5>&nbsp;&nbsp;&nbsp;&nbsp;Call Us</h5></i>
                        <i><h6>+94 112902368</h6></i>    

                </div>

                <div class="group col-md-4">

                    <i><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email Us</h5></i>
                    <i><h6>electrogrid@gmail.com</h6></i>

                </div>

            </div>

        
        </div>



        <hr style="border: 2px solid seagreen;">

        <div class = "container-fluid" style="background-color: springgreen">
            <h2>Monthly E-Bill Generation of Consumers </h2>

        </div>

        <div class = "container">
            
              <br>

            <form id="formEBill" name="formEBill" method="post" action="EBill.jsp">

              <div class="form-group">
                  <label for="eaNumber">Electricity Account Number</label>
                 <input type="text" class="form-control" id="eaNumber" name="eaNumber" placeholder="Enter Electricity Account Number">
              </div>

              <div class="form-group">
                  <label for="cusName">Customer Name</label>
                 <input type="text" class="form-control" id="cusName" name="cusName" placeholder="Enter Customer Name">
              </div>

              <div class="form-group">
                  <label for="address">Home Address</label>
                 <input type="text" class="form-control" id="address" name="address" placeholder="Enter Home Address">
              </div>

              <div class="form-group">
                  <label for="billingDate">Billing Date</label>
                 <input type="text" class="form-control" id="billingDate" name="billingDate" placeholder="Enter Billing Date">
              </div>


              <div class="form-group">
                  <label for="amount">Bill Amount</label>
                 <input type="text" class="form-control" id="amount" name="amount" placeholder="Enter Bill Amount">
              </div>

              <input id="btnSubmit" name="btnSubmit" type="button" value="Submit" class="btn btn-success">
              <input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">

              <br/>
              <br/>

            </form>
            
        </div>
        
        <div class = "container-fluid" style="background-color: springgreen">
        
            <h2>Electricity Statement of Accounts</h2>

        </div>
        
        <br/>

        <div class = "container">


            <%
                EBill ebill = new EBill(); 
                out.print(ebill.DisplayEBills()); 
             %>

         </div>
         
         
        <br/>

        <div class="container alert alert-success">
              <%
                out.print(session.getAttribute("statusMsg")); 
              %>
        </div> 
        
        <br/>

    </div>

</body>
</html>