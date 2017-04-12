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
@WebServlet("/Verify")
public class Verify extends HttpServlet {
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

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection cn=null;
		int f=-1;
		response.setContentType("text/html");
		String to=request.getParameter("a2");
		PrintWriter p=response.getWriter();
		String q2="select * from client_personal_details where ";	
		String q1="select * from temp_regd where mail=?";
		String q="select * from temp_verify where mail=?";
		String sql="insert into temp_verify values(?,?,?)";
		String updt="update temp_verify set code=?,date=? where mail=?";
		String sub="CET Bank registration OTP";
		String message="Your One Time Password is ";
		int t=7; Boolean get=false;
		Date dd=new Date();
		SimpleDateFormat ss=new SimpleDateFormat("dd-MM-yyyy kk:mm:ss");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
			if(request.getParameter("a1").equals("email"))
			{
			   q2+="mail=?;";
			   t=7;
			}
			else if(request.getParameter("a1").equals("text"))
			{
				q2+="customer_id=?";
				t=1;
			}
			PreparedStatement ps=cn.prepareStatement(q);
			PreparedStatement ps1=cn.prepareStatement(q1);
			PreparedStatement ps2=cn.prepareStatement(q2);
			ps.setString(1, to);
			ps1.setString(1, to);
			ps2.setString(1, to);
			ResultSet rs=ps.executeQuery();
			ResultSet rs1=ps1.executeQuery();
			ResultSet rs2=ps2.executeQuery();
			if(rs2.next())
			{   
				if(rs.next())	
				{	
					 if(rs.getString(1).equals(to))
						{  //If an otp has been sent previously
							String code=Verify.randomAlphaNumeric(6);
							message=message+code;
							get=SendMail.send(to,sub, message);
							if(get)
							{
							PreparedStatement ps4=cn.prepareStatement(updt);
							HttpSession session=request.getSession();
							ps4.setString(1, code);
							ps4.setString(2, ss.format(dd));
							ps4.setString(3, to);
							ps4.executeUpdate();
							f=1;
							RequestDispatcher rd=request.getRequestDispatcher("verify.html");
							p.print("<html><body onload='myFunction();loadDoc();'></body><html>");
							session.setAttribute("mail", rs2.getString(7));
							rd.include(request, response);
							}
							else
							{
								RequestDispatcher rd=request.getRequestDispatcher("verify.html");
								rd.include(request, response);
								p.print("Connection Timed Out");
							}
						}
				}	
				else if(rs2.getString(t).equals(to))
				{  //If Customer have an account previously.
					String code=Verify.randomAlphaNumeric(6);
					message=message+code;
					get=SendMail.send(to,sub, message);
					if(get)
					{
					PreparedStatement ps3=cn.prepareStatement(sql);
					HttpSession session=request.getSession();
					ps3.setString(1, to);
					ps3.setString(2, code);
					ps3.setString(3, ss.format(dd));
					ps3.executeUpdate();
					f=0;
					RequestDispatcher rd=request.getRequestDispatcher("verify.html");
					session.setAttribute("mail", rs2.getString(7));
					p.print("<html><body onload='loadDoc()'></body><html>");
					rd.include(request, response);
					p.print(f+"You are registered with us wit the Customer ID : "+rs2.getString(1)+"\n We have send you an OTP for a new account");
				    } 
					else
					{
						RequestDispatcher rd=request.getRequestDispatcher("verify.html");
						rd.include(request, response);
						p.print("Connection Timed Out");
					}
				}
			}		
				else if(rs.next())	
				{
					 if(rs.getString(1).equals(to))
						{  //If an otp has been sent previously
							String code=Verify.randomAlphaNumeric(6);
							message=message+code;
							get=SendMail.send(to,sub, message);
							if(get)
							{
							HttpSession session=request.getSession();
							PreparedStatement ps4=cn.prepareStatement(updt);
							ps4.setString(1, code);
							ps4.setString(2, ss.format(dd));
							ps4.setString(3, to);
							ps4.executeUpdate();
							RequestDispatcher rd=request.getRequestDispatcher("verify.html");
							session.setAttribute("mail", to);
							p.print("<html><body onload='loadDoc()'></body></body><html>");
							rd.include(request, response);
							}
							else
							{
								RequestDispatcher rd=request.getRequestDispatcher("verify.html");
								rd.include(request, response);
								p.print("Connection Timed Out");
							}
						}
				}		
			else if(rs1.next())	
			{
				if(rs1.getString(6).equals(to))
				{  //If customer alredy filled the form.
					p.print("You have already registered go to the Bank and make documents Verified");
				}
			}
			else
			{  
				if(t==1)
				{
					RequestDispatcher rd=request.getRequestDispatcher("verify.html");
					p.print("<h4 align=center>You are not a previous customer with Us Please Give the Mail Id</h4>");
					rd.include(request, response);
				}
				else
				{
				String code=Verify.randomAlphaNumeric(6);
				message=message+code;
				get=SendMail.send(to,sub, message);
				if(get)
				{
				HttpSession session=request.getSession();
				PreparedStatement ps3=cn.prepareStatement(sql);
				ps3.setString(1, to);
				ps3.setString(2, code);
				ps3.setString(3, ss.format(dd));
				ps3.executeUpdate();
				RequestDispatcher rd=request.getRequestDispatcher("verify.html");
				session.setAttribute("mail", to);
				p.print("<html><body onload='loadDoc()'></body><html>");
				rd.include(request, response);
				}
				else
				{
					RequestDispatcher rd=request.getRequestDispatcher("verify.html");
					rd.include(request, response);
					p.print("Connection Timed Out");
				}
				}
			}	
				
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
