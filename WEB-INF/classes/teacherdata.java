import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class teacherdata extends HttpServlet
{
	public void doGet(HttpServletRequest sq,HttpServletResponse sr) throws ServletException,IOException
	{
		try
		{
		Connection cc=connect.getConnection();
		Statement st=cc.createStatement();
		ResultSet rs=st.executeQuery("select * from teacher");
		HttpSession s=sq.getSession();
		String name1="teacher",name2="admin";
		String valid=(String)s.getAttribute("login");
		if(valid!=null)
		{
			if(valid.equals(name1))
			{
				s.setAttribute("trs",rs);
				RequestDispatcher rd=sq.getRequestDispatcher("view.jsp");
				rd.forward(sq,sr);
			}
			else if(valid.equals(name2))
			{
				s.setAttribute("trs",rs);
				RequestDispatcher rd=sq.getRequestDispatcher("view.jsp");
				rd.forward(sq,sr);
			}
			else
			{
				RequestDispatcher rd=sq.getRequestDispatcher("index.jsp");
				rd.forward(sq,sr);	
			}
		}
		else
		{
			RequestDispatcher rd=sq.getRequestDispatcher("index.jsp");
			rd.forward(sq,sr);

		}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}