

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
import p.*;

/**
 * Servlet implementation class ResetPassword
 */
@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String mail=CheckPassword.mail;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String password=request.getParameter("pass");
		PrintWriter pw=response.getWriter();
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con;
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
			
			pw.println(mail);
			String sql3="update netbanking_active set password=? where email=?";
			String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
			hashed = BCrypt.hashpw(password, BCrypt.gensalt(12));
        	PreparedStatement ps3=con.prepareStatement(sql3);
			ps3.setString(1,hashed);
			ps3.setString(2, mail);
			ps3.executeUpdate();
			
			String sql2="delete from forgot_password where mail = ? ";
			PreparedStatement ps2=con.prepareStatement(sql2);
			ps2.setString(1,mail);
			ps2.executeUpdate();
			
			
		}catch(Exception e)
		{
			
		}
		
		
	}

	

}
