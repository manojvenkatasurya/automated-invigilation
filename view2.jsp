<%@page import ="java.sql.*"%>
<jsp:declaration>
	ResultSet rs,rsd,rsa;
	String ver;
	int i=0;
	boolean t=false;
</jsp:declaration>
<jsp:scriptlet>
String valid=(String)session.getAttribute("login");
if(valid!=null)
{
if(valid.equals("teacher")||valid.equals("admin"))
{
	rs=(ResultSet)session.getAttribute("ch");
	if(rs!=null)
	{
		try
		{
			rs.first();
			int np=Integer.parseInt((String)session.getAttribute("nop"));
			String v[]=new String[np+1];
			String cat[]=new String[np+1];
			String clas[]=new String[np+1];
			String t1=rs.getString("emp_id");
			session.setAttribute("t_id",rs.getString("emp_id"));
			rsd=(ResultSet)session.getAttribute("datars");
			rsa=(ResultSet)session.getAttribute("fauc_alloc");
			String ver=(String)session.getAttribute("login");
			if(ver.equals("admin"))
				t=true;
</jsp:scriptlet>
<html lang="en" oncontextmenu="return false">
<head>
	<title>Details of Selected Faculty</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="images/icons/logo.png"/>
	<link rel="stylesheet" type="text/css" href="css files/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css files/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css files/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="css files/animate.css">
	<link rel="stylesheet" type="text/css" href="css files/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="css files/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="css files/select2.min.css">
	<link rel="stylesheet" type="text/css" href="css files/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="css files/util.css">
	<link rel="stylesheet" type="text/css" href="css files/main.css">
	<link rel="stylesheet" type="text/css" href="css files/items.css">
	<link rel="stylesheet" type="text/css" href="css files/checkbox.css">
	<link rel="stylesheet" type="text/css" href="css files/bootstrap1.min.css">
	<link rel="stylesheet" type="text/css" href="css files/bootstrap-clockpicker.min.css">
	<link rel="stylesheet" type="text/css" href="css files/github.min.css">
	<link rel="stylesheet" type="text/css" href="css files/style.css">
	<link rel="stylesheet" type="text/css" href="css files/selstyle.css">
	<style type="text/css">
</style>
<script type = "text/javascript" >

   function preventBack(){window.history.forward();}

    setTimeout("preventBack()", 0);

    window.onunload=function(){null};

</script>
<style>
td,th
{
	padding:10px;

}
table
{
	left:1%;
	right:10%;
}
</style>
</head>
<body  style="bgcolor:solid red">
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/backGround.jpeg');background-attachment:fixed;">
			<div class="wrap-login100 p-t-30 p-b-50" style="width:auto;">
				<span class="login100-form-title p-b-41">
					DETAILS OF <jsp:expression>rs.getString("name")</jsp:expression>
				</span>
				<form class="login100-form validate-form p-b-33 p-t-5" action="update" method="post">
					<table border="0" style="margin-left:10%;margin-top:3%;width:70%">
						<tr style="padding:5px;">
							<th style="padding:10px;width:48%;">
							EMPLOYEE ID 
							</th>
							<td><th>:</th></td>
							<td style="width:48%;"><jsp:expression>rs.getString("emp_id")</jsp:expression></td> 
						</tr>
						<tr style="padding:5px;">
							<th style="padding:10px;width:48%;">
							EMAIL-ID 
							</th>
							<td><th>:</th></td>
							<td style="width:48%;"><jsp:expression>rs.getString("email_id")</jsp:expression></td>
						</tr>
						<tr style="padding:5px;">
							<th style="padding:10px;width:48%;">
							CONTACT NO
							</th>
							<td><th>:</th></td>
							<td style="width:48%;"><jsp:expression>rs.getString("contact")</jsp:expression></td>
						</tr>
						<tr style="padding:5px;">
							<th style="padding:10px;width:48%;">
							NUMBER OF INTERNAL EXAM DUTIES
							</th>
							<td><th>:</th></td>
							<td style="width:48%;"><jsp:expression>rs.getString("count")</jsp:expression></td>
						</tr>
						<tr style="padding:5px;">
							<th style="padding:10px;width:48%;">
							NUMBER OF EXTERNAL EXAM DUTIES
							</th>
							<td><th>:</th></td>
							<td style="width:48%;"><jsp:expression>rs.getString("ec")</jsp:expression></td>
						</tr>
					</table>
					<h3>SCHEDULE</h3>
					<table border="1" style="width:90%;margin-left:5%;margin-top:1%;margin-right:5%">
						<tr>
							<th style="text-align:center">DAY</th>
							<jsp:scriptlet>
							for(int i=1;i!=np+1;i++)
							{
							</jsp:scriptlet>
							<th style="text-align:center">PERIOD <jsp:expression>i</jsp:expression></th>
							<jsp:scriptlet>
							}
							</jsp:scriptlet>
						</tr>
		<jsp:scriptlet>
		rsd.first();
		rsd.previous();
			while(rsd.next())
			{
				int wday=rsd.getInt("day");
				String day="";
				if(wday==1)
					day="MON";
				else if(wday==2)
					day="TUES";
				else if(wday==3)
					day="WED";
				else if(wday==4)
					day="THURS";	
				else if(wday==5)
					day="FRI";
				else if(wday==6)
					day="SAT";
				for(i=0;i!=np;i++)
				{ 
					v[i]=rsd.getString("p"+(i+1));
					String temp[]=v[i].split(" ");
					int c=Integer.parseInt(temp[0]);
					int ca=Integer.parseInt(temp[1]);
					if(ca==1)
						cat[i]="Lab";
					else if(ca==2)
						cat[i]="";
					else if(ca==3)
						cat[i]="Lab";
					else if(ca==4)
						cat[i]="-";
					if(ca!=4)
					{
						
					if(c==1)
						clas[i]="I B.Tech";
					else if(c==2)
						clas[i]="II B.Tech";
					else if(c==3)
						clas[i]="III B.Tech";
					else if(c==4)
						clas[i]="IV B.Tech";
					else if(c==5)
						clas[i]="M.Tech";
					else if(c==6)
						clas[i]="MCA";
					}
					else
						clas[i]=" ";
					//rs.close();
					//rsd.close();
				}
		</jsp:scriptlet>
				<tr>
					<td style="width:10%;padding:5px;"><jsp:expression>day</jsp:expression></td>
					<jsp:scriptlet>
							for(int i=0;i!=np;i++)
							{
							</jsp:scriptlet>
					<td style="text-align:center"><jsp:expression>clas[i]+" "+cat[i]</jsp:expression></td>
					<jsp:scriptlet>
							}
							</jsp:scriptlet>
					
				</tr>
		<jsp:scriptlet>
			}
		</jsp:scriptlet>
			</table>
			<br>
			<jsp:scriptlet>
			boolean alloc=false;
				if(rsa.next())
					alloc=true;
				rsa.first();
				rsa.previous();
				if(alloc)
				{
			</jsp:scriptlet>
			<h3>Exam Timings for <jsp:expression>rs.getString("name")</jsp:expression></h3>
			<br>
			<center>
			<table border="1" style="width:90%;margin-left:5%;margin-top:1%;margin-right:5%">
			<tr><th style="text-align:center">EXAM</th>
			<th style="text-align:center">DATE</th>
			<th style="text-align:center">TIME</th>
			</tr>
			<jsp:scriptlet>
			while(rsa.next())
			{
			</jsp:scriptlet>
			<tr>
			<td style="text-align:center"><jsp:expression>rsa.getString("e_name")</jsp:expression></td>
			<td style="text-align:center"><jsp:expression>rsa.getString("date")</jsp:expression></td>
			<td style="text-align:center"><jsp:scriptlet>out.println(rsa.getString("start_time")+"-"+rsa.getString("end_time"));</jsp:scriptlet></td>
			</tr>
			<jsp:scriptlet>
			}
			}
			else
			{
			</jsp:scriptlet>
			<h3>No Exam for <jsp:expression>rs.getString("name")</jsp:expression></h3>
			<jsp:scriptlet>
			}
			</jsp:scriptlet>
			</table>
					<br>
					<table border="0" style="width:100%;">
					<tr>
		<jsp:scriptlet>
			if(t)
			{
		</jsp:scriptlet>
					<td>
					<div class="container-login100-form-btn m-t-32">
						<input type="submit" value="remove" name="up" class="login100-form-btn">
						</button>
					</div></td>
		<jsp:scriptlet>
			}
		</jsp:scriptlet>
					<td>
					<div class="container-login100-form-btn m-t-32">
						<input type="submit" value="update" name="up" class="login100-form-btn">
						</button>
					</div></td>
					<td>
					<div class="container-login100-form-btn m-t-32">
						<input type="submit" value="ok" name="up" class="login100-form-btn">
						</button>
					</div>
					</td>
					</tr>
					</table>
		<jsp:scriptlet>
			if(t)
			{
		</jsp:scriptlet>
		<jsp:scriptlet>
			}
		</jsp:scriptlet>
			</center>
			</form>
			</div>
			<a href="getintouch.html" target="_blank"><img src="images/git.png" style="width:25%;height:20%;position:fixed;right:0;bottom:0;"></img></a>
			</div>
			</div>
			</body>
			</html>
		<jsp:scriptlet>
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
else
{
</jsp:scriptlet>
	<jsp:forward page="index.jsp"></jsp:forward>
<jsp:scriptlet>
}
}
else
{
</jsp:scriptlet>
	<jsp:forward page="index.jsp"></jsp:forward>
<jsp:scriptlet>
}
</jsp:scriptlet>