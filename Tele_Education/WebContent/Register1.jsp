<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="/struts-tags" prefix="s"%>
	<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<sx:head />
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

<script type="text/javascript">
	$(document).ready(function() {
		$('#sport').multiselect({
			buttonWidth : '450px',
			dropRight : true
		});
	});
</script>
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
<script src="js/jquery-2.0.3.js" type="text/javascript"></script>

<style type="text/css">
.modalBlock {
	display: block;
	position: relative;
}

</style>
</head>
<body onload="Load_Taluq">

	<div id="wrapper">



		<div class="row">
			<div class="modal modalBlock">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Please fill up the form</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" action="SignupAction_TI" onsubmit="return(validate());" name="Signup_form_TI">
								<fieldset>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">Line
											1</label>
										<div class="col-sm-10">
											<input type="text" placeholder="Address Line 1"
												class="form-control">
										</div>
									</div>

									<!-- Text input-->
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">Line
											2</label>
										<div class="col-sm-10">
											<input type="text" placeholder="Address Line 2"
												class="form-control">
										</div>
									</div>

									<!-- Text input-->
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">City</label>
										<div class="col-sm-10">
											<input type="text" placeholder="City" class="form-control">
										</div>
									</div>
									
									<div class="form-group">
										<label for="select" class="col-sm-2 control-label">Select
											TI</label>
										<div class="col-lg-8">
									
											<select name="Role" id="Role" class="form-control" style="width: 170px" >
										<option value="TI">TI</option>
										<option value="TI">TI12</option>
									</select>
							</div>
							</div>
							<h2>Struts 2 Autocomplete (Drop down) Example!</h2>
<s:form action = "Load_Taluq"  >
	Country:
	<sx:autocompleter size="1" list="Asm" name="Name"></sx:autocompleter>
	</action>
	</s:form>
								<div class="form-group">
										<label for="select" class="col-sm-2 control-label">Select
											Taluq</label>
										<div class="col-lg-8">
	
								
								
								<s:select id="Name" name="Name" list="{'Select State'}"
        label="Select State" />
        </div>
        </div>
        
      
   	<!-- Text input-->
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">State</label>
										<div class="col-sm-4">
											<input type="text" placeholder="State" class="form-control">
										</div>

										<label class="col-sm-2 control-label" for="textinput">Postcode</label>
										<div class="col-sm-4">
											<input type="text" placeholder="Post Code"
												class="form-control">
										</div>
									</div>



									<!-- Text input-->
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">Country</label>
										<div class="col-sm-10">
											<input type="text" placeholder="Country" class="form-control">
										</div>
									</div>
								</fieldset>
							</form>
						<div class="modal-footer">
							<input type="reset" class="btn btn-default" /> <input
								type="submit" class="btn btn-primary" />
						</div>
						
						</div>
											</div>
				</div>
			
			</div>
		</div>
	</div>



</body>
</html>