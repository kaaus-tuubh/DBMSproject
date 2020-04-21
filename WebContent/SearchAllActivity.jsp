<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.http.HttpSession" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("RegID")==null)
{
	response.sendRedirect("LoginAdmin.jsp");
}
else{


String sdate=session.getAttribute("sdate").toString();
String edate=session.getAttribute("edate").toString();
String me = session.getAttribute("me").toString();


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
<html>
<style>
table, th, td {
  border: 0px solid black;
  border-collapse: collapse;
}
th {
	font-size:20px;
	color: white;
    background-color: slategrey;
}

td {
 	font-family:monospace;
 	font-size:17px;
}


table caption {
	padding: .5em 0;
}

@media screen and (max-width: 767px) {
  table caption {
    border-bottom: 1px solid #ddd;
  }
}
</style>
<head>
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>All Details</title>

	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/hover.min.css">
	
	<link rel="stylesheet" href="css/core.css">

	<!-- Custom styles for this template -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/responsive.css">
	</head>
		<body>
		<header id="masthead" class="site-header header-3">
			<div class="top-header">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-xsm-6">
							<p style="		  font-size:larger;
										    color: dimgray;
										    font-style: unset; ">
								<i class="fa fa-user-circle-o" aria-hidden="true"></i>
								<a href="studentprofile.jsp"><%=me%></a>
							</p>
						</div>
						<div class="col-sm-6 col-md-6">
							<ul class="list-unstyled list-inline">
								<li>
									
										<a href="LogoutAdminServlet" class="btn btn-info" style="background-color: darkgray;">LOGOUT</a>
									
								</li>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
				<br><br>	
		&nbsp&nbsp<a href="Admin.jsp">Back to Search Page</a>	
		<br>
			
			<section class="header-3-navigation">
			<div class="container">
				<div class="row">
					<nav id="site-navigation" class="navbar">
						<div class="navbar-offcanvas navbar-offcanvas-touch navbar-offcanvas-right offcanvas-transform js-offcanvas-done" id="js-bootstrap-offcanvas">
							
							<ul class="nav navbar-nav">
								<li><a href="SearchAll.jsp">ALL DETAILS</a></li>
								<li><a href="SearchAllAchievement.jsp">ACHIEVEMENTS</a></li>
								<li><a href="SearchAllPublications.jsp">PUBLICATIONS</a></li>
								<li class="active"><a href="SearchAllActivity.jsp">ACTIVITIES</a></li>
								<li><a href="SearchAllInternship.jsp">INTERNSHIPS</a></li>
								<li><a href="SearchAllCompetitive.jsp">COMPETITIVE EXAMS</a></li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</section>
				
		<section class="welcome">

		<div class="container">
		  <div class="row">
		    <div class="col-xs-12">
		      <div class="table-responsive">
	<table class="table table-bordered table-hover">
					       								
						<%	
									
						try{
							connection = DriverManager.getConnection(connectionUrl+database, userid, password);
							statement=connection.createStatement();
							String sql;
						    sql ="select actid,proffbody_chapter,eventname,worknature,startperiod,endperiod from activity where startperiod >= '"+sdate+"' and endperiod <= '"+edate+"'";

							
							resultSet = statement.executeQuery(sql);
							
							if(resultSet.next()){
								resultSet = statement.executeQuery(sql);
							
							%>
							
					          		<caption class="text-center">ACTIVITIES </caption>
							          <thead>
							            <tr>
							              <th>PROFFESSIONAL BODY / CHAPTER</th>
							              <th>LOCATION</th>
							              <th>WORK NATURE</th>
							              <th>START DATE</th>
							              <th>END DATE</th>    
							            </tr>
							          </thead>
							         <tbody>
							<%
								while(resultSet.next()){
								%>
										<tr>
											<td><%=resultSet.getString("proffbody_chapter") %></td>
											<td><%=resultSet.getString("eventname") %></td>
											<td><%=resultSet.getString("worknature") %></td>
											<td><%=resultSet.getString("startperiod") %></td>
											<td><%=resultSet.getString("endperiod") %></td>
											<td><button><a href="ActivityImage.jsp?id=<%=resultSet.getString("actid")%>"  target="_blank"> View Certificate</a></button></td>
											</tr>									
							<%
								}
							}//if end
							%>
									  </tbody>
							         
							        </table>			
								<% 
								connection.close();
								} catch (Exception e) {
										e.printStackTrace();
									}}
								%>
						</div>
					</div>
					
					
				</div>
			</div>
		</section>

		
	</body>
	</html>
		