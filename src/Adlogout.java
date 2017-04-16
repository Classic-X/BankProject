import java.io.IOException;  
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;
@WebServlet("/Adlogout")
public class Adlogout extends HttpServlet {  
        protected void doPost(HttpServletRequest request, HttpServletResponse response)  
                                throws ServletException, IOException { 
        	try{
            response.setContentType("text/html");  
            PrintWriter out=response.getWriter();  
            HttpSession session=request.getSession();  
            session.invalidate(); 
            out.print("<h5 align=center>You are successfully logged out!<h5><meta http-equiv='refresh' content='3;url=Homepage.html'>");   
            out.close();  
        	}
        	catch(Exception e)
        	{
        		e.printStackTrace();
        	}
    }  
} 