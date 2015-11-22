<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HA Dashboard</title>
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


		<%@ include file="Sidebar_HA.jsp"%>
	<div class="row">
			<div class="modal modalBlock">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Request For Approval</h4>
							<div class="form-group">
			<table class="table">
			<thead>
				<tr>
					<th class="SENDER_NAME">SrNO</th>
					<th class="MESSAGE_BODY">Name</th>
					<th class="SENDER_NAME">User_id</th>
					<th class="SENDER_NAME">Role</th>
					
				</tr>
			</thead>
				<s:iterator value="alm">
					<tr>
						<th class="SENDER_NAME"><label class="col-sm-2 control-label"><s:property
							value="i" /></label>
						</th>
						<th class="MESSAGE_BODY"><label class="col-sm-2 control-label"><s:property
							value="Name" /></label>
						</th>
						<th class="MESSAGE_BODY"><label class="col-sm-2 control-label"><s:property
							value="user_id" /></label>
						</th>
					<th class="MESSAGE_BODY"><label class="col-sm-2 control-label"><s:property
							value="Role" /></label>
						</th>
					
					</tr>
				</s:iterator>
				</table>
			
							</div>
						</div>

			<form action = "Approve" >
						<input type = "submit" value="Approve above users">
						</form>
							
						
	</div>



</body>
</html>