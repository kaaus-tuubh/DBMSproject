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
<title>Add Publication</title>
<script>
function validateForm() {
	var x = document.forms["myForm"]["title"].value;
	  var y = document.forms["myForm"]["name"].value;
	  var z = document.forms["myForm"]["organizer"].value;
	  var e = document.forms["myForm"]["volume"].value;
	  var c = document.forms["myForm"]["tpages"].value;
	  var p = document.forms["myForm"]["factor"].value;
	  var rp = document.forms["myForm"]["indexing"].value;
	  var reg = document.forms["myForm"]["paid_unpaid"].value;
	  var ay = document.forms["myForm"]["dop"].value;
	  var v = document.forms["myForm"]["n_i"].value;
	  var b = document.forms["myForm"]["doi"].value;
	  
	  if (x == "") {
	    alert("Please enter title of page");
	    return false;
	  }
	  if (y == "") {
	    alert("Please enter Name of the Journal/Proceeding/Edited Book/Conference");
	    return false;
	  }
	  if (z == "") {
	    alert("Please enter Organizer/Publisher");
	    return false;
	  }
	   if (e == "") {
	    alert("Please enter Volume No");
	    return false;
	  }
	  if (c == "") {
	    alert("Please enter Total pages");
	    return false;
	  }
	  if (p == "") {
	    alert("Please enter ISBN/ISSN No./Impact Factor");
	    return false;
	  }
	  if (rp == "") {
	    alert("Please enter Indexing(SCI,Scopus,other)");
	    return false;
	  }
	  if (reg == "") {
	    alert("Please select Paid/Unpaid");
	    return false;
	  }
	  if (ay == "") {
	    alert("Please enter Date of Publication");
	    return false;
	  }
	if (v == "") {
	    alert("Please select National/International");
	    return false;
	  }
	if (b == "") {
	    alert("Please enter Date of Issue");
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
  width: 47%;
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

  <form name="myForm" onsubmit="return validateForm();" action = "PublicationServlet" method="post"  enctype = "multipart/form-data">
    
    <label for="Title :">Title of the paper :</label>
  	<input type="text" id="title" name="title" placeholder="Enter Title..." required>
	<br><br>
    <label for="name">Name of the Journal / Proceeding / Edited Book / Conference :</label>
	<input type="text" id="name" name="name" placeholder="Enter here..." required>
    <br><br>
    <label for="organizer">Organizer / Publisher :</label>    
	<input type="text" id="organizer" name="organizer" placeholder="Enter Organiser..." required>
    <br><br>
	<label for="volume">Volume No :</label> 
	<input type="number" id="volume" name="volume" placeholder="Enter Volume no..." required>
   <br><br>
	<label for="tpages">Total pages :</label> 
	<input type="number" id="tpages" name="tpages" placeholder="Enter Total pages..." required>
  <br><br>
	<label for="factor">ISBN / ISSN No. / Impact Factor :</label> 
	<input type="text" id="factor" name="factor" placeholder="Enter here..." required>
  <br><br>
	<label for="indexing">Indexing (SCI,Scopus,other) :</label> 
	<input type="text" id="indexing" name="indexing" placeholder="Enter Indexing.." required>
    <br><br>
	<table>
	<tr>
	<td>
    <label for="paid_unpaid">Paid/Unpaid :</label>
				
		 <ul>
			<li>
				<input type="radio" id="paid" name="paid_unpaid" value="Paid" required>
				<label for="paid">Paid</label>
			</li>
		
			<li>
				<input type="radio" id="unpaid" name="paid_unpaid" value="Unpaid" required>
				<label for="unpaid">Unpaid</label>
			</li>
		</ul>
	</td>
	<td>
	<label  style="margin-left:200px;" for="dop">Date of Publication :<br></label><br> 
	<input type="date" id="dop" name="dop" style="width: 210px;height:35px;margin-left:200px;" required>
	</td>
	</tr>
	<tr>
	<td>
    <br><br>
    <label for="n_i">National/International :</label>
				
		 <ul>
			<li>
				<input type="radio" id="national" name="n_i" value="National" required>
				<label for="national">National</label>
			</li>
		
			<li>
				<input type="radio" id="international" name="n_i" value="International" required>
				<label for="international">International</label>
			</li>
		</ul>
	</td>
	<td>
	<label  style="margin-left:200px;" for="doi">Date of Issue :<br></label><br> 
	<input type="date" id="doi" name="doi" style="width: 210px;height:35px;margin-left:200px;" required>
	</td>
	</tr>
	</table>
	<br><br>
	<label  style="margin-left:2px;">Certificate :</label><br>
	<input type="file" name="photo" size = "50" required  style="margin-left:2px;">
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
