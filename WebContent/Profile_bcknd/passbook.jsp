<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@page import="java.io.*,java.sql.*,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
	String accno=request.getParameter("accno");
	int d=Integer.parseInt(request.getParameter("d"));
	String dd[]=new String[4];
	String q="";
	String with="";
	String depo="";
	String Particular="";
	float total=0.00f;
	if(d==1)
	{
	 dd[0]=request.getParameter("d0");
	 dd[1]=request.getParameter("d1");
	q="select * ,DATE_FORMAT(date,'%d-%m-%Y %h:%i %p') from transaction where (sender_acc_no='"+accno+"' or receiver_acc_no='"+accno+"') and (date between '"+dd[0]+"' and '"+dd[1]+"') order by date;";
	}
	else if(d==2)
	{
		dd[2]=request.getParameter("d2");
	q="select * ,DATE_FORMAT(date,'%d-%m-%Y %h:%i %p') from transaction where (sender_acc_no='"+accno+"' or receiver_acc_no='"+accno+"') and date like '"+dd[2]+"%' order by date;";
	}
	else
	{
		dd[3]=request.getParameter("d3");
	q="select *,DATE_FORMAT(date,'%d-%m-%Y %h:%i %p') from transaction where (sender_acc_no='"+accno+"' or receiver_acc_no='"+accno+"') and date like '"+dd[3]+"%' order by date";
	}
	Statement ps=cn.createStatement();
	ResultSet rs=ps.executeQuery(q);
	int i=0;
%><table class="table  table-striped table-bordered" id="psview" style="width: 95%">
   <thead style="background-color: #5A55A3 ;color: white;"><tr><th style="width:20%;"><span class="glyphicon glyphicon-calendar"></span> Date</th><th>Particulars</th><th>Debit</th><th>Credit</th><th>Balance</th></tr></thead><%
	while(rs.next())
	{ if(rs.getString(1).equals(accno))
	  {
		 with=rs.getString(3);
		 depo="";
		 total=rs.getInt(5);
		 Particular="Sent to account no. "+rs.getString(2);
	  }
	else if(rs.getString(2).equals(accno))
	{
		depo=rs.getString(3);
		with="";
		total=rs.getInt(6);
		Particular="Received from account no. "+rs.getString(1);
	}
%>    <tr><td align="center"><%=rs.getString(8) %></td><td><%=Particular+" "+rs.getString(7) %></td><td align="right" style="padding-right: 25px;"><%=with%></td><td align="right" style="padding-right: 25px;"><%=depo %></td><td align="right" style="padding-right: 25px;"><%=total %></td></tr>
	<%}%>
</table>
<%}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>