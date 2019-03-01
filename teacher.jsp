<jsp:declaration>
String name="teacher";
</jsp:declaration>
<jsp:scriptlet>
	String valid=(String)session.getAttribute("login");
	if(valid!=null)
	{
		if(valid.equals(name))
		{
</jsp:scriptlet>
<html oncontextmenu="return false">
<head>
	<title>TEACHER'S VIEW</title>
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
	<script type = "text/javascript" >

   function preventBack(){window.history.forward();}

    setTimeout("preventBack()", 0);

    window.onunload=function(){null};

	</script>

</head>
<body>
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/backGround.jpeg');background-attachment:fixed;">
			<div class="wrap-login100 p-t-30 p-b-50" style="width:650px;">
				<form class="login100-form validate-form p-b-33 p-t-5">
					<div style="padding-left:5%;">
					<ul>
						<li>
							<a href="t_data">
								<h3>VIEW PROFILES</h3>
								<p>View profiles and exam schedules</p>
							</a>
						</li>
						<li>
							<a href="logout">
								<h1 style="text-align:center;margin-bottom:40%;margin-top:40%">LOGOUT</h1>
							</a>
					</ul>
					</div>
				</form>
			</div>
			<a href="getintouch.html" target="_blank"><img src="images/git.png" style="width:25%;height:20%;position:fixed;right:0;bottom:0;"></img></a>
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