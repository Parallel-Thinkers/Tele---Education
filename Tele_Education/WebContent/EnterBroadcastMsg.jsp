<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BroadCast Messages</title>
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

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   

    
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
   
</head>
<body>
	<div id="wrapper">

<%@ include file="Sidebar.jsp"%>
<br/>

<br/>
<br/>
<div class="form-group">
<form  action="addBMessage">
			
	<div class="form-group">

		<label for=message" class="col-sm-2 control-label">ENTER
			Message </label>
		<div class="col-sm-6">
			<input type="text" class="form-control" name="MESSAGE_BODY" required
				placeholder="Enter message" size="50" />
		</div>
	</div>
<br/>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-3">
			<button type="submit" class="btn btn-primary">ADD</button>
		</div>
	</div>
</form>
</div>
</div>
</body>
</html>