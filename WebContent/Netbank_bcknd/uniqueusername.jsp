<%@ page import="java.sql.*,java.io.*" %>
<% Class.forName("com.mysql.jdbc.Driver");
Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");

String qr="select username from netbanking_active";
String x=request.getParameter("c2");
PreparedStatement ps=cn.prepareStatement(qr);
ResultSet rs=ps.executeQuery();
boolean check=false;
while(rs.next())
{
	String db=rs.getString("username");
	if(x.equals(db))
		{check=true;
		break;
		}
}
if(check)
{
%>1<% }
else
{
%>0<% } %>