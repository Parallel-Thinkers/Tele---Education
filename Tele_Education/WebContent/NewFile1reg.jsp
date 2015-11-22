<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@page import="java.util.ArrayList" %>
<%@page import="org.iiitb.model.*" %>
<%@page import="org.iiitb.action.*" %>

<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="robots" content="noodp" />
<!-- Login -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery-2.0.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/notification.js"></script>

<title>Register</title>
<script src="js/jquery-2.1.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>


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
 
   if( document.Signup_form_TI.Password.value != document.Signup_form_TI.password_check.value )
   {
     alert( "Paaswords entered do not match!!" );
     document.Signup_form_TI.Password.focus() ;
     return false;
   }
}
function validate_SC()
{
 
   if( document.Signup_form_SC.Password.value != document.Signup_form_SC.password_check.value )
   {
     alert( "Paaswords entered do not match!!" );
     document.Signup_form_SC.Password.focus() ;
     return false;
   }
}

</script>
<script type = "text/javascript" >
function Load_Taluq()
{
	var xmlhttp;
alert("hello");
	//var x=document.getElementById(subject_in_class).val;
	console.log(Subject);

	//var subject_in_class=Subject;
	//subject_in_class.name="subject_in_class";
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
	    }
	  }
	xmlhttp.open("GET","Load_Taluq",true);
	xmlhttp.send();
	}
	
</script>
	



</head>
<body  >
								
								<br/>
								<br/>	
								<br/>	
								<br/>	
								<br/>	
								<br/>	
								<br/>	
								<br/>	
								<br/>	
								<form action = "Load_Taluq">
									<li class="no-border">
										<h2 align="center"><a  class="no-border js-login login-required" href="#"
										data-toggle="modal" data-target="#SignupModal_TI" ">Register As TI</a>
									</h5>
									</li>
									<input value = "Submit " type="submit">
									</form>
									<li class="no-border">
															<h2 align="center">			 <a
										class="no-border js-login login-required" href="#"
										data-toggle="modal" data-target="#SignupModal_SC" onclick="Load_School();">Register As SC</a>
										</h2>
									</li>
	
		
	<!--  Signup modal TI -->
		<div class="modal fade" id="SignupModal_TI" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Header Section -->
				<div class="modal-header">
					<h2>Register TI</h2>
				</div>

				<!-- Body Section -->
				<div class="modal-body">
					<s:form class="form col-md-8" action="SignupAction_TI" onsubmit="return(validate());" name="Signup_form_TI">

						<div class="form-group">

							<div class="line rw">
								<div class="unit size1of3 lf">
									<label class="fk-label" for="User_id">Email Address</label>
								</div>
								<div class="unit size3of4 lastUnit rt">
									<input id="User_id" class="fk-input" type="email"
										autocomplete="on" required="true" name="User_id"></input>
								</div>
							</div>
						</div>


						<div class="form-group">
							<div class="line rw">
								<div class="unit size1of3 lf">
									<label class="fk-label" for="password">Password</label>
								</div>
								<div class="unit size3of4 lastUnit rt">
									<input id="Password" class="fk-input" type="password"
										autocomplete="off" required="true" name="Password"></input>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="line rw">
								<div class="unit size1of3 lf">
									<label class="fk-label" for="password">Repeat</label>
								</div>
								<div class="unit size3of4 lastUnit rt">
									<input id="password_check" class="fk-input" type="password"
										autocomplete="off" required="true" name="password_check"></input>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="line rw">
								<div class="unit size1of3 lf">
									<label class="fk-label" for="email"> Name</label>
								</div>
								<div class="unit size3of4 lastUnit rt">
									<input id="fname" class="fk-input" type="text"
										autocomplete="on" required="true" name="Name"></input>
								</div>
							</div>
						</div>
								

						<div class="form-group" >
							<div class="Line rw">
								<div class="unit size1of3 lf">

									<label class="fk-label" for="Role"
										class="col-sm-2 control-label">Role </label>
								</div>
								<div class="unit size3of4 lastUnit rt">

									<select name="Role" class="form-control" style="width: 170px" onchange="Load_Taluq()">
										<option value="TI">TI</option>
										<option value="TI">TI12</option>
									</select>
								</div>
							</div>
						</div>

						</div>
						</div>
					
									<div>
						
									<label class="fk-label" for="Role"
										class="col-sm-2 control-label">Taluq </label>
						
										<select name="Taluq">
											<s:iterator value="asmm"> 
									<option value="<s:property value="Taluq"/>"><s:property
														value="Taluq" />
												</option>
											</s:iterator>
										</select>
						</div>

						<div class="form-group">
								<div class="line rw">
									<div class="unit size1of3 lf">
										<label class="fk-label" for="email">Mobile</label>
									</div>
									<div class="unit size3of4 lastUnit rt">
										<input id="Mobile" class="fk-input" type="text"
											autocomplete="on" required="true" name="Mobile"></input>
									</div>
								</div>
							</div>


							<div class="form-group">
								<div class="line rw">
									<div class="unit size1of3 lf">
										<label class="fk-label" for="email">Address</label>
									</div>
									<div class="unit size3of4 lastUnit rt">
										<input id="Landline" class="fk-input" type="text"
											autocomplete="on" required="true" name="Address"></input>
									</div>
								</div>
							</div>

							<div class="form-group">
								<input class="btn btn-green" value="Sign Up Now!" type="submit">
								</input>
						</s:form>
					</div>

					<!-- Footer Section -->
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>


<!--  Signup modal SC -->
		<div class="modal fade" id="SignupModal_SC" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Header Section -->
				<div class="modal-header">
					<h2>Register SC</h2>
				</div>

				<!-- Body Section -->
				<div class="modal-body">
					<s:form class="form col-md-8" action="SignupAction_SC" name="Signup_form_SC" onsubmit="return(validate_SC());" >

						<div class="form-group">

							<div class="line rw">
								<div class="unit size1of3 lf">
									<label class="fk-label" for="email">Email Address</label>
								</div>
								<div class="unit size3of4 lastUnit rt">
									<input id="User_id" class="fk-input" type="email"
										autocomplete="on" required="true" name="User_id"></input>
								</div>
							</div>
						</div>


						<div class="form-group">
							<div class="line rw">
								<div class="unit size1of3 lf">
									<label class="fk-label" for="password">Password</label>
								</div>
								<div class="unit size3of4 lastUnit rt">
									<input id="Password" class="fk-input" type="password"
										autocomplete="off" required="true" name="Password"></input>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="line rw">
								<div class="unit size1of3 lf">
									<label class="fk-label" for="password">Repeat</label>
								</div>
								<div class="unit size3of4 lastUnit rt">
									<input id="password_check" class="fk-input" type="password"
										autocomplete="off" required="true" name="password_check"></input>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="line rw">
								<div class="unit size1of3 lf">
									<label class="fk-label" for="email"> Name</label>
								</div>
								<div class="unit size3of4 lastUnit rt">
									<input id="fname" class="fk-input" type="text"
										autocomplete="on" required="true" name="Name"></input>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="Line rw">
								<div class="unit size1of3 lf">

									<label class="fk-label" for="Role"
										class="col-sm-2 control-label">Role </label>
								</div>
								<div class="unit size3of4 lastUnit rt">

									<select name="Role" class="form-control" style="width: 170px">
										<option value="SC">SC</option>
									</select>
								</div>
							</div>
						</div>



						<div class="form-group">
							<div class="Line rw">
								<div class="unit size1of3 lf">

									<label class="fk-label" for="Taluq"
										class="col-sm-2 control-label">School </label>
								</div>
								<div class="unit size3of4 lastUnit rt">

									<select name="Role" class="form-control" style="width: 170px">
										<s:iterator value="Asm2">

											<option value="<s:property value="Name"/>"><s:property
													value="Name" /></option>
										</s:iterator>
									</select>
								</div>
							</div>
						</div>



						<div class="form-group">
								<div class="line rw">
									<div class="unit size1of3 lf">
										<label class="fk-label" for="email">Mobile</label>
									</div>
									<div class="unit size3of4 lastUnit rt">
										<input id="Mobile" class="fk-input" type="text"
											autocomplete="on" required="true" name="Mobile"></input>
									</div>
								</div>
							</div>


							<div class="form-group">
								<div class="line rw">
									<div class="unit size1of3 lf">
										<label class="fk-label" for="email">Address</label>
									</div>
									<div class="unit size3of4 lastUnit rt">
										<input id="Landline" class="fk-input" type="text"
											autocomplete="on" required="true" name="Address"></input>
									</div>
								</div>
							</div>

							<div class="form-group">
								<input class="btn btn-green" value="Sign Up Now!" type="submit">
								</input>
						</s:form>
					</div>

					<!-- Footer Section -->
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>

</body>
</html>