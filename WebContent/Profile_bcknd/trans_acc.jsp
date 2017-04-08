<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*,java.sql.*" %>

<%try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
	String cid=request.getParameter("cid");
	String q="select * from client_account_details where customer_id='"+cid+"' and acc_type !='fixed'";
	Statement ps=cn.createStatement();
	ResultSet rs=ps.executeQuery(q);
	int i=0,x=0;
%><select value="" class="form-control" id="opt2" onclick="viewacinfo2();" style="width: 50%">
<option value="Select" disabled selected>Select Account</option>
<% 
	while(rs.next())
	{ x++;
%><option value=<%=Integer.toString(x) %>><%=rs.getString(1) %></option>
<%
	}
%></select> <br>
<%  ResultSet rs2=ps.executeQuery(q);
    while(rs2.next())
{   i++;
	%>
	<div id=<%="pgl"+Integer.toString(i)%> style="display:none;width:50%" >
		<table class="table table-bordered">
			<tr >
				<th style="color: white;background-color: #494588;width: 60%;">Account Type:</th>
				<td><b><%=rs2.getString(3) %></b></td>
			</tr>
			<tr>
				<th style="color: white;background-color: #494588">Balance:</th>
				<td><b><i class="fa fa-inr"></i> <%=rs2.getString(5) %></b></td>
			</tr>
			
		</table>
	</div>
	<%
}
%>  <div id="x5" style="display:none"><%=i%></div>
<%
}
catch(Exception e)
{
	e.printStackTrace();
}
%>