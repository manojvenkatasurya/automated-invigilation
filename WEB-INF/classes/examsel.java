import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class examsel extends HttpServlet
{
	public static int ver=0;
	public void doPost(HttpServletRequest sq,HttpServletResponse sr) throws ServletException,IOException
	{
		PrintWriter pw=sr.getWriter();
		HttpSession s=sq.getSession();
		String b1=(String)s.getAttribute("1");
		String b2=(String)s.getAttribute("2");
		String b3=(String)s.getAttribute("3");
		String b4=(String)s.getAttribute("4");
		String mt=(String)s.getAttribute("5");
		String mc=(String)s.getAttribute("6");
		if(b1!=null)
		{
			if(b1.equals("true"))
			{
				s.setAttribute("y_dup","1");
				s.setAttribute("y_data","1");
				pw.println(s.getAttribute("y_data"));
				RequestDispatcher rd=sq.getRequestDispatcher("createexam.jsp");
				rd.forward(sq,sr);
			}
		}
		pw.println("out side 1");
		  if(b2!=null)
		{
			if(b2.equals("true"))
			{
				s.setAttribute("y_dup","2");
				s.setAttribute("y_data","2");
				RequestDispatcher rd=sq.getRequestDispatcher("createexam.jsp");
				rd.forward(sq,sr);
			}
		}
		  if(b3!=null)
		{
			if(b3.equals("true"))
			{
				s.setAttribute("y_dup","3");
				s.setAttribute("y_data","3");
				RequestDispatcher rd=sq.getRequestDispatcher("createexam.jsp");
				rd.forward(sq,sr);
			}
		}
		  if(b4!=null)
		{
			if(b4.equals("true"))
			{
				s.setAttribute("y_dup","4");
				pw.println("in 4");
				s.setAttribute("y_data","4");
				RequestDispatcher rd=sq.getRequestDispatcher("createexam.jsp");
				rd.forward(sq,sr);
			}
		}
		  if(mt!=null)
		{
			if(mt.equals("true"))
			{
				s.setAttribute("y_dup","5");
				s.setAttribute("y_data","5");
				RequestDispatcher rd=sq.getRequestDispatcher("createexam.jsp");
				rd.forward(sq,sr);
			}
		}
		  if(mc!=null)
		{
			if(mc.equals("true"))
			{
				s.setAttribute("y_dup","6");
				s.setAttribute("y_data","6");
				RequestDispatcher rd=sq.getRequestDispatcher("createexam.jsp");
				rd.forward(sq,sr);
			}
		}
			//generatesch.generate();
		RequestDispatcher rd=sq.getRequestDispatcher("generate_sch");
		rd.forward(sq,sr);
		//PrintWriter pw=sr.getWriter();
		//pw.println("data inserted");
	}
}