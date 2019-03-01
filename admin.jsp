<jsp:declaration>
String name="admin";
</jsp:declaration>
<jsp:scriptlet>
	String valid=(String)session.getAttribute("login");
	if(valid!=null)
	{
		if(valid.equals(name))
		{
</jsp:scriptlet>

<html lang="en" oncontextmenu="return false">
<head>
	<title>ADMIN</title>
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
	<style type="text/css">
</style>
<script type = "text/javascript" >

   function preventBack(){window.history.forward();}

    setTimeout("preventBack()", 0);

    window.onunload=function(){null};

</script>
<script type = "text/javascript">
	$(document).keydown(function (event) {
    if (event.keyCode == 123) { // Prevent F12
        return false;
    } else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) { // Prevent Ctrl+Shift+I        
        return false;
    }
});

	</script>
</head>
<body>
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/backGround.jpeg');background-attachment:fixed;">
			<div class="wrap-login100 p-t-30 p-b-50" style="width:950px;position:fixed;">
				<form class="login100-form validate-form p-b-33 p-t-5">
					<div style="padding-left:5%;">
					<ul>
						<li>
							<a href="t_data">
								<h3>VIEW AND UPDATE FACULTY</h3>
								<p>Views Details of Each Faculty</p>
							</a>
						</li>
						<li>
							<a href="validating_teachers_schedule">
								<h3>GENERATE EXAM SCHEDULE</h3>
								<p>Creates Invigilation TimeTable</p>
							</a>
						</li>
						<li>
							<a href="recexamsel">
								<h3>VIEW RECORDS</h3>
								<p>Views Past Records</p>
							</a>
						</li>
						<li>
							<a href="periods.jsp">
								<h3>UPDATE PERIODS</h3>
								<p>Updated periods will be saved permanantly untill you re update</p>
							</a>
						</li>
						<li>
							<a href="reset.jsp">
								<h3>RESET RECORDS</h3>
								<p>Data bases are formatted</p>
							</a>
						</li>
						<li>
							<a href="logout">
								<h1 style="text-align:center;margin-bottom:40%;margin-top:40%">LOGOUT</h1>
							</a>
						</li>
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