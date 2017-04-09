

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
import javax.servlet.http.HttpSession;

@WebServlet("/Verify1")
public class Verify1 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String email=request.getParameter("email");
	    HttpSession session=request.getSession();
	    session.setAttribute("email", email);
	    PrintWriter pw=response.getWriter();
		Connection cn=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");	
			String p="select * from client_personal_details where mail='"+email+"';";
			Statement smt=cn.createStatement();
			ResultSet rs=smt.executeQuery(p); 
			int c=0; while(rs.next()){c++;}
		    if(c==0)
		    { 
		    	session.setAttribute("servlet", "Confirm2");
		    	RequestDispatcher rd=request.getRequestDispatcher("Admin_bcknd/check.jsp");
		    	rd.forward(request, response);
		    }
		    else
		    {
		    	session.setAttribute("servlet", "Confirm11");
		    	RequestDispatcher rd=request.getRequestDispatcher("Admin_bcknd/check.jsp");
		    	rd.forward(request, response);
		    }
		}
		catch(Exception e){pw.print(e);}
  }
}
