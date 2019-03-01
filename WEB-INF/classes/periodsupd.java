import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class periodsupd extends HttpServlet 
{
	public void doPost(HttpServletRequest sq,HttpServletResponse sr)throws ServletException,IOException
	{
		try
		{
			HttpSession s=sq.getSession();
			int np=Integer.parseInt((String)s.getAttribute("nop"));
			Connection cc=connect.getConnection();
			Statement stmt=cc.createStatement();
			ResultSet rs=stmt.executeQuery("select * from periods");
			rs.last();
			int onp=rs.getRow();
			//s.getAttribute("nop")
			if(onp>0)
			{
				onp++;
				for(int i=1;i<=onp;i++)
				{
					String st=sq.getParameter("st"+i);
					String et=sq.getParameter("et"+i);
					stmt.executeUpdate("update periods set start_time='"+st+"' where p_name='period "+i+"'");
					stmt.executeUpdate("update periods set end_time='"+et+"' where p_name='period "+i+"'");
				}
			}
			else
			{
				for(int i=1;i<=onp;i++)
				{
					String st=sq.getParameter("st"+i);
					String et=sq.getParameter("et"+i);
					PreparedStatement ps=cc.prepareStatement("insert ignore into periods values(?,?,?)");
					ps.setString(1,"period "+i);
					ps.setString(2,st);
					ps.setString(3,et);
					ps.execute();
				}
			}
			RequestDispatcher rd=sq.getRequestDispatcher("plast.html");
			rd.forward(sq,sr);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}