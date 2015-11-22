<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forum</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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


<link href="css/bootstrap.min.css" rel="stylesheet"/>
<script src="js/jquery-1.11.3.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js"></script>
<SCRIPT >
$(document).ready(function() { 
	
	 $.getJSON('lfilterAction', {

     }, function(jsonResponse) {
       var select = $('#filter');
       $.each(jsonResponse.sub, function(key, value) {
       $('<input>',{ type:'checkbox', value:key , label:value   }).appendTo(select);
       $('<label>').append("&nbsp;&nbsp;"+value).appendTo(select);
       $('<br>').appendTo(select);
             });
       $('<button>').text("Apply").addClass("btn btn-primary").appendTo(select);
     });
	
	$('.likeButton').click(function(){
		
	  var id = $(this).closest("div").attr("id");
	  var text =	parseInt($('#'+id).children("label").attr("value"));
	  var btext = $('#'+id).children("button").text();
		
	
	
	
		if(btext == "Like ")
		{
			 $('#'+id).children("button").text("Unlike");
			 $('#'+id).children("label").text(text+1 +" Likes"); 
			
			}
		else
			{
			$('#'+id).children("button").text("Like ")	;
			 $('#'+id).children("label").text(text +" Likes");
			
			} 
		//$()
		//alert(va);
		
	});
	
	 
});


</SCRIPT>

</head>
<body>
<div class="container">
<%@ include file="Sidebar.jsp"%>

   <h1>FORUM</h1>

   <div class="row">

      <s:div id="filter" name="filter" class="col-sm-3"  >
        <%--  <s:checkbox id="subject"  name="subject" label="Subject" /> --%>
      </s:div>

      <s:div id="posts" class="col-sm-9"  >
       
		<s:iterator value="posts" var="i" >
			<div>
			<p>Question :<s:property value="#i.question" /> </p>
			
			<p>Answer : <s:property value="#i.answer" /> </p>
			
			<p>Refrences : <s:property value="#i.ref" /> </p>
			<div class="likediv" id ="<s:property value="#i.textid" />" style="width:100px;" >
			<BUTTON class ="likeButton btn btn-primary">Like </BUTTON>
			<LABEL   value= "<s:property value="#i.upvote" />" > <s:property value="#i.upvote" /> Likes</LABEL>
			<BR />
			</div></div>
		
		</s:iterator>
		
		
   </s:div>
 
</div>
</div>
</body>
</html>
