import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class viewsch extends HttpServlet
{
	public void doPost(HttpServletRequest sq,HttpServletResponse sr) throws ServletException,IOException
	{
		HttpSession s=sq.getSession();
		try
		{
		Connection cc=connect.getConnection();
		String v=(String)s.getAttribute("login");
		if(v!=null)
		{
			PrintWriter pw=sr.getWriter();
			String empid=sq.getParameter("vf");
			//pw.println(empid);
			Statement st=cc.createStatement();
			Statement st1=cc.createStatement();
			Statement st2=cc.createStatement();
			Statement st3=cc.createStatement();
			ResultSet rs=st.executeQuery("select * from teacher where emp_id='"+empid+"'");
			ResultSet rs1=st1.executeQuery("select * from teacher_data where emp_id='"+empid+"'");
			ResultSet rs2=st2.executeQuery("select * from allocation where emp_id='"+empid+"'");
			s.setAttribute("datars",rs1);
			s.setAttribute("ch",rs);
			s.setAttribute("fauc_alloc",rs2);
			rs.last();
			int l=rs.getRow();
			rs.first();
			rs.previous();
			rs1.last();
			int l1=rs1.getRow();
			rs1.first();
			rs1.previous();
			ResultSet rs3=st3.executeQuery("select * from periods");
			rs3.last();
			int np=rs3.getRow();
			s.setAttribute("nop",np+"");
			//pw.println("<a href="+"view2.jsp>"+l+"\t"+l1+""+st+""+st1+"continue</a>");
			RequestDispatcher rd=sq.getRequestDispatcher("view2.jsp");
			rd.forward(sq,sr);
		}
		else
		{
			s.invalidate();
			RequestDispatcher rd=sq.getRequestDispatcher("index.jsp");
			rd.forward(sq,sr);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}