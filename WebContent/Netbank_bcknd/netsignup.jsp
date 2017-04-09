<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*,java.io.*,p.*,java.util.Date,java.text.*" %>

<% Class.forName("com.mysql.jdbc.Driver");
Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
Date dNow=new Date();
SimpleDateFormat ss=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
String s=ss.format(dNow);
String qr="insert into netbanking_active values (?,?,?,?,?,?)";
String param[]={"c1","c2","c3","c4"};
String details[]=new String[4];

for(int i=0;i<3;i++)
{
	details[i]=request.getParameter(param[i]);
	
}
String upass=request.getParameter(param[3]);
String hashed = BCrypt.hashpw(upass, BCrypt.gensalt());

// gensalt's log_rounds parameter determines the complexity
// the work factor is 2**log_rounds, and the default is 10
 hashed = BCrypt.hashpw(upass, BCrypt.gensalt(12));
PreparedStatement ps=cn.prepareStatement(qr);
for(int i=0;i<3;i++)
{
	ps.setString(i+1, details[i]);
	
}
ps.setInt(5,0);
ps.setString(6,s);
ps.setString(4,hashed);
ps.executeUpdate(); %>