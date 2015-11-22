<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@page import="java.util.ArrayList" %>
<%@page import="org.iiitb.model.*" %>
<%@page import="org.iiitb.action.*" %>
	
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<!-- START HEAD -->
<meta charset="utf-8">
<!-- START TITLE -->
<title>TELE EDUCATION PROJECT</title>
<!-- END TITLE -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- START THEME STYLE -->
<link rel="stylesheet" type="text/css" href="css/normal.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/headhesive.css">
<link href="css/animate.css" rel="stylesheet">

<!-- END THEME STYLE -->

<!-- START FONTELLO ICONS STYLESHEET -->
<link rel="stylesheet" type="text/css" href="css/fontello.css">
<link rel="stylesheet" type="text/css" href="css/fontello-ie7.css">
<!-- END FONTELLO ICONS STYLESHEET -->

<!-- START MAGNIFIC POPUP STYLESHEET -->
<link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
<!-- END MAGNIFIC POPUP STYLESHEET -->

<!-- LOAD GOOGLE FONT OPEN SANS -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,300,400,600,700"
	rel="stylesheet" type="text/css">
<!-- END GOOGLE FONT OPEN SANS -->


<!-- START AJAX WEBFONTS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script>
<!-- END AJAX WEBFONTS -->

<!-- START MOBILE DETECT -->
<script>
	if (/mobile/i.test(navigator.userAgent))
		document.documentElement.className += ' w-mobile';
</script>

<script src="js/jquery-2.1.3.min.js"></script>
<script
	src="js/bootstrap.min.js"></script>


<!-- Login -->
<style type="text/css">
.modal-footer {
	border-top: 0px;
}
</style>

<script type="text/javascript">
<!--
// Form validation code for checking/matching password of Signup_form.
function validate()
{
 
   if( document.Signup_form.password.value != document.Signup_form.password_check.value )
   {
     alert( "Paaswords entered do not match!!" );
     document.Signup_form.password.focus() ;
     return false;
   }
}
</script>


<script type = "text/javascript" >
function Load_Taluq()
{
	document.getElementById("Signup_form").action="Load_Taluq";
	$('#Signup_form').submit();
}
</script>

<!-- END MOBILE DETECT -->

<!-- START FAVICON -->
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
<!-- EDN FAVICON -->

