<jsp:declaration>
String name="true";
int day;
String wday;
String test;
String id;
</jsp:declaration>
<jsp:scriptlet>
	String valid=(String)session.getAttribute("data");
	if(valid!=null)
	{
		if(valid.equals(name))
		{
			id=(String)session.getAttribute("empid");
			test=(String)session.getAttribute("nd");
			day=Integer.parseInt(test);
			if(day==1)
				wday="MONDAY";
			else if(day==2)
				wday="TUESDAY";
			else if(day==3)
				wday="WEDNESDAY";
			else if(day==4)
				wday="THURSDAY";
			else if(day==5)
				wday="FRIDAY";
			else if(day==6)
				wday="SATURDAY";
</jsp:scriptlet>
<html lang="en" oncontextmenu="return false">
<head>
	<title>SCHEDULE UPDATE</title>
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
		<div class="container-login100" style="background-image: url('images/backGround.jpeg');background-attachment:fixed">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					Employee id:<jsp:expression>id+""+test</jsp:expression> 
				</span>
				<form class="login100-form validate-form p-b-33 p-t-5" action="enter_schedule" method="post">
				<h3 style="color:#a41aba;margin-left:20px">Enter Schedule for <jsp:expression>wday</jsp:expression><h3>
				<table>
					<jsp:scriptlet>
					int np=Integer.parseInt((String)session.getAttribute("nop"));
					for(int i=1;i!=np+1;i++)
					{
					</jsp:scriptlet>
						<tr>
							<td>
								<h1 style="color:#a41aba;margin-left:20px">PERIOD <jsp:expression>i</jsp:expression></h1>
							</td>
							<td>
								<div class="sel sel--superman">
									<select required name="p<%=i%>" id="select-superpower">
										<option value="4" name="" >SCHEDULE</option>
										<option value="1" name="">LAB 1</option>
										<option value="3" name="">LAB 2</option>
										<option value="2" name="">CLASS</option>
										<option value="4" name="">FREE</option>
									</select>
								</div>
							</td>
							<td>
								<div class="sel sel--superman">
									<select required name="y<%=i%>" id="select-superpower">
										<option value="4" >CATEGORY</option>
										<option value="1">B.Tech 1</option>
										<option value="2">B.Tech 2</option>
										<option value="3">B.Tech 3</option>
										<option value="4">B.Tech 4</option>
										<option value="5">M.Tech</option>
										<option value="6">M.C.A</option>
										<option value="4">FREE</option>
									</select>
								</div>
							</td>
						</tr>
					<jsp:scriptlet>}</jsp:scriptlet>
					
					</table>
					<br>
				<div class="container-login100-form-btn m-t-32">
					<button class="login100-form-btn">
						NEXT
					</button>
				</div>
			</div>
				</form>
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
	<script src="js files/index.js"></script>
</body>
</html>
<jsp:scriptlet>
		}
		else
		{
</jsp:scriptlet>
		<jsp:forward page="signup.jsp"></jsp:forward>	
<jsp:scriptlet>
		}
	}
	else
	{
</jsp:scriptlet>
		<jsp:forward page="signup.jsp"></jsp:forward>
<jsp:scriptlet>
	}
</jsp:scriptlet>