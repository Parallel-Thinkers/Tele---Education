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

<script>

function issuedetails(school){
//	alert("inside ajax");
	
	var xmlhttp;
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
			 console.log(xmlhttp.responseText);
		    document.getElementById("details").innerHTML=xmlhttp.responseText;
		    //event.preventDefault();
		   
	    }
	  }
xmlhttp.open("POST","issuedetails?school="+school,true);
	xmlhttp.send();
//	alert("ajax call send");
	return true;
	// event.preventDefault();
	//event.preventDefault();	
}
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
	<center> <legend >UNRESOLVED ISSUES</legend>	</center> 
	    <br><br>
	<center><h5><em>*Select school name to get unresolved/resolved issues of school</em></h5></center>
	  	<div class="form-group">
		   	<label  class="col-lg-6 control-label">School Name</label>
	    	<div class="col-lg-5">
	     		<select onchange="issuedetails(this.value)">
	     			<s:iterator value="schoollist">
	     				<option ><s:property /></option>		
	     			 </s:iterator>
	     		</select>
	     	</div>
	    <br><br> 
	   	</div>

<div id="details"></div>

  </fieldset>

</form>		 




</body>
</html>