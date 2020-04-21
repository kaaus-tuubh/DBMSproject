<!--DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"-->
<html>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("RegID")==null)
{
	response.sendRedirect("Login.jsp");
}
else{ %>
<head>
<title>Add Activity </title>

<script>
function validateForm() {
	var x = document.forms["myForm"]["chapter"].value;
	  var y = document.forms["myForm"]["event"].value;
	  var z = document.forms["myForm"]["nature"].value;

	  var c = document.forms["myForm"]["sdate"].value;
	  var p = document.forms["myForm"]["edate"].value;

	  
	  var letters = /^[A-Za-z]+$/;
	  var letterNumber = /^[0-9a-zA-Z]+$/;
	  var num=/^[0-9]{4}$/;

	  if (x == "") {
	    alert("Please fill Professional Body/Chapter");
	    return false;
	  }

	  if (y == "") {
	    alert("Please enter event name");
	    return false;
	  }
	 

	  
	  if (z == "") {
	    alert("Please enter nature of Responsibility/Work");
	    return false;
	  }
	  if (c == "") {
	    alert("Please enter start date");
	    return false;
	  }
	  if (p == "") {
	    alert("Please enter end date");
	    return false;
	  }
	  if(c>p)
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

  <form name="myForm" onsubmit="return validateForm();" action = "ActivityServlet" method="post"  enctype = "multipart/form-data">
  
    <label for="chapter">Professional Body/Chapter :</label>
  	<input type="text" id="capter" name="chapter" placeholder="Enter here..." required>
	<br><br>
    <label for="event">Event :</label>
	<input type="text" id="event" name="event" placeholder="Event" required>
    <br><br>
    <label for="nature">Nature of Responsibility/Work :</label>    
	<input type="text" id="organizer" name="nature" placeholder="nature"  required>
    <br><br>
	<table>
	<tr>
	<td>
	<label  style="margin-left:5px;" for="sdate">Start Date :<br></label><br> 
	<input type="date" id="sdate" name="sdate" style="width: 210px;height:35px;margin-left:5px;" required>
	</td>
	<td>
	<label  style="margin-left:200px;">Certificate :</label><br>
	<input type="file" name="photo" size = "50"  style="margin-left:200px;" required>
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