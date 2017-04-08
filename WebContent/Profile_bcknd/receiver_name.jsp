
    <%@ page import="java.io.*,java.sql.*" %>
<%try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
	String rec_acc=request.getParameter("acc");
	String q="select concat(salutation,' ',concat(concat(fname,' ',mname),' ',lname)) from client_personal_details where customer_id=(select customer_id from client_account_details where accno='"+rec_acc+"')";
	Statement ps=cn.createStatement();
	ResultSet rs=ps.executeQuery(q);
	while(rs.next())
	{
%>     <%=rs.getString(1) %>
<%
	} 
}
catch(Exception e)
{
	e.printStackTrace();
}
%>