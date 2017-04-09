

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	
	public static String randomAlphaNumeric(int count) {
		StringBuilder builder = new StringBuilder();
		while (count-- != 0) {
		int character = (int)(Math.random()*ALPHA_NUMERIC_STRING.length());
		builder.append(ALPHA_NUMERIC_STRING.charAt(character));
		}
		return builder.toString();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cid=request.getParameter("cid");
		String mail=null;
		String token=ForgotPassword.randomAlphaNumeric(10);
		Date dNow = new Date( );
		String date=dNow.toString();
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con;
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select mail from client_personal_details where customer_id='"+cid+"'");
			if(rs.next()){//now on 1st row  
	              
				 mail=rs.getString(1);
			}
			
			if(mail==null)
			{
				pw.print("<div>You are not our customer</div>");
			}
			else
			{
				
				String sql2="delete from forgot_password where mail=?";
				PreparedStatement ps2=con.prepareStatement(sql2);
				ps2.setString(1,mail);
				ps2.executeUpdate();
					
				
				
			String sql="insert into forgot_password values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,mail);
			ps.setString(2,token);
			ps.setString(3,date);
			
			String to = mail;
			String subject = "Password Reset Mail";
	        String message = "Click on below link to reset you password.\nhttp://localhost:1235/InternetBanking/check?token=";
	        message=message+token;
	        message=message+"\nThe link will be alive for 15 minutes";
	        boolean check=SendMail.send(to,subject, message);
	       
			
	        if(check==true)
	        {
	        ps.executeUpdate();
	        pw.print("<div>A link has been sent to your mail</div>");
	        }
	        else
	        {
	        	pw.print("<div>There was a system malfunction! Please refresh the page and try again</div>");
	        }
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	
		}
	

}
