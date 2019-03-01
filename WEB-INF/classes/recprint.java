import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class recprint extends HttpServlet 
{
	public void doPost(HttpServletRequest sq,HttpServletResponse sr)throws ServletException,IOException
	{
		try
		{	
			HttpSession s=sq.getSession();
			String name=sq.getParameter("vf");
			s.setAttribute("rvf",name);
			String rdate=sq.getParameter("date");
			s.setAttribute("rdate",rdate);
			String racy=sq.getParameter("acy");
			s.setAttribute("racy",racy);
			String rcs=sq.getParameter("cs");
			s.setAttribute("rcs",rcs);
			Connection cc=connect.getConnection();
			Statement st=cc.createStatement();
			//st.executeUpdate("create view reprint select * from records where e_name='"+name+"'");
			String req=sq.getParameter("req");
			Statement stt1=cc.createStatement();
			Statement stt2=cc.createStatement();
			Statement stt3=cc.createStatement();
			s.setAttribute("stmt1",stt1);
			s.setAttribute("stmt2",stt2);
			s.setAttribute("stmt3",stt3);
			RequestDispatcher rd=sq.getRequestDispatcher("recprint.jsp");
			rd.forward(sq,sr);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}