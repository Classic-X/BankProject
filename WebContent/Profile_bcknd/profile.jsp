<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
	String cid=request.getParameter("cid");
	String q="select * from client_personal_details where customer_id='"+cid+"'";
	Statement ps=cn.createStatement();
	ResultSet rs=ps.executeQuery(q);
	String a=null,b=null,c=null,d=null;
	while(rs.next())
	{  if(rs.getString(4)==null)
	{
	  a="";
	}
	else
	{
		a=rs.getString(4);
	}
	%>
		<div style="padding: 20px;">
        <table class="table table-bordered">
            <thead>
                <tr style="color: white;background-color: #5A55A3">
                    <th colspan="4"> <span class="glyphicon glyphicon-user"></span> Customer ID : <%= rs.getString(1) %></th>                    
                </tr>
            </thead>
            <tr><br></tr>
            <tr>
                <th colspan="1">Name</th>
                <td colspan="1">
                    <p class="pro"><%= rs.getString(2)+" "+ rs.getString(3)+" "+a + " "+rs.getString(5) %></p>
                </td>
                <th colspan="1">Date Of Birth</th>
                <td colspan="1">
                    <p class="pro"><%= rs.getString(9) %></p>
                </td>
            </tr>
            <tr>
                <th colspan="1">E-Mail</th>
                <td colspan="1">
                    <p class="pro"><%= rs.getString(7) %></p>
                </td>
                <th colspan="1">Mobile no.</th>
                <td colspan="1">
                    <p class="pro"><%= rs.getString(8) %></p>
                </td>
            </tr>
            
            <tr>
                <th colspan="1">Father's Name</th>
                <td colspan="1">
                    <p class="pro"><%= rs.getString(12) %></p>
                </td>
            
                <th colspan="1">Mother's Name</th>
                <td colspan="1">
                    <p class="pro"><%= rs.getString(11) %></p>
                </td>
            </tr>
            <tr>
                <th colspan="1">Alt Mobile no.</th>
                <%if(rs.getString(20)==null)
              {
                  b="-";
                }
                else
                {
                  b=rs.getString(20);
                } %>
                <td colspan="1">
                    <p class="pro"><%= b %></p>
                </td>
                <th colspan="1">Office no.</th>
                <%if(rs.getString(21)==null)
              {
                  c="-";
                }
                else
                {
                  c=rs.getString(21);
                } %>
                <td colspan="1">
                    <p class="pro"><%= c %></p>
                </td>
            </tr>
            <tr>
            <th colspan="1">Address</th>
                <td colspan="1"><%if(rs.getString(16)==null)
              {
                  d="";
                }
                else
                {
                  d=rs.getString(16);
                } %>
                    <p class="pro"><%= rs.getString(14)%> <br> <%= rs.getString(15) +" , "+ d %> <br> <%= rs.getString(17)+", "+rs.getString(18)+", "+rs.getString(22) %> <br> <%= "Pincode-"+rs.getString(19) %></p>
                </td>
                <th colspan="1">Education</th>
                <td>
                <p><%= rs.getString(10) %></p>
                </td>
            </tr>
            
        </table>
    </div>
<%	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>