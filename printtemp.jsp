<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<jsp:declaration>
	ResultSet dates,empid,use,alloc;
	String st,et;
	Statement stmt;
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
		return c.get(Calendar.DAY_OF_WEEK)-4;
    }
	static int count1=0;
</jsp:declaration>
<jsp:scriptlet>
st=(String)session.getAttribute("starttime");
et=(String)session.getAttribute("endtime");
alloc=(ResultSet)session.getAttribute("alloc");
dates=(ResultSet)session.getAttribute("examdata");

empid=(ResultSet)session.getAttribute("teacherdata");
stmt=(Statement)session.getAttribute("stmt");


</jsp:scriptlet>
<html>
<head>
<title>REPORT</title>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="icon" type="image/png" href="images/icons/logo.png"/>

	<style>
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
	padding:3px;
}
.a4landscape
{
	height:1684px;
	width:1190px;
}
.center
{
	margin-left:20%;
	margin-right:20%
}
</style>

</head>
<body>

	<div class="a4landscape" id="print">
		<center>
			<div class="center">
				<table>
					<tr>
						<td>
								<link rel="icon" type="image/png" href="images/icons/logo.png" style="width:40px;height:40px">
						</td>
						<td>
							<table style="width:100%;padding-left:70px;width:650px">
								<tr>
									<td style="padding:5px"><p style="font-size=40px;text-align:center"><b>DEPARTMENT OF COMPUTER SCIENCE ENGINEERING</b></p></td>
								</tr>
								<tr>
									<td><p>VIGNAN LARA INSTITUTE OF TECHNOLOGY & SCIENCE : : VADLAMUDI</p></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
			<b><hr></b>
			<br>
			<table style="width:100%">
				<tr>
					<td style="text-align:left"><b>VLIT/CSE/Invigilation/internal/100(B)/02</b></td>
					<td style="text-align:right"><b>Date : <jsp:expression>request.getParameter("date")</jsp:expression></b></td>
				</tr>
			</table>
			<p style="text-align:left"><b>Academic year: <jsp:expression>request.getParameter("acy")</jsp:expression></b></p>
			<h3><u>INVISILATION DUTIES</u></h3>
		</center>
	<table style="width:20%">
		<tr>
			<td><u><p style="font-size:20px">course & sem</u></p></td>
			<td><p style="font-size:20px"><b><jsp:expression>request.getParameter("cs")</jsp:expression></p></b></td>
		</tr>
		<tr>
			<td><u><p style="font-size:20px">Name of the Exam</u></p></td>
			<td><p style="font-size:20px"><b>"<jsp:expression>request.getParameter("name")</jsp:expression>"</p></b></td>
		</tr>
	</table>
	<br>
	<center>
	<table border=1 style="border-collapse:collapse;padding:5px">
	<jsp:scriptlet>
	dates.first();
				dates.previous();
				while(dates.next())
				{
					String date=(dates.getString("date"));
				</jsp:scriptlet>
	<tr><td><jsp:expression>date</jsp:expression></td>
				<jsp:scriptlet>
		empid.first();
		empid.previous();
		while(empid.next())
		{
			String id=empid.getString("emp_id");
			ResultSet rs=stmt.executeQuery("select * from teacher where emp_id='"+id+"'");
			rs.next();
			String name=rs.getString("name");
//			out.println(name);
//			rs.close();
		</jsp:scriptlet>
		<td><jsp:expression>name</jsp:expression></td>
		<jsp:scriptlet>}</jsp:scriptlet>
		
		</tr>
		<jsp:scriptlet>
				}
		</jsp:scriptlet>
	</table>