<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*,java.sql.*,java.util.Date,java.text.*,p.*" %>
<%
try
{
	DAO d=new DAO();
	Connection cn=d.getConnection();
	String user=request.getParameter("user");
	String val="select username from netbanking_active where username='"+user+"';";
	Statement sm=cn.createStatement();
	ResultSet rs=sm.executeQuery(val);
    if(rs.next())
    {
 %> Username <span class="glyphicon glyphicon-ok" style="color: green;"></span>  <%
     }
     else
     {
    %> Username <span class="glyphicon glyphicon-remove" style="color: red;"></span>    
  <%  }
}
catch(Exception e)
{
	e.printStackTrace();
}
%>