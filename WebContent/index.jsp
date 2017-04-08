<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
	<title>Admin Dashboard</title>
	<link rel="stylesheet" src="external.css">
	<script type="text/javascript">
		function fun2(){
			document.getElementById("hey").innerHTML=("Delete an Account<br>Enter Account Number:<form action='Verify2' method='post'><input type='text' name='accno' autofocus><br><input type='submit' value='submit'></form>");
		}
		function fun1(){
			document.getElementById("hey").innerHTML=("Confirm an Account<br>Enter Email id:<form action='Verify1' method='post'><input type='text' name='email' autofocus><br><input type='submit' value='submit'></form>");
		}
	</script>
</head>
<body>
<h1 id="main" align="center">ADMIN  DASHBOARD</h1>
<br><br>
<div width=100% style="background-color: grey;">
<table align="center">
	<tr align="center">
		<td><input type="button" value="Confirm an Account" onclick="fun1()" id="ConfirmAccount"></td>
	</tr>
	<tr align="center">
		<td><input type="button" value="Delete an Account" onclick="fun2()" id="DeleteAccount"></td>
	</tr>
</table>
</div>
<div style="background-color: black; color: white" align="center"><h2 id="hey"></h2></div>

</body>
</html>