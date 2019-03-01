import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class reset extends HttpServlet
{
	public void doPost(HttpServletRequest sq,HttpServletResponse sr) throws ServletException,IOException
	{
		try
		{
			Connection c=connect.getConnection();
			Statement st=c.createStatement();
			st.executeUpdate("delete from exam");
			st.executeUpdate("delete from exam_data");
			st.executeUpdate("delete from exam_dup");
			st.executeUpdate("delete from allocation");
			st.executeUpdate("delete from records");
			/*st.executeUpdate("delete from periods");
			st.executeUpdate("delete from teacher");
			st.executeUpdate("delete from teacher_data");*/
			PreparedStatement ps=c.prepareStatement("update teacher set count="+0);
			ps.execute();
			ps.close();
			RequestDispatcher rd=sq.getRequestDispatcher("index.jsp");
			rd.forward(sq,sr);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}