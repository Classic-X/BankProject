<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
session=request.getSession(false);
String servlet=(String)session.getAttribute("servlet");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Checking Page</title>

</head>
<body>
<form action="CheckServlet" method="post">
<div class="w3-row-padding">
<div class="w3-half">
<label for="x1">Admin ID :</label>
<input class="w3-input w3-border" type="text" id="x1" name="id"></div>
<div class="w3-half">
<label for="x2">Password :</label><input class="w3-input w3-border" id="x2" type="password" name="pass"><br>
</div>
</div>
<input type="hidden" value="true" name="result">
<input type="submit" class="w3-button w3-blue" value="Submit">
</form>
</body>
</html>