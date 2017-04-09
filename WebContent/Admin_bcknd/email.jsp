<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*,java.sql.*" %>
    <%try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
	String cid=request.getParameter("cid");
	String q="select * from temp_regd";
	Statement ps=cn.createStatement();
	ResultSet rs=ps.executeQuery(q);
	int i=0,x=0;
	String z=""; %>
	<label for="selm">Select Mail ID</label>
<select value="" class="w3-select w3-border" id="selm" onchange="viewacinfo();" style="width: 20%">
<option value="" hidden>Select</option>
<%
	while(rs.next())
	{i++;
	z=rs.getString(6);
	%><option value=<%=Integer.toString(i) %>><%= z %></option>
<%
	}
%></select><br><br>
<%  ResultSet rs2=ps.executeQuery(q);
	while(rs2.next())
	{   x++;
	%> 
	<div id=<%="pg"+Integer.toString(x)%> style="display:none;width:50%;" >
	<table class="w3-table-all w3-card-4" style="text-align: center">
	<thead >
		<tr align="center">
			<th colspan="2" >Details</th>
		</tr>
	</thead>
	<tr>
		<th>Name :</th>
		<td><%=rs2.getString(1) %> <%=rs2.getString(2) %> <%=rs2.getString(3) %> <%=rs2.getString(4) %></td>
	</tr>
	<tr>
		<th>Gender :</th>
		<td><%=rs2.getString(5) %></td>
	</tr>
	<tr>
		<th>Mobile :</th>
		<td><%=rs2.getString(7) %></td>
	</tr>
	
	</table>
	</div>
<%	} %>
	<div id="x23" hidden=""><%= x%></div>
<%}
catch(Exception e)
{
	e.printStackTrace();
}
%>