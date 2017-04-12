<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*,java.sql.*,java.util.Date,java.text.*" %>
      <%
      response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
      response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
      response.setHeader("Expires", "0");
      if(session.getAttribute("user")!=null)
       {
          session.setMaxInactiveInterval(15*60);
       String user=(String)session.getAttribute("user");
       String UID=(String)session.getAttribute("ID");
      %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Bank</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.5/validator.min.js"></script>
    <!--Date Checker-->    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker3.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script>
    <script>
    var myVar;
    function myFunction() {
      myVar = setTimeout(showPage, 500);
    }
    
    function showPage() {
    document.getElementById("loader").style.display = "none";
    document.getElementById("myDiv").style.display = "block";
  }
  </script>
    <style>
    thead >tr >th {
        font-size: 20px;
        text-align: center;
    }
    th
    {
        font-size: 20px;
    }
    tr
    {
        font-size: 17px;
    }    
    
    .list-group-item {
        background-color: #1A1A1A;
    }
    .input-group > .ac
    {
        height: 50px;
        width: 50px;
    }
    .input-group > .ab
    {

        height: 50px;
        width: 260px;
    }
    #myModal > .modal-dialog > .modal-header
    {
        text-align: center;
        font-size: 30px;
        background-color: #805FB7;
        color: #FFFFFF;
    }
    #modal2 > .modal-dialog > .modal-header
    {
        text-align: center;
        font-size: 30px;
        background-color: #059955;
        color: #FFFFFF;
    }
    #form2 > .form-group > .input-group,
    #form2 > .form-group > .help-block
    {
        width: 80%;       
    }    
   
    #form2
    {
        margin-top: 20px;
    }
    .tran
    {
        border-style: solid;
    border-width: 0px;
    padding-bottom: 50px;
    padding-top: 30px;
    border-radius: 5px;
    }
    div.polaroid {
  width: auto;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);  
  
}
    div.polaroid2{
  width: auto;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
 
    }
    .cpass
    {
        border-radius: 5px;
        padding-top: 10px;
        width: 30%;
        margin-left: 30%;
        margin-right: 30%;
        padding-bottom: 20px;
    }
    
    div > a {}
    /*  bhoechie tab */
    
    div.bhoechie-tab-container {
        z-index: 10;
        background-color: #ffffff;
        padding: 0 !important;
        border-radius: 4px;
        -moz-border-radius: 4px;
        border: 1px solid #ddd;
        margin-top: 20px;
        margin-left: 50px;
        -webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
        box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
        -moz-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
        background-clip: padding-box;
        opacity: 0.97;
        filter: alpha(opacity=97);
        width: 93%;
    }
    
    div.bhoechie-tab-menu {
        padding-right: 0;
        padding-left: 0;
        padding-bottom: 0;
    }
    
    div.bhoechie-tab-menu div.list-group {
        margin-bottom: 0;
        margin-right: 180px;
        height: 613px;
    }
    
    div.bhoechie-tab-menu div.list-group>a {
        margin-bottom: 0;
    }
    
    div.bhoechie-tab-menu div.list-group>a.list-group-item:hover,
    div.bhoechie-tab-menu div.list-group>a .glyphicon:hover,
    div.bhoechie-tab-menu div.list-group>a .fa:hover {
        background-color: #333030;
        border-left: 5px solid #333030;
        margin-left: -2px;
        margin-right: -2px;
    }
    
    div.bhoechie-tab-menu div.list-group>a.active:hover {
        background-color: #5A55A3;
        background-image: #5A55A3;
        color: #ffffff;
    }
    
    div.bhoechie-tab-menu div.list-group>a .glyphicon,
    div.bhoechie-tab-menu div.list-group>a .fa {
        color: #FFFFFF;
    }
    
    div.bhoechie-tab-menu div.list-group>a:first-child {
        border-top-right-radius: 0;
        -moz-border-top-right-radius: 0;
    }
    
    div.bhoechie-tab-menu div.list-group>a:last-child {
        border-bottom-right-radius: 0;
        -moz-border-bottom-right-radius: 0;
    }
    
    div.bhoechie-tab-menu div.list-group>a.active,
    div.bhoechie-tab-menu div.list-group>a.active .glyphicon,
    div.bhoechie-tab-menu div.list-group>a.active .fa {
        background-color: #5A55A3;
        background-image: #5A55A3;
        color: #ffffff;
    }
    
    div.bhoechie-tab-menu div.list-group>a.active:after {
        content: '';
        position: absolute;
        left: 100%;
        top: 50%;
        margin-top: -13px;
        border-left: 0;
        border-bottom: 13px solid transparent;
        border-top: 13px solid transparent;
        border-left: 10px solid #5A55A3;
    }
    
    div.bhoechie-tab-content {
        background-color: #ffffff;
        /* border: 1px solid #eeeeee; */
        padding-left: 20px;
        padding-top: 10px;
        margin-left: -150px;
    }
    
    div.bhoechie-tab div.bhoechie-tab-content:not(.active) {
        display: none;
    }
    
    .log2:hover {
        background-color: #FF0000;
    }
    </style>
