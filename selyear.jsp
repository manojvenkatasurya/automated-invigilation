<jsp:declaration>
String name="admin";
boolean nodata=false;
</jsp:declaration>
<jsp:scriptlet>
	String valid=(String)session.getAttribute("login");
	if(valid!=null)
	{
		if(valid.equals(name))
		{
			String sel=(String)session.getAttribute("y_data");
			if(sel!=null)
				if(sel.equals("nodata"))
					nodata=true;
</jsp:scriptlet>
<html lang="en">
<head>
	<title>SELECT YEAR</title>
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
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/backGround.jpeg');background-attachment:fixed;">
			<div class="wrap-login100 p-t-30 p-b-50" style="width:500px;">
				<form class="login100-form validate-form p-b-33 p-t-5" action="year_select" method="post">
					<a href="admin.jsp"><img src="images/home1.png" alt="BACK" style="width:9%;height:5%;border:0;margin-top:2%"/></a>

					<div style="margin-top:5%;margin-right:40%;margin-left:30%">
					<div>
						<jsp:scriptlet>
							if(nodata)
							{
						</jsp:scriptlet>
						<p>select atleast 1 year</p>
						<jsp:scriptlet>
							}
						</jsp:scriptlet>
					<label class="el-checkbox el-checkbox-lg">
						<span class="margin-r">BTECH 1</span>
						<input type="checkbox" name="1"  >
						<span class="el-checkbox-style  pull-right"></span>
					</label>
					</div>
					<div>
					<label class="el-checkbox el-checkbox-lg">
						<span class="margin-r">BTECH 2</span>
						<input type="checkbox" name="2"  >
						<span class="el-checkbox-style  pull-right"></span>
					</label>
					</div>
					<div>
					<label class="el-checkbox el-checkbox-lg">
						<span class="margin-r">BTECH 3</span>
						<input type="checkbox" name="3"  >
						<span class="el-checkbox-style  pull-right"></span>
					</label>
					</div>
					<div>
					<label class="el-checkbox el-checkbox-lg">
						<span class="margin-r">BTECH 4</span>
						<input type="checkbox" name="4"  >
						<span class="el-checkbox-style  pull-right"></span>
					</label>
					</div>
					<div>
					<label class="el-checkbox el-checkbox-lg">
						<span class="margin-r">M.TECH</span>
						<input type="checkbox" name="5"  >
						<span class="el-checkbox-style  pull-right"></span>
					</label>
					</div>
					<div>
					<label class="el-checkbox el-checkbox-lg">
						<span class="margin-r">M.C.A</span>
						<input type="checkbox" name="6"  >
						<span class="el-checkbox-style  pull-right"></span>
					</label>
					</div>
					</div>
					<div class="container-login100-form-btn m-t-32">
						<input type="submit" class="login100-form-btn" value="NEXT">
					</div>
			</div>
				</form>
				<a href="getintouch.html" target="_blank"><img src="images/git.png" style="width:25%;height:20%;position:fixed;right:0;bottom:0;"></img></a>
		</div>
	</div>	
	

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