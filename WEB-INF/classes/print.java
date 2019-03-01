import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class print extends HttpServlet
{
	public void doPost(HttpServletRequest sq,HttpServletResponse sr) throws ServletException,IOException
	{
		try
		{
		Connection cc=connect.getConnection();
		PrintWriter pw=sr.getWriter();
		Statement sts=cc.createStatement();
		ResultSet rs=sts.executeQuery("select * from exam");
		rs.last();
		int ne=rs.getRow();
		rs.first();
		rs.previous();
		rs.next();
		String st=rs.getString("start_time");
		String et=rs.getString("end_time");
		Statement stt=cc.createStatement();
		pw.println("stt");
		//ResultSet rst=stt.executeQuery("select * from exam where start_time='"+stt+"' and end_time='"+et+"'");
		//rst.last();
		//int ne1=rst.getRow();
		//rst.close();
		HttpSession s=sq.getSession();
		if(ne==0)
		{
			Statement st1=cc.createStatement();
			ResultSet rs1=st1.executeQuery("select * from exam_data ");
			s.setAttribute("examdata",rs1);
			Statement st2=cc.createStatement();
			ResultSet rs2=st2.executeQuery("select * from exam ");
			rs2.next();
			String sttime,ettime;
			sttime=rs2.getString("start_time");
			ettime=rs2.getString("end_time");
			s.setAttribute("starttime",sttime);
			s.setAttribute("endtime",ettime);
			Statement st4=cc.createStatement();
			ResultSet rs4=st4.executeQuery("select distinct emp_id from allocation ");
			s.setAttribute("teacherdata",rs4);		
			Statement st5=cc.createStatement();
			s.setAttribute("stmt",st5);;
			//String e_type=(String)s.getAttribute("rvf");
			Statement st6=cc.createStatement();
			s.setAttribute("st6",st6);
			
			//s.setAttribute("e_type",ex);
			//pw.println("<a href=print.jsp target=_blank>click here for schedule</a>");
			s.setAttribute("print",1);
			RequestDispatcher rd=sq.getRequestDispatcher("print.jsp");
			rd.forward(sq,sr);
		}
		else
		{
			//rs.first();
			//rs.previous();
			//s.setAttribute("printrs",rs);
			//Statement strs=cc.createStatement();
			//ResultSet rsrs=strs.executeQuery("select * from allocation");
			//s.setAttribute("allocrs",rsrs);
			Statement st5=cc.createStatement();
			ResultSet rs5=st5.executeQuery("select * from exam");
			s.setAttribute("printrs",rs5);
			RequestDispatcher rd=sq.getRequestDispatcher("interprint.jsp");
			rd.forward(sq,sr);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}