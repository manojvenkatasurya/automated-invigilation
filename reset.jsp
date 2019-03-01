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
	<title>RESET</title>
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
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/backGround.jpeg');">
			<div class="wrap-login100 p-t-30 p-b-50" style="width:40%;">
				<span class="login100-form-title p-b-41">
					RESETTING DATABASES
				</span>
				<form class="login100-form validate-form p-b-33 p-t-5" action="reset" method="post">
				<a href="admin.jsp"><img src="images/home1.png" alt="BACK" style="width:9%;height:9%;border:0;margin-top:2%"/></a>
					<h3 align="center">ON RESET ALL INFORMATION OF THE CURRENT SEMESTER ARE PERMANANTLY TRUNCATED</h3>
					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn">
							RESET
						</button>
					</div>
				</form>
				
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
	<script type="text/javascript" src="js files/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js files/animsition.min.js"></script>
	<script type="text/javascript" src="js files/popper.js"></script>
	<script type="text/javascript" src="js files/bootstrap.min.js"></script>
	<script type="text/javascript" src="js files/select2.min.js"></script>
	<script type="text/javascript" src="js files/moment.min.js"></script>
	<script type="text/javascript" src="js files/daterangepicker.js"></script>
	<script type="text/javascript" src="js files/countdowntime.js"></script>
	<script type="text/javascript" src="js files/main.js"></script>
	<script type="text/javascript" src="js files/index.js"></script>
	<script type="text/javascript" src="js files/jquery.min.js"></script>
	<script type="text/javascript" src="js files/bootstrap1.min.js"></script>
	<script type="text/javascript" src="js files/bootstrap-clockpicker.min.js"></script>
	<script type="text/javascript" src="js files/clockpicker.js"></script>
	<script type="text/javascript" src="js files/highlight.min.js"></script>
	<script type="text/javascript" src="js files/config.js"></script>

</body>
</html>
<jsp:scriptlet>
}
</jsp:scriptlet>