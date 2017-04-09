<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*,java.sql.*" %>
    <%try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
	String cid=request.getParameter("cid");
	String q="select accno,acc_type,project_bank.client_account_details.customer_id,concat(salutation,' ',concat(concat(fname,' ',mname),' ',lname)) from project_bank.client_account_details,project_bank.client_personal_details where project_bank.client_account_details.customer_id = (project_bank.client_personal_details.customer_id); ";
	Statement ps=cn.createStatement();
	ResultSet rs=ps.executeQuery(q);
	int i=0,x=0;
	String z=""; %>
	<label for="selm2">Select Account</label>
<select value="" class="w3-select w3-border" id="selm2" onchange="viewacinfo2();" style="width: 20%">
<option value="" hidden>Select</option>
<%
	while(rs.next())
	{i++;
	z=rs.getString(1);
	%><option value=<%=Integer.toString(i) %>><%= z %></option>
<%
	}
%></select><br><br>
<%  ResultSet rs2=ps.executeQuery(q);
	while(rs2.next())
	{   x++;
	%> 
	<div id=<%="pg5"+Integer.toString(x)%> style="display:none;width:50%;" >
	<table class="w3-table-all w3-card-4" style="text-align: center">
	<thead >
		<tr align="center">
			<th colspan="2" >Details</th>
		</tr>
	</thead>
	<tr>
		<th>Customer Id :</th>
		<td><%=rs2.getString(3) %></td>
	</tr>
	<tr>
		<th>Customer Name :</th>
		<td><%=rs2.getString(4) %>	
	</tr>
	<tr>
		<th>Account Type</th>
		<td><%=rs2.getString(2) %></td>
	</tr>	
	</table>
	</div>
<%	} %>
	<div id="x24" hidden=""><%= x%></div>
<%}
catch(Exception e)
{
	e.printStackTrace();
}
%>