</head>

<body onload="myFunction();profileinfo();">
<div id="loader"></div>
<!--loader  -->

<!--main-->
<div style="display:none;" id="myDiv" class="animate-bottom" >
    <!--Navabar-->
    <form method="get" action="Logout">
    <nav class="navbar navbar-inverse" style="border-radius: 0px;">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">WebSiteName</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span> Home</a></li>                
            </ul>
            <div style="padding-right: 20px;">
                <ul class="nav navbar-nav navbar-right">
                    <p class="label " style="font-size: 18px;margin: auto;">Welcome!!</p>
                    <p class="label label-primary" style="font-size: 15px;margin: auto;background-color:#55518a;"><%=user %></p>
                    <button class="btn btn-danger navbar-btn log2"><span class="glyphicon glyphicon-log-out"></span> Logout</button>
                </ul>
            </div>
        </div>
    </nav>
    </form>
    <!--Vertical tabs-->
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-5 col-md-5 col-sm-8 col-xs-9 bhoechie-tab-container">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 bhoechie-tab-menu">
                    <div class="list-group">
                        <a href="#" class="list-group-item active text-center">
                            <h2 class="glyphicon glyphicon-user"></h2>
                            <br/><span id="menuxtxt" style="color: #E9E9E9;">Profile</span>
                        </a>
                        <a href="#" class="list-group-item text-center" onclick="accountinfo();">
                            <h2 class="glyphicon glyphicon-list-alt"></h2>
                            <br/><span id="menuxtxt" style="color: #E9E9E9;">Account Information
                        </a>
                        <a href="#" class="list-group-item text-center" onclick="selpassview();passbook(0);">
                            <h2 style="margin-bottom: -12px;margin-top: 20px;"><i class="fa fa-money"></i></h2>
                            <br/><span id="menuxtxt" style="color: #E9E9E9;">Passbook</span>
                        </a>
                        <a href="#" class="list-group-item text-center" onclick="transacinfo();">
                            <h2 style="margin-bottom: -10px;margin-top: 20px;"><i class="fa fa-inr"></i></h2>
                            <br/><span id="menuxtxt" style="color: #E9E9E9;">Money Transfer</span>
                        </a>
                        <a href="#" class="list-group-item text-center">
                            <h2 class="glyphicon glyphicon-credit-card"></h2>
                            <br/><span id="menuxtxt" style="color: #E9E9E9;">Change Password</span>
                        </a>
                        <a href="#" class="list-group-item text-center">
                            <h2 class="glyphicon glyphicon-exclamation-sign"></h2>
                            <br/><span id="menuxtxt" style="color: #E9E9E9;">Help!!</span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 bhoechie-tab">
                    <!-- Detailss section -->
                    <div class="bhoechie-tab-content active">
                    	<h1 align="center">Customer Details</h1>
                        <div id="profileview" style="width: 95%">
                            
                        </div>
                    </div>
                    <!-- Account Information -->
                    <div class="bhoechie-tab-content">
                        <center>
                            <div >
                                    <h2>Account Information</h2>
                                    <br>
                                    <div id="accountinfo"></div>
                                                             
                            </div>
                        </center>
                    </div>
                    <!-- Account statement -->
                    <div class="bhoechie-tab-content" align="center">
                        <div class="container">
                            <h2>View Statement By</h2>
                            <div id="sacc"></div>
                            <br>
                            <p><b>Select the time period for viewing statement.</b></p>
                            <form>
                                <label class="radio-inline">
                                    <input id="radio_1" type="radio" name="optradio">Date
                                </label>
                                <label class="radio-inline">
                                    <input id="radio_2" type="radio" name="optradio">Month
                                </label>
                                <label class="radio-inline">
                                    <input id="radio_3" type="radio" name="optradio">Year
                                </label>
                            </form>
                            <br>
                            <div class="form-group" style="display:none;" id="II">
                            <form class="form-inline">
                            <label for="#I1">From </label>
                                <div class="input-group date" style="width: 15%;"">
                                  <input type="text" id="I1" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                </div>
                             <label for="#I2"> To </label>
                                <div class="input-group date" style="width: 15%;"">
                                  <input type="text" id="I2" onchange="passbook(1);" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                </div>
                             </form>   
                            </div>
                            <form class="row form-inline ">
                            <div class="" style="display:none;" id="div2">
                            <label for="#I3" style="">Select Month </label>
                                <div class="input-group date" style="width: 15%;">
                                  <input type="text" id="I3" style="" onchange="passbook(2);" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                </div>                           
                            
                            </div>
                            </form>
                            <form class="form-inline ">
                            <div class="" style="display:none;" id="div3">
                            <label for="#I4" style="">Select Year </label>
                                <div class="input-group date" style="width: 15%;">                           
                                <input type="text" id="I4" style="" onchange="passbook(3);" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                </div>                         
                            </div>
                            <div style="padding-top: 10px">
                                <div id="passbook"></div>
                            </div>
                            </form>
                        </div>
                    </div>
                    <script>
                        $("#radio_1").click(function(){
                            $("#div3").fadeOut(0);
                            $("#div2").fadeOut(0);
                            $("#II").fadeIn(50);
                        });
                        $("#radio_2").click(function(){
                            $("#div3").fadeOut(0);
                            $("#II").fadeOut(0);
                            $("#div2").fadeIn(50);
                        });
                        $("#radio_3").click(function(){
                            $("#div2").fadeOut(0);
                            $("#II").fadeOut(0);
                            $("#div3").fadeIn(50);
                        });
                        $('#div3 .input-group.date').datepicker({
                            format: "yyyy",
                            minViewMode: 2,
                            maxViewMode: 3
                        });
                        $('#div2 .input-group.date').datepicker({
                            format: "yyyy-mm",
                            minViewMode: 1,
                            maxViewMode: 2
                        });
                            $('#II .input-group.date').datepicker({
                            format: "yyyy-mm-dd",
                            maxViewMode: 2,
                            todayHighlight: true
                        });
                    </script>
   <!-- Transaction tab -->
                    <div class="bhoechie-tab-content">
                    <div align="center">
                    <h1>Transfer Money</h1>
                    <div class="" id="tsalert">
                    <div style="width: 30%" class="alert alert-info">
                      <strong>Info!</strong> Check details properly before transaction.
                    </div>
                    </div>
                    </div>
                        <div class="tran row polaroid" align="center" style="margin: 20px;">
                        <div class="col-lg-6">
                        <h2  style="padding-bottom: 20px;" ><span style="background-color: #5A55A3;" class="label label-default">Select Your Account</span></h2>
                        <div id="acc1"></div>
                        </div>
                        <div class="col-lg-6">
                        <h2  style="padding-bottom: 10px;" ><span style="background-color: #5A55A3;" class="label label-default">Receiver</span></h2>
                        <form data-toggle="validator" role="form" id="form1">
                            <div class="form-group has-feedback">
                                    <div class="input-group">
                                        <span class="ac input-group-addon" style="color: #F2F1FF; background-color:#343434;font-size: 20px; " id="hv"><b>ID</b></span>
                                        <input id="F1" type="text" oninput="recname();" data-error="Enter valid account number" class="form-control ab" name="c1" placeholder="Account No." required>
                                    </div>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="form-group has-feedback">
                                    <div class="input-group">
                                        <span class="ac input-group-addon" style="color: #F2F1FF; background-color:#343434;font-size: 20px; " id="hv"><b>N</b></span>
                                        <input id="FR" type="text" class="form-control ab" placeholder="Receiver Name"  disabled="">
                                    </div>
                                </div>
                                <div class="form-group has-feedback">
                                    <div class="input-group">
                                        <span class="ac input-group-addon" style="color: #F2F1FF; background-color:#343434;font-size: 20px; " id="hv"><b><i class="fa fa-inr"></i></b></span>
                                        <input id="F2" type="text" class="form-control ab" name="c1" placeholder="Amount" required>
                                    </div>
                                    <div class="help-block with-errors" id="cerror"></div>
                                </div>
                                <div class="form-group has-feedback">
                                    <div class="">
                                     <input type="text" style="height: 50px;width: 265px;" class="form-control"  id="parti" placeholder="Reason">
                                    </div>                                    
                                </div>
                                <!-- Trigger the modal with a button -->
                                <button type="submit" class="btn btn-success btn-lg" id="transfer">Transfer</button>
                            </form>
                            </div>
                        </div>
                    </div>
                    <script>
                        //"#opt2 option:selected").text()
                        $("#transfer").click(function(){                          
                            
                            $("#TS2").html($("#F1").val());
                            $("#TS3").html($("#FR").val());
                            $("#TS4").html($("#F2").val());
                            $("#TS66").html($( "#opt2 option:selected" ).text());
                            
                        });
                        $('#form1').validator().on('submit', function (e) {
                          if (e.isDefaultPrevented()) {
                          document.getElementById("tsalert").innerHTML="<div style='width: 30%' class='alert alert-danger'><strong>Info!</strong> Check all the fields are filled.</div>";
                        } else {
                          $("#myModal").modal();
                          document.getElementById("tsalert").innerHTML='<div style="width: 30%" class="alert alert-info"><strong>Info!</strong> Check details properly before transaction.</div>';
                       return false;
                        }                       
                      });
                    </script>
            <!--Change Password Tab-->
                    <div class="bhoechie-tab-content">                  
                        
                        <div align="center">
                        <h2>Password Change</h2>
                        <div class="alert alert-warning" style="width: 70%">
                        <strong>Warning! </strong> Please do NOT disclose you User ID and/or Passwords to any person - glyphicon glyphicon-checknot even Bank staff - either Intentionally or otherwise. Periodically change your Passwords.
                        </div>
                        <div class="alert alert-danger alert-dissmissable" id="passf" style="width: 70%; display: none;">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Warning! </strong> Check all the fields are filled!!
                        </div>
                        <div class="">
                            <div class="cpass polaroid2">
                            <form data-toggle="validator" role="form" id="form2">
                            <div class=" form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon" style="color: #F2F1FF; background-color:#343434; "><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="pc1" type="password" class="form-control" name="currpass" placeholder="Current Password" data-error="Enter your current password" required="">
                                    </div>
                                    <div class="help-block with-errors"></div>
                                </div>
                                
                                <div class=" form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon" style="color: #F2F1FF; background-color:#343434; "><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="pc2" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" type="password" class="form-control" name="newpass" placeholder="New Password" data-error="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters!!!" required="">
                                    </div>
                                    <div class="help-block with-errors">Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters</div>
                                </div>
                                <br>
                                <div class=" form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon" style="color: #F2F1FF; background-color:#343434; "><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="pc3" type="password" data-equc="sad" class="form-control" name="cnewpass" placeholder="Confirm Password" required="">
                                    </div>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <button type="submit" class="btn btn-warning">Change</button>
                                <br>
                                
                            </form>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="bhoechie-tab-content">
                        <center>
                            <p style="font-size: 20px;padding-top: 30px;text-align:justify;padding-right: 50px;padding-left: 30px;">At State Bank of India, we are committed to provide best internet banking services to our customers. Please feel free to share your Internet Banking experience with us over phone.</p>
                            <p style="font-size: 20px;text-align:justify;padding-right: 50px;padding-left: 30px; ">SBI now provides your Account Balance and Transaction details over phone round the clock. Information on deposits & loan schemes and services also available.</p>
                            <div class="row">
                                <div class="col-lg-1"></div>
                                <p style="font-size: 30px;padding-top: 30px;text-align: left;padding-left: 50px;color:#55518a; "><b> Contact us :-</b></p>
                                <p style="font-size: 20px;padding-top: 20px;text-align: left;padding-left: 50px;padding-right: 50px;"><span class="glyphicon glyphicon-phone-alt"></span> 611-5210006 (Toll free and accessible from all landlines and mobile phones)</p>
                                <p style="font-size: 20px;padding-top: 20px;text-align: left;padding-left: 50px;padding-right: 50px;"><span class="glyphicon glyphicon-phone-alt"></span> 661-2698199 (Accessible from all landlines and mobile phones)</p>
                                <div class="col-lg-1"></div>
                            </div>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Modal Transfer Money -->
    <div id="ts23">
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog" style="border-radius: 5px;">
    
      <!-- Modal content-->
      <div class="modal-content" style="margin-top: 250px;width: 400px;margin-left: 220px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Confirmation</h4>
        </div>
        <div class="modal-body" align="center" style="text-align: left;padding-left: 50px;">
        <div class="row">
              <div class="col-lg-5"><b style="font-size: 30px;">Your Account</b></div>
              <div class="col-lg-4" id="TS7"></div>
          </div>
          <div class="row">
              <div class="col-lg-5"><b>Account No. :</b></div>
              <div class="col-lg-4" id="TS66"></div>
          </div>
        <div class="row">
              <div class="col-lg-5"><b style="font-size: 30px;">Reciever</b></div>
              <div class="col-lg-4" id="TS1"></div>
          </div>
          <div class="row">
              <div class="col-lg-5"><b>Account No. :</b></div>
              <div class="col-lg-4" id="TS2"></div>
          </div>
          <div class="row">
              <div class="col-lg-5"><b>Name :</b></div>
              <div class="col-lg-4" id="TS3"></div>
          </div>
          <div class="row">
              <div class="col-lg-5"><b>Amount :</b></div>
              <div class="col-lg-4" id="TS4"></div>
          </div>          
        </div>
        <form role="validator" id="form3">
        <div class="modal-footer" align="center" style="padding-right: 17%;">
          <div class="form-group form-inline">
          <input type="password" id="p2" style="width: 60%;" class="form-control" name="" placeholder="Enter Password" required="">       
          <button type="submit" class="btn btn-success" id="cst"> Confirm</button>              
          </div>
        </div>
        </form>
      </div>
      
    </div>
  </div>