</head>
<!-- END HEAD -->
<body background="happy_students.jpg">
	<!-- START BODY TAG -->

	<!-- START HEADER -->
	<!-- SCROLL DIV #boxscroll by nicescroll -->

	<div tabindex="1000" style="overflow-y: auto;" id="boxscroll">


		<!-- CHANGEABLE UNIQUE SECTOIN ID -->
		<section id="home"> <!-- START FIXED HEADER DIV -->
		<div class="banner">
			<!-- START CONTAINER -->
			<div class="w-container container">
				<div class="w-row">

					<!-- START COLUMN 3 -->
					<div class="w-col w-col-3 logo">
						<!-- START LOGO -->
						<a href="#"><img class="logo" src="images/logo.jpg" alt="#"
							style="height: 72px;"></a>
						<!-- END LOGO -->
					</div>
					<!-- END COLUMN 3 -->

					<!-- START COLUMN 9 -->
					<div class="w-col w-col-9">

						<!-- START NAVIGATION -->
						<div class="w-nav navbar" data-collapse="medium"
							data-animation="default" data-duration="400" data-contain="1">
							<div class="w-container nav">
								<!-- START CONTAINER -->

								<!-- START NAVIGATION LINKS -->
								<nav class="w-nav-menu nav-menu" role="navigation"> <a
									class="w-nav-link menu-li" href="#home">HOME</a> <a
									class="w-nav-link menu-li" href="Home.jsp#login">LOGIN</a> <a
									class="w-nav-link menu-li" href="Register.jsp">REGISTER</a>
									
									 </nav>
								<!-- END NAVIGATION LINKS -->

								<!-- START MOBILE NAVIGATION BUTTON * DO NOT DELETE THIS DIV* -->
								<div class="w-nav-button">
									<div class="w-icon-nav-menu"></div>
								</div>
								<!-- END MOBILE NAVIGATION BUTTON -->

							</div>
							<!-- END CONTAINER -->
						</div>
						<!-- END NAVIGATION -->
					</div>
					<!-- END COLUMN 9 -->
				</div>
			</div>
			<!-- END CONTAINER -->
		</div>
		<!-- END FIXED HEADER DIV --> </section>
		<!-- END SECTION -->
		<!-- END HEADER -->

		<div class="header-parallax" data-stellar-background-ratio="0.5">
			<div class="slidersection">



				<div class="overlay">

					<div class="center fixed-content">
						<div class="center-fix">
							<h1 class="underline animated fadeInDown">TELE EDUCATION PROJECT</h1>
							<h4 class="animated fadeInUp delay-05s"
								style="margin-bottom: 50px;">
								<strong>नास्ति विद्यासमो बन्धुर्नास्ति विद्यासमः सुहृत्
									। नास्ति विद्यासमं वित्तं नास्ति विद्यासमं सुखम् ॥ </strong>
							</h4>
							<a class="button animated fadeInUp delay-1s"
								href="index.html#login" style="margin-right: 20px;"><span><i
									class="cogelegance-icons-"></i></span>Login</a>
									<a
								class="button border animated fadeInUp delay-1s"
								href="Register.jsp">Register</a>
								</div>
					</div>
				</div>
			</div>
		</div>





		<div id="login">

			<div class="row-back">
				<div class="parallax-back" data-stellar-background-ratio="0.5">

					<div class="opcaity">

						<div class="w-container wrap-normal">

							<div class="center">

								<h1 class="underline">Login</h1>


							</div>
							<div class="main" align="center">
									
									<div class="alert alert-danger" role="alert">
										<%=(request.getParameter("actionerror")!=null)?"UserId,password doesn't match Or Your are not Approved by HA":""%>
									</div>
								<s:if test="hasActionErrors()">
									<script type="text/javascript">
											window.location.href="Home.jsp?actionerror=error#login";
									</script>
								</s:if>

								
								<s:if test="hasActionMessages()">
		 	    						<div class="alert alert-success" role="alert">
			         				<s:actionmessage/>
								</s:if>
								
								
								<form action="loginAction" method="post">

									<label for="name">User ID:</label> <input class="w-input"
										type="text" id="name" placeholder="Enter User ID"
										name="userID" style="width: 50%" required="required">

									<label for="email">Password:</label> <input class="w-input"
										placeholder="Enter Password" type="password" id="email"
										name="password" required="required" style="width: 50%">

									<input class="button medium" type="submit" value="Submit">
			        				</form>
								

							</div>

						</div>

					</div>

				</div>


			</div>


<!-- Register
 -->
 
  
 
 
 

			<!--///////////////////////////////////////////////////////

       // End Clients section 

       //////////////////////////////////////////////////////////-->



			<!--///////////////////////////////////////////////////////

       // Contact section 

       //////////////////////////////////////////////////////////-->

			<!--///////////////////////////////////////////////////////

       // Footer section 

       //////////////////////////////////////////////////////////-->



			<div class="footer row-back">
				<div class="w-container wrap-normal center">
					© <strong>Student of IIIT Bangalore </strong>M.Tech Batch-2016
				</div>
			</div>

			<!--///////////////////////////////////////////////////////

       // End Footer section 

       //////////////////////////////////////////////////////////-->
		</div>
		
		
		
			
		
		

		<!-- START JQUERY PLUGINS LOAD -->
		<script src="js/jquery.js"></script>
		<script src="js/modernizr.js"></script>
		<script src="js/normal.js"></script>
		<script src="js/carousels.js"></script>
		<script src="js/jquery.stellar.js"></script>
		<script src="js/classie.js"></script>
		<script src="js/jquery.mixitup.js"></script>
		<script src="js/testimonials.js"></script>
		<script src="js/jquery.nicescroll.js"></script>
		<script src="js/rotating-text.js"></script>
		<script src="js/jquery.magnific-popup.js"></script>
		<script src="js/headhesive.min.js"></script>
		<script src="js/waypoints.min.js"></script>
		<script src="js/scripts.js"></script>

		<!-- END JQUERY PLUGINS LOAD -->
</body>

</html>
