<jsp:declaration>
String valid;
</jsp:declaration>
<jsp:scriptlet>
valid=(String)session.getAttribute("login");
if(valid.equals("admin"))
{
</jsp:scriptlet>
<html lang="en">
<head>
	<title>ERROR PAGE</title>
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
</head>
<body>

	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/backGround.jpeg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<form class="login100-form validate-form p-b-33 p-t-5" style="width:600px;">
					<a href="admin.jsp"><img src="images/home1.png" alt="BACK" style="width:9%;height:5%;border:0;margin-top:2%"/></a>
					<h3 style="text-align:center;margin-top:2%;">The schedule for the following teachers are not accurate.Please update the folowing teacher details to generate exam allotments.</h3>
					<center>
					<table border=1>
					<jsp:scriptlet>
					String err=(String)session.getAttribute("err");
					
					String temp[]=err.split(",");
					for(int i=1;i!=temp.length;i++)
					{
						</jsp:scriptlet>
						<tr>
						<td style="padding:5px;">
						<jsp:scriptlet>
						out.println(i);
						</jsp:scriptlet>
						</td>
						<td style="padding:5px;">
						<jsp:scriptlet>
						out.println(temp[i]);
						</jsp:scriptlet>
						</td></tr>
						<jsp:scriptlet>
					}
					</jsp:scriptlet>
					</table>
					</center>
						</form>
					</div>
				<a href="getintouch.html" target="_blank"><img src="images/git.png" style="width:25%;height:20%;position:fixed;right:0;bottom:0;"></img></a>
			</div>
		</div>


	<div id="dropDownSelect1"></div>

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
		<jsp:forward page="index.jsp"></jsp:forward>	
<jsp:scriptlet>
		}

</jsp:scriptlet>