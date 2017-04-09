<html>  
<body>  
 <%@ page import="java.sql.*,java.io.*" %>
 <% Connection cn=null;
Class.forName("com.mysql.jdbc.Driver");
cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
String s=request.getParameter("a2");
String qr="select * from savings_acc_details where accno=?";
PreparedStatement ps=cn.prepareStatement(qr);
ps.setString(1, s);
ResultSet rs=ps.executeQuery(); %>
<% 
int n=0;

%>
<% while(rs.next()) 
{ String a=rs.getString(1); String b=rs.getString(2); %>
 
<table class="table">
<tr>
<td> <% out.print(a); %> </td>
<td> <% out.print(b); %> </td>
</tr>

</table>

<% } %>
<p>FUCKI</p>
</body>  
</html>  