<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Student</title>
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

<SCRIPT language="javascript"><!--
        function addRow(tableID) {
 
            var table = document.getElementById(tableID);
 
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
 
            var cell1 = row.insertCell(0);
            var element1 = document.createElement("input");
            element1.type = "checkbox";
            element1.name="chkbox[]";
            cell1.appendChild(element1);
 
            var cell2 = row.insertCell(1);
            cell2.innerHTML = rowCount;
            
            
            var cell3 = row.insertCell(2);
            var element2 = document.createElement("input");
            element2.type = "text";
            var length=(table.rows.length)-1;
            element2.name = "rollnumber";
            cell3.appendChild(element2);
            
 
            var cell4 = row.insertCell(3);
            var element3 = document.createElement("input");
            element3.type = "text";
            var length4=(table.rows.length4)-1;
            element3.name = "name";
            cell4.appendChild(element3);
           
            

            var cell5 = row.insertCell(4);
            var element4 = document.createElement("input");
            element4.type = "text";
            var length5=(table.rows.length5)-1;
            element4.name = "address";
            cell5.appendChild(element4);
           
            
            
            
 
        }
 
        function deleteRow(tableID) {
            try {
            var table = document.getElementById(tableID);
            var rowCount = table.rows.length;
 
            for(var i=0; i<rowCount; i++) {
                var row = table.rows[i];
                var chkbox = row.cells[0].childNodes[0];
                if(null != chkbox && true == chkbox.checked) {
                    table.deleteRow(i);
                    rowCount--;
                    i--;
                }
            }
            }catch(e) {
                alert(e);
            }
        }
 
    </SCRIPT>




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

		<form action="submitStudent" method="get">
		<h4>Select class to enter data</h4>
		 <select name="cls" style="width: 100px" >
  <option  value="5">5</option>
  <option value="6">6</option>
  <option value="7">7</option>
  <option value="8">8</option>
  <option value="9">9</option>
  <option value="10">10</option>
</select> 
			<fieldset>
				<legend>Enter Student Detail</legend>
				<ol>

					<li>

						<TABLE id="dataTable" width="700px" border="1">
							<thead>
								<tr>
									<th></th>
									<th>Sr.no</th>
									<th>Roll number</th>
									<th>Name</th>
									<th>Address</th>
								</tr>
							</thead>

						</TABLE>
					</li>
					<INPUT type="button" value="Add Student"
						onclick="addRow('dataTable')" />
					<INPUT type="button" value="Delete Student"
						onclick="deleteRow('dataTable')" />
				</ol>
</fieldset>
	
	
	
	
			<fieldset>
				<button type=submit>ADD Students!</button>
			</fieldset>
		</form>
</body>
</html>
</body>
</html>