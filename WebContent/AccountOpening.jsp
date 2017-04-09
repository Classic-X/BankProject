<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Create account</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.5/validator.min.js"></script>  
  <!--Jasny Bootstrap-->
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
  
</head>
<%
session=request.getSession(false);
String s=(String)session.getAttribute("mail");
%>
<style type="text/css">
	header
	{
		text-align: center ;

	}
	.radio-toolbar label
	{

  		font-size: 17px;

  		cursor: pointer;
	}
	.panel > .panel-heading
	{
		background-image: none;
    	background-color: #55518a;
    	border-color: #55518a;
    	color: white;
    	text-align: center;
	}
	#footer
	{
		background-color: #55518a;
		color:white;
		float: right;
	}
	th,td
	{
		text-align: center;
		width: 20%;
	}
	#changebtn
	{
		background-color: #FF900C;
	}


</style>


<body >
<form data-toggle="validator"  role="form" method="POST" name="accreate" action="Register">
<header style="font-weight:bold;">
   <h1 id="top"><b>Bank of CET</b><small>Cetians Trust</small></h1>
</header>



<!--Start of Big grid-->
<div class="container" >

<ul class="nav nav-tabs" id="createNotTab">
  <li class="active"><a data-toggle="tab" href="#home">Details</a></li>
  <li class="disabled"><a data-toggle="" href="#ident">Additional Details</a></li>
  <li class="disabled"> <a data-toggle="" href="#finaltab">Confirmation</a></li>
</ul>
			
<div class="tab-content">


<div id="home" class="tab-pane fade in active">
<div align="center">
	<div class="panel panel-primary">
 	<div class="panel-heading">Instructions</div>
 	<div class="panel-body" >
 	<div class="alert alert-info" align="left" style="margin-bottom: 0px;"><strong>Info!</strong> The (*) marked fields are mandatory.</div>
 	<div class="alert alert-info" align="left" style="margin-bottom: 0px;"><strong>Info!</strong> <kbd>F5</kbd> button is disabled. Please use <kbd>Reset</kbd> button located at the bottom to reset the fields.</div>
 	<div class="alert alert-info" align="left" style="margin-bottom: 0px;"><strong>Info!</strong> For opening account of minors, where proof of Identity / Address is not available, the same may be provided by father or mother and Natural Guardian.</div>
 	</div>
 	</div>



 
 <div class="panel panel-primary">
 <div class="panel-heading">Personal Details</div>
 <div class="panel-body" >
  			<div class="row">
  				<div class="col-lg-1"></div>
  				<div class="col-lg-2">
  					<label><b>Salutation*</b></label>
  					<div class="form-group">
					<div class="radio-toolbar">
						<div class="radio">
						<label><input id="sl1" type="radio" name="a1" value="Mr." required autofocus> Mr.</label>
						<label><input id="sl2" type="radio" name="a1" value="Mrs." required> Mrs.</label>
						<label><input id="sl3" type="radio" name="a1" value="Ms." required> Ms.</label>
						</div>
					</div></div>
				</div>

				<div class="col-lg-2"><div class="form-group">
    					<label for="inputName" class="control-label">First Name *</label>
    					<input type="text" class="form-control" name="a2"  id="inputName" placeholder="Jane" pattern="[A-Za-z]+" required>
  				</div></div>

  				<div class="col-lg-2"><div class="form-group">
    					<label for="midName" class="control-label">Middle Name</label>
    					<input type="text" class="form-control" name="a3"  id="midName" pattern="[A-Za-z]+" placeholder="Johnny">
  				</div></div>

  				<div class="col-lg-2"><div class="form-group">
    					<label for="lName" class="control-label">Last Name *</label>
    					<input type="text" class="form-control" name="a4"  id="lName" pattern="[A-Za-z]+" placeholder="Doe" required="">
  				</div></div>

  				<div class="col-lg-2">
				<div class="form-group">
				<label for="addt" class="control-label">Gender *</label>
 				<select class="form-control" name="a5"  id="addt" required>
 				<option value="" hidden="">Select</option>
 				<option>Male</option>
 				<option>Female</option>
 				<option>Transgender</option>
 				</select>
 				</div>
 				</div>

				<div class="col-lg-1"></div>
			</div>
			<div class="row">
				<div class="col-lg-1"></div>
				<div class="col-lg-3">
				<div class="form-group">
    				<label for="inputEmail" class="control-label">Email *</label>
   					<input type="email" class="form-control" id="inputEmail" placeholder="johhny@pizza.com" data-error="Email address is invalid" required disabled value=<%=s %>>
   					<input type="hidden" name="a6" value=<%=s %>>
   					<div class="help-block with-errors"></div>
				</div>

				</div>

				<div class="col-lg-2">
				<div class="form-group">
				<label for="mobile" class="control-label">Mobile No.*</label>
				<input type="text" id="mobile" name="a7"  class="form-control" pattern="[0-9]{10}" data-minlength="10" data-error="Invalid Number." placeholder="XXXXXXXXXX" required>
				<div class="help-block with-errors">10 digits</div>
				</div></div>

				<div class="col-lg-2"><div class="form-group">
				<label for="DOB" class="control-label">Date of birth * </label>
				<input type="date" name="a8"  class="form-control" id="DOB" required>
				</div></div>

				<div class="col-lg-3">
				<div class="form-group">
					<label for="educ" class="control-label">Education</label>
 					<select class="form-control"  name="a9" id="educ">
 					<option value="" hidden="">Select</option>
					<option>Below SSC</option>
					<option>SSC</option>
					<option>HSC</option>
					<option>Graduate</option>
					<option>Masters</option>
					<option>Professional(CA,CS,CMA)</option>
					<option>Others</option>
 					</select>
 					</div>
				</div>
				

			</div>

			<div class="row">
				<div class="col-lg-1"></div>
  				<div class="col-lg-3">
				<div class="form-group">
				<label for="mother" class="control-label">Name of Mother * </label>
				<input type="text" id="mother" name="a10"  class="form-control" required>
				</div></div>

				<div class="col-lg-3">
				<div class="form-group">
				<label for="father" class="control-label">Name of Father </label>
				<input type="text" id="father" name="a11"  class="form-control">
				</div></div>	

				<div class="col-lg-4">
				<label for="guardian">Name of Natural Guardian </label>
				<input type="text" class="form-control" id="guardian" name="a12" >
				<div class="help-block with-errors">In case of a minor please provide details</div>
				</div>
				
				<div class="col-lg-1"></div>
			</div>
