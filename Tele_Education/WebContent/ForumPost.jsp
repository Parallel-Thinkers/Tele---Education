<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Forum Post</title>
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
<script src="js/jquery-1.11.3.js" type="text/javascript"></script>
<script>
	$(document).ready(function() {

		$.getJSON('ajaxAction', {

		}, function(jsonResponse) {
			var select = $('#school');
			select.find('option').remove();
			$.each(jsonResponse.sch, function(key, value) {
				$('<option>').val(key).text(value).appendTo(select);
			});
		});

		$("#class").click(function(event) {
			var cid = $("select#class").val();
			$.getJSON('ajaxAction', {
				classId : cid
			}, function(jsonResponse) {
				var select = $('#subject');
				select.find('option').remove();
				$.each(jsonResponse.sub, function(key, value) {
					$('<option>').val(key).text(value).appendTo(select);
				});

			});

		});

		$("#subject").click(function(event) {
			var sid = $("select#subject").val();
			$.getJSON('ajaxAction', {
				subId : sid
			}, function(jsonResponse) {
				var select = $('#topic');
				select.find('option').remove();
				$.each(jsonResponse.tag1, function(key, value) {
					$('<option>').val(key).text(value).appendTo(select);
				});

			});

		});

		$("#topic").click(function(event) {
			var tid = $("select#topic").val();
			$.getJSON('ajaxAction', {
				tag1Id : tid
			}, function(jsonResponse) {
				var select = $('#subtopic');
				select.find('option').remove();
				$.each(jsonResponse.tag2, function(key, value) {
					$('<option>').val(key).text(value).appendTo(select);
				});

			});

		});

		$("#school").click(function(event) {
			var sid = $("select#school").val();
			$.getJSON('ajaxAction', {
				schoolId : sid
			}, function(jsonResponse) {
				var select = $('#class');
				select.find('option').remove();
				$.each(jsonResponse.cla, function(key, value) {
					$('<option>').val(key).text(value).appendTo(select);
				});

			});

		});

	});
</script>

</head>
<body>

	<div id="wrapper">


		<%@ include file="Sidebar.jsp"%>

		<div class="row">
			<div class="modal modalBlock">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Forum Post</h4>
						</div>
						<div class="modal-body"></div>

						<div class="row">
							<s:form method="post" action="postAction">


								<s:select id="school" name="school" list="{'Select School'}"
									label="Select School" />
																
								<s:select id="class" name="classsch" list="{'Select Class'}"
									label="Select class" />
								<s:select id="subject" name="subject" list="{'Select Subject'}"
									label="Select subject" />
								<s:select id="topic" name="topic" list="{'Select Topic'}"
									label="Select Topic" />
								<s:select id="subtopic" name="subtopic"
									list="{'Select Subtopic'}" label="Select subtopic" />

								<s:textarea id="question" name="question" label="Question"></s:textarea>
								<s:textarea id="answer" name="answer" label="Answer"></s:textarea>
								<s:textarea id="ref" name="ref" label="Reference"></s:textarea>
								<s:submit id="submit" name="submit" label="Post"></s:submit>

							</s:form>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>