

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Register")
public class Register extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection cn=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
			String q="insert into temp_regd values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			String param[]={"a1","a2","a3","a4","a5","a6","a7","a8","a9","a10","a11","a12","a13","a14","a15","a16","a17","a18","a19","a20","a21","a22","a23","a24","a25","a26","a27","a28","a29","a30","a31","a32","a33","a34"};
			String details[]=new String[34];
			String checkbox[]={"a26","a27","a28","a29","a30"};
			PrintWriter pw=response.getWriter();
			for(int i=0;i<34;i++)
			{				
				details[i]=request.getParameter(param[i]);
			}
			for(int i=25;i<30;i++)
			{				
				
				if(details[i]==null)
					details[i]="false";
			}
			PreparedStatement ps=cn.prepareStatement(q);
		    for(int i=0;i<34;i++)
			{   
			if((i!=21)&&(i!=22))
			{
				ps.setString(i+1, details[i]);
			}
			else
			{
				File fin = new File(details[i]);
		         FileInputStream inputStream = new FileInputStream(fin);
		         ps.setBinaryStream(i+1, (InputStream) inputStream, (int)(fin.length()));
		         pw.println(details[i]);
			}
			}
			ps.executeUpdate();
			GenPDF.generate(details);
			String s="This mail contains the attatchment of your Application Form.\nSubmit this form with appropriate copy of documents at the nearest branch for verification.\nYou will be notified when your account is created.";
			SendMail2.send(details[5], "Account Creation Application", s);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
