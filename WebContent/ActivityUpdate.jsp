<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("RegID")==null)
{
	response.sendRedirect("Login.jsp");
}
else{
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "miniproject";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from activity where actid="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!--DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"-->
<html>
<head>
<title>Update Activity </title>
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
  width: 55%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  background-color: white;
}

input[type=submit],[type=reset],[type=button]{
  width: 30%;
  background-color: #5bc0de;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: 1px solid;
  border-color: #46b8da;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover,[type=reset]:hover,[type=button]:hover {
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

  <form name="myForm" onsubmit="return validateForm();" action = "ActivityUpdateServlet" method="post"  enctype = "multipart/form-data">
    
      <input type="hidden" name="id" value="<%=resultSet.getString("actid") %>">
    
	<label for="chapter">Professional Body/Chapter :</label>
  	  <input type="text" id="capter" name="chapter" placeholder="Enter here..." value="<%=resultSet.getString("proffbody_chapter") %>">
	<br><br>
    <label for="event">Event :</label>
	<input type="text" id="event" name="event" placeholder="Event" value="<%=resultSet.getString("eventname") %>">
    <br><br>
    <label for="nature">Nature of Responsibility/Work :</label>    
	<input type="text" id="organizer" name="nature" placeholder="nature" value="<%=resultSet.getString("worknature") %>">
    <br><br>
	<table>
	<tr>
	<td>
	<label  style="margin-left:5px;" for="sdate">Start Date :<br></label><br> 
	<input type="date" id="sdate" name="sdate" style="width: 210px;height:35px;margin-left:5px;" value="<%=resultSet.getString("startperiod") %>">
	</td>
	<td>
		<label style="margin-left:175px;">Existing Certificate :</label><br><br>
		<a href="ActivityImage.jsp?id=<%=resultSet.getString("actid")%>" target="_blank" style="margin-left:175px">View</a>
	</td>
	
 	</tr>
        <tr>
	
 	<td>
	<br>
	<label  style="margin-left:5px;" for="edate">End Date :<br></label><br> 
	<input type="date" id="edate" name="edate" style="width: 210px;height:35px;margin-left:5px;" value="<%=resultSet.getString("endperiod") %>">
	</td>
	<td>
	<br>
	<label  style="margin-left:175px;">New Certificate :</label><br>
	<input type="file" name="newphoto"  size = "50" style="margin-left:175px;">
	</td>
	</tr>
	</table>
	
	<br><br>
     
    <br><br>
	<center>
    <a href="ActivityIndex.jsp"><input type="button" value="Back"></a>
    <input type="submit" value="Submit">
    <input type="reset" value="Reset">
  </form>
</fieldset>
</div>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}}
%>
</body>
</html>
