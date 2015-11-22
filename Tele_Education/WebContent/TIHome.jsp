<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>	
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
			<!-- search engine -->

							<div class="fk-searchbar unit fclear">
								<form onsubmit="" method="get" id="fk-header-search-form"
									action="" autocomplete="off">
									<div class="search-bar-wrap">
										<div class="search-bar">
											<div class="unit search-bar-text-wrap size5of6">
												<span class="search-bar-icon"> </span> <input type="text"
													name="q" class="search-bar-text fk-font-13 ac_input"
													placeholder="Search for a Question"
													value="" id="fk-top-search-box" />
											</div>
											<div class="unit search-bar-submit-wrap size1of6">
												<input type="submit"
													class="search-bar-submit fk-font-13 fk-font-bold"
													value="Search" />

											</div>
										</div>
									</div>
								</form>
								<!-- search engine close -->
		
		
		
	<div class="row">
			<div class="modal modalBlock">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Messages</h4>
							<div class="form-group">
			<table class="table">
			<thead>
				<tr>
					<th class="SENDER_NAME">SENDER_NAME</th>
					<th class="MESSAGE_BODY">MESSAGE_BODY</th>
					<th>
				</tr>
			</thead>
				<s:iterator value="arrAllPersonalMessageModel">
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
			
							</div>
						</div>
	
	

</body>
</html>