</div>
  <!-- tRANSFER Money Result-->
  <div class="" id="ts24">
  <div id="scsmodal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" style="margin-top: 250px;width: 400px;margin-left: 220px;">
      <div class="modal-header" style="background-color: #2D7AC8;color: white">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Result</h4>
      </div>
      <div class="modal-body">
        <div id="tsmsg"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</div>
  <!--Transaction check password-->
  <script>
$('#form3').validator().on('submit', function (e) {
    if (e.isDefaultPrevented()) {
    alert("Please Check the fields!!");
  } else {
  	moneytransfer();
  	$("#myModal").modal("toggle");
  	$("#scsmodal").modal("toggle");
 return false;
  }
 
});

</script>
  <!-- Password Change Modal Success -->
<div id="modal2" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Success</h4>
      </div>
      <div class="modal-body">
        <div id="passstatus"><h4>Loading...</h4><i class="fa fa-cog fa-spin" style="font-size:48px;color:blue"></i></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    <!-- /container -->
    <!--Scripts-->
    <script>
        $('form[data-toggle="validator"]').validator({
            custom: {
                equc: function($as) {
                    var matchValue = $("#c4").val();
                    if ($("#c5").val() !== matchValue) {
                        console.log("gatbuyuy");
                        return "Passwords do not match!!!" ;
                    }
                }
            }
        })
        
        </script> 
        <!-- Password Validation-->
        <script>
             $('#form2').validator().on('submit', function (e) {
                          if (e.isDefaultPrevented()) {
                          $("#passf").fadeIn(1000);
                        } else {
                            changep();
                          $("#modal2").modal();
                       return false;
                        }                       
                      });
        </script>
    <script>
    $(document).ready(function() {
        $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
            e.preventDefault();
            $(this).siblings('a.active').removeClass("active");
            $(this).addClass("active");
            var index = $(this).index();
            $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
            $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
        });
    });
    </script>