</div>
</div>

<!--Address -->

<div class="panel panel-primary">
<div class="panel-heading">Permanent Address</div>
<div class="panel-body" style="padding-right: 10%;padding-left: 10%;">
		<div class="row">	

			<div class="col-lg-3">
					<div class="form-group">
					<label for="addtype" class="control-label">Address Type*</label>
 					<select class="form-control" id="addtype" name="a13"  required>
 					<option value="">Select</option>
 					<option>Residential</option>
 					<option>Bussiness</option>
 					<option>Registered Office</option>
 					<option>Residential or Bussiness</option>
 					</select>
 					</div>
 					</div>

			<div class="col-lg-3">
			<div class="form-group">
			<label class="control-label" for="flat">Address* </label>
			<input type="text" id="flat" name="a14"  class="form-control" required="">
			</div></div>
			<div class="col-lg-3" >
			<div class="form-group">
			<label for="areala">Area and landmark </label>
			<input type="text" id="areala" name="a15"  class="form-control">
			</div></div>
			<div class="col-lg-3">
			<div class="form-group">
			<label class="control-label" for="citya">City* </label>
			<input type="text" id="citya"  name="a16" class="form-control" required>
			</div></div>			
		</div>
		<div class="row">
			
			<div class="col-lg-3">
			<div class="form-group">
			<label class="control-label" for="roadeo">District* </label><input type="text" id="roadeo"  name="a17" class="form-control" required="">
			</div></div>
			<div class="col-lg-2">
			<div class="form-group">
			<label class="control-label" for="pina">Pin code* </label><input type="text" id="pina"  name="a18" pattern="[0-9]{6}" class="form-control" data-minlength="6" data-error="Invalid Pincode" placeholder="XXXXXX" required>
			<div class="help-block with-errors">6 digits</div>
			</div></div>
			<div class="col-lg-2">
			<div class="form-group">
				<label for="teleresi" class="control-label">Alt Mobile No.</label>
				<input type="text" id="teleresi" class="form-control" pattern="[0-9]{10}"  name="a19" data-minlength="10" data-error="Invalid Number." placeholder="XXXXXXXXXX">
				<div class="help-block with-errors">10 digits</div>
				</div>
				</div>
			<div class="col-lg-2">
			<label for="office">Office </label>
			<input type="text" id="office"  name="a20" class="form-control"></div>


			<div class="col-lg-3">
					<div class="form-group">
					<label for="stateind" class="control-label">State*</label>
 					<select class="form-control" id="stateind"  name="a21" required>
					<option value="">None</option>
					<option value="ANDAMAN AND NICOBAR"		>ANDAMAN AND NICOBAR</option>
					<option value="ANDHRA PRADESH"			>ANDHRA PRADESH</option>
					<option value="ARUNACHAL PRADESH"		>ARUNACHAL PRADESH</option>
					<option value="ASSAM"					>ASSAM</option>
					<option value="BIHAR"					>BIHAR</option>
					<option value="CHANDIGARH"				>CHANDIGARH</option>
					<option value="CHATTISGARH"				>CHATTISGARH</option>
					<option value="DADRA AND NAGAR HAVELI"	>DADRA AND NAGAR HAVELI</option>
					<option value="DAMAN AND DIU"			>DAMAN AND DIU</option>
					<option value="DELHI"					>DELHI</option>
					<option value="GOA"						>GOA</option>
					<option value="GUJARAT"					>GUJARAT</option>
					<option value="HARYANA"					>HARYANA</option>
					<option value="HIMACHAL PRADESH"		>HIMACHAL PRADESH</option>
					<option value="JAMMU AND KASHMIR"		>JAMMU AND KASHMIR</option>
					<option value="JHARKHAND"				>JHARKHAND</option>
					<option value="KARNATAKA"				>KARNATAKA</option>
					<option value="KERALA"					>KERALA</option>
					<option value="LAKSHADWEEP"				>LAKSHADWEEP</option>
					<option value="MADHYA PRADESH"			>MADHYA PRADESH</option>
					<option value="MAHARASHTRA"				>MAHARASHTRA</option>
					<option value="MANIPUR"					>MANIPUR</option>
					<option value="MEGHALAYA"				>MEGHALAYA</option>
					<option value="MIZORAM"					>MIZORAM</option>
					<option value="NAGALAND"				>NAGALAND</option>
					<option value="ODISHA"					>ODISHA</option>
					<option value="PONDICHERRY"				>PONDICHERRY</option>
					<option value="PUNJAB"					>PUNJAB</option>
					<option value="RAJASTHAN"				>RAJASTHAN</option>
					<option value="SIKKIM"					>SIKKIM</option>
					<option value="TELENGANA"				>TELENGANA</option>
					<option value="TAMILNADU"				>TAMILNADU</option>
					<option value="TRIPURA"					>TRIPURA</option>
					<option value="UTTAR PRADESH"			>UTTAR PRADESH</option>
					<option value="UTTARANCHAL"				>UTTARANCHAL</option>
					<option value="WEST BENGAL">WEST BENGAL</option>
					</select>
					</div>
			</div>			
		</div>
</div>
</div>

<!--Terms/conditions-->

	<div class="panel panel-primary">
	<div class="panel-heading">Confirm</div>
	<div class="panel-body">
			<div class="row">
  			<div class="col-lg-1"></div>
  			<div class="col-lg-10">
			
    		</div>
			<div class="col-lg-1"></div>
  			</div>
  			<div style="padding-right: 10%;padding-left: 10%;">
  			<div class="alert alert-warning" align="center" style="margin-bottom: 0px;"><strong>(*)</strong> Please check all the mandatory fields are filled and correct before proceeding to next page.</div>
  			<br>
  			</div>

  			<div class="row">

  				
  			</div>

  			<div class="row">
  			<div  align="center">  			
			<div class="form-group">	
 			<button class="btn btn-info prevtab"  onclick="tabv();">Next <span class="glyphicon glyphicon-arrow-right"></span></button>
			<button type="button" onclick="resetpg1();" class="btn btn-primary">Reset</button>
			</div>
			</div>
			</div>
			
	</div>
	</div>
<!--End oF Terms/conditions-->
</div>
</div>


<!--Start of tab2-->
<div id="ident" class="tab-pane fade">
	<div align="center">
	<div class="panel panel-primary">
	<div class="panel-heading">Image upload section</div>
	<div class="panel-body" style="padding-left: 10%;padding-right: 10%;">

		<div class="alert alert-info" align="left" style="margin-bottom: 0px;"><strong>Info!</strong>Select a Passport size photo with proper dimensions (140x180)</div><br>
		<div class="row" style="align-content:right">
		<div class="fileinput fileinput-new" data-provides="fileinput"  id="bean">
		<span class="btn btn-info btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="a22" accept="image/*" onchange="fun(this)" id="bean"></span>
    	<a href="#" class="btn btn-danger fileinput-exists" data-dismiss="fileinput">Remove</a>
    	<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 140px; height: 180px;"></div>
    	</div></div>    	

    	<div class="alert alert-info" align="left" style="margin-bottom: 0px;"><strong>Info!</strong>Select a Signature with proper dimensions (200x60)    </div><br>
  		<div class="row" style="align-content:right">
		<div class="fileinput fileinput-new" data-provides="fileinput">
    	<span class="btn btn-info btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="a23" onchange="fun1(this)" accept="image/*"></span>
    	<a href="#" class="btn btn-danger fileinput-exists" data-dismiss="fileinput">Remove</a>
    	<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 60px;"></div> </div></div>

	</div></div>

	<div class="panel panel-primary">
	<div class="panel-heading">Account Details</div>
	<div class="panel-body" style="padding-left: 10%;padding-right: 10%;">
			<div class="row">
				<div class="col-lg-3">
					<div class="form-group">
					<label for="actype" class="control-label">Account Type *</label>
 					<select class="form-control" id="actype" name="a24"  required>
 					<option value="" hidden="">Select</option>
					<option>Savings</option>
					<option>Current</option>
					<option>Fixed Deposit</option>
 					</select>
 					</div>
 				</div>
 				<div class="col-lg-3">
 					<div class="form-group">
 					<label for="initbal" class="control-label">Initial Balance *</label>
 					<input type="number" min="500" style="text-align:center;" id="initbal"  name="a25"  class="form-control" placeholder="₹500" required="">
 					<div class="help-block with-errors">Minimum Balance:For savings account(₹500), Current account(₹5000)</div>
 					</div> 					
 				</div>

 			</div>
 			<br>
 			<div  class="row" align="left" style="padding-left: 67px;padding-bottom: 3px;"><label >Facilities Required</label></div>
 			<div class="row ">
				<div class="" align="left">
  					<label class="checkbox-inline"><input id="fr1" type="checkbox"  name="a26" value="true">Cheque Book</label>
    				<label class="checkbox-inline"><input id="fr2" type="checkbox"  name="a27" value="true">ATM-cum-Debit Card</label>
    				<label class="checkbox-inline"><input id="fr3" type="checkbox"  name="a28" value="true">Internet Banking</label>
    				<label class="checkbox-inline"><input id="fr4" type="checkbox"  name="a29" value="true">SMS Notifications</label>
    				<label class="checkbox-inline"><input id="fr5" type="checkbox"  name="a30" value="true">Mobile Banking</label>
				</div>
 			</div>
 			<br>
	</div></div>



	<div class="panel panel-primary">
	<div class="panel-heading">Required Documents</div>
	<div class="panel-body" style="padding-left: 10%;padding-right: 10%;">
	<div class="alert alert-info" align="left" style="margin-bottom: 0px;"><strong>Info!</strong>Both of the documents are required.</div>
	<br>
			<div class="row">
				<div class="col-lg-3">
					<div class="form-group">
					<label for="identtype" class="control-label">Identity Proof *</label>
 					<select class="form-control" id="identtype" name="a31"  required>
 					<option value="" hidden="">Select</option>
 					<option>PAN card</option>
					<option>Passport</option>
					<option>Aadhar Card</option>
					<option>Election/Voter's Card</option>
					<option>Permanent Driving Lincense</option>
					<option>Photo ID Card(Issued by Central Govt./State Govt./PSU)</option>
 					</select>
   				</div>
 				</div>
 				<div class="col-lg-3" >
 					<div class="form-group">
 						<label for="Identitytxt">Number/ID *</label>
 						<input type="text" class="form-control" id="Identitytxt" name="a32"  placeholder="XXXXXXXX" required>
 					</div>
 				</div>

 			</div>
 			<div class="row">
				<div class="col-lg-3">
					<div class="form-group">
					<label for="aftype" class="control-label">Address Proof *</label>
 					<select class="form-control" id="aftype" name="a33"  required>
 					<option value="" hidden="">Select</option>
					<option>Passport</option>
					<option>Aadhar Card</option>
					<option>Election Card(If it has address printed on it)</option>
					<option>Permanent Driving Lincense</option>
					<option>Photo ID Card(Issued by Central Govt./State Govt./PSU)</option>
 					</select>
 					</div>
 				</div>
 				<div class="col-lg-3" >
 					<div class="form-group">
 						<label for="addresstxt">Number/ID *</label>
 						<input type="text" class="form-control" id="addresstxt" name="a34"  placeholder="XXXXXXXX" required>
 					</div>
 				</div>
 			</div>
 	</div>
	</div>

	<div class="panel panel-primary">
	<div class="panel-heading">Confirm</div>
	<div class="panel-body" style="padding-left: 10%;padding-right: 10%">
			<div class="row">
  			
			<div style="padding-right: 10%;padding-left: 10%;">
  			<div class="alert alert-warning" align="center" style="margin-bottom: 0px;"><strong>(*)</strong> Please check all the mandatory fields are filled and correct before proceeding to next page.</div>
  			<br>
  			</div>
    		</div>			
  			

  			<div class="row">
  				<div  align="center">
  					<div class="form-group">
  						<button class="btn btn-info prevtab" type="button" onclick="return showPrev()"><span class="glyphicon glyphicon-arrow-left"></span> Previous </button>
  						<button class="btn btn-info prevtab" type="button" onclick="tabv2()">Next <span class="glyphicon glyphicon-arrow-right"></span></button>
  						<button type="button" onclick="resetpg2()" class="btn btn-primary">Reset</button>
  					</div>
  				</div>
  			</div>

	</div>
	</div>

	</div>

	</div>

<!--Start of tabfinal-->
<div id="finaltab" class="tab-pane">
    <div align="center">
        <div class="panel panel-primary">
            <div class="panel-heading">Confirm Details</div>
            <div class="panel-body" style="padding-left: 10%;padding-right: 10%;">
            <div id="messages" class="hide" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <div id="messages_content"></div>
            </div>
			<div class="container-fluid">
			   <h2 align=center>Personal Details</h2>
			<div class="row-content">
			<div class="col-sm-9">
                <table class="table">
                        <th>Salutation *</th>
                        <td>
                            <p id="s"></p>
                    	</td>
                    </tr>
                    <tr>
                        <th>First Name *</th>
                        <td>
                            <p id="d1"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Middle Name</th>
                        <td>
                            <p id="d2"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Last Name</th>
                        <td>
                            <p id="d3"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Gender</th>
                        <td>
                            <p id="d4"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>
                            <p id="d5"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Mobile Number</th>
                        <td>
                            <p id="d6"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Date of Birth</th>
                        <td>
                            <p id="d7"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Education</th>
                        <td>
                            <p id="d8"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Mother's Name</th>
                        <td>
                            <p id="d9"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Father's Name</th>
                        <td>
                            <p id="d10"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Natural Guardian</th>
                        <td>
                            <p id="d11"></p>
                        </td>
                    </tr>
                </table></div>
				<div class="col-sm-3" align=center>
				<div align=center><h3>Profile Image</h3></div>
				<div style="margin-bottom:200px;">
				   <img id="m1" src=# alt="Passport" height=180 width=140 style="border:1px groove ;">
				  </div>
				  <div align=center><h3>Signature</h3></div>
				 <div style="width=100%">
				    <img id="m2" src=# alt="Signature" height=60 width=200 style="border:1px groove ;" >
				 </div>
				</div>
				</div>
				</div>
                <table class="table">
                    <tr>
                        <h2>Permanent Address</h2></tr>
                    <tr>
                        <th>Address Type</th>
                        <td>
                            <p id="e1"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td>
                            <p id="e2"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Area and landmark</th>
                        <td>
                            <p id="e3"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>City</th>
                        <td>
                            <p id="e4"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>District*</th>
                        <td>
                            <p id="e5"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Pin code</th>
                        <td>
                            <p id="e6"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Alt Mobile No.</th>
                        <td>
                            <p id="e7"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Office</th>
                        <td>
                            <p id="e8"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>State</th>
                        <td>
                            <p id="e9"></p>
                        </td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <h2>Account details</h2></tr>
                    <tr>
                        <th>Account Type</th>
                        <td>
                            <p id="f1"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Initial Balance </th>
                        <td>
                            <p id="f2"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Facilities Required</th>
                        <td>
                            <p id="ec1"></p>
                            <p id="ec2"></p>
                            <p id="ec3"></p>
                            <p id="ec4"></p>
                            <p id="ec5"></p>
                        </td>
                    </tr>
                </table>
                <table class="table">
                	<tr>
                        <h2>Proof of Identity/Address</h2>
                    </tr>
                    <tr>
                        <th>Identity Proof </th>
                        <td>
                        	<p id="g1"></p>
                        </td>
                        <td>
                            <p id="g2"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>Address Proof </th>
                        <td>
                            <p id="g3"></p>
                        </td>
                        <td>
                            <p id="g4"></p>
                        </td>
                    </tr>
                </table>
                <div class="well well-lg">
                <div class="form-group">
    		<div class="checkbox">
      			<label>
      			<input type="checkbox" id="terms" data-error="Please Accept the terms and conditions." required>
        		I/We confirm having read and understood the account rules of The Banking Corporation Limited ('the Bank'), and hereby agree to be bound by the terms and conditions and amendments governing the account(s) issued by the Bank from time-to-time.
      			</label>
      			<br>
      		<div class="help-block with-errors"></div>
      		</div>
			</div>

                </div>
                <div class="row">
                    <div align="center">
                        <div class="form-group">
                            <button class="btn btn-warning prevtab"  type="button" onclick="return showPrev()"><span class="glyphicon glyphicon-repeat"></span> Change Details </button>
                            <button class="btn btn-success" id="" type="submit"></span> Confirm <span class="glyphicon glyphicon-ok"> </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--End of tabfinal-->
</div>
<!--End of tab2-->
</div>

<!--Scripts-->

<!--Disable F5 script-->
<script type = "text/javascript">
    window.onload = function () {
        document.onkeydown = function (e) {
            return (e.which || e.keyCode) != 116;
        };
    }
</script>

<!-- SCript for Disabling tabs and nav through prev next-->
<script>
var $tabs = $('#createNotTab li');

function showPrev() {
    $tabs.filter('.active').prev('li').removeClass("disabled");
    $tabs.filter('.active').prev('li').find('a[data-toggle]').each(function() {
        $(this).attr("data-toggle", "tab");
    });

    $tabs.filter('.active').prev('li').find('a[data-toggle="tab"]').tab('show');

    $tabs.filter('.active').next('li').find('a[data-toggle="tab"]').each(function() {
        $(this).attr("data-toggle", "").parent('li').addClass("disabled");
    });
    fetchdetails();

}

function showNext() {
    $tabs.filter('.active').next('li').removeClass("disabled");
    $tabs.filter('.active').next('li').find('a[data-toggle]').each(function() {
        $(this).attr("data-toggle", "tab");
    });

    $tabs.filter('.active').next('li').find('a[data-toggle="tab"]').tab('show');

    $tabs.filter('.active').prev('li').find('a[data-toggle="tab"]').each(function() {
        $(this).attr("data-toggle", "").parent('li').addClass("disabled");;
    });
    fetchdetails();
}
</script>
<!-- SCript for Scrolling to top through prev next-->
<script>
$(".prevtab").on("click", function() {
    $("body").scrollTop(0);
});
</script>

<!-- Fetch Details Script-->
<script>
function fetchdetails() {
	//Personal Details
	for(i=1;i<=3;i++)
	{
		var ss=document.getElementById("sl"+i).checked;
		if(ss)
		{
			document.getElementById("s").innerHTML=document.getElementById("sl"+i).value;
			break;
		}
		else
		{
			document.getElementById("s").innerHTML="-";
		}
	}
    var zz = ["inputName", "midName", "lName", "addt", "inputEmail", "mobile", "DOB", "educ", "mother", "father", "guardian"];
    for (i = 0; i < 11; i++) {
        var vld = document.getElementById(zz[i]).value;
        if (vld != "") {
            document.getElementById("d" + (i + 1)).innerHTML = vld;
        } else {
            document.getElementById("d" + (i + 1)).innerHTML = "-";
        }
    }
    //Address
    var padr = ["addtype", "flat", "areala", "citya", "roadeo", "pina", "teleresi", "office", "stateind"];
    for (i = 0; i < 9; i++) {
        var vld = document.getElementById(padr[i]).value;
        if (vld != "") {
            document.getElementById("e" + (i + 1)).innerHTML = vld;
        } else {
            document.getElementById("e" + (i + 1)).innerHTML = "-";
        }
    }
    // Account
    var xd1 = document.getElementById("actype").value;
    document.getElementById("f1").innerHTML = xd1;
    var xd2 = document.getElementById("initbal").value;
    document.getElementById("f2").innerHTML = xd2;
    //Checkbox facilities
    for (j = 1; j < 6; j++) {
        var check = document.getElementById("fr" + j).checked;
        var vlu = document.getElementById("fr" + j).value;
        if (check) {
            document.getElementById("ec" + j).innerHTML = check;
        } else {
            document.getElementById("ec" + j).innerHTML = "-";
        }
    }
    //Proof
    var proof=["identtype","Identitytxt","aftype","addresstxt"];
    for (i = 0; i < 11; i++) {
        var vld = document.getElementById(proof[i]).value;
        if (vld != "") {
            document.getElementById("g" + (i + 1)).innerHTML = vld;
        } else {
            document.getElementById("g" + (i + 1)).innerHTML = "-";
        }
    }

}
//Reset function for tabs
function resetpg1()
{
	for(i=1;i<=3;i++)
	{
		document.getElementById("sl"+i).checked=false;
	}
	var zz = ["inputName", "midName", "lName", "addt", "inputEmail", "mobile", "DOB", "educ", "mother", "father", "guardian"];
    for (i = 0; i < 11; i++)
    {
        document.getElementById(zz[i]).value = "";
    }
    var padr = ["addtype", "flat", "areala", "citya", "roadeo", "pina", "teleresi", "office", "stateind"];
    for (i = 0; i < 9; i++)
    {
        document.getElementById(padr[i]).value = "";
    }
}
function resetpg2()
{
document.getElementById("actype").value="";
document.getElementById("initbal").value="";
var proof=["identtype","Identitytxt","aftype","addresstxt"];
    for (i = 0; i < 4; i++)
    {
        document.getElementById(proof[i]).value="";
    }
for (j = 1; j < 6; j++)
	{
        document.getElementById("fr" + j).checked=false;
    }

}
//Tab1 validation
function tabv()
{
	var scs=1;
	for(i=1;i<=21;i++)
	{
		var vlu=document.getElementsByName("a"+i);
		if(vlu[0].required==true)
		{
			if(vlu[0].value=="")
				{scs=0;}
		}
	
	}	
	
	if (scs==1) 
	{
		
		showNext();
	}
	else
	{
		window.alert("Please check all required fields are filled.!!!")
	}
}
//Tab2 validation
function tabv2()
{
	var scs=1;
	for(i=22;i<=34;i++)
	{
		var vlu=document.getElementsByName("a"+i);
		if(vlu[0].required==true)
		{
			if(vlu[0].value=="")
				{scs=0;}
		}
	
	}	
	
	if (scs==1) 
	{
		showNext();
	}
	else
	{
		window.alert("Please check all required fields are filled.!!!")
	}
}
</script>
<!--Image Final Tab-->
<script>
function fun(x)
{
 if (x.files && x.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#m1')
                    .attr('src', e.target.result)
                    .width(140)
                    .height(180);
            };

            reader.readAsDataURL(x.files[0]);
        }
}
function fun1(x)
{
 if (x.files && x.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#m2')
                    .attr('src', e.target.result)
                    .width(200)
                    .height(60);
            };

            reader.readAsDataURL(x.files[0]);
        }
}
</script>

<!--Scripts-End-->

</form>
</body>
<div id="footer" style="width: 100%; padding-top: 6PX; padding-right: 10%;font-family: Arial, Helvetica, sans-serif;" align="right" class="sansserif">
<div><P id="time"></P></div>
<div>
<p>This site is best viewed in Google Chrome,Mozilla Firefox.</p></div>
</div>
<script>
	document.getElementById("time").innerHTML = Date();
</script>
	

</html>
