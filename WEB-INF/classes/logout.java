import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class logout extends HttpServlet
{
	public void doGet(HttpServletRequest sq,HttpServletResponse sr) throws ServletException,IOException
	{
		HttpSession s=sq.getSession();
		s.invalidate();
		RequestDispatcher rd=sq.getRequestDispatcher("index.jsp");
		rd.forward(sq,sr);
	}
}