

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Confirm2")
public class Confirm1 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		Date d=new Date();
		HttpSession session=request.getSession(false);
		String email=(String)session.getAttribute("email");
		session.invalidate();
		Connection cn=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
		
			String r="select * from temp_regd where mail='"+email+"';";
			Statement smt=cn.createStatement();
			ResultSet rs=smt.executeQuery(r);
			String param[]={"a1","a2","a3","a4","a5","a6","a7","a8","a9","a10","a11","a12","a13","a14","a15","a16","a17","a18","a19","a20","a21","a22","a23","a24","a25","a26","a27","a28","a29","a30","a31","a32","a33","a34"};
			float abal=0; Blob b1=null,b2=null;
			while(rs.next())
			{
				for(int i=1;i<=34;i++)
				{
					if(i!=22 && i!=23 && i!=25)
					{
	                   param[i-1]=rs.getString(i);
					}
					if(i==25) abal=rs.getFloat(i);
					if(i==22)
					{
				     b1=rs.getBlob(i);
					}
					if(i==23)
					{
				     b2=rs.getBlob(i);
					}
				}
			}
			int custid=0,accno=0;
			String z="select * from client_personal_details";
			rs=smt.executeQuery(z);
			while(rs.next())
			{
				custid=Integer.parseInt(rs.getString(1));
			}
			custid++;
			
			z="select * from client_account_details";
			rs=smt.executeQuery(z);
			while(rs.next())
			{
				accno=Integer.parseInt(rs.getString(1));
			}
			accno++;
			String q="insert into client_personal_details values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			String p="insert into client_account_details values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps1=cn.prepareStatement(q);
			PreparedStatement ps2=cn.prepareStatement(p);
			ps1.setString(1, new Integer(custid).toString());
			ps2.setString(1, new Integer(accno).toString());
			ps2.setString(2, new Integer(custid).toString());
			int x=2,y=3;
			for(int i=1;i<=34;i++)
			{
					if(i>=24 && i<=30)
					{
					if(i==24){ps2.setString(y,param[i-1]); y+=2;}
					else if(i==25){ ps2.setFloat(5, abal); y++;}
					else{ ps2.setString(y,param[i-1]); y++;}    
					}
					else if(i!=22 && i!=23)
					{
					  ps1.setString(x, param[i-1]); x++;
					}
					else if(i==22)
					{
			           ps1.setBlob(x, b1);
	                   x++;
					}
					else
					{
				       ps1.setBlob(x, b2);
		               x++;
					}
			}
			String date=f.format(d);
			ps2.setString(4, date);
			int a11=ps1.executeUpdate();
			int a12=ps2.executeUpdate();
			r="delete from temp_regd where mail='"+email+"';";
			smt.executeUpdate(r);
			if(a11>0 && a12>0) 
				{
					pw.print("Account created Successfully. Account id="+accno+". Customer id="+custid);
					String message="Congratulations!! Your Account has been Created. Welcome to our Family. Happy Banking.\n Your Customer id is "+custid+" and your Account no. is "+accno+".\nThank You!";
					String subject="Bank Account Creation!";
					String to=email;
					SendMail.send(to,subject,message);
		        }
		    }
		catch(Exception e){pw.print(e); e.printStackTrace();}
	}

}
