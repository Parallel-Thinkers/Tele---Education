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


		<%@ include file="Sidebar.jsp"%>

		<div class="row">
			<div class="modal modalBlock">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Please fill up the form</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" action="#" onsubmit="">
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
									<div class="form-group">
										<label for="select" class="col-sm-2 control-label">Select
											Sport</label>
										<div class="col-lg-8">
											<select class="form-control" id="sport" name="sport"
												multiple="multiple">
												<option default>Select A Sport</option>
												<option value="bb">Basket Ball</option>
												<option value="bm">Badminton</option>
												<option value="bb">Carrom</option>
												<option value="bb">Table Tennis</option>
												<option value="bb">Chess</option>
												<option value="bb">Football</option>
												<option value="bb">Volley Ball</option>
												<option value="bb">Counter Strike</option>
												<option value="bb">Cricket</option>
												<option value="bb">FIFA</option>
												<option value="bb">Slow Cycling</option>
												<option value="bb">Throw Ball</option>
												<option value="bb">Mini Marathon</option>
											</select>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
						<div class="modal-footer">
							<input type="reset" class="btn btn-default" /> <input
								type="submit" class="btn btn-primary" />
						</div>
					</div>
				</div>
			
			</div>
		</div>
	</div>



</body>
</html>