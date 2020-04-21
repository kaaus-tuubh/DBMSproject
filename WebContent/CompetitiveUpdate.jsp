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
String sql ="select * from competitive_exams where ceid="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!--DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"-->
<html>
<head>
<title>Update Competitive</title>

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

  <form name="myForm" onsubmit="return validateForm();" action = "CompetitiveUpdateServlet" method="post"  enctype = "multipart/form-data">
  
    <input type="hidden" name="id" value="<%=resultSet.getString("ceid") %>">
    <label for="ename">Exam Name / Certification :</label>
  	<input type="text" id="ename" name="ename" placeholder="Enter here..." value="<%=resultSet.getString("examname") %>">
	<br><br>
    <label for="organiser">Certifying Authority / Organizer :</label>
	<input type="text" id="organiser" name="organiser" placeholder="Enter here..." value="<%=resultSet.getString("organizer") %>">
    <br><br>
	<label for="score">Score :</label> 
	<input type="number" id="score" name="score" placeholder="Enter Score..." value="<%=resultSet.getString("score_grade") %>">
    <br><br>
	<table>
	<tr>
	<td>
	<label  style="margin-left:5px;" for="sdate">Start Date :<br></label><br> 
	<input type="date" id="sdate" name="sdate" style="width: 210px;height:35px;margin-left:5px;" value="<%=resultSet.getString("startperiod") %>">
	</td>
	<td>
		<label style="margin-left:200px;">Existing Certificate :</label><br><br>
		<a href="CompetitiveImage.jsp?id=<%=resultSet.getString("ceid")%>" target="_blank" style="margin-left:200px">View</a>
	</td>
	
	</tr>
	<tr>
	<td>
	<label  style="margin-left:5px;" for="edate">End Date :<br></label><br> 
	<input type="date" id="edate" name="edate" style="width: 210px;height:35px;margin-left:5px;" value="<%=resultSet.getString("endperiod") %>">
	</td>
	</td>
	<td><br>
	<label  style="margin-left:200px;">New Certificate :</label>
	<input type="file" name="newphoto" size = "50" style="margin-left:200px;">
	</td>
	</tr>
 	</table>

		
	<br><br>
     
    <br><br>
	<center>
        <a href="CompetitiveIndex.jsp"><input type="button" value="Back"></a>
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
