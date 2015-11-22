<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib prefix="s" uri="/struts-tags"%>
 <%@ taglib prefix="sx" uri="/struts-dojo-tags" %>

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
<body style="background-color:#848484">

		<%@ include file="Sidebar.jsp"%>

<form class="form-horizontal" action="reportissue" method="post">
  <fieldset>
	    <br><br><br>
	<center> <legend >SYSTEM STATUS</legend>	</center> 
	    <br><br>
  	<div class="form-group">
	   	<label  class="col-lg-4 control-label"></label>
    	<div class="col-lg-6">
<div style="max-height:200px; width:100%; overflow:auto;">
	
 <table class="table" style="border:0.5px;" >
    <thead>
      <tr>
        <th>SCHOOL NAME</th>
        <th>STATUS</th>
      </tr>
    </thead>
   
    <s:iterator value="a1">
    
    <tbody>
     <tr>
        <td><s:property /></td>
        <td>Not Working</td>
     </tr>
    </tbody>
    </s:iterator>
  </table>
 </div>
     	</div>
    <br><br> 
   	</div>

  </fieldset>

</form>		 




</body>
</html>