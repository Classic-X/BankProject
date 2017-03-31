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
import javax.servlet.http.HttpSession;

@WebServlet("/CheckOTP")
public class CheckOTP extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
		Connection cn=null;
		String OTP=request.getParameter("OTP");
		HttpSession session=request.getSession(false);
		String mail=(String)session.getAttribute("mail");
		PrintWriter p=response.getWriter();
		String q="select * from temp_verify where mail=?";
		String del="delete from temp_verify where mail=?";
		Date dNow=new Date();
		SimpleDateFormat ss=new SimpleDateFormat("dd-MM-yyyy kk:mm:ss");
		
		try
		{ 
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","ANUJ");
			PreparedStatement ps=cn.prepareStatement(q);
			ps.setString(1, mail);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{  
				if(rs.getInt(2)==Integer.parseInt(OTP))
				{   
					PreparedStatement ps1=cn.prepareStatement(del);
					ps1.setString(1, mail);
					ps1.executeUpdate();
					Date nowdate = ss.parse(rs.getString(3)); 
				    dNow=ss.parse(ss.format(dNow));
		            long difference=dNow.getTime() - nowdate.getTime() ;
					if(difference>60000)
					{
						request.getRequestDispatcher("verify.html").forward(request,response);
						p.println("Session timed Out Request OTP again.");
					}
					else
					{
					request.getRequestDispatcher("reg.jsp").forward(request,response);
					session.setAttribute("mail", mail);
					}
				}
				else
				{
					p.print("Wrong OTP Enter the right one within 10 minutes.");
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
