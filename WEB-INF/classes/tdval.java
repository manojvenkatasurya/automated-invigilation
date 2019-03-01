import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class tdval extends HttpServlet 
{
	public void doGet(HttpServletRequest sq,HttpServletResponse sr)throws ServletException,IOException
	{
		String err="";
		boolean flag=false;
		try
		{
			Connection cc=connect.getConnection();
			Statement stt=cc.createStatement();
			ResultSet rst=stt.executeQuery("select * from teacher");
			while(rst.next())
			{
				
				Statement sttd=cc.createStatement();
				ResultSet rstd=sttd.executeQuery("select * from teacher_data where emp_id='"+rst.getString("emp_id")+"'");
				if(rstd.next()==false)
				{
					flag=true;
					err+=","+rst.getString("name");
				}
				else
				{
					
				rstd.last();
				int count=rstd.getRow();
				rstd.beforeFirst();
				if(count!=6)
				{
					err+=","+rst.getString("name");
					flag=true;
				}
				}
			}
				if(flag)
				{
					HttpSession s=sq.getSession();
					s.setAttribute("err",err);
					RequestDispatcher rd=sq.getRequestDispatcher("errorack.jsp");
					rd.forward(sq,sr);
				}
				else
				{
					RequestDispatcher rd=sq.getRequestDispatcher("selyear.jsp");
					rd.forward(sq,sr);
				}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}