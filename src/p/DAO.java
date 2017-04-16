package p;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO{
	
	Connection cn=null;
	public DAO()
	{
		
	}
	public Connection getConnection()
	{
		try {
				Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
			return cn;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return cn;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			return cn;
		}
	}

}
