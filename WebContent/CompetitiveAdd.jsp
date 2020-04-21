<!--DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"-->
<html>
<head>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("RegID")==null)
{
	response.sendRedirect("Login.jsp");
}
else{ %>

<title>Add Competitive Exam</title>

<script>
function validateForm() {
	 var x = document.forms["myForm"]["ename"].value;
	  var y = document.forms["myForm"]["organiser"].value;
	  var z = document.forms["myForm"]["score"].value;
	  var e = document.forms["myForm"]["sdate"].value;
	  var c = document.forms["myForm"]["edate"].value;



	  if (x == "") {
	    alert("Please enter exam Name/Certification");
	    return false;
	  }

	  

	  if (y == "") {
	    alert("Please enter Certifying Authority/Organiser");
	    return false;
	  }
	 

	  
	  if (z == "") {
	    alert("Please enter score");
	    return false;
	  }

	   if (e == "") {
	    alert("Please enter start date");
	    return false;
	  }
	  if (c == "") {
	    alert("Please enter end date");
	    return false;
	  }
	  if(e>c)
	  {
		alert("Start date should be less than end date");
	        return false;

	  }
	  
	  return true; 
}
</script>

<style>

input[type=email],input[type=number],input[type=text],input[type=password],select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=file],select {
  width: 49%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  background-color: white;
}

input[type=submit] {
  width: 100%;
  background-color: #5bc0de;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: 1px solid;
  border-color: #46b8da;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #46b8da;
}

fieldset{
  margin-top: 20px;
  margin-bottom: 100px;
  margin-right: 400px;
  margin-left: 400px;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

label {
	font-family: "Consolas";

}
</style>

</head>
<body>
<div>	
<fieldset>

  <form name="myForm" onsubmit="return validateForm();" action = "CompetitiveServlet" method="post"  enctype = "multipart/form-data">
    <label for="ename">Exam Name  / Certification :</label>
  	  <input type="text" id="ename" name="ename" placeholder="Enter here..." required>
	<br><br>
    <label for="organiser">Certifying Authority/Organizer :</label>
	<input type="text" id="organiser" name="organiser" placeholder="Enter here..." required>
    <br><br>
	<label for="score">Score :</label> 
	<input type="number" id="score" name="score" placeholder="Enter Score..." required>
    <br><br>
	<table>
	<tr>
	<td>
	<label  style="margin-left:5px;" for="sdate">Start Date :<br></label><br> 
	<input type="date" id="sdate" name="sdate" style="width: 210px;height:35px;margin-left:5px;" required>
	</td>
	<td>
	<label  style="margin-left:200px;">Certificate :</label><br>
	<input type="file" name="photo" size = "50" required  style="margin-left:200px;" required>
	</td>
	</tr>
 	</table>
	<br>
	<label  style="margin-left:5px;" for="edate">End Date :<br></label><br> 
	<input type="date" id="edate" name="edate" style="width: 210px;height:35px;margin-left:5px;" required>
		
	<br><br>
     
    <br><br>
    <input type="submit" value="Submit" >
  </form>
</fieldset>
</div>

 <%
 }
 %>

</body>
</html>
