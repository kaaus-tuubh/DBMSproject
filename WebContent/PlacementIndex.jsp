<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
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
String id = session.getAttribute("RegID").toString();
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
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Placement Details</title>

	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/hover.min.css">
	
	<link rel="stylesheet" href="css/core.css">

	<!-- Custom styles for this template -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/responsive.css"> 



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
								<%= me %>
							</p>
						</div>
						<div class="col-sm-6 col-md-6">
							<ul class="list-unstyled list-inline">
								<li>
									<a href="LogoutServlet" class="btn btn-info" style="background-color: #a9a9a957;">LOGOUT</a>
								</li>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
		
		


		<section class="header-3-navigation">
			<div class="container">
				<div class="row">
					<nav id="site-navigation" class="navbar">
						<div class="navbar-offcanvas navbar-offcanvas-touch navbar-offcanvas-right offcanvas-transform js-offcanvas-done" id="js-bootstrap-offcanvas">
							
								<ul class="nav navbar-nav">
								<li><a href="AllDetails.jsp">ALL DETAILS</a></li>
								<li><a href="AchievementIndex.jsp">ACHIEVEMENTS</a></li>
								<li><a href="PublicationIndex.jsp">PUBLICATIONS</a></li>
								<li><a href="ActivityIndex.jsp">ACTIVITIES</a></li>
								<li><a href="InternshipIndex.jsp">INTERNSHIPS</a></li>
								<li><a href="CompetitiveIndex.jsp">COMPETITIVE EXAMS</a></li>
								<li class="active"><a href="PlacementIndex.jsp">PLACEMENTS</a></li>
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
						<div class="welcome-content">
							</tr>
								<table class="table table-bordered table-hover">
					          		<caption class="text-center">PLACEMENTS </caption>
							          <thead>
							            <tr>
							              <th>COMPANY NAME</th>
							              <th>JOB DESIGNATION</th>
							              <th>PACKAGE</th>
							              <th>OFFER DATE</th>				              
							            </tr>
							          </thead>
							         <tbody>
								<%
								try{
								connection = DriverManager.getConnection(connectionUrl+database, userid, password);
								statement=connection.createStatement();
								String sql ="select * from placement where RegID = '"+id+"'";
								resultSet = statement.executeQuery(sql);
								while(resultSet.next()){
								%>
								
							
								
										<tr>
											<td><%=resultSet.getString("cmpname") %></td>
											<td><%=resultSet.getString("jobdesignation") %></td>
											<td><%=resultSet.getString("salary") %></td>
											<td><%=resultSet.getString("offerdate") %></td>
										
										    <td><a href="PlacementImage.jsp?id=<%=resultSet.getString("plcid")%>" target="_blank"><button>View Certificate</button></a></td>
											<td><a href="PlacementUpdate.jsp?id=<%=resultSet.getString("plcid")%>"><button>update</button></a></td>
											<td><a href="PlacementDelete.jsp?id=<%=resultSet.getString("plcid")%>"><button>delete</button></a></td>
											</tr>									
							<%
								}
							%>
									  </tbody>
							          <tfoot>
							            <tr>
							              <td><a href="PlacementAdd.jsp" style="color:red;"><button>Add</button></a></td>
							            </tr>
							          </tfoot>
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