<script>
<!-- Profile View-->
function profileinfo() {
    var xhttp;
    var cid = "<%out.print(UID);%>";
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("profileview").innerHTML = xhttp.responseText;
        }
    };
    xhttp.open("POST", "Profile_bcknd/profile.jsp?cid=" + cid, true);
    xhttp.send();
}
<!--Change password-->
function changep() {
    var xhttp;
    var cid = "<%out.print(UID);%>";
    var cp=document.getElementById("pc1").value;
    var cp1=document.getElementById("pc2").value;
    var cp2=document.getElementById("pc3").value;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("passstatus").innerHTML = xhttp.responseText;
        }
    };
    xhttp.open("POST", "Profile_bcknd/change_pass.jsp?cuid="+cid+"&currpass="+cp+"&cnewpass="+cp1+"&newpass="+cp2, true);
    xhttp.send();
}
<!-- Account info-->
function accountinfo() {
    var xhttp;
    var cid = "<%out.print(UID);%>";
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("accountinfo").innerHTML = xhttp.responseText;
            document.getElementById("x24").innerHTML = document.getElementById("x23").innerHTML;
        }
    };
    xhttp.open("POST", "Profile_bcknd/acc_info1.jsp?cid=" + cid, true);
    xhttp.send();
}
<!-- Passbook Account Select -->
function selpassview() {
    var xhttp;    
    var cid = "<%out.print(UID);%>";
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("sacc").innerHTML = xhttp.responseText;
        }
    };
    xhttp.open("POST", "Profile_bcknd/pass_acc_select.jsp?cid=" + cid, true);
    xhttp.send();
}
<!-- Transfer Account View-->
function transacinfo() {
    var xhttp;
    var cid = "<%out.print(UID);%>";
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("acc1").innerHTML = xhttp.responseText;
        }
    };
    xhttp.open("POST", "Profile_bcknd/trans_acc.jsp?cid=" + cid, true);
    xhttp.send();
}
<!--Transfer MOney-->
function moneytransfer() {	
	document.getElementById("tsmsg").innerHTML ="";
	document.getElementById("acc1").innerHTML ="<div></div>";
    var xhttp;
    var cid = "<%out.print(UID);%>";
    var p2c=document.getElementById("p2").value;
    var a1=document.getElementById("TS66").innerHTML;
    var a2=document.getElementById("TS2").innerHTML;
    var a3=Number(document.getElementById("TS4").innerHTML);
    var a4=document.getElementById("parti").value;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("tsmsg").innerHTML = xhttp.responseText;
            transacinfo();
            document.getElementById("form1").reset();
        }
    };
    xhttp.open("POST", "Profile_bcknd/trans_confirm.jsp?a1="+a1+"&a2="+a2+"&a3="+a3+"&a4="+a4+"&cuid="+cid+"&currpass="+p2c, true);
    xhttp.send();      
}
<!-- Reciever Name-->
function recname() {
    var xhttp;
      
    var cid = document.getElementById("F1").value;
    xhttp = new XMLHttpRequest();
    
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) 
        {
             
             document.getElementById("FR").value = xhttp.responseText;

        }
    };
    xhttp.open("POST", "Profile_bcknd/receiver_name.jsp?acc="+cid, true);
    xhttp.send();
}

