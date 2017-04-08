<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*,java.sql.*" %>

<%try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
	String cid=request.getParameter("cid");
	String q="select * from client_account_details where customer_id='"+cid+"'";
	Statement ps=cn.createStatement();
	ResultSet rs=ps.executeQuery(q);
	int i=0,x=0;
%> <label for="opt">Select Account</label>
<select value="" class="form-control" id="opt3" onchange="passbook(0);" style="width: 20%">
<option value="Select" disabled selected>Select</option>
<% 
	while(rs.next())
	{ x++;
%><option value=<%=Integer.toString(x) %>><%=rs.getString(1) %></option>
<%
	}
%></select>
 <div id=x23 style="visibility: hidden;display:none;"><%=i%></div>
<%
}
catch(Exception e)
{
	e.printStackTrace();
}
%>