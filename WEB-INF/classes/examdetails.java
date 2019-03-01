import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class examdetails extends HttpServlet
{
	public void doPost(HttpServletRequest sq,HttpServletResponse sr)throws ServletException,IOException
	{
		PrintWriter pw=sr.getWriter();
		Connection cc=connect.getConnection();
		HttpSession s=sq.getSession();
		pw.println("connection created");
		String temp=(String)s.getAttribute("nd");
		int nd=Integer.parseInt(temp);
		String nt="";
		String d="";
		String m="";
		String y="";
		String date="";
		for(int i=0;i<nd;i++)
		{
			pw.println("in loop"+(i+1));
			nt=sq.getParameter("nt"+(i+1));
			d=sq.getParameter("day"+(i+1));
			m=sq.getParameter("month"+(i+1));
			y=sq.getParameter("year"+(i+1));
			date=d+"/"+m+"/"+y;
			try
			{
				PreparedStatement ps1=cc.prepareStatement("insert ignore into exam_data values(?,?,?,?,?)");
				PreparedStatement ps2=cc.prepareStatement("insert ignore into exam_dup values(?,?,?,?,?)");
				pw.println("statements created");
				ps1.setString(1,(String)s.getAttribute("e-name"));
				String temp1;
				int year=0;
			
				temp1=(String)s.getAttribute("1");
				if(temp1!=null)
					if(temp1.equals("false"))
						year=1;
		
				temp1=(String)s.getAttribute("2");
				if(temp1!=null)
					if(temp1.equals("false"))
						year=2;

				temp1=(String)s.getAttribute("3");
				if(temp1!=null)
					if(temp1.equals("false"))
						year=3;

				temp1=(String)s.getAttribute("4");
				if(temp1!=null)
					if(temp1.equals("false"))
						year=4;

				temp1=(String)s.getAttribute("5");
				if(temp1!=null)
					if(temp1.equals("false"))
						year=5;

				temp1=(String)s.getAttribute("6");
				if(temp1!=null)
					if(temp1.equals("false"))
						year=6;
					
					
				ps1.setInt(2,year);
				ps1.setString(3,date);
				pw.println(date+"\t"+date.length()+nt+"\n");
				ps1.setInt(4,Integer.parseInt(nt));
				ps1.setInt(5,0);
				ps1.execute();
				pw.println("data inserted");
				ps2.setString(1,(String)s.getAttribute("e-name"));
				
				
				
				//String temp1=(String)s.getAttribute("exam_name");
				//Statement ps3=cc.createStatement();
				//ResultSet rs3=ps3.executeQuery("select * from teacher where exam_name='"+temp1+"'");
				//rs3.next();
				//int year=(rs3.getInt("year"));
				ps2.setInt(2,year);
				ps2.setString(3,date);
				ps2.setInt(4,Integer.parseInt(nt));
				ps2.setInt(5,0);
				ps2.execute();
				pw.println("data inserted");
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		try{
			
				RequestDispatcher rs=sq.getRequestDispatcher("exam_sel");
				rs.forward(sq,sr);
				pw.println(rs);
		}catch(Exception e){e.printStackTrace();}
	}
}
