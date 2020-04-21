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
<title>Add Internship</title>

<script>
function validateForm() {
	var x = document.forms["myForm"]["name"].value;
	  var y = document.forms["myForm"]["location"].value;
	  var z = document.forms["myForm"]["nature"].value;
	  var e = document.forms["myForm"]["status"].value;
	  var c = document.forms["myForm"]["sdate"].value;
	  var p = document.forms["myForm"]["edate"].value;


	  if (x == "") {
	    alert("Please enter Company/Institution name ");
	    return false;
	  }


	  if (y == "") {
	    alert("Please enter location");
	    return false;
	  }

	  
	  if (z == "") {
	    alert("Please enter Nature of Responsibility/Work");
	    return false;
	  }

	  
	   if (e == "") {
	    alert("Please select Status");
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
  border: 1px s""olid;
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

<body bgcolor="#d3d3d3">
<div>
<fieldset>

  <form name="myForm" onsubmit="return validateForm();" action = "InternshipServlet" method="post"  enctype = "multipart/form-data">
    
    <label for="name">Company/Institution name :</label>
  	<input type="text" id="name" name="name" placeholder="Enter here..." required>
	<br><br>
    <label for="location">Location :</label>
	<input type="text" id="location" name="location" placeholder="Enter location..." required>
    <br><br>
	<label for="nature">Nature of Responsibility/Work :</label> 
	<input type="text" id="nature" name="nature" placeholder="Enter here..." required>
    <br><br>
	<table>
	<tr>
	<td>
        <label for="status">Status :</label><br>
	
		 <ul>
			<li>
				<input type="radio" id="ongoing" name="status" value="Ongoing" required>
				<label for="ongoing">Ongoing</label>
			</li>
		
			<li>
				<input type="radio" id="completed" name="status" value="Completed" required>
				<label for="completed">Completed</label>
			</li>
		
		 </ul>
		 </td>
	
	<td>
	<label  style="margin-left:200px;">Certificate :</label><br>
	<input type="file" name="photo" size = "50" required  style="margin-left:200px;">
	</td>
	</tr>
	<tr>
	<td>
	<label  style="margin-left:5px;" for="sdate">Start Date :<br></label><br>
	<input type="date" id="sdate" name="sdate" style="width: 210px;height:35px;margin-left:5px;" required>
	</td>
	</tr>
	<tr>
	<td>
	<br>
	<label style="margin-left:5px;" for="edate">End Date :<br></label><br>
	<input type="date" id="edate" name="edate" style="width: 210px;height:35px;margin-left:5px;" required>
	</td>
        
		 </tr>
	</table>

		
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
