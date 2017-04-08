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
Banker ID:<input type="text" name="id"><br>
Banker Password:<input type="password" name="pass"><br>
<input type="hidden" value="true" name="result">
<input type="submit" value="Submit">
</form>
<a href='index.jsp'><input type='button' value='main page'></a>
</body>
</html>