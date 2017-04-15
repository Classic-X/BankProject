

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

import p.DAO;

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
			DAO d=new DAO();
			cn=d.getConnection();	
			String p="select * from admin where id='"+id+"';";
			Statement smt=cn.createStatement();
			ResultSet rs=smt.executeQuery(p);
			String password="";
			while(rs.next()){password=rs.getString(2);}
		    if(password.equals(pass))
		    {  HttpSession session=request.getSession();
			   RequestDispatcher rd=request.getRequestDispatcher("AdminDashboard.jsp");
			   session.setAttribute("admin", id);
			   rd.include(request, response);   
		    }
		    else
		    {
		    	request.setAttribute("message","Wrong id or password.");
		    	RequestDispatcher rd=request.getRequestDispatcher("Homepage.html");			   
		    	rd.forward(request, response); 
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
			DAO d=new DAO();
			cn=d.getConnection();
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
		    	RequestDispatcher rd=request.getRequestDispatcher("AdminDashboard.jsp");			   
		    	request.setAttribute("message", "WRONG ADMIN ID OR PASSWORD");
		    	rd.forward(request, response);
		    }
	  }
		catch(Exception e){pw.print(e);}
		}
	}
}
