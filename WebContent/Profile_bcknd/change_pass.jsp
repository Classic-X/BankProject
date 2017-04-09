<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*,java.sql.*,p.*" %>

<%
    PrintWriter pw=response.getWriter();
    try{
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
	 String s2="select password from netbanking_active where customer_id=?";
	 PreparedStatement ps2=cn.prepareStatement(s2);
	 String currpass=request.getParameter("currpass");
	 String cid=request.getParameter("cuid");
	 ps2.setString(1,cid);
	 ResultSet rs2=ps2.executeQuery();
	 if(rs2.next())
	   { String cpass=rs2.getString("password");
	      if(BCrypt.checkpw(currpass,cpass))
	      {
	      String s="UPDATE netbanking_active SET password=? where customer_id=?";
	      String cnewpass=request.getParameter("cnewpass");
	      String upass=request.getParameter("acc");
	      String newpass=request.getParameter("newpass");
	      if(newpass.equals(cnewpass))
	       {
	        PreparedStatement ps=cn.prepareStatement(s);
	        String hashed = BCrypt.hashpw(cnewpass, BCrypt.gensalt());

		// gensalt's log_rounds parameter determines the complexity
		// the work factor is 2**log_rounds, and the default is 10
		   hashed = BCrypt.hashpw( cnewpass, BCrypt.gensalt(12));
		   ps.setString(1,hashed);
			ps.setString(2,cid);
		   int rs=ps.executeUpdate();
		   if(rs>0)
		   {
			out.println("Password Changed successfully");
		   }
		   else
		   {
			out.println("Something went Wrong while changing Password. Please Try Again after Login!");
		    }
	    }
	 else
	 {
		 out.println("Password does not match..!");
	 }
	 }
	  else
	  {   out.println("incorrect password");
		  out.println("2 more Incorrect Attemps will block your account.!! ");
	  }
	 }
	 else
	 {
	   out.println("Invalid Credentials");
	 }
    }
	 catch(Exception e)
	 { pw.print(e);   
	 	
	 }
	 %>