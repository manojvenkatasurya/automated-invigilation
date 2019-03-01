import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class validate extends HttpServlet
{

	public void service(HttpServletRequest sq,HttpServletResponse sr) 
	{
		PrintWriter pw;
		try
		{
			//pw=sr.getWriter();
			//pw.println("in validate");
			//pw.println("driver loaded");
			Connection cc=connect.getConnection();
			//pw.println("connection established");
			Statement st=cc.createStatement();
			Statement st1=cc.createStatement();
			HttpSession s=sq.getSession();
			ResultSet rs1=st1.executeQuery("select * from periods");
			rs1.last();
			int np=rs1.getRow();
			np++;
			s.setAttribute("nop",np+"");
			String usr=sq.getParameter("username");
			String pswd=sq.getParameter("pass");
			//pw.println(cc+"\n");
			ResultSet rs=st.executeQuery("select * from validate where name='"+usr+"' and password='"+pswd+"'");
			//pw.println(rs);
			rs.last();
			int c=rs.getRow();
			rs.first();
			rs.previous();
			while(rs.next())
			{
				if(usr.equals("teacher"))
				{
					s=sq.getSession();
					s.setAttribute("login",usr);
					RequestDispatcher rd=sq.getRequestDispatcher("teacher.jsp");
					rd.forward(sq,sr);
				}
				else if(usr.equals("admin"))
				{
					s=sq.getSession();
					s.setMaxInactiveInterval(15*60);
					s.setAttribute("login",usr);
					RequestDispatcher rd=sq.getRequestDispatcher("admin.jsp");
					rd.forward(sq,sr);
				}
			}
			if(c==0)
			{
				s=sq.getSession();
				s.setAttribute("login",null);
				//pw.println("<center>user nameor password invalid");
				//pw.println("<a href="+"index.jsp></a><center>");
				RequestDispatcher rd=sq.getRequestDispatcher("index.jsp");
				rd.forward(sq,sr);
			}
		}
		catch(Exception e)
		{
			//pw.println(ex+"\n"+e);
			e.printStackTrace();
		}
	}
}