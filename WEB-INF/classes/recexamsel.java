import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class recexamsel extends HttpServlet 
{
	public void doGet(HttpServletRequest sq,HttpServletResponse sr)throws ServletException,IOException
	{
		try
		{
		Connection cc=connect.getConnection();
		Statement st=cc.createStatement();
		ResultSet rs=st.executeQuery("select distinct e_name from records");
		HttpSession s=sq.getSession();
		s.setAttribute("recsel",rs);
		RequestDispatcher rd=sq.getRequestDispatcher("recexamsel.jsp");
		rd.forward(sq,sr);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}