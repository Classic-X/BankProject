import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/SMailOTP")
public class SMailOTP extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String ALPHA_NUMERIC_STRING = "0123456789";
	//Function for random String generation
		public static String randomAlphaNumeric(int count) {
			StringBuilder builder = new StringBuilder();
			while (count-- != 0) {
			int character = (int)(Math.random()*ALPHA_NUMERIC_STRING.length());
			builder.append(ALPHA_NUMERIC_STRING.charAt(character));
			}
			return builder.toString();
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Connection cn=null;
		String sql="insert into temp_verify values(?,?,?)";
		String sub="CET Bank registration OTP";
		String user="willrobin@gmail.com";
		String password="petervsock";
		String message="Your One Time Password is ",to=request.getParameter("mail2");
		Date dd=new Date();
		SimpleDateFormat ss=new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		try
		{
			String code=randomAlphaNumeric(6);
			message=message+code;
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank?useSSL=false","root","petervsock");
				PreparedStatement as=cn.prepareStatement(sql);
				SendMail.send(to,sub,message);
				as.setString(1,to);
				as.setString(2,code);
				as.setString(3, ss.format(dd));
				as.executeUpdate();
			}
			catch(Exception e)
		{
			e.printStackTrace();
		}
		}

}
