<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Test</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrapswatch.css">
<link href="css/simple-sidebar.css" rel="stylesheet">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap-multiselect.css"
	type="text/css" />
<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
$(function() {
$( "#datepicker" ).datepicker();
});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#sport').multiselect({
			buttonWidth : '450px',
			dropRight : true
		});
	});
</script>


<script type="text/javascript">
function showSubTopic(tag,Standard)
{
	
//var tag=document.getElementsByName(subject_in_class)	
var xmlhttp;
//var Sub=document.getElementById(Subjectt);
//alert(Standard);
//alert(tag);

//var x=document.getElementById(subject_in_class).val;
//console.log(Sub);


if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("myDiv1").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","getSubTopic?tag="+tag+"&Standard="+Standard,true);
xmlhttp.send();
}
</script>

<script>
function showSubject(Subject)
{
	
	
var xmlhttp;

//var x=document.getElementById(subject_in_class).val;
console.log(Subject);

//var subject_in_class=Subject;
//subject_in_class.name="subject_in_class";
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","getSubject?Subject="+Subject,true);
xmlhttp.send();
}
</script>








</head>
<body>




 


<style type="text/css">
.modalBlock {
	display: block;
	position: relative;
}
</style>
</head>
<body>

	<div id="wrapper">


		<%@ include file="Sidebar_SC.jsp"%>



		
<div class="row">
			<div class="modal modalBlock">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Create Test</h4>
						
						
						</div>
						<div class="modal-body">
						
							<form class="form-horizontal" action="submitTestDetail" method="get">
								<fieldset>
								
									<div class="form-group">
										<label for="select" class="col-sm-2 control-label">Select
											Class</label>
										<div class="col-lg-8">
											<select class="form-control" id="subject_in_class" name="Standard" onchange="showSubject(this.value)" >
												<option default>Select Class</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10</option>
											</select>
										</div>
									</div>
									
									
									<div id="myDiv">
									
									
									</div>
									
									<div id="myDiv1"></div>
									
									
									
									
									
									
										<div class="form-group">
										<label for="select" class="col-sm-2 control-label">Test-
										Topic</label>
										<div class="col-lg-8">
											<input type="text" placeholder="Test-Topic" class="form-control" name="test_topic">
										</div>
									</div>
									
									<div class="form-group">
										<label for="select" class="col-sm-2 control-label">Max-Marks
										</label>
										<div class="col-lg-8">
											<input name="maxMarks" type="text" placeholder="Max-Marks" class="form-control">
										</div>
									</div>
									
									
									<div class="form-group">
										<label for="select" class="col-sm-2 control-label">Date-of-Test
										</label>
										<div class="col-lg-8">
										 <input type="text" id="datepicker" name="test_date">
										</div>
									</div>
										
									
									
									
									
								</fieldset>
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
	</div>





</body>
</html>