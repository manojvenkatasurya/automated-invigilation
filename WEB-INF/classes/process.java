import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
public class process extends HttpServlet
{
	//public void doPost(HttpServletRequest sq,HttpServletResponse sr) throws ServletException,IOException
	Connection cc=connect.getConnection();
	public void generate()
	{
		try
		{
			Statement stt=cc.createStatement();
			Statement sttd=cc.createStatement();
			Statement ste=cc.createStatement();
			Statement sted=cc.createStatement();
			Statement stp=cc.createStatement();
			Statement sttemp=cc.createStatement();
			Statement sttemp1=cc.createStatement();
			ResultSet rst=stt.executeQuery("select * from teacher");
			ResultSet rstd=sttd.executeQuery("select * from teacher_data");
			ResultSet rse=ste.executeQuery("select * from exam");
			ResultSet rsed=sted.executeQuery("select * from exam_data");
			ResultSet rsp=stp.executeQuery("select * from periods");
			ResultSet rstemp,rstemp1;
			rsp.last();
			int np=rsp.getRow();
			rsp.first();
			rsp.previous();
			Period p[]=new Period[np+1];
			rst.last();
			int nt=rst.getRow();
			rst.first();
			rst.previous();
			Teacher t[]=new Teacher[nt+1];
			rst.close();
			for(int i=1;i<=np;i++)
			{
				rsp.next();
				String st=rsp.getString("start_time");
				String et=rsp.getString("end_time");
				p[i]=new Period(new TimeSlot(st),new TimeSlot(et));
			}
				Exam e[];
			while(rsed.next())
			{
				Statement stedt=cc.createStatement();
				ResultSet rsedt=stedt.executeQuery("select * from exam_data");
				/*for(int i=0;i<count;i++)
					rsedt.next();
				int test=rsedt.getInt("checked");
				stedt.close();
				rsedt.close();*/
				while(rsedt.next())
				if(rsedt.getInt("checked")==0)
				{
					break;
				}
					String date=rsedt.getString("date");
					rstemp=sttemp.executeQuery("select * from exam_dup where date='"+date+"'");
					int day=getDay(date);
					PreparedStatement ps=cc.prepareStatement("update exam_data set checked=1 where date='"+date+"'");
					ps.execute();
					rstemp.last();
					int nd=rstemp.getRow();
					int y[]=new int[nd];
					e=new Exam[nd+1];
					rstemp.first();
					rstemp.previous();
					for(int i=0;i<nd;i++)
					{
						rstemp.next();
						y[i]=rstemp.getInt("year");
					}
					rstemp.first();
					rstemp.previous();
					for(int i=1;i<=nd;i++)
					{
						rstemp.next();
						e[i]=new Exam();
						e[i].p=p;
						String en=rstemp.getString("name");
						rstemp1=sttemp1.executeQuery("select * from exam where exam_name='"+en+"'");
						rstemp1.next();
						String st=rstemp1.getString("start_time");
						String et=rstemp1.getString("end_time");
						e[i].st=new TimeSlot(st);
						e[i].et=new TimeSlot(et);
						e[i].rin=rstemp.getInt("nt");
						e[i].c=e[i].rin;
						e[i].allocate=new String[e[i].rin+1];
						e[i].name=en;
						e[i].date=rstemp.getString("date");
						e[i].eType=rstemp1.getInt("type");
						rstemp1.close();
					}
					rstemp.close();
					rstemp1=sttemp1.executeQuery("select * from teacher_data where day="+day);
					int ij=0;
					while(rstemp1.next())
					{
						ij++;
						String pp[]=new String[np+1];
						for(int kik=1;kik<=np;kik++)
						{
						pp[kik]=rstemp1.getString("p"+kik);	
						}
						/*
						String p2=rstemp1.getString("p2");
						String p3=rstemp1.getString("p3");
						String p4=rstemp1.getString("p4");
						String p5=rstemp1.getString("p5");
						String p6=rstemp1.getString("p6");
						String p7=rstemp1.getString("p7");
						String p8=rstemp1.getString("p8");*/
						String temp[];
						String tid=rstemp1.getString("emp_id");
						int yt1,yt2;
						rstemp=sttemp.executeQuery("select * from teacher where emp_id='"+tid+"'");
						rstemp.next();
						t[ij]=new Teacher();
						t[ij].id=tid;
						t[ij].desig=rstemp.getInt("designation");
						t[ij].fp=new int[9];
						t[ij].ecount=rstemp.getInt("count");
						t[ij].execount=rstemp.getInt("ec");
						rstemp.close();
						
						for(int kuk=1;kuk<=np;kuk++)
						{
						temp=pp[kuk].split(" ");
						yt1=Integer.parseInt(temp[0]);
						yt2=Integer.parseInt(temp[1]);
						if(Integer.parseInt(temp[1])==4)
								t[ij].fp[kuk]=4;
						else
						{
							for(int i=0;i<y.length;i++)
							{
								if(y[i]==yt1)
								{
									t[ij].fp[kuk]=4;
									break;
								}
								else
									t[ij].fp[kuk]=yt2;
							}
						}
						}
						/*temp=p2.split(" ");
						yt1=Integer.parseInt(temp[0]);
						yt2=Integer.parseInt(temp[1]);
						if(Integer.parseInt(temp[1])==4)
								t[ij].fp[2]=4;
						else
						{
							for(int i=0;i<y.length;i++)
							{
								if(y[i]==yt1)
								{
									t[ij].fp[2]=4;
									break;
								}
								else
									t[ij].fp[2]=yt2;
							}
						}
						temp=p3.split(" ");
						yt1=Integer.parseInt(temp[0]);
						yt2=Integer.parseInt(temp[1]);
						if(Integer.parseInt(temp[1])==4)
								t[ij].fp[3]=4;
						else
						{
							for(int i=0;i<y.length;i++)
							{
								if(y[i]==yt1)
								{
									t[ij].fp[3]=4;
									break;
								}
								else
									t[ij].fp[3]=yt2;
							}
						}
						temp=p4.split(" ");
						yt1=Integer.parseInt(temp[0]);
						yt2=Integer.parseInt(temp[1]);
						if(Integer.parseInt(temp[1])==4)
								t[ij].fp[4]=4;
						else
						{
							for(int i=0;i<y.length;i++)
							{
								if(y[i]==yt1)
								{
									t[ij].fp[4]=4;
									break;
								}
								else
									t[ij].fp[4]=yt2;
							}
						}
						temp=p5.split(" ");
						yt1=Integer.parseInt(temp[0]);
						yt2=Integer.parseInt(temp[1]);
						if(Integer.parseInt(temp[1])==4)
								t[ij].fp[5]=4;
						else
						{
							for(int i=0;i<y.length;i++)
							{
								if(y[i]==yt1)
								{
									t[ij].fp[5]=4;
									break;
								}
								else
									t[ij].fp[5]=yt2;
							}
						}
						temp=p6.split(" ");
						yt1=Integer.parseInt(temp[0]);
						yt2=Integer.parseInt(temp[1]);
						if(Integer.parseInt(temp[1])==4)
								t[ij].fp[6]=4;
						else
						{
							for(int i=0;i<y.length;i++)
							{
								if(y[i]==yt1)
								{
									t[ij].fp[6]=4;
									break;
								}
								else
									t[ij].fp[6]=yt2;
							}
						}
						temp=p7.split(" ");
						yt1=Integer.parseInt(temp[0]);
						yt2=Integer.parseInt(temp[1]);
						if(Integer.parseInt(temp[1])==4)
								t[ij].fp[7]=4;
						else
						{
							for(int i=0;i<y.length;i++)
							{
								if(y[i]==yt1)
								{
									t[ij].fp[7]=4;
									break;
								}
								else
									t[ij].fp[7]=yt2;
							}
						}
						temp=p8.split(" ");
						yt1=Integer.parseInt(temp[0]);
						yt2=Integer.parseInt(temp[1]);
						if(Integer.parseInt(temp[1])==4)
								t[ij].fp[8]=4;
						else
						{
							for(int i=0;i<y.length;i++)
							{
								if(y[i]==yt1)
								{
									t[ij].fp[8]=4;
									break;
								}
								else
									t[ij].fp[8]=yt2;
							}
						}*/
					}
					rstemp1.close();
					calculate(t,e,p);
					stedt.close();
					rsedt.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static int getDay(String date)
	{
		String temp[]=date.split("/");
		int day=Integer.parseInt(temp[0]);
		int month=Integer.parseInt(temp[1]);
		int year=Integer.parseInt(temp[2]);
		Calendar c=Calendar.getInstance();
		c.set(year,month,day);
		int f=c.get(Calendar.DAY_OF_WEEK);
		f-=3;
		if(f<0)
			f+=7;
		return f;
    }
	static int count1=0;
	public void calculate(Teacher teacher[],Exam e[],Period p[])
	{
		try
		{
		Teacher t[];
		int count=0;
		int ne=e.length-1;
		int nt=teacher.length-1;
		int np=p.length-1;
		count1++;
		for(int i=1;i<=ne;i++)
		{
			count=0;
			if(e[i].eType==1)
			t=e[i].getSorted(teacher);
			else
				t=e[i].exgetSorted(teacher);
			e[i].calculateExamPeriods(p);
			int sp=e[i].getStartPeriod(),ep=e[i].getEndPeriod();
			for(int j=1;j<=nt&&e[i].c>0;j++)
			{
				if(t[j].isFree(sp,ep)==(ep-sp+1)&&e[i].c>0)
				{
					if((e[i].eType==t[j].desig)||e[i].eType==2)
					{
						e[i].c-=1;
						e[i].allocate[++count]=t[j].id;
						if(e[i].eType==1)
							t[j].ecount++;
						else
							t[j].execount++;
						PreparedStatement ps=cc.prepareStatement("insert ignore into allocation values(?,?,?,?,?)");
						ps.setString(1,t[j].id);
						ps.setString(2,e[i].name);
						ps.setString(3,e[i].date);
						ps.setString(4,e[i].st.getTime());
						ps.setString(5,e[i].et.getTime());
						ps.execute();
						ps.close();
						PreparedStatement psr=cc.prepareStatement("insert ignore into records values(?,?,?,?,?,?)");
						psr.setString(1,t[j].id);
						psr.setString(2,e[i].name);
						psr.setString(3,e[i].date);
						psr.setString(4,e[i].st.getTime());
						psr.setString(5,e[i].et.getTime());
						psr.setInt(6,e[i].eType);
						psr.execute();
						psr.close();
						for(int ij=1;ij<=np;ij++)
						{
							t[j].fp[ij]=1;
						}
					}	
				}
			}
			if(e[i].c>0)
			for(int j=1;j<=nt;j++)
			{
				if((t[j].isFree(sp,ep)+t[j].isLab2(sp,ep))==(ep-sp+1)&&e[i].c>0)
					if((e[i].eType==t[j].desig)||e[i].eType==2)
					{
						e[i].c-=1;
						e[i].allocate[++count]=t[j].id;
						if(e[i].eType==1)
							t[j].ecount++;
						else
							t[j].execount++;
						PreparedStatement ps=cc.prepareStatement("insert ignore into allocation values(?,?,?,?,?)");
						ps.setString(1,t[j].id);
						ps.setString(2,e[i].name);
						ps.setString(3,e[i].date);
						ps.setString(4,e[i].st.getTime());
						ps.setString(5,e[i].et.getTime());
						ps.execute();
						ps.close();
						PreparedStatement psr=cc.prepareStatement("insert ignore into records values(?,?,?,?,?,?)");
						psr.setString(1,t[j].id);
						psr.setString(2,e[i].name);
						psr.setString(3,e[i].date);
						psr.setString(4,e[i].st.getTime());
						psr.setString(5,e[i].et.getTime());
						psr.setInt(6,e[i].eType);
						psr.execute();
						psr.close();
						for(int ij=1;ij<=np;ij++)
						{
							t[j].fp[ij]=1;
						}
					}
			}
			if(e[i].c>0)
			for(int j=1;j<=nt;j++)
			{
				if((t[j].isFree(sp,ep)+t[j].isLab2(sp,ep)+t[j].isClass(sp,ep))==(ep-sp+1)&&e[i].c>0)
					if((e[i].eType==t[j].desig)||e[i].eType==2)
					{
						e[i].c-=1;
						e[i].allocate[++count]=t[j].id;
						if(e[i].eType==1)
							t[j].ecount++;
						else
							t[j].execount++;
						PreparedStatement ps=cc.prepareStatement("insert ignore into allocation values(?,?,?,?,?)");
						ps.setString(1,t[j].id);
						ps.setString(2,e[i].name);
						ps.setString(3,e[i].date);
						ps.setString(4,e[i].st.getTime());
						ps.setString(5,e[i].et.getTime());
						ps.execute();
						ps.close();
						
						PreparedStatement psr=cc.prepareStatement("insert ignore into records values(?,?,?,?,?,?)");
						psr.setString(1,t[j].id);
						psr.setString(2,e[i].name);
						psr.setString(3,e[i].date);
						psr.setString(4,e[i].st.getTime());
						psr.setString(5,e[i].et.getTime());
						psr.setInt(6,e[i].eType);
						psr.execute();
						psr.close();
						for(int ij=1;ij<=np;ij++)
						{
							t[j].fp[ij]=1;
						}
					}
			}
				t=e[i].getSorted(teacher);
				
				if(e[i].c>0)
				for(int j=1;j<=nt;j++)
				{
					if((t[j].isFree(sp,ep)+t[j].isLab2(sp,ep))==(ep-sp+1)&&e[i].c>0)
					{
						e[i].c-=1;
						e[i].allocate[++count]=t[j].id;
						if(e[i].eType==1)
							t[j].ecount++;
						else
							t[j].execount++;
						PreparedStatement ps=cc.prepareStatement("insert ignore into allocation values(?,?,?,?,?)");
						ps.setString(1,t[j].id);
						ps.setString(2,e[i].name);
						ps.setString(3,e[i].date);
						ps.setString(4,e[i].st.getTime());
						ps.setString(5,e[i].et.getTime());
						ps.execute();
						ps.close();
						PreparedStatement psr=cc.prepareStatement("insert ignore into records values(?,?,?,?,?,?)");
						psr.setString(1,t[j].id);
						psr.setString(2,e[i].name);
						psr.setString(3,e[i].date);
						psr.setString(4,e[i].st.getTime());
						psr.setString(5,e[i].et.getTime());
						psr.setInt(6,e[i].eType);
						psr.execute();
						psr.close();
						for(int ij=1;ij<=np;ij++)
						{
							t[j].fp[ij]=1;
						}
					}
				}
				if(e[i].c>0)
				for(int j=1;j<=nt;j++)
				{
					if((t[j].isFree(sp,ep)+t[j].isLab2(sp,ep)+t[j].isClass(sp,ep))==(ep-sp+1)&&e[i].c>0)
					{
						e[i].c-=1;
						e[i].allocate[++count]=t[j].id;
						if(e[i].eType==1)
							t[j].ecount++;
						else
							t[j].execount++;
						PreparedStatement ps=cc.prepareStatement("insert ignore into allocation values(?,?,?,?,?)");
						ps.setString(1,t[j].id);
						ps.setString(2,e[i].name);
						ps.setString(3,e[i].date);
						ps.setString(4,e[i].st.getTime());
						ps.setString(5,e[i].et.getTime());
						ps.execute();
						ps.close();
						
						PreparedStatement psr=cc.prepareStatement("insert ignore into records values(?,?,?,?,?,?)");
						psr.setString(1,t[j].id);
						psr.setString(2,e[i].name);
						psr.setString(3,e[i].date);
						psr.setString(4,e[i].st.getTime());
						psr.setString(5,e[i].et.getTime());
						psr.setInt(6,e[i].eType);
						psr.execute();
						psr.close();
						for(int ij=1;ij<=np;ij++)
						{
							t[j].fp[ij]=1;
						}
					}	
				}
				
			
			for(int j=1;j<=nt;j++)
			{
				PreparedStatement ps=cc.prepareStatement("update teacher set count="+t[j].ecount+ " where emp_id='"+t[j].id+"'");
				ps.execute();
				ps.close();
				ps=cc.prepareStatement("update teacher set ec="+t[j].execount+ " where emp_id='"+t[j].id+"'");
				ps.execute();
				ps.close();
			}
		}
		//PreparedStatement ps=cc.prepareStatement("update teacher set count="+0);
		//ps.execute();
		//ps.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	public void doPost(HttpServletRequest sq,HttpServletResponse sr) throws ServletException,IOException
	{
		PrintWriter pw=sr.getWriter();
		pw.println("please wait generating schedule and this may take a while");
		process p=new process();
		p.generate();
		pw.println("schedule generated");
		RequestDispatcher rd=sq.getRequestDispatcher("print");
		rd.forward(sq,sr);
	}
} 