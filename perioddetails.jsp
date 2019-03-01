<jsp:declaration>
String valid;
</jsp:declaration>
<jsp:scriptlet>
	valid=(String)session.getAttribute("login");
	if(valid.equals("admin"))
	{
		String ver=(String)session.getAttribute("nop");
		int np=Integer.parseInt(ver);
</jsp:scriptlet>
<html lang="en" oncontextmenu="return false">
<head>
	<title>UPDATING PERIODS TIMINGS</title>
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
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/backGround.jpeg');background-attachment:fixed;">
			<div class="wrap-login100 p-t-30 p-b-50">
			
				<span class="login100-form-title p-b-41">
				</span>
				<form class="login100-form validate-form p-b-33 p-t-5" action="periodsupd" method="post">
					<a href="admin.jsp"><img src="images/home1.png" alt="BACK" style="width:9%;height:7%;border:0;margin-top:2%"/></a><br>			
					<h2 style="text-align:center">ENTER PERIOD TIMINGS</h2>
					<table border="1" style="width:100%;padding:5%;">
					<jsp:scriptlet>
					for(int i=1;i!=np+1;i++)
					{
				</jsp:scriptlet>
					<tr align="center">
					<td align="center;"style="padding:3%;">
						<h3 style="color:#a41aba;">PERIOD <jsp:expression>i</jsp:expression></h3>
					</td>
					<td style="width:36%;padding:3%;">
					<div class="form-group">
						<div class="clearfix">
							<div class="input-group clockpicker pull-center" data-placement="right" data-align="top" data-autoclose="true">
								<input type="text" class="form-control" name="st"<%=i%> value="Enter start time">
								<span class="input-group-addon">
								<span class="glyphicon glyphicon-time"></span>
								</span>
							</div>
						</div>
					</div>
					</td>
					<td style="width:36%;padding:3%;">
					<div class="form-group">
						<div class="clearfix">
							<div class="input-group clockpicker pull-center" data-placement="right" data-align="top" data-autoclose="true">
								<input type="text" class="form-control" name="et"<%=i%> value="Enter end time">
								<span class="input-group-addon">
								<span class="glyphicon glyphicon-time"></span>
								</span>
							</div>
						</div>
					</div>
					</td>
					<jsp:scriptlet>
					}
					</jsp:scriptlet>
					</table>
			<div class="container-login100-form-btn m-t-32">
						<input type="submit" class="login100-form-btn" value="NEXT">
					</div>
			</div>


				</form>
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
</body>
</html>
<jsp:scriptlet>
}
else
{
</jsp:scriptlet>
<jsp:forward page="index.jsp" ></jsp:forward>
<jsp:scriptlet>
}
</jsp:scriptlet>