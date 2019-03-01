import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class createteacher extends HttpServlet
{
	//public static void c_teacher()
	public void doPost(HttpServletRequest sq,HttpServletResponse sr) throws ServletException,IOException
	{
		try
		{
			String id=sq.getParameter("empid");
			String name=sq.getParameter("name");
			int count=0;
			int designation=0;
			String desig=sq.getParameter("design");
			if(desig!=null)
			if(desig.equals("on"))
				designation=1;
			//int designation=Integer.parseInt(sq.getParameter("design"));
			String email=sq.getParameter("email");
			String cno=sq.getParameter("num");
			Connection cc=connect.getConnection();
			Statement st=cc.createStatement();
			PrintWriter pw=sr.getWriter();
			pw.println(id+"\t"+name+"\t"+designation+"\t"+email+"\t"+cno+"\t"+cc+st);
			PreparedStatement ps=cc.prepareStatement("insert ignore into teacher values(?,?,?,?,?,?,?)");
			pw.println("insert ignoreing");
			ps.setString(1,id);
			pw.println("insert ignoreing");
			ps.setString(2,name);
			pw.println("insert ignoreing");
			ps.setInt(3,count);
			pw.println("insert ignoreing");
			ps.setInt(4,designation);
			pw.println("insert ignoreing");
			ps.setString(5,email);
			pw.println("insert ignoreing");
			ps.setString(6,cno);
			pw.println("insert ignoreing");
			ps.setInt(7,0);
			ps.execute();
			pw.println("insert ignoreed");
			HttpSession s=sq.getSession();
			pw.println("got session");
			s.setAttribute("data","true");
			s.setAttribute("empid",id);
			s.setAttribute("nd","1");
			pw.println("set attributes");
			ResultSet rs=st.executeQuery("select * from periods");
			rs.last();
			int np=rs.getRow();
			s.setAttribute("nop",np+"");
			RequestDispatcher rd=sq.getRequestDispatcher("schedule.jsp");
			rd.forward(sq,sr);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}