<!-- Passbook View-->
function passbook(x) {
        var xhttp;
        document.getElementById("passbook").innerHTML="";
        var e5 = document.getElementById("opt3");
        var accno = e5.options[e5.selectedIndex].text;
        var a="",b="";
        var d=[];
        xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                document.getElementById("passbook").innerHTML = xhttp.responseText;
            }
        };
        if(x==0)
        {
        	document.getElementById("passbook").innerHTML="";
        	document.getElementById("I1").value="";
			document.getElementById("I2").value="";
			document.getElementById("I3").value="";
			document.getElementById("I4").value="";
        }
        if(x==1)
        {
         var a=document.getElementById("I1").value;
         var b=document.getElementById("I2").value;
         xhttp.open("POST", "Profile_bcknd/passbook.jsp?accno="+accno+"&d0="+a+"&d1="+b+"&d=1", true);
         xhttp.send();
        }
        if(x==2)
        {
         var a=document.getElementById("I3").value;
         xhttp.open("POST", "Profile_bcknd/passbook.jsp?accno="+accno+"&d2="+a+"&d=2", true);
         xhttp.send();
        }
        if(x==3)
        {
         var a=document.getElementById("I4").value;
         xhttp.open("POST", "Profile_bcknd/passbook.jsp?accno="+accno+"&d3="+a+"&d=3", true);
         xhttp.send();
        }
        
    }
    function viewacinfo()
    {
        var xx=Number(document.getElementById("x23").innerHTML);        
        var e = document.getElementById("opt");
        var strUser = e.options[e.selectedIndex].value;
        for(i=1;i<=xx;i++)
        {

         var vn=document.getElementById('pgs'+i);
        vn.style.display='none';   
        var v2=document.getElementById('pg'+i);
        v2.style.display='none';
        }
        var v3=document.getElementById('pg'+strUser);
        v3.style.display='block';
        var vs=document.getElementById('pgs'+strUser);
        vs.style.display='block';
    }
    function viewacinfo2()
    {
        var xt=Number(document.getElementById("x5").innerHTML);        
        var e2 = document.getElementById("opt2");
        var stl = e2.options[e2.selectedIndex].value;
        for(i=1;i<=xt;i++)
        {
        var v9=document.getElementById('pgl'+i);
        v9.style.display='none';
        }
        var v7=document.getElementById('pgl'+stl);
        v7.style.display='block';
    }
</script>
    <!--Scripts End-->
    </div>
    </div>
</body>

</html>
<%}
      else
      {
          response.sendRedirect("netbank.html");
            out.print("Enter Login Details");
      }
%>