
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


@WebServlet("/Verify2")
public class Verify2 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accno=request.getParameter("accno");
	    HttpSession session=request.getSession();
	    session.setAttribute("accno", accno);
	    PrintWriter pw=response.getWriter();
		Connection cn=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");	
			String p="select * from client_account_details where accno='"+accno+"';";
			Statement smt=cn.createStatement();
			ResultSet rs=smt.executeQuery(p);
			int c=0; while(rs.next()){c++;}
			if(c==0)
			{
				pw.print("The Account Doesn't Exist");
				session.invalidate();
			}
			else
			{
				session.setAttribute("servlet", "Delete");
		    	RequestDispatcher rd=request.getRequestDispatcher("Admin_bcknd/check.jsp");
		    	rd.forward(request, response);
			}
		}
		catch(Exception e){pw.print(e);}
	}

}
