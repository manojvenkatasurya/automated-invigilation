import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class daysschedule extends HttpServlet
{
	public void doPost(HttpServletRequest sq,HttpServletResponse sr) throws ServletException,IOException
	{
		HttpSession s=sq.getSession();
		String ver=(String)s.getAttribute("nd");
		String id=(String)s.getAttribute("empid");
		int nd=Integer.parseInt(ver);
		int np=Integer.parseInt((String)s.getAttribute("nop"));
			Connection cc=connect.getConnection();
			try
			{
			String p[]=new String[np+1];
			String y[]=new String[np+1];
			String ins="insert ignore into teacher_data values(?,?";
			for(int i=0;i<np;i++)
				ins+=",?";
			ins+=")";
			PreparedStatement ps=cc.prepareStatement(ins);
			PrintWriter pw=sr.getWriter();
			for(int i=1;i<=np;i++)
			{
				p[i]=sq.getParameter("p"+i);
				y[i]=sq.getParameter("y"+i);
				ps.setString(1,id);
				ps.setInt(2,nd);
				ps.setString(i+2,y[i]+" "+p[i]);
				pw.println("||"+(i+2)+y[i]+" "+p[i]);
			}
			ps.execute();
			s.setAttribute("vip",""+nd);
			nd++;
			s.setAttribute("vip",""+nd);		
			s.setAttribute("nd",""+nd);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		if(nd<=6)
		{
			try
			{
				
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
			RequestDispatcher rd=sq.getRequestDispatcher("last.html");
			rd.forward(sq,sr);
		}
	}
}