<%@ page import="java.sql.*,java.io.*" %>
<% Class.forName("com.mysql.jdbc.Driver");
Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");

String qr="select customer_id from netbanking_active";

String x=request.getParameter("c1");
String qr1="select * from client_personal_details where customer_id='"+x+"'";

PreparedStatement ps2=cn.prepareStatement(qr1);
ResultSet rs2=ps2.executeQuery();
boolean check=false;

if(rs2.next())
{
	PreparedStatement ps=cn.prepareStatement(qr);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		String db=rs.getString("customer_id");
		if(x.equals(db))
			check=true;
	}
	if(check)
	{
	%>1<% }
	else
	{
		%>0<% 
	} 
}
else
{
	%>2<%
}
%>