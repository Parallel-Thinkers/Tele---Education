<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SC DASHBOARD</title>
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
<style type="text/css">
.welcome {
	background-color:#FFCCCC;
	border:1px solid #CC0000;
	width:400px;
	margin-bottom:8px;
}
.welcome li{ 
	list-style: none; 
}
</style>
</head>
<body>

	<div id="wrapper">


		<%@ include file="Sidebar_SC.jsp"%>
			<!-- Warning -->



		<s:if test="hasActionMessages()">
			<div class="welcome">
				<s:actionmessage />
			</div>
		</s:if>


		<div class="row">
			<div class="modal modalBlock">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Messages From TI</h4>
						
						
						
						
						
						</div>
						<div class="modal-body">
							<div class="form-group">
								<div class="row">
									<div class="col-md-12">
										
										<!-- <div style="height: 8cm; overflow: scroll;">-->
											<s:iterator value="arrAddBroadcastModel"> -
									<s:property value="MESSAGE_BODY"/>
											<br>
											</s:iterator>
									
										<!-- </div> -->
									</div>
								</div>
							</div>
					
						</div>
					</div>
				</div>		
			</div>
		</div>
			

</body>
</html>