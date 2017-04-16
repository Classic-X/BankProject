<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0");
if(session.getAttribute("admin")!=null)
 {
String message=(String)request.getAttribute("message");
String admin=(String)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Dashboard</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
	/* Style the tab */
div.tab {
    float: left;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
    width: 20%;
    height: 500px;
}

/* Style the buttons inside the tab */
div.tab button {
    display: block;
    background-color: inherit;
    color: black;
    padding: 22px 16px;
    width: 100%;
    border: none;
    outline: none;
    text-align: left;
    cursor: pointer;
    transition: 0.3s;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current "tab button" class */
div.tab button.active {
    background-color: #209DEC;
    color: white;
    border-bottom: 13px solid transparent;
        border-top: 13px solid transparent;
        border-left: 10px solid #383839;
}

/* Style the tab content */
.tabcontent {
    float: left;
    padding: 0px 12px;
    border: 1px solid #ccc;
    width: 80%;
    border-left: none;
    height: 500px;
}

</style>
<body onload="call();custinfo();custinfo2();">
<header>
<div class="container-fluid" align="center" style="width: 100%;background-color: #336699;padding-bottom: 1%"><img src="Head.png" width="20%"></div>
</header>
<div class="">
<form action="Adlogout" method="post">
<div class="w3-bar w3-blue">
  <a href="#" class="w3-bar-item w3-button" >Home</a> 
    <span class="w3-bar-item " style="width: 82%">Hello <%=admin %> </span>
    <button class="w3-button w3-red log2" style="left: 90%"><span class="glyphicon glyphicon-log-out"></span> Logout</button>
</div>
</form>

<div class="tab">
   <button class="tablinks" onclick="openCity(event, 'Cacc')">Confirm <span class="glyphicon glyphicon-ok"></span></button>
  <button class="tablinks" onclick="openCity(event, 'DelAcc')">Delete <span class="glyphicon glyphicon-trash"></button>
</div>

<div id="Cacc" class="tabcontent" style="display: active" align="center">
  <h3>Confirm Account</h3>
  <br>
  <div id="viewc"></div>
  <br>
  <div id="con"  style="width: 40%"></div>
  <button class="w3-button w3-teal" id="bt2" onclick="confirmac();">Confirm Account</button>
</div>

<div id="DelAcc" class="tabcontent" style="display: none" align="center">
  <h3>Delete Account</h3>
  <br>
  <div id="viewc2"></div>
  <br>
  <div id="con2"  style="width: 40%"></div>
  <button class="w3-button w3-teal" id="bt22" onclick="confirmac2();">Delete Account</button>
</div>

</div>
<script>
	<!-- Customer View-->
function custinfo() {
    var xhttp;    
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("viewc").innerHTML = xhttp.responseText;
        }
    };
    xhttp.open("POST", "Admin_bcknd/email.jsp", true);
    xhttp.send();
}
function confirmac() {
    var xhttp;    
    document.getElementById("bt2").style.visibility = 'hidden';
    var e = document.getElementById("selm");
        var strUser = e.options[e.selectedIndex].text;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
        	
            document.getElementById("con").innerHTML = xhttp.responseText;
        }
    };
    xhttp.open("POST", "Verify1?email="+strUser, true);
    xhttp.send();
}
function custinfo2() {
    var xhttp;    
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("viewc2").innerHTML = xhttp.responseText;
        }
    };
    xhttp.open("POST", "Admin_bcknd/email2.jsp", true);
    xhttp.send();
}
function confirmac2() {
    var xhttp;    
    document.getElementById("bt22").style.visibility = 'hidden';
    var e = document.getElementById("selm2");
        var strUser = e.options[e.selectedIndex].text;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
        	
            document.getElementById("con2").innerHTML = xhttp.responseText;
        }
    };
    xhttp.open("POST", "Verify2?accno="+strUser, true);
    xhttp.send();
}
function viewacinfo()
    {
        var xx=Number(document.getElementById("x23").innerHTML);        
        var e = document.getElementById("selm");
        var strUser = e.options[e.selectedIndex].value;
        for(i=1;i<=xx;i++)
        {
        var v2=document.getElementById('pg'+i);
        v2.style.display='none';
        }
        var v3=document.getElementById('pg'+strUser);
        v3.style.display='block';
    }
    function viewacinfo2()
    {
        var xx=Number(document.getElementById("x24").innerHTML);        
        var e = document.getElementById("selm2");
        var strUser = e.options[e.selectedIndex].value;
        for(i=1;i<=xx;i++)
        {
        var v2=document.getElementById('pg5'+i);
        v2.style.display='none';
        }
        var v3=document.getElementById('pg5'+strUser);
        v3.style.display='block';
    }
</script>
<script>
	function openCity(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the link that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}

</script>	
<script>
function call()
{
var m="<%out.print(message);%>";
document.getElementById('status').innerHTML=m;
if(m!="null")
	{
$("#amm").modal('show');
	}
	return true;
}
</script>



<div class="container">
	  <!-- Modal -->
	  <div class="modal fade" id="amm" role="dialog">
	    <div class="modal-dialog modal-sm">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title"><span class="glyphicon glyphicon-user"></span> Message</h4>
	        </div>
	        <div class="modal-body" id="status">
	            
	        </div>
	      </div>
	    </div>
	  </div>
	  
	</div>

</body>
</html>
<%  }
else
{
	response.sendRedirect("Homepage.html");
}%>