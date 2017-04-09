

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Delete")
public class Delete extends HttpServlet { 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		HttpSession session=request.getSession(false);
		String accno=(String)session.getAttribute("accno");
		session.invalidate();
		response.setContentType("text/html");
		pw.print("<html><head><title>Create an Account</title></head><body>");  
		Connection cn=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
		
			String r="select * from client_account_details where accno='"+accno+"';";
			String custid="";
			float bal=0;
			Statement smt=cn.createStatement();
			ResultSet rs=smt.executeQuery(r);
			while(rs.next()){ custid=rs.getString(2); bal=rs.getFloat(5);}
			r="select * from client_personal_details where customer_id='"+custid+"';";
			rs=smt.executeQuery(r);
			String email="";
			while(rs.next()){ email=rs.getString("mail");}
			r="delete from client_account_details where accno='"+accno+"';";
			PreparedStatement ps=cn.prepareStatement(r);
			int a1=ps.executeUpdate();
			r="select * from client_account_details where customer_id='"+custid+"';";
			rs=smt.executeQuery(r);
			int c=0;
			while(rs.next()){c++;}
			if(c==0)
			{
				r="delete from client_personal_details where customer_id='"+custid+"';";
				ps=cn.prepareStatement(r);
				ps.executeUpdate();
			}
			if(a1>0)
			{
				pw.print("Account with Account Number "+accno+" deleted Successfully");
				pw.print("<br><form action='cheque' method='post'><input type='hidden' value='"+bal+"' name='balance'><input type='submit' value='Print Balance Cheque'></form>");
				String message="Your Account with Account no. "+accno+" has been deleted.";
				if(c==0) message+="\nIt was nice having you as our Customer. You had been a valuable Customer. We will be happy to provide you our services in near future.";
				message+="Thank You!";
					String subject="Bank Account Deletion!";
					String to=email;
					SendMail.send(to,subject,message);
			}
		}
			catch(Exception e){pw.print(e); e.printStackTrace();}
		pw.print("</body></html>");
		
	}

}
