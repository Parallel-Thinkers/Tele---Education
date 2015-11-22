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
							<form class="form-horizontal" action="studentNumber" method="post">
								<fieldset>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="textinput">Number OF Student
											</label>
										<div class="col-sm-10">
											<input type="text" placeholder="Address Line 1"
												class="form-control">
										</div>
									</div>

									
								
  
									

								</fieldset>
							
						</div>
						<div class="modal-footer">
							<input type="reset" class="btn btn-default" /> <input
								type="submit" class="btn btn-primary" />
						</div>
						</form>
					</div>
				</div>
			
			</div>
		</div>
	</div>



</body>
</html>