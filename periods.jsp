<jsp:declaration>
String valid;
</jsp:declaration>
<jsp:scriptlet>
	valid=(String)session.getAttribute("login");
	if(valid.equals("admin"))
	{
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
		<div class="container-login100" style="background-image: url('images/backGround.jpeg');">
			<div class="wrap-login100 p-t-30 p-b-50" style="width:300px">
				<span class="login100-form-title p-b-41">
					Enter number of periods<br>(include lunch break as a period)
				</span>
				<form class="login100-form validate-form p-b-33 p-t-5" action="periods" method="post">
					<a href="admin.jsp"><img src="images/home1.png" alt="BACK" style="width:11%;height:6%;border:0;margin-top:2%"/></a>
					<div class="wrap-input100 validate-input" data-validate = "Enter Number of periods">
						<input class="input100" type="text" name="nop" placeholder="Number of periods">
						
					</div>

					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn">
							NEXT
						</button>
					</div>
				</form>
			</div>
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