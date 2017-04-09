

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ResetPassword
 */
@WebServlet("/check")
public class CheckPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String mail=null;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url=request.getQueryString();
		String query=url.substring(url.lastIndexOf("=") + 1);
		String date="";
		SimpleDateFormat formatter = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy");
		response.setContentType("text/html");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con;
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
			
			Statement stmt1 = con.createStatement();
			ResultSet rs = stmt1.executeQuery("select * from forgot_password where token='"+query+"'");
			PrintWriter pw=response.getWriter();
			
			while(rs.next())
			{
				mail=rs.getString(1);
				date=rs.getString(3);
				
			}
			
			if(mail==null)
			{
				pw.println("<h3>The link has expired or was terminated by administrator</h3>");
				pw.print("<h3 style='color:black'>You will redirected to login page within 5 seconds</h3>");
	    		pw.print("<META HTTP-EQUIV='refresh' CONTENT='3;URL=hp.html'>");
			}
			
			else{
			Date nowdate = formatter.parse(date);  
			Date dNow = new Date( );
	        
	        long difference=dNow.getTime() - nowdate.getTime() ;
	        
	        response.setContentType("text/html");
	        
	        if(difference>90000000)
	        {
	        	pw.print("<br>The link has expired!!! Register again");
	        	String sql3="delete from forgot_password where token = ? ";
	        	PreparedStatement ps3=con.prepareStatement(sql3);
				ps3.setString(1,query);
				ps3.executeUpdate();
				pw.print("<h3 style='color:black'>You will redirected to login page within 5 seconds</h3>");
	    		pw.print("<META HTTP-EQUIV='refresh' CONTENT='5;URL=netbank.html'>");
	        }
	        else
	       {
	        	pw.print("<h3 style='color:black'>Redirecting to Reset Password</h3>");
	    		pw.print("<META HTTP-EQUIV='refresh' CONTENT='3;URL=changepassword.html'>");
	       }
	    
			}
			
		}catch(Exception e)
		{
			
		}
		
		
	}

	

}
