<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<jsp:declaration>
	ResultSet dates,empid,use,alloc;
	String st,et;
	Statement stmt,st6;
	int count=0;
	String e_name;
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
		if(f==-1||f==-2||f==-3)
						f+=7;
		return f;
    }
	static int count1=0;
</jsp:declaration>
<jsp:scriptlet>
count=0;
e_name=(String)session.getAttribute("rvf");
st=(String)session.getAttribute("starttime");
et=(String)session.getAttribute("endtime");
alloc=(ResultSet)session.getAttribute("alloc");
dates=(ResultSet)session.getAttribute("examdata");
empid=(ResultSet)session.getAttribute("teacherdata");
stmt=(Statement)session.getAttribute("stmt");
st6=(Statement)session.getAttribute("st6");
ResultSet rs6=st6.executeQuery("select type from exam where exam_name='"+e_name+"'");
			int type=0;
			if(rs6.next())
				type=rs6.getInt("type");
			String ex;
			if(type==1)
				ex="INTERNAL";
			else
				ex="EXTERNAL";
</jsp:scriptlet>
<html>
<head>
<title>REPORT</title>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="icon" type="image/png" href="images/icons/logo.png"/>

	<style>
@page {
    size: 29.7cm 21cm;
   }
body
{
	font-family:timesnewroman;
}
#tdcenter
{
	text-align:center;
}
#tdtab
{
	padding:1px;
}

.center
{
	margin-left:20%;
	margin-right:20%
}
td
{
	padding:2px;
}
</style>

</head>
<body>

	<div id="print" style="heigth:fixed;">
		<center>
			<div class="center">
			<center>
				<table style="margin-top:0px">
					<tr>
						<td>
							<img src="images\icons\logo.png" style="width:40px;height:40px">
						</td>
						<td>
							<table style="width:100%;padding-left:70px;width:650px">
								<tr>
									<td style="padding:5px"><p style="font-size=40px;text-align:center"><b>DEPARTMENT OF COMPUTER SCIENCE ENGINEERING</b></p></td>
								</tr>
								<tr>
									<td><p>VIGNAN'S LARA INSTITUTE OF TECHNOLOGY & SCIENCE : : VADLAMUDI</p></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</center>
			</div>
			<b><hr></b>
			
			<table style="width:100%">
				<tr>
					<td style="text-align:left"><b>VLIT/CSE/Invigilation/<jsp:expression>ex</jsp:expression>/100(B)/02</b></td>
					<td style="text-align:right;margin-right:10px;"><b>Date : <jsp:expression>request.getParameter("date")</jsp:expression></b></td>
				</tr>
			</table>
		</center>
			<p>The following faculty members are assigned to invigilation duties for <b><jsp:expression>request.getParameter("cs")</jsp:expression></b> for <b>A.Y: <jsp:expression>request.getParameter("acy")</jsp:expression></b>. The invigilator should report time to duty 30 minutes before examination. The timings for examinaton are given below.</p>
	<center>
	<table border=1 style="border-collapse:collapse">
		<tr>
			<td id="tdtab">S.NO.</td>
			<td id="tdcenter">Name of the faculty</td>
				<jsp:scriptlet>
				dates.first();
				dates.previous();
				while(dates.next())
				{
					String date=(dates.getString("date"));
					int wday=getDay(date);
					String day="";
				if(wday==1)
					day="MONDAY";
				else if(wday==2)
					day="TUESDAY";
				else if(wday==3)
					day="WEDNESDAY";
				else if(wday==4)
					day="THURSDAY";	
				else if(wday==5)
					day="FRIDAY";
				else if(wday==6)
					day="SATURDAY";
				else
					day="SUNDAY";
				</jsp:scriptlet>
			<td id="tdtab">
				<table style="border-collapse:collapse;padding:5px">
					<tr>
						<td id="tdtab">
							<table>
								<tr>
									<td id="tdtab"><jsp:expression>dates.getString("date")</jsp:expression></td>
								</tr>
								<tr>
									<td id="tdtab"><jsp:expression>day</jsp:expression></td>
								</tr>
							</table>
						</td>
					</tr>
					
				</table>
			</td>
			<jsp:scriptlet>
				}
			dates.first();dates.previous();
			</jsp:scriptlet>
			<td>Signature</td>
		</tr>
		<jsp:scriptlet>
		empid.first();
		empid.previous();
		while(empid.next())
		{
			String id=empid.getString("emp_id");
			ResultSet rs=stmt.executeQuery("select * from teacher where emp_id='"+id+"'");
			rs.next();
			String name=rs.getString("name");
			//out.println(name);
			rs.close();
		</jsp:scriptlet>
		<tr>
		<td id="tdcenter"><jsp:scriptlet>count++;out.println(count);</jsp:scriptlet></td>
		<td><jsp:expression>name</jsp:expression></td>
		<jsp:scriptlet>
		dates.first();
		dates.previous();
								while(dates.next())
								{
										String date=dates.getString("date");
										rs=stmt.executeQuery("select * from allocation where date='"+date+"' and emp_id='"+id+"' and e_name='"+e_name+"'");
										int p=0;
										if(rs.next())
											p=1;
										rs.close();
										</jsp:scriptlet>
										<td id="tdcenter">
										<jsp:scriptlet>
										if(p==1)
										{
		</jsp:scriptlet>
		&#10004;
		<jsp:scriptlet>}</jsp:scriptlet>
		</td>
		<jsp:scriptlet>
		}
		</jsp:scriptlet>
		<td>	</td>
		</tr>
		<jsp:scriptlet>
		}
		</jsp:scriptlet>
	</table>
	</center>
	<b>Timings: <jsp:expression>st</jsp:expression> to <jsp:expression>et</jsp:expression></b>
	
	<table style="bottom:0;width:100%;margin-top:20px;margin-left:20px;margin-right:30px">
		<tr>
			<td><p><b>EXAM-IN-CHARGE</b></p></td>
			<td><p><b>H.O.D</b></p></td>
			<td></td>
		</tr>
		<tr>
		<td>
		Copy to:Incharge,Examination cell:Dept File 
		</td>
		</tr>
	</table>
	
	</div>

</body>
</html>