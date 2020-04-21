<!--DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"-->
<html>
<head>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("RegID")==null)
{
	response.sendRedirect("Login.jsp");
}
else{
%>

<html>

<head>

<title>Add Achievement</title>

<script>
function validate(){
	  var aname = document.forms["myForm"]["aname"].value;
	  var ename = document.forms["myForm"]["ename"].value;

	  var organiser = document.forms["myForm"]["organizer"].value;
	  var city = document.forms["myForm"]["city"].value;
	  
	  var inter_intra = document.forms["myForm"]["inter_intra"].value;
	  var edate = document.forms["myForm"]["eventdate"].value;

	  var state = document.forms["myForm"]["state"].value;
	  var w_p = document.forms["myForm"]["w_p"].value;



	  if (aname == "") {
	    alert("Please fill Achievement/Awards/Honors");
	    document.myForm.aname.focus();
	    return false;
	  }
	  if (ename == "") {
	    alert("Please fill Name of the event");
	    document.myForm.ename.focus();
	    return false;
	  }
	  if (organiser == "") {
	    alert("Please fill Organiser name");
	    return false;
	  }
	  if (city == "") {
	    alert("Please fill City name");
	    document.myForm.city.focus();
	    return false;
	  }
	  if (inter_intra == "") {
	    alert("Please fill Inter/Intra");
	    return false;
	  }

	  if (edate == "") {
	    alert("Please fill Event date");
	    document.myForm.edate.focus();
	    return false;
	  }

	  if (state== "") {
	    alert("Please fill Within/Outside state");
	 
	    return false;
	  }

	  if (w_p== "") {
	    alert("Please fill Winner/Participation");

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

  <form name="myForm" onsubmit="return validate();" action = "Achieve" method="post"  enctype = "multipart/form-data">
  
    <label for="achievement">Achievement/Awards/Honors </label>
  	<input type="text" id="achievement" name="aname" placeholder="Achievement" >
	<br><br>
    <label for="ename">Name of the Event :</label>
	<input type="text" id="ename" name="ename" placeholder="Event name" >
    <br><br>
    <label for="organizer">Organizer :</label>    
	<input type="text" id="organizer" name="organizer" placeholder="Organizer" >
    <br><br>
	<label for="city">City</label> 
	<input type="text" id="city" name="city" placeholder="city" >
    <br><br>
	<table>
	<tr>
	<td>
    <label for="inter_intra">Inter-college / Intra-college</label>
				
		 <ul>
			<li>
				<input type="radio" id="inter" name="inter_intra" value="Intercollege" required>
				<label for="inter">Inter-college</label>
			</li>
		
			<li>
				<input type="radio" id="intra" name="inter_intra" value="Intracollege" required>
				<label for="intra">Intra-college</label>
			</li>
		</ul>
	</td>
	<td>
	<label  style="margin-left:200px;" for="eventdate">Event date :<br></label><br> 
	<input type="date" id="eventdate" name="eventdate" style="width: 210px;height:35px;margin-left:200px;"  >
	</td>
	</tr>
	<tr>
	<td>
    <br><br>
    <label for="state">Within-state / Outside-state</label>
				
		 <ul>
			<li>
				<input type="radio" id="within" name="state" value="Within State" required>
				<label for="within">Within-State</label>
			</li>
		
			<li>
				<input type="radio" id="outside" name="state" value="Outside State" required>
				<label for="outside">Outside-state</label>
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
   <br><br>
    <label for="w_p">Winner / Participant</label>
	
		 <ul>
			<li>
				<input type="radio" id="winner" name="w_p" value="Winner" required>
				<label for="winner">Winner</label>
			</li>
		
			<li>
				<input type="radio" id="participation" name="w_p" value="Participant" required>
				<label for="participation">Participation</label>
			</li>
		
		 </ul>
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
