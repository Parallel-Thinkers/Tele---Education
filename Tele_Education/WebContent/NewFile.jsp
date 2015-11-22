
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
		$(document).ready(function() {
    $(function() {
            $("#Name").onload({
            source : function(request, response) {
                    $.ajax({
                            url : "Load_Taluq",
                            type : "POST",
                            data : {
                                    term : request.term
                            },
                            dataType : "json",
                            success : function(jsonResponse) {
                                    response(jsonResponse.Asm);
                                    for (var i = 0; i < Asm.length; i++) {
                                        console.log(" " + Asm[i]);
                                        $('#Name').append(
                                            '<option value=' + Asm.Name[i] + '>' + Asm.Name[i] + '</option>');
                                    } }
                    });
                    }
            });
    });
});
</script>
		

</body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="height: 8cm; overflow: scroll;">
		<table class="table">
			<thead>
				<tr>
					<th class="TI_NAME">Name</th>

					<th>
				</tr>
			</thead>
			
				<s:iterator value="arrTIModel">
					<tr>
						<th class="TI_NAME"><a href="selectFriend
							?RECIVER_ID=<s:property value="TI_ID"/>&RECIVER_NAME=<s:property value="TI_NAME"/>"> <font size="4"
								color="black"><s:property value="TI_ID"/><s:property value="TI_NAME" /></font></a>
								<input type="text"
										style="display: none; border-color: white; color: white; border-width: 0;"
										name="RECIVER_NAME" value=<s:property value= "TI_NAME" />>
		
								</th>
					
		
					</tr>
				</s:iterator>
		
		</table>
	</div>
	
	Tanay
	
	<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Forum Post</title>
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
      
      $("#class").click(function(event){
    	  var cid = $("select#class").val();
    	 $.getJSON( 'ajaxAction',{
    		 classId : cid 
    	 },function(jsonResponse){
    		 var select = $('#subject');
    	     select.find('option').remove(); 
    	     $.each(jsonResponse.sub, function(key, value) {
    	    	 $('<option>').val(key).text(value).appendTo(select);	 
    	     });
    		 
    	 });
    	  
      });
      
      $("#subject").click(function(event){
    	  var sid = $("select#subject").val();
    	 $.getJSON( 'ajaxAction',{
    		 subId : sid 
    	 },function(jsonResponse){
    		 var select = $('#topic');
    	     select.find('option').remove(); 
    	     $.each(jsonResponse.tag1, function(key, value) {
    	    	 $('<option>').val(key).text(value).appendTo(select);	 
    	     });
    		 
    	 });
    	  
      });
      
      $("#topic").click(function(event){
    	  var tid = $("select#topic").val();
    	 $.getJSON( 'ajaxAction',{
    		 tag1Id : tid 
    	 },function(jsonResponse){
    		 var select = $('#subtopic');
    	     select.find('option').remove(); 
    	     $.each(jsonResponse.tag2, function(key, value) {
    	    	 $('<option>').val(key).text(value).appendTo(select);	 
    	     });
    		 
    	 });
    	  
      });
      
      
      $("#school").click(function(event){
    	  var sid = $("select#school").val(); 
    	 $.getJSON( 'ajaxAction',{
    		 schoolId : sid 
    	 },function(jsonResponse){
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
<div class="row">
<s:form method="post" action="postAction">


<s:select id="school" name="school"
        list="{'Select School'}" label="Select School"
         />
  <br />
   <br />
<s:select id="class" name="classsch"
        list="{'Select Class'}" label="Select class"
         />
         <br />
   <br />
<s:select id="subject" name="subject"
        list="{'Select Subject'}" label="Select subject"
         />
         <br />
   <br />
<s:select id="topic" name="topic"
        list="{'Select Topic'}" label="Select Topic"
         />
         <br />
   <br />
         <s:select id="subtopic" name="subtopic"
        list="{'Select Subtopic'}" label="Select subtopic"
         />

       <br />
   <br />
   <s:textarea id ="question" name="question"  label="Question"></s:textarea>
   <br />
   <br />
   <s:textarea id ="answer" name="answer"  label="Answer"></s:textarea>
<br />
   <br />
   <s:textarea id ="ref" name="ref"  label="Reference"></s:textarea>
   <br />
   <br />
   <s:submit id="submit" name="submit" label="Post"></s:submit>
   
</s:form>
</div>
</body>
</html>
	
	
</body>
</html>
</html>