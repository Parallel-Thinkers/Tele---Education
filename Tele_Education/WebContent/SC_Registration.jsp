<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="/struts-tags" prefix="s"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrapswatch.css">
<link href="css/simple-sidebar.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap-multiselect.css"
	type="text/css" />
<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#sport').multiselect({
			buttonWidth : '450px',
			dropRight : true
		});
	});
</script>

<script type = "text/javascript">
	
	function validate_SC()
	{
 
   if( document.Signup_form_SC.Password.value != document.Signup_form_SC.Password_check.value )
  		{
     alert( "Paaswords entered do not match!!" );
     document.Signup_form_SC.Password.focus() ;
     return false;
  		}
	}
</script>

<style type="text/css">
.modalBlock {
	display: block;
	position: relative;
}
</style>
</head>
<body>

	<div id="wrapper">


		
		<div class="row">
			<div class="modal modalBlock">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Please fill up the form</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" action="SignupAction_SC"  name="Signup_form_SC" onsubmit="return(validate_SC());">
								<fieldset>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">Email</label>
										<div class="col-sm-10">
											<input type="email" placeholder="Enter Your Email "
												class="form-control" name="User_id" required="true">
										</div>
									</div>

									<!-- Text input-->
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">Password</label>
										<div class="col-sm-10">
											<input type="password" placeholder="Enter Your Password"
												class="form-control" name="Password" required="true">
										</div>
									</div>
									
								
								<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">Repeat Password</label>
										<div class="col-sm-10">
											<input type="password" placeholder="Enter Your Password"
												class="form-control" name="Password_check" required="true">
										</div>
									</div>
								


									
									<!-- Text input-->
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">Name</label>
										<div class="col-sm-10">
											<input type="text" placeholder="Enter Your Name" class="form-control" required="true" name="Name">
										</div>

										</div>



									<!-- Text input-->
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">Address</label>
										<div class="col-sm-10">
											<input type="text" placeholder="Enter Your Address" class="form-control" required="true" name="Address">
										</div>
									</div>
									
									
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">Mobile</label>
										<div class="col-sm-10">
											<input type="text" placeholder="Enter Your Mobile Number" class="form-control" required="true" name="Mobile">
										</div>
									</div>
									
									<div class="form-group">
										<label for="Role" class="col-sm-2 control-label">Select
											Role</label>
										<div class="col-lg-8">
										<select name="Role" required="true">
											<option value="SC">SC</option>
											</select>
											</div>
											</div>
											
									
									
									
								
										<!-- <div style="height: 8cm; overflow: scroll;"> -->
										
									<div class="form-group">
										<label for="School" class="col-sm-2 control-label">Select
											School</label>
										<div class="col-lg-8">
										<select name="School" required="true">
											<s:iterator value=" asmm2"> -
											<option value="<s:property value="School"/>"><s:property
														value="School" />
												</option>
											</s:iterator>
										</select>
									</div>
									</div>
								</fieldset>
							
						</div>
						<div class="modal-footer">
							<input type="reset" class="btn btn-default" /> <input
								type="submit" class="btn btn-primary" />
						</div>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>



</body>
</html>