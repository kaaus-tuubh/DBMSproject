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
String sql ="select * from publication where pubid="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!--DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"-->
<html>
<head>
<title>Update Publication</title>
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
  width: 55%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  background-color: white;
}

label {
	font-family: "Consolas";

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
</style>

</head>

<body>
<div>
<fieldset>

  <form name="myForm" onsubmit="return validateForm();" action = "PublicationUpdateServlet" method="post"  enctype = "multipart/form-data">
    
      <input type="hidden" name="id" value="<%=resultSet.getString("pubid") %>">
    <label for="Title :">Title of the paper :</label>
  	  <input type="text" id="title" name="title" placeholder="Enter Title..." value="<%=resultSet.getString("titlename") %>">
	<br><br>
    <label for="name">Name of the Journal/Proceeding/Edited Book/Conference :</label>
	<input type="text" id="name" name="name" placeholder="Enter here..." value="<%=resultSet.getString("journalname") %>">
    <br><br>
    <label for="organizer">Organizer/Publisher :</label>    
	<input type="text" id="organizer" name="organizer" placeholder="Enter Organiser..." value="<%=resultSet.getString("organiser_publ") %>">
    <br><br>
	<label for="volume">Volume No :</label> 
	<input type="number" id="volume" name="volume" placeholder="Enter Volume no..." value="<%=resultSet.getString("volume_no") %>">
   <br><br>
	<label for="tpages">Total pages :</label> 
	<input type="number" id="tpages" name="tpages" placeholder="Enter Total pages..." value="<%=resultSet.getString("pageno") %>">
  <br><br>
	<label for="factor">ISBN/ISSN No./Impact Factor :</label> 
	<input type="text" id="factor" name="factor" placeholder="Enter here..." value="<%=resultSet.getString("impactfactor") %>">
  <br><br>
	<label for="indexing">Indexing(SCI,Scopus,other) :</label> 
	<input type="text" id="indexing" name="indexing" placeholder="Enter Indexing.." value="<%=resultSet.getString("indexing") %>">
    <br><br>
	<table>
	<tr>
	<td>
    <label for="paid_unpaid">Paid/Unpaid :</label>
				
		 <ul>
			<li>
				<input type="radio" id="paid" name="paid_unpaid" <% if(resultSet.getString("paid_unpaid").equals("Paid")){%>value="<%=resultSet.getString("paid_unpaid") %>" checked<%}else{ %>value="Paid"<%} %>>
				<label for="paid">Paid</label>
			</li>
		
			<li>
				<input type="radio" id="unpaid" name="paid_unpaid" <% if(resultSet.getString("paid_unpaid").equals("Unpaid")){%>value="<%=resultSet.getString("paid_unpaid") %>" checked<%}else{ %>value="Unpaid"<%} %>>
				<label for="unpaid">Unpaid</label>
			</li>
		</ul>
	</td>
	<td>
	<label  style="margin-left:175px;" for="dop">Date of Publication :<br></label><br> 
	<input type="date" id="dop" name="dop" style="width: 210px;height:35px;margin-left:175px;" value="<%=resultSet.getString("pubdate") %>">
	</td>
	</tr>
	<tr>
	<td>
    <br><br>
    <label for="n_i">National/International :</label>
				
		 <ul>
			<li>
				<input type="radio" id="national" name="n_i" <% if(resultSet.getString("nat_internat").equals("National")){%>value="<%=resultSet.getString("nat_internat") %>" checked<%}else{ %>value="National"<%} %>>
				<label for="national">National</label>
			</li>
		
			<li>
				<input type="radio" id="international" name="n_i" <% if(resultSet.getString("nat_internat").equals("International")){%>value="<%=resultSet.getString("nat_internat") %>" checked<%}else{ %>value="International"<%} %>>
				<label for="international">International</label>
			</li>
		</ul>
	</td>
	<td>
	<label  style="margin-left:175px;" for="doi">Date of Issue :<br></label><br> 
	<input type="date" id="doi" name="doi" style="width: 210px;height:35px;margin-left:175px;" value="<%=resultSet.getString("doi") %>">
	</td>
	</tr>
	<tr>
	
	<td>
	<label>Existing Certificate :</label><br>
	<br>
	<a href="PublicationImage.jsp?id=<%=resultSet.getString("pubid")%>" target="_blank" >View</a>
	</td>
	<td>
	<label  style="margin-left:175px;">New Certificate :</label><br>
	<input type="file" name="newphoto" size = "50"  style="margin-left:175px;">
	</td>
	</tr>
	</table>
	<br><br>
     
    <br><br>
        <a href="PublicationIndex.jsp"><input type="button" value="Back"></a>
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
