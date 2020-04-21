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
String sql ="select * from achievement where achid="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!--DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"-->
<html>
<head>

<title>Update Achievement</title>

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

label {
	font-family: "Consolas";

}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>

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
	    return false;
	  }
	  if (ename == "") {
	    alert("Please fill Name of the event");
	    return false;
	  }
	  if (organiser == "") {
	    alert("Please fill Organiser name");
	    return false;
	  }
	  if (city == "") {
	    alert("Please fill City name");
	    return false;
	  }
	  if (inter_intra == "") {
	    alert("Please fill Inter/Intra");
	    return false;
	  }

	  if (edate == "") {
	    alert("Please fill Event date");
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
</head>
<body>

<div>		
<fieldset>

  <form name="myForm" onsubmit="return validate();" action = "AchievementUpdate" method="post"  enctype = "multipart/form-data">
  <input type="hidden" name="id" value="<%=resultSet.getString("achid") %>">
    <label for="achievement">Achievement/Awards/Honors </label>
  	  <input type="text" id="achievement" name="aname" placeholder="Achievement"  value="<%=resultSet.getString("achname") %>">
	<br><br>
    <label for="ename">Name of the Event :</label>
	<input type="text" id="ename" name="ename" placeholder="Event name" value="<%=resultSet.getString("eventname") %>">
    <br><br>
    <label for="organizer">Organizer :</label>    
	<input type="text" id="organizer" name="organizer" placeholder="Organizer" value="<%=resultSet.getString("achorganiser") %>">
    <br><br>
	<label for="city">City</label> 
	<input type="text" id="city" name="city" placeholder="city" value="<%=resultSet.getString("achcity") %>">
    <br><br>
	<table>
	<tr>
	<td>
    <label for="inter_intra">Inter-college / Intra-college</label>
				
		 <ul>
			<li>
				<input type="radio" id="inter" name="inter_intra"  <% if(resultSet.getString("inter_intra").equals("Intercollege")){%>value="<%=resultSet.getString("inter_intra") %>" checked<%}else{ %>value="Intercollege"<%} %>>
				<label for="inter">Inter-college</label>
			</li>
		
			<li>
				<input type="radio" id="intra" name="inter_intra" <% if(resultSet.getString("inter_intra").equals("Intracollege")){%>value="<%=resultSet.getString("inter_intra") %>" checked<%}else{ %>value="Intracollege"<%} %>>
				<label for="intra">Intra-college</label>
			</li>
		</ul>
	</td>
	<td>
	<label  style="margin-left:200px;" for="eventdate">Event date :<br></label><br> 
	<input type="date" id="eventdate" name="eventdate" value="<%=resultSet.getString("eventdate") %>"style="width: 210px;height:35px;margin-left:200px;">
	</td>
	</tr>
	<tr>
	<td>
    <br><br>
    <label for="state">Within-state / Outside-state</label>
				
		 <ul>
			<li>
				<input type="radio" id="within" name="state" <% if(resultSet.getString("achstate").equals("Within State")){%>value="<%=resultSet.getString("achstate") %>" checked<%}else{ %>value="Within State"<%} %>>
				<label for="within">Within-State</label>
			</li>
		
			<li>
				<input type="radio" id="outside" name="state" <%  if(resultSet.getString("achstate").equals("Outside State")){%>value="<%=resultSet.getString("achstate") %>" checked<%}else{ %>value="Outside State"<%} %>>
				<label for="outside">Outside-state</label>
			</li>
		</ul>
	</td>
	<td>
		<label style="margin-left:200px">Existing Certificate :</label><br><br>
		<a href="AchievementImage.jsp?id=<%=resultSet.getString("achid")%>" target="_blank" style="margin-left:200px"> View </a>
	</tr>
	<tr>
	<td>
   <br><br>
    <label for="w_p">Winner / Participant</label>
	
		 <ul>
			<li>
				<input type="radio" id="winner" name="w_p" <% if(resultSet.getString("winner_participation").equals("Winner")){%>value="<%=resultSet.getString("winner_participation") %>" checked<%}else{ %>value="Winner"<%} %>>
				<label for="winner">Winner</label>
			</li>
		
			<li>
				<input type="radio" id="participation"  name="w_p" <% if(resultSet.getString("winner_participation").equals("Participant")){%>value="<%=resultSet.getString("winner_participation") %>" checked<%}else{ %>value="Participant"<%} %>>
				<label for="participation">Participation</label>
			</li>
		
		 </ul>
		 </td>
		 <td>
		<label  style="margin-left:200px;">New Certificate :</label><br>
		<input type="file" name="newphoto"  size = "50" style="margin-left:200px;">
		</td>
		 </tr>
		 </table>
	<br><br>
     <center>
    <br><br>
    <a href="AchievementIndex.jsp"><input type="button" value="Back"></a>
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