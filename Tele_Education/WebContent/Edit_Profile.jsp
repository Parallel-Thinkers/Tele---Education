<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script type = "text/javascript">
function validate()
{
 
   if( document.editnup_form.Password.value != document.edit_form.password_check.value )
   {
     alert( "Paaswords entered do not match!!" );
     document.Signup_form_TI.Password.focus() ;
     return false;
   }
}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#sport').multiselect({
			buttonWidth : '450px',
			dropRight : true
		});
	});
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
							<h4 class="modal-title">Please fill up the form for Editing Your Profile</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" action="Edit_profile" name = "edit_form" id ="edit_form" >
								<fieldset>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">Email</label>
										<div class="col-sm-10">
											<input type="text" placeholder="Email" class="form-control" name ="User_id">
										</div>
									</div>
									
									<!-- Text input-->
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">Password</label>
										<div class="col-sm-10">
											<input type="password" placeholder="Enter Your New Password"
												class="form-control" name="Password" id="Password">
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">Re Enter Password</label>
										<div class="col-sm-10">
											<input type="password" placeholder="Enter Your New Password Again"
												class="form-control" name="password_check" id = "password_check">
										</div>
									</div>
									


									<!-- Text input-->
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">Address</label>
										<div class="col-sm-10">
											<input type="text" placeholder="Address" class="form-control" name ="Address">
										</div>
									</div>

									<!-- Text input-->
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">Mobile</label>
										<div class="col-sm-4">
											<input type="text" placeholder="Mobile" class="form-control" name = "Mobile">
										</div>

																		</fieldset>
						<div class="modal-footer">
							<input type="reset" class="btn btn-default" /> <input
								type="submit" class="btn btn-primary" />
								</form>
															
						</div>
								
						</div>
					</div>
				</div>
		
			</div>
		</div>
	</div>



</body>
</html>