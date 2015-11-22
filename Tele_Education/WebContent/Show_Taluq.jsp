<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="robots" content="noodp" />
<!-- Login -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery-2.0.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/notification.js"></script>

<title>Register</title>
<script src="js/jquery-2.1.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</head>
<body>
<div class="form-group">
							<div class="Line rw">
								<div class="unit size1of3 lf">

									<label class="fk-label" for="Taluq"
										class="col-sm-2 control-label">Taluq </label>
								</div>
								<div class="unit size3of4 lastUnit rt">
								
								


									<select name="Name" class="form-control" style="width: 170px">
										<s:iterator value="Asm">

											<option value="<s:property value="Name"/>"><s:property
													value="Name" /></option>
										</s:iterator>
									</select>
								</div>
							</div>
						</div>


</body>
</html>