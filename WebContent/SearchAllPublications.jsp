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
								<li class="active"><a href="SearchAllPublications.jsp">PUBLICATIONS</a></li>
								<li><a href="SearchAllActivity.jsp">ACTIVITIES</a></li>
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
					
							sql ="select pubid,titlename,journalname,nat_internat,volume_no,pageno,pubdate,impactfactor, organiser_publ,doi,paid_unpaid,indexing from publication where pubdate >= '"+sdate+"' and pubdate <= '"+edate+"'";
					
							resultSet = statement.executeQuery(sql);
							if(resultSet.next()){
								resultSet = statement.executeQuery(sql);
							
							%>
					          		<caption class="text-center">PUBLICATIONS </caption>
							          <thead>
							            <tr>
							              <th>Title Name</th>
							              <th>JOURNAL NAME</th>
							              <th>NATIONAL/INTERNATIONAL</th>
							              <th>VOLUME NO</th>
							              <th>PAGE NO</th>
							              <th>DATE OF PUBLICATION</th>
							              <th>ISBN</th>
							              <th>ORGANIZER</th>
							              <th>DATE OF ISSUE</th>
							              <th>PAID/UNPAID</th>
							              <th>INDEXING</th>
							              
							            </tr>
							          </thead>
							         <tbody>
						<%
							while(resultSet.next())
							{
						%>			         
										<tr>
										<td><%=resultSet.getString("titlename") %></td>
										<td><%=resultSet.getString("journalname") %></td>
										<td><%=resultSet.getString("nat_internat") %></td>
										<td><%=resultSet.getString("volume_no") %></td>
										<td><%=resultSet.getString("pageno") %></td>
										<td><%=resultSet.getString("pubdate") %></td>
										<td><%=resultSet.getString("impactfactor") %></td>
										<td><%=resultSet.getString("organiser_publ") %></td>
										<td><%=resultSet.getString("doi") %></td>
										<td><%=resultSet.getString("paid_unpaid") %></td>
										<td><%=resultSet.getString("indexing") %></td>
										<td><button><a href="PublicationImage.jsp?id=<%=resultSet.getString("pubid")%>" target="_blank">View Certificate</a></button>
										</td>
									<tr>
							<%
								}}
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
		