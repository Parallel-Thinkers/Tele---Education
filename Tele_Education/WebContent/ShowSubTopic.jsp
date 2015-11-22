<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SC Dashboard</title>
</head>
<body>

								<div class="form-group">
										<label for="select" class="col-sm-2 control-label">Select
											Sub-Topic</label>
										<div class="col-lg-8">
										
											<select class="form-control" id="subject" name="Topic" onchange="testTopic()" >
												<s:iterator value="gstm.gstm_array">
													<option value="<s:property/>"> <s:property/></option>
												</s:iterator>
											</select>
										</div>
									</div>

</body>
</html>