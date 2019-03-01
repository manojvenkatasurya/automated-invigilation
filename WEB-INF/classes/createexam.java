import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class createexam extends HttpServlet
{
	public void doPost(HttpServletRequest sq,HttpServletResponse sr)throws ServletException,IOException
	{
		try
		{
			
		PrintWriter pw=sr.getWriter();
		HttpSession s=sq.getSession();
		pw.println((String)s.getAttribute("y_data")+"\t"+(String)s.getAttribute("y_dup")+"\t"+examsel.ver);
		String name=sq.getParameter("e-name");
		String temp=sq.getParameter("nd");
		int nd=Integer.parseInt(temp);
		s.setAttribute("nd",temp);
		s.setAttribute("ex-name",name);
		String st=sq.getParameter("st");
		String et=sq.getParameter("et");
		//temp=sq.getParameter("year");
		//int y=Integer.parseInt(temp);
		temp=sq.getParameter("in");
		int type=1;
		if(temp!=null)
		if(temp.equals("on"))
			type=2;
		//pw.println("data read ok");
		Connection cc=connect.getConnection();
		Statement stmt=cc.createStatement();
		ResultSet rs=stmt.executeQuery("select * from exam");
		rs.last();
		int nr=rs.getRow();
		nr++;
		PreparedStatement ps=cc.prepareStatement("insert ignore into exam values(?,?,?,?,?,?,?)");
		ps.setInt(1,nr);
		HttpSession se=sq.getSession();
		//temp=(String)se.getAttribute("y_dup");
		String temp1;
		int year=0;
		
		temp1=(String)se.getAttribute("1");
		if(temp1!=null)
		if(temp1.equals("false"))
			year=1;
		
		temp1=(String)se.getAttribute("2");
		if(temp1!=null)
		if(temp1.equals("false"))
			year=2;

		temp1=(String)se.getAttribute("3");
		if(temp1!=null)
		if(temp1.equals("false"))
			year=3;

		temp1=(String)se.getAttribute("4");
		if(temp1!=null)
		if(temp1.equals("false"))
			year=4;

		temp1=(String)se.getAttribute("5");
		if(temp1!=null)
		if(temp1.equals("false"))
			year=5;

		temp1=(String)se.getAttribute("6");
		if(temp1!=null)
		if(temp1.equals("false"))
			year=6;
		
		//int year=Integer.parseInt(temp);
									pw.println(temp+"\t"+year);
		se.setAttribute("e-name",name);
		ps.setString(2,name);
		ps.setInt(3,year);
		ps.setInt(4,type);
		ps.setInt(5,nd);
		ps.setString(6,st);
		ps.setString(7,et);
		ps.execute();
		Statement st1=cc.createStatement();
		ResultSet rs1=st1.executeQuery("select * from teacher");
		rs1.last();
		int not1;
		not1=rs1.getRow();
		s.setAttribute("tc",not1+"");
		RequestDispatcher rd=sq.getRequestDispatcher("examdetails.jsp");
		rd.forward(sq,sr);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}