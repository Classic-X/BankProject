<%@ page import="java.io.*,java.sql.*,java.util.Date,java.text.*,p.*" %>

<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");

	 String s23="select password from netbanking_active where customer_id=?";
	 PreparedStatement ps23=cn.prepareStatement(s23);
	 String currpass=request.getParameter("currpass");
	 String cid=request.getParameter("cuid");
	 ps23.setString(1,cid);
	 String message="";
	 ResultSet rs23=ps23.executeQuery();
	 if(rs23.next())
	   { String cpass=rs23.getString("password");
	      if(BCrypt.checkpw(currpass,cpass))
	      {
	
	String tra_det[]=new String[7];
	SimpleDateFormat ss=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
	for(int i =0;i<4;i++)
	{
		tra_det[i]=request.getParameter("a"+Integer.toString(i+1));
	}
	double amt=Double.parseDouble(tra_det[2]);
	message="Transaction Successfull.";
	String q2="insert into transaction values (?,?,?,?,?,?,?)";
	String a1="select balance from client_account_details where accno='"+tra_det[0]+"'";
	String a2="select balance from client_account_details where accno='"+tra_det[1]+"'";
	String u1="update client_account_details set balance=balance-"+amt+"where (accno='"+tra_det[0]+"' and balance>=500+"+amt+")";
	String u2="update client_account_details set balance=balance+"+amt+"where (accno='"+tra_det[1]+"' and accno!='"+tra_det[0]+"')";
	Statement s1=cn.createStatement();
	Statement s2=cn.createStatement();
	Statement p1=cn.createStatement();
	Statement p2=cn.createStatement();
	PreparedStatement ps=cn.prepareStatement(q2);
	int res1=-1;
	int res2=s2.executeUpdate(u2);
	if(res2==1)
	{
     res1=s1.executeUpdate(u1);
	}
	else
	{
		res1=0;
	}
	ResultSet rs1=p1.executeQuery(a1);
	if((res1==1 )&& (res2==1))
	{
		while(rs1.next())
		{
			ps.setDouble(5, rs1.getDouble(1));
		}
	ResultSet rs2=p2.executeQuery(a2);
		while(rs2.next())
		{
			ps.setDouble(6, rs2.getDouble(1));
		}
	for(int i =0;i<2;i++)
	{
		ps.setString(i+1,tra_det[i]);
	}
	ps.setDouble(3, amt);
	ps.setString(7,tra_det[3]);
	ps.setString(4,ss.format(new Date()));
	int rs=ps.executeUpdate(); 
	if(rs!=1)
	{
		message="Transaction Failed.";
	}
	}
	else if((res1==0)&&(res2==1))
	{
	     message="Balance Insufficient.";
	}
	else if(res2!=1)
	{
		message="Receiver And Sender Account are Same";
	}

	}
	else
	message="Invalid Credentials!!";
	%><p><%=message %></p>
	<%

}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>