import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class periods extends HttpServlet 
{
	public void doPost(HttpServletRequest sq,HttpServletResponse sr)throws ServletException,IOException
	{
		try
		{
			int np=Integer.parseInt(sq.getParameter("nop"));
			HttpSession s=sq.getSession();
			Connection cc=connect.getConnection();
			Statement st=cc.createStatement();
			ResultSet rs=st.executeQuery("select * from periods");
			rs.last();
			int onp=rs.getRow();
			//onp++;
			if(np==onp)
				s.setAttribute("nop",np+"");
			else
			{
				s.setAttribute("nop",np+"");
				Statement str=cc.createStatement();
				ResultSet rsr=st.executeQuery("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA='test' and table_name='teacher_data'");
				if(rsr.next())
					st.executeUpdate("drop table teacher_data");
				String tab="create table teacher_data(emp_id varchar(50),day int(10)";
				for(int i=1;i<=np;i++)
					tab+=",p"+i+" varchar(3)";
				tab+=")";
				st.executeUpdate(tab);
			}
			RequestDispatcher rd=sq.getRequestDispatcher("perioddetails.jsp");
			rd.forward(sq,sr);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}