import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class interprint extends HttpServlet
{
	public void doPost(HttpServletRequest sq,HttpServletResponse sr) throws ServletException,IOException
	{
		try
		{
			PrintWriter pw=sr.getWriter();
			pw.println("connect");
			Connection cc=connect.getConnection();
			HttpSession s=sq.getSession();
			String name=sq.getParameter("vf");
			s.setAttribute("rvf",name);
			String rdate=sq.getParameter("date");
			s.setAttribute("rdate",rdate);
			String racy=sq.getParameter("acy");
			s.setAttribute("racy",racy);
			String rcs=sq.getParameter("cs");
			s.setAttribute("rcs",rcs);
			String rname=sq.getParameter("name");
			Statement st1=cc.createStatement();
			ResultSet rs1=st1.executeQuery("select * from exam_data where name='"+name+"'");
			pw.println("st1");
			s.setAttribute("examdata",rs1);
			Statement st2=cc.createStatement();
			ResultSet rs2=st2.executeQuery("select * from exam where exam_name='"+name+"'");
			pw.println("st2");
			rs2.next();
			String st,et;
			st=rs2.getString("start_time");
			et=rs2.getString("end_time");
			s.setAttribute("starttime",st);
			s.setAttribute("endtime",et);
			Statement st3=cc.createStatement();
			ResultSet rs3=st3.executeQuery("select * from allocation where e_name='"+name+"'");
			pw.println("st3");
			s.setAttribute("alloc",rs3);
			Statement st4=cc.createStatement();
			ResultSet rs4=st4.executeQuery("select distinct emp_id from allocation where e_name='"+name+"'");
			pw.println("st4");
			s.setAttribute("teacherdata",rs4);		
			Statement st5=cc.createStatement();
			s.setAttribute("stmt",st5);
			Statement st6=cc.createStatement();
			s.setAttribute("st6",st6);
			pw.println("st5");
			pw.println("<a href=print.jsp >print</a>");
			RequestDispatcher rd=sq.getRequestDispatcher("print.jsp");
			pw.println(rd);
			rd.forward(sq,sr);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}