import java.sql.*;
import java.util.*;
public class connect
{
	//public static void establish()
	static Connection cc;
	static 
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			cc=DriverManager.getConnection("jdbc:mysql://localhost:3306/invis","scott","tiger");  
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static Connection getConnection()
	{
		return cc;
	}
}