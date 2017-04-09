<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*,java.sql.*,java.util.Date,java.text.*,p.*" %>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
	String user=request.getParameter("user");
	String pass=request.getParameter("pass");
	String val="select password,status,date,customer_id from netbanking_active where username='"+user+"';"; 
	Statement sm=cn.createStatement();
	Statement sm2=cn.createStatement();
	Statement sm1=cn.createStatement();
	ResultSet rs=sm.executeQuery(val);
	Date dNow=new Date();
	SimpleDateFormat ss=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
	String s=ss.format(dNow);
	String stat="update netbanking_active set status=1,date='"+s+"' where username='"+user+"';";
    while(rs.next())
    {   Boolean b=BCrypt.checkpw(pass,rs.getString(1));
    	Date nowdate = ss.parse(rs.getString(3)); 
    	long difference=dNow.getTime() - nowdate.getTime() ;  
    	if(b)
    	{   
    		
    		if((rs.getInt(2)==0||difference>900000)||(rs.getInt(2)==1&&difference>900000))
    		{
    			sm1.executeUpdate(stat);
        		session.invalidate();
        		session=request.getSession();
        		session.setAttribute("user", user);
				session.setAttribute("ID", rs.getString(4));
        		%>
          	   1
          	 <%
    		}
    		else if(rs.getInt(2)==1&&difference<900000)
    		{
    			%>
    	    	   3	
    	    	 <%
    		}
    	}
    	else if(!b)
    	{%>
    	   2	
    	 <%
    	}
    }
}
catch(Exception e)
{
	e.printStackTrace();
}
%>