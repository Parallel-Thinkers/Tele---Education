<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

 <%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
     <%@ taglib prefix="s" uri="/struts-tags"%>

  	<div class="form-group">
	   	<label  class="col-lg-4 control-label"></label>
    	<div class="col-lg-6">
<div style="max-height:200px; width:100%; overflow:auto;">
	
 <table class="table" style="border:0.5px;" >
    <thead>
      <tr>
        <th>Issue Title</th>
        <th>Issue Description</th>
        <th>Issue Status</th>
      </tr>
    </thead>
   
    <s:iterator value="list">
    
    <tbody>
     <tr>
        <td><s:property value="ititle"/></td>
        <td><s:property value="idesc"/></td>
        <td><s:property value="istatus"/></td>
     </tr>
    </tbody>
    </s:iterator>
  </table>
 </div>
     	</div>
    <br><br> 
   	</div>



					
					
