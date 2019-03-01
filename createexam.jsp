<jsp:declaration>
String name="admin";
String year="";
</jsp:declaration>
<jsp:scriptlet>

	String valid=(String)session.getAttribute("login");
	if(valid!=null)
	{
		if(valid.equals(name))
		{
			String y=(String)session.getAttribute("y_data");
			session.setAttribute(y,"false");
			int t=Integer.parseInt(y);
			if(t==1)
				year="1-B.TECH";
			else if(t==2)
				year="2-B.TECH";
			else if(t==3)
				year="3-B.TECH";
			else if(t==4)
				year="4-B.TECH";
			else if(t==5)
				year="M.TECH";
			else if(t==6)
				year="M.C.A";
</jsp:scriptlet>
<html lang="en" oncontextmenu="return false">
<head>
	<title>EXAM DETAILS</title>
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
		
<script>
function tv()
{
	var st1=document.getElementById("st");
	var et1=document.getElementById("et");
	st1="01 Jan 1970 "+st1+":00 GMT";
	var stn=Date.parse(st1);
	et1="01 Jan 1970 "+et1+":00 GMT";
	var etn=Date.parse(et1);
	var st2=(String)session.getAttribute("p1s");
	var et2=(String)session.getAttribute("pne");
	st2="01 Jan 1970 "+st2+":00 GMT";
	et2="01 Jan 1970 "+et2+":00 GMT";
	var stb=Date.parse(st2);
	var etb=Date.parse(et2);
	if(etn<stn)
		window.alert("Enter Valid timings");
	else
		window.alert("please confirm ");
}
</script>
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/backGround.jpeg');background-attachment:fixed;">
			<div class="wrap-login100 p-t-30 p-b-50" style="width:600px;">
				<span class="login100-form-title p-b-41">
					ENTER EXAM DETAILS FOR <jsp:expression>year</jsp:expression>
				</span>
				<form class="login100-form validate-form p-b-33 p-t-5" onsubmit="tv" action="create_exam" method="post">
					
					<div class="wrap-input100 validate-input" data-validate = "Enter Exam Name">
						<input class="input100" type="text" name="e-name" placeholder="Exam Name">
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Enter NO. of days">
						<input class="input100" type="number" name="nd" placeholder="Number of days">
					</div>
					<br>
					<table style="width:100%;">
										
					<tr align="center">
					<td>
					<div class="form-group" style="width:60%;margin-left:5%">
						<div class="clearfix">
							<div class="input-group clockpicker pull-center" data-placement="right" data-align="top" data-autoclose="true">
								<input type="time" class="form-control" value="Enter start time" name="st" id="st">
								<span class="input-group-addon">
								<span class="glyphicon glyphicon-time"></span>
								</span>
							</div>
						</div>
					</div>
					</td>
					<td>
					<div class="form-group" style="width:60%;margin-left:5%">
						<div class="clearfix">
							<div class="input-group clockpicker pull-center" data-placement="right" data-align="top" data-autoclose="true">
								<input type="time" class="form-control" value="Enter end time" name="et" id="et">
								<span class="input-group-addon">
								<span class="glyphicon glyphicon-time"></span>
								</span>
							</div>
						</div>
					</div>
					</td>
					</table>
									
					<br>
					<div>
					<label class="el-switch">
					<input type="checkbox" name="in">
					<span class="el-switch-style" style="font-size:9px"></span>
						Is External Examination?
					</label>
					</div>
					
					<div class="container-login100-form-btn m-t-32">
						<input type="submit" class="login100-form-btn" name="next">
					</div>
				</form>
			</div>
			<a href="index.jsp"><img src="images/git.png" style="width:25%;height:20%;position:fixed;right:0;bottom:0;"></img></a>
		</div>
	</div>	
	

	<script src="js files/jquery-3.2.1.min.js"></script>
	<script src="js files/animsition.min.js"></script>
	<script src="js files/popper.js"></script>
	<script src="js files/bootstrap.min.js"></script>
	<script src="js files/select2.min.js"></script>
	<script src="js files/moment.min.js"></script>
	<script src="js files/daterangepicker.js"></script>
	<script src="js files/countdowntime.js"></script>
	<script src="js files/main.js"></script>
	<script src="js files/index.js"></script>
	<script type="text/javascript" src="js files/jquery.min.js"></script>
	<script type="text/javascript" src="js files/bootstrap1.min.js"></script>
	<script type="text/javascript" src="js files/bootstrap-clockpicker.min.js"></script>
	<script type="text/javascript" src="js files/clockpicker.js"></script>
	<script type="text/javascript" src="js files/highlight.min.js"></script>
	<script type="text/javascript" src="js files/config.js">

</script>
</body>
</html>
<jsp:scriptlet>
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