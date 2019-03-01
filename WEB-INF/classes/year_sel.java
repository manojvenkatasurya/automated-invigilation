import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class year_sel extends HttpServlet
{
	public void doPost(HttpServletRequest sq,HttpServletResponse sr) throws ServletException,IOException
	{
		try
		{
		Connection cc=connect.getConnection();
		Statement st=cc.createStatement();
		st.executeUpdate("delete from exam");
		st.executeUpdate("delete from exam_data");
		st.executeUpdate("delete from exam_dup");
		st.executeUpdate("delete from allocation");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		boolean flag=false;
		HttpSession s=sq.getSession();
		String b1=sq.getParameter("1");
		String b2=sq.getParameter("2");
		String b3=sq.getParameter("3");
		String b4=sq.getParameter("4");
		String mt=sq.getParameter("5");
		String mc=sq.getParameter("6");
		//PrintWriter pw=sr.getWriter();
		//pw.println(b1+b2+b3+b4+mt+mc);
		if(b1!=null)
			if(b1.equals("on"))
			{
				s.setAttribute("1","true");
				flag=true;
			}
		if(b2!=null)
			if(b2.equals("on"))
			{
				s.setAttribute("2","true");
				flag=true;
			}
		if(b3!=null)
			if(b3.equals("on"))
			{
				s.setAttribute("3","true");
				flag=true;
			}
		if(b4!=null)
			if(b4.equals("on"))
			{
				s.setAttribute("4","true");
				flag=true;
			}
		if(mt!=null)
			if(mt.equals("on"))
			{
				s.setAttribute("5","true");
				flag=true;
			}
		if(mc!=null)
			if(mc.equals("on"))
			{
				s.setAttribute("6","true");
				flag=true;
			}
		if(flag==false)
		{
			s.setAttribute("y_data","nodata");
			RequestDispatcher rd=sq.getRequestDispatcher("selyear.jsp");
			rd.forward(sq,sr);
		}
		else
		{
			RequestDispatcher rd=sq.getRequestDispatcher("exam_sel");
			rd.forward(sq,sr);
		}
	}
}