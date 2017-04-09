

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Confirm11")
public class Confirm11 extends HttpServlet {
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
			String param[]={"a24","a25","a26","a27","a28","a29","a30"};
			float abal=0;
			while(rs.next())
			{
				for(int i=24;i<=30;i++)
				{
					if(i!=25)
					{
	                   param[i-24]=rs.getString(i);
					}
					if(i==25) abal=rs.getFloat(i);
				}
			}
			int custid=0,accno=0;
			String z="select * from client_personal_details where mail='"+email+"';";
			rs=smt.executeQuery(z);
			while(rs.next())
			{
				custid=Integer.parseInt(rs.getString(1));
			}	
			z="select * from client_account_details";
			rs=smt.executeQuery(z);
			while(rs.next())
			{
				accno=(Integer.parseInt(rs.getString(1))+1);
			}
			String p="insert into client_account_details values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps2=cn.prepareStatement(p);
			ps2.setString(1, new Integer(accno).toString());
			ps2.setString(2, new Integer(custid).toString());
			int y=3;
			for(int i=1;i<=7;i++)
			{
					if(i==1){ps2.setString(y,param[i-1]); y+=2;}
					else if(i==2){ ps2.setFloat(5, abal); y++;}
					else{ ps2.setString(y,param[i-1]); y++;}    
			}
			String date=f.format(d);
			ps2.setString(4, date);
			int a12=ps2.executeUpdate();
			r="delete from temp_regd where mail='"+email+"';";
			smt.executeUpdate(r);
			if(a12>0) 
				{pw.print("Account created Successfully. Account id="+accno+". Customer id="+custid);
			String message="Hello "+custid+"\nCongratulations!! Your new Account has been Created.  Happy Banking.\nYour Account no. is "+accno+".\nThank You!";
					String subject="Bank Account Creation!";
					String to=email;
					SendMail.send(to,subject,message);



		}
		}
		catch(Exception e){pw.print(e); e.printStackTrace();}
			
	}

}
