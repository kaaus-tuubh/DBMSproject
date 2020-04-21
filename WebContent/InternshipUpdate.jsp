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
String sql ="select * from internship where intid="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!--DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"-->
<html>
<head>
<title>Update Internship</title>

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
  border: 1px s""olid;
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

  <form name="myForm" onsubmit="return validateForm();" action = "InternshipUpdateServlet" method="post"  enctype = "multipart/form-data">
  
    <input type="hidden" name="id" value="<%=resultSet.getString("intid") %>">
    <label for="name">Company/Institution name :</label>
  	<input type="text" id="name" name="name" placeholder="Enter here..." value="<%=resultSet.getString("companyname") %>">
	<br><br>
    <label for="location">Location :</label>
	<input type="text" id="location" name="location" placeholder="Enter location..." value="<%=resultSet.getString("intlocation") %>">
    <br><br>
	<label for="nature">Nature of Responsibility/Work :</label> 
	<input type="text" id="nature" name="nature" placeholder="Enter here..." value="<%=resultSet.getString("worknature") %>">
    <br><br>
	<table>
	<tr>
	<td>
        <label for="status">Status :</label><br>
	
		 <ul>
			<li>
				<input type="radio" id="ongoing" name="status" <% if(resultSet.getString("intstatus").equals("Ongoing")){%>value="<%=resultSet.getString("intstatus") %>" checked<%}else{ %>value="Ongoing"<%} %>>
				<label for="ongoing">Ongoing</label>
			</li>
		
			<li>
				<input type="radio" id="completed" name="status" <% if(resultSet.getString("intstatus").equals("Completed")){%>value="<%=resultSet.getString("intstatus") %>" checked<%}else{ %>value="Completed"<%} %>>
				<label for="completed">Completed</label>
			</li>
		
		 </ul>
    </td>
	<td>
		<label style="margin-left:175px;">Existing Certificate :<br></label><br>
		<a href="InternshipImage.jsp?id=<%=resultSet.getString("intid")%>" target="_blank" style="margin-left:175px">View</a>
	</td>
	</tr>
	<tr>
	<td>
	<br>
	<label for="sdate">Start Date :<br></label><br>
	<input type="date" id="sdate" name="sdate" style="width: 210px;height:35px;margin-left:5px;" value="<%=resultSet.getString("startperiod") %>">
	</td>
	<td>
	<label  style="margin-left:175px;">New Certificate :</label><br>
	<input type="file" name="newphoto" size = "50" style="margin-left:175px;">
	</td>
	</tr>
	<tr>
	<td>
	<br>
	<label for="edate">End Date :<br></label><br>
	<input type="date" id="edate" name="edate" style="width: 210px;height:35px;" value="<%=resultSet.getString("endperiod") %>">
	</td>
        
		 </tr>
	</table>
     
    <br><br>
	<center>
        <a href="InternshipIndex.jsp"><input type="button" value="Back"></a>
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
s