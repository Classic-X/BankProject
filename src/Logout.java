import java.io.IOException;  
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;
@WebServlet("/Logout")
public class Logout extends HttpServlet {  
        protected void doGet(HttpServletRequest request, HttpServletResponse response)  
                                throws ServletException, IOException { 
        	try{
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
        	Date dNow=new Date();
        	SimpleDateFormat ss=new SimpleDateFormat("dd-MM-yyyy kk:mm:ss");
        	String s=(ss.format(dNow));
            response.setContentType("text/html");  
            PrintWriter out=response.getWriter();  
            HttpSession session=request.getSession();
            String user=(String)session.getAttribute("user");
            String val="update netbanking_active set status=0,date='"+s+"' where username='"+user+"';"; 
            Statement sm=cn.createStatement();
            sm.executeUpdate(val);
            request.getRequestDispatcher("netbank.html").include(request, response);  
            out.print("<h5 align=center>You are successfully logged out!<h5>");   
            session.invalidate(); 
            out.close();  
        	}
        	catch(Exception e)
        	{
        		e.printStackTrace();
        	}
    }  
} 