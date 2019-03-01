<jsp:declaration>
String name="admin";
</jsp:declaration>
<jsp:scriptlet>
	String valid=(String)session.getAttribute("login");
	if(valid!=null)
	{
		if(valid.equals(name))
		{
			String temp=(String)session.getAttribute("nd");
			if(temp!=null)
			{
				int nd=Integer.parseInt(temp);
</jsp:scriptlet>
<html lang="en" oncontextmenu="return false">
<head>
	<title>INDIVIDUAL EXAM DETAILS</title>
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
	<script>
    function validateForm() {
        var d = document.forms["myForm"]["date"].value;
        var m = document.forms["myForm"]["month"].value;
        var y = document.forms["myForm"]["year"].value;

        if(d == null || d == ""){
            alert("Please select date.");
            return false;
        }
        if(m == null || m == ""){
            alert("Please select date.");
            return false;
        }
        if(y == null || y == ""){
            alert("Please select date.");
            return false;
        }
        if((m == 4 || m == 6 || m == 9 || m == 11) && d == 31) {
            alert("Selected month contains only 30 days.");
            return false;
        }
        if(m == 2 && d > 29 && (y%4 == 0)) {
            alert("Selected month contains only 29 days.");
            return false;
        }

        else if((m == 2) && d > 28 && (y%4!=0)) {
            alert("Selected month contains only 28 days.");
            return false;
        }
        return true;
    }
</script>
</head>
<body>

	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/backGround.jpeg');background-attachment:fixed;">
			<div class="wrap-login100 p-t-30 p-b-50" style="align:center;width:auto;">
			<span class="login100-form-title p-b-41">
					ENTER DETAILS FOR EXAM:<jsp:expression>(String)session.getAttribute("ex-name")</jsp:expression>
				</span>
				<form class="login100-form validate-form p-b-33 p-t-5" onsubmit="return validateForm()" action="exam_details" method="post">
				<table border="0">
				<jsp:scriptlet>
					for(int i=1;i!=nd+1;i++)
					{
				</jsp:scriptlet>
				<tr>
				<td>
				<h2 style="color:#a41aba;margin-left:20px">DAY <jsp:expression>i</jsp:expression></h2>
				
				</td>
				<td style="width:50%;">
					<div class="wrap-input100 validate-input" data-validate = "Enter no.of invigilators">
						<input class="input100" type="number" min="1" max="<%=(String)session.getAttribute("tc")%>" name="nt<%=i%>" placeholder="No. of Invigilators">
					</div>
				</td>
				<td>

						<input type="number" id="d" name="day<%=i%>" min="1" max="31" value="dd" placeholder="dd" style="border:1.5px solid black;text-align:center;font:inherit;"/>
						<input type="number" id="m" name="month<%=i%>" min="1" max="12" value="mm" placeholder="mm" style="border:1.5px solid black;text-align:center;font:inherit;"/>
						<input type="number" id="y"  name="year<%=i%>" min="2018" max="2100" value="yyyy" placeholder="yyyy" style="border:1.5px solid black;text-align:center;font:inherit;"/>
						</form>
				</td>
				</tr>
				<jsp:scriptlet>
					}
				</jsp:scriptlet>
				</table>
					<div class="container-login100-form-btn m-t-32">
					<input type="submit" value="SUBMIT" name="SUBMIT" class="login100-form-btn">
					</div>
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