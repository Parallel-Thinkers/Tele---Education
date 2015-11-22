<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib prefix="s" uri="/struts-tags"%>
 <%@ taglib prefix="sx" uri="/struts-dojo-tags" %>

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
</head>
<body style="background-color:#848484">



		<%@ include file="Sidebar_SC.jsp"%>

<form class="form-horizontal" action="reportissue" method="post">
  <fieldset>
    <br><br><br><br>
<center> <legend >REPORT ISSUES</legend>	</center> 
    <br><br>
  	<div class="form-group">
	   	<label  class="col-lg-4 control-label">Issue History</label>
    	<div class="col-lg-5">
     		<select>
     			<s:iterator value="issuelist">
     				<option ><s:property /></option>		
     			 </s:iterator>
     		</select>
     	</div>
    <br><br> 
   	</div>


  	<div class="form-group">
	   	<label  class="col-lg-4 control-label">Unresolved Issue</label>
    	<div class="col-lg-5">
     		<select>
     			<s:iterator value="unresolvedissue">
     				<option ><s:property /></option>		
     			 </s:iterator>
     		</select>
     	</div>
    <br><br> 
   	</div>


    <div class="form-group">
      <label for="inputEmail" class="col-lg-4 control-label">Issue Title</label>
      <div class="col-lg-5">
        <input class="form-control" name="issuetitle" id="inputEmail" placeholder="Enter Title" type="text" required >
      </div>
    </div>


    <div class="form-group">
      <label for="textArea" class="col-lg-4 control-label">Issue Description</label>
      <div class="col-lg-5">
        <textarea class="form-control" name="issuedesc" placeholder="Enter Issue" rows="3" id="textArea" required></textarea>
        <span class="help-block">A longer block of help text that breaks onto a new line and may extend beyond one line.</span>
      </div>
    </div>


    <div class="form-group">
      <div class="col-lg-6 col-lg-offset-6">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>


  </fieldset>

</form>		 


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Solve Issue</h4>
      </div>
      <div class="modal-body">
<!-- solve issue modal body-->

<form action="solveissue" method="post" enctype="multipart/form-data">
  <fieldset>

  	<div class="form-group">
	   	<label  class="col-lg-4 control-label">Unresolved Issue</label>
    	<div class="col-lg-5">
     		<select class="form-control" name="urissueid">
					<option value="default" selected>Select below</option>
     			<s:iterator value="unresolvedissue">
     				<option ><s:property /></option>		
     			 </s:iterator>
     		</select>
        <button type="submit" class="btn btn-primary">Submit</button>
     	</div>
    <br><br> 
   	</div>
  </fieldset>
</form>
<!--end of modal body-->

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>



</body>
</html>