import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class update extends HttpServlet
{
	public void doPost(HttpServletRequest sq,HttpServletResponse sr)throws ServletException,IOException
	{
		String s=sq.getParameter("up");
		HttpSession se=sq.getSession();
		String ver=(String)se.getAttribute("login");
		if(s.equals("remove"))
		{
			try
			{
			Connection cc=connect.getConnection();
			Statement st=cc.createStatement();
			String id=(String)se.getAttribute("t_id");
			st.executeUpdate("delete from teacher where emp_id='"+id+"'");
			st.executeUpdate("delete from teacher_data where emp_id='"+id+"'");
			RequestDispatcher rd=sq.getRequestDispatcher("admin.jsp");
			rd.forward(sq,sr);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else if(s.equals("update"))
		{
			try
			{
			Connection cc=connect.getConnection();
			Statement st=cc.createStatement();
			String id=(String)se.getAttribute("t_id");
			//st.executeUpdate("delete from teacher where emp_id='"+id+"'");
			st.executeUpdate("delete from teacher_data where emp_id='"+id+"'");
			se.setAttribute("nd",1+"");
			se.setAttribute("data","true");
			se.setAttribute("empid",id);
			RequestDispatcher rd=sq.getRequestDispatcher("schedule.jsp");
			rd.forward(sq,sr);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
		else
		{
			if(ver.equals("admin"))
			{
				RequestDispatcher rd=sq.getRequestDispatcher("admin.jsp");
				rd.forward(sq,sr);
			}
			else if(ver.equals("teacher"))
			{
				RequestDispatcher rd=sq.getRequestDispatcher("teacher.jsp");
				rd.forward(sq,sr);
			}
		}
	}
}