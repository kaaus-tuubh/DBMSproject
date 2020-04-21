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
<title>Add Placement</title>


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

<body >
<div>
<fieldset>

  <form name="myForm" action = "PlacementServlet" method="post"  enctype = "multipart/form-data">
    
    <label for="cname">Company name :</label>
  	<input type="text" id="name" name="cname" placeholder="Enter company name" required>
	<br><br>
    <label for="job">Job Designation :</label>
	<input type="text" id="location" name="job" placeholder="Enter job designation" required>
    <br><br>
	<label for="lpa">Package (LPA) :</label> 
	<input type="number" id="nature" name="lpa" placeholder="Enter package in lpa" required>
    <br><br>
    <label for="odate">Offer date :<br></label><br> 
    <input type="date" id="nature" name="date" placeholder="Enter offer date" style="width: 210px;height:35px;margin-left:5px;" required>
    <br><br>
	<label for="certificate">Certificate :</label><br>
	<input type="file" name="photo" size = "50"  required>
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
