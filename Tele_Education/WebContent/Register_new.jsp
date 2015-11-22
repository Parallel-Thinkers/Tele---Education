<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AddToCompare</title>
<script>
	
</script>
</head>
<body>

<div class="jumbotron">
				<h2 >Name: Mujahid Ali&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RollNO: MT2014068</h2>
			</div>



	<label for="UP_name" class="col-sm-2 control-label">Select
											Taluq</label>

										<!-- <div style="height: 8cm; overflow: scroll;"> -->
										<select name="Taluq">
											<s:iterator value=" asmm"> -
											<option value="<s:property value="Taluq"/>"><s:property
														value="Taluq" />
												</option>
											</s:iterator>
										</select>
	
<!-- </div> -->


</body>
</html>