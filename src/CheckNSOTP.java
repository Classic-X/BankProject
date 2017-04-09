import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/CheckNSOTP")
public class CheckNSOTP extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
		Connection cn=null;
		String OTP=request.getParameter("OTP");
		String mail=request.getParameter("mail");
		String q="select * from temp_verify where mail=?";
		String del="delete from temp_verify where mail=?";
		Date dNow=new Date();
		SimpleDateFormat ss=new SimpleDateFormat("dd-MM-yyyy kk:mm:ss");
		
		try
		{ 
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
			PreparedStatement ps=cn.prepareStatement(q);
			ps.setString(1, mail);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{  PreparedStatement ps1=cn.prepareStatement(del);
				Date nowdate = ss.parse(rs.getString(3)); 
			    dNow=ss.parse(ss.format(dNow));
	            long difference=dNow.getTime() - nowdate.getTime() ;
				if((rs.getInt(2)==Integer.parseInt(OTP))&&(difference<900000))
				{   
					ps1.setString(1, mail);
					ps1.executeUpdate();
					response.setContentType("text/html;charset=UTF-8");
			        response.getWriter().write('1');
				}
				else if((rs.getInt(2)!=Integer.parseInt(OTP))&&(difference<900000))
				{
					response.setContentType("text/html;charset=UTF-8");
			        response.getWriter().write('2');
				}
				else
				{
					ps1.setString(1, mail);
					ps1.executeUpdate();
					response.setContentType("text/html;charset=UTF-8");
			        response.getWriter().write('3');
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
