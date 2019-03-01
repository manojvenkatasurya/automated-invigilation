<%@ page import ="java.sql.*"%>
<jsp:declaration>
	ResultSet rs;
	String p,valid;
</jsp:declaration>
<jsp:scriptlet>
	valid=(String)session.getAttribute("login");
	if(valid==null)
	{
		</jsp:scriptlet>
	<jsp:forward page="index.jsp"></jsp:forward>
	<jsp:scriptlet>
	}
	if(valid!=null)
	{
		if(valid.equals("teacher")||valid.equals("admin"))
		{
		rs=(ResultSet)session.getAttribute("trs");
		if(rs!=null)
		{
</jsp:scriptlet>
<html lang="en" oncontextmenu="return false">
<head>
	<title>SELECT TEACHER</title>
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
			<div class="wrap-login100 p-t-30 p-b-50" style="width:650px;">
				<form class="login100-form validate-form p-b-33 p-t-5" action="view_data" method="post">
				<jsp:scriptlet>
				if(valid.equals("admin"))
				{
				</jsp:scriptlet>
				<div class="top-left">
					<a href="admin.jsp"><img src="images/home1.png" alt="BACK" style="width:8%;height:7%;"/></a></div>
				<jsp:scriptlet>
				}
				</jsp:scriptlet>
				<jsp:scriptlet>
				if(valid.equals("teacher"))
				{
				</jsp:scriptlet>
				<div class="top-left">
					<a href="teacher.jsp"><img src="images/home1.png" alt="BACK" style="width:8%;height:7%;"/></a></div>
				<jsp:scriptlet>
				}
				</jsp:scriptlet>
					<div class="sel sel--black-panther">
					<select name="vf" required id="select-faculty">
					<option value="" disabled>SELECT FACULTY</option>
					<jsp:scriptlet>
				while(rs.next())
				{
					</jsp:scriptlet>
					<option value=<%=rs.getString("emp_id")%>><jsp:expression>rs.getString("name")</jsp:expression></option>
					<jsp:scriptlet>
				}
					</jsp:scriptlet>
					</select>
					</div>
					<br>
					<div class="container-login100-form-btn m-t-32">
						<input type="submit" value="VIEW" class="login100-form-btn">
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
	}
	
</jsp:scriptlet>