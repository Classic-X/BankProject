

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CheckServlet")
public class CheckServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		String val=request.getParameter("val");
		if(val==null) val="s";
		PrintWriter pw=response.getWriter();
		if(val.equals("dashboard"))
		{
			Connection cn=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");	
			String p="select * from admin where id='"+id+"';";
			Statement smt=cn.createStatement();
			ResultSet rs=smt.executeQuery(p);
			String password="";
			while(rs.next()){password=rs.getString(2);}
		    if(password.equals(pass))
		    {
			   RequestDispatcher rd=request.getRequestDispatcher("AdminDashboard.html");
			   rd.include(request, response);   
		    }
		    else
		    {
		    	RequestDispatcher rd=request.getRequestDispatcher("AdminDashboard.html");			   
		    	pw.println("WRONG ADMIN ID OR PASSWORD");
		    	rd.include(request, response); 
		    }
		}
		catch(Exception e){pw.print(e);}
		}
		else
		{
		
	    HttpSession session=request.getSession(false);
	    String servlet=(String)session.getAttribute("servlet");
		Connection cn=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");	
			String p="select * from admin where id='"+id+"';";
			Statement smt=cn.createStatement();
			ResultSet rs=smt.executeQuery(p);
			String password="";
			while(rs.next()){password=rs.getString(2);}
		    if(password.equals(pass))
		    {
			   RequestDispatcher rd=request.getRequestDispatcher(servlet);
			   rd.include(request, response);   
		    }
		    else
		    {
		    	RequestDispatcher rd=request.getRequestDispatcher(servlet);			   
		    	pw.println("WRONG ADMIN ID OR PASSWORD");
		    	rd.include(request, response);
		    }
	  }
		catch(Exception e){pw.print(e);}
		}
	}
}
