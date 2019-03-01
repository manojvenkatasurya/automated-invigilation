import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.Calendar;
public class generatesch extends HttpServlet
{
	public void doPost(HttpServletRequest sq,HttpServletResponse sr) throws ServletException,IOException
	{
		PrintWriter pw=sr.getWriter();
		pw.println("please wait generating schedules for each teacher for given input<br>this may take a awhile");
		try
		{
		Connection cc=connect.getConnection();
		Statement stt=cc.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		Statement sttd=cc.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		Statement ste=cc.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		Statement sted=cc.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		Statement sttemp=cc.createStatement();
		ResultSet rse=ste.executeQuery("select * from exam");
		ResultSet rst=stt.executeQuery("select * from teacher");
		ResultSet rstd=sttd.executeQuery("select * from teacher_data");
		ResultSet rsed=sted.executeQuery("select * from exam_data");
		//System.out.println(rsed);
		//rsed.first();rsed.previous();
		while(rsed.next())
		{
			String date=rsed.getString(3);
			int day=getDay(date);
			int ch=rsed.getInt("checked");
			if(ch!=1)
			{
			PreparedStatement ps=cc.prepareStatement("update exam_data set checked=1 where date=?");
			//sttd.executeUpdate();
			ps.setString(1,date);
			ps.execute();
			ResultSet temp=sttemp.executeQuery("select * from exam_dup where date="+date);
			temp.last();
			int ne=temp.getRow();
			temp.first();temp.previous();
			if(ne==0)
			{
				int year=rsed.getInt(2);
				rstd.first();rstd.previous();
				//System.out.println(rstd);
				while(rstd.next())
				{
					PreparedStatement ins=cc.prepareStatement("insert ignore into exam_alloc values(?,?,?,?,?,?,?,?,?,?,?,?)");
					//System.out.println("statement created");
					ins.setString(1,date);
					String name=rstd.getString(1);
					ins.setString(2,name);
					ins.setString(12,rsed.getString("name"));
					String wday=rstd.getString("day");
					ins.setString(3,wday);
					int tp[]=new int[8];
					String p1=rstd.getString("p1"),p2=rstd.getString("p2"),p3=rstd.getString("p3"),p4=rstd.getString("p4"),p5=rstd.getString("p5"),p6=rstd.getString("p6"),p7=rstd.getString("p7"),p8=rstd.getString("p8");
					String tp1[]=p1.split(" ");
					int ty=Integer.parseInt(tp1[1]);
					if(ty==4)
						tp[0]=4;
					else
					{
						if(Integer.parseInt(tp1[0])==year)
							tp[0]=4;
						else
							tp[0]=ty;
					}
					ins.setInt(4,tp[0]);
					String tp2[]=p2.split(" ");
					ty=Integer.parseInt(tp2[1]);
					if(ty==4)
						tp[1]=4;
					else
					{
						if(Integer.parseInt(tp2[0])==year)
							tp[1]=4;
						else
							tp[1]=ty;
					}
					ins.setInt(5,tp[1]);
					String tp3[]=p3.split(" ");
					ty=Integer.parseInt(tp3[1]);
					if(ty==4)
						tp[2]=4;
					else
					{
						if(Integer.parseInt(tp3[0])==year)
							tp[2]=4;
						else
							tp[2]=ty;
					}
					ins.setInt(6,tp[2]);
					String tp4[]=p4.split(" ");
					ty=Integer.parseInt(tp4[1]);
					if(ty==4)
						tp[3]=4;
					else
					{
						if(Integer.parseInt(tp4[0])==year)
							tp[3]=4;
						else
							tp[3]=ty;
					}
					ins.setInt(7,tp[3]);
					String tp5[]=p5.split(" ");
					ty=Integer.parseInt(tp5[1]);
					if(ty==4)
						tp[4]=4;
					else
					{
						if(Integer.parseInt(tp5[0])==year)
							tp[4]=4;
						else
							tp[4]=ty;
					}
					ins.setInt(8,tp[4]);
					String tp6[]=p6.split(" ");
					ty=Integer.parseInt(tp6[1]);
					if(ty==4)
						tp[5]=4;
					else
					{
						if(Integer.parseInt(tp6[0])==year)
							tp[5]=4;
						else
							tp[5]=ty;
					}
					ins.setInt(9,tp[5]);
					String tp7[]=p7.split(" ");
					ty=Integer.parseInt(tp7[1]);
					if(ty==4)
						tp[6]=4;
					else
					{
						if(Integer.parseInt(tp7[0])==year)
							tp[6]=4;
						else
							tp[6]=ty;
					}
					ins.setInt(10,tp[6]);
					String tp8[]=p8.split(" ");
					//System.out.println(p8);
					ty=Integer.parseInt(tp8[1]);
					if(ty==4)
						tp[7]=4;
					else
					{
						if(Integer.parseInt(tp8[0])==year)
							tp[7]=4;
						else
							tp[7]=ty;
					}
					ins.setInt(11,tp[7]);
					ins.execute();
				}
				temp.close();
			}
			else
			{
				//System.out.println(rstd+"\telse\t"+ne);
				while(temp.next())
				{
					//temp.next();
					int year=temp.getInt(2);
					rstd.first();rstd.previous();
					while(rstd.next())
					{
						PreparedStatement ins=cc.prepareStatement("insert ignore into exam_alloc values(?,?,?,?,?,?,?,?,?,?)");
						//System.out.println("statement created");
						ins.setString(1,date);
						String name=rstd.getString(2);
						ins.setString(2,name);
						int tp[]=new int[8];
						//String p1=rstd.getString(p1),p2=rstd.getString(p2),p3=rstd.getString(p3),p4=rstd.getString(p4),p5=rstd.getString(p5),p6=rstd.getString(p6),p7=rstd.getString(p7),p8=rstd.getString(p8);
						String p1=rstd.getString("p1"),p2=rstd.getString("p2"),p3=rstd.getString("p3"),p4=rstd.getString("p4"),p5=rstd.getString("p5"),p6=rstd.getString("p6"),p7=rstd.getString("p7"),p8=rstd.getString("p8");
						String tp1[]=p1.split(" ");
						int ty=Integer.parseInt(tp1[1]);
						if(ty==4)
							tp[0]=4;
						else
						{
							if(Integer.parseInt(tp1[0])==year)
								tp[0]=4;
							else
								tp[0]=ty;
						}
						ins.setInt(3,tp[0]);
						String tp2[]=p2.split(" ");
						ty=Integer.parseInt(tp2[1]);
						if(ty==4)
							tp[1]=4;
						else
						{
							if(Integer.parseInt(tp2[0])==year)
								tp[1]=4;
							else
								tp[1]=ty;
						}
						ins.setInt(4,tp[1]);
						String tp3[]=p3.split(" ");
						ty=Integer.parseInt(tp3[1]);
						if(ty==4)
							tp[2]=4;
						else
						{
							if(Integer.parseInt(tp3[0])==year)
								tp[2]=4;
							else
								tp[2]=ty;
						}
						ins.setInt(5,tp[2]);
						String tp4[]=p4.split(" ");
						ty=Integer.parseInt(tp4[1]);
						if(ty==4)
							tp[3]=4;
						else
						{
							if(Integer.parseInt(tp4[0])==year)
								tp[3]=4;
							else
								tp[3]=ty;
						}
						ins.setInt(6,tp[3]);
						String tp5[]=p5.split(" ");
						ty=Integer.parseInt(tp5[1]);
						if(ty==4)
							tp[4]=4;
						else
						{
							if(Integer.parseInt(tp5[0])==year)
								tp[4]=4;
							else
								tp[4]=ty;
						}
						ins.setInt(7,tp[4]);
						String tp6[]=p6.split(" ");
						ty=Integer.parseInt(tp6[1]);
						if(ty==4)
							tp[5]=4;
						else
						{
							if(Integer.parseInt(tp6[0])==year)
								tp[5]=4;
							else
								tp[5]=ty;
						}
						ins.setInt(8,tp[5]);
						String tp7[]=p7.split(" ");
						ty=Integer.parseInt(tp7[1]);
						if(ty==4)
							tp[6]=4;
						else
						{
							if(Integer.parseInt(tp7[0])==year)
								tp[6]=4;
							else
								tp[6]=ty;
						}
						ins.setInt(9,tp[6]);
						String tp8[]=p8.split(" ");
						ty=Integer.parseInt(tp8[1]);
						if(ty==4)
							tp[7]=4;
						else
						{
							if(Integer.parseInt(tp8[0])==year)
								tp[7]=4;
							else
								tp[7]=ty;
						}
						ins.setInt(10,tp[7]);
						ins.execute();
					}
				}
			}
			
			}
		}
		rst.close();
		rstd.close();
		rsed.close();
		/*rs.last();
		int ned=rs.getRow();
		for(int i=0;i<ned;i++)
		{
			rs.start();
			for(int j=0;j<i;j++)
				rs.next();
			String s1=rs.getString(3);
			while(rs.next())
			{
				String temp=rs.getString(3);
				if(s1.equals(temp))
				{
					
				}
			}
		}*/
		}
		catch(Exception e)
		{e.printStackTrace();}
	}
	public static int getDay(String date)
	{
		String temp[]=date.split("/");
		//System.out.println(temp[0]+temp[1]+temp[2]);
		int day=Integer.parseInt(temp[0]);
		int month=Integer.parseInt(temp[1]);
		int year=Integer.parseInt(temp[2]);
		//SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		//java.util.Date d;
		Calendar c=Calendar.getInstance();
		c.set(year,month,day);
		return c.get(Calendar.DAY_OF_WEEK)-1;
    }
	/*public static void main(String arg[])
	{
		generate();
	}*/
}