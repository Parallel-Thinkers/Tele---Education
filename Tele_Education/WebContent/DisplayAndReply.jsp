<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TI DASHBOARD</title>
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


</head>
<body>
	<div id="wrapper">
		<%@ include file="Sidebar.jsp"%>
		<!-- search engine -->
		<form class="form-horizontal" action="addReply">
		<div class="form-group">

	<label  class="col-sm-2 control-label"><s:property value= "RECIVER_NAME" /></label>
	
</div>
		<input type="text"
										style="display: none; border-color: white; color: white; border-width: 0;"
										name="RECIVER_ID" value=<s:property value= "RECIVER_ID" />>
		<input type="text"
										style="display: none; border-color: white; color: white; border-width: 0;"
										name="RECIVER_NAME" value=<s:property value= "RECIVER_NAME" />>
		
			
			<table class="table">
			<thead>
				<tr>
					<th class="SENDER_NAME">SENDER_NAME</th>
					<th class="MESSAGE_BODY">MESSAGE_BODY</th>
					<th>
				</tr>
			</thead>
				<s:iterator value="arrPersonalMessageModel">
					<tr>
						<th class="SENDER_NAME"><label class="col-sm-2 control-label"><s:property
							value="SENDER_NAME" /></label>
						</th>
						<th class="MESSAGE_BODY"><label class="col-sm-2 control-label"><s:property
							value="MESSAGE_BODY" /></label>
						</th>
					</tr>
				</s:iterator>
				</table>
				<div class="form-group">
				<label for="MESSAGE_BODY" class="col-sm-2 control-label">Reply
				</label>
				<div class="col-sm-3">
					<textarea rows="4" cols="50" class="form-control"
						name="MESSAGE_BODY"></textarea>
				</div>
			</div>
			<input type="submit" value="Reply" />
		</form>
	</div>
</body>
</html>