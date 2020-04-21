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
	
String sdate=request.getParameter("sdate");
String edate=request.getParameter("edate");

if(session.getAttribute("sdate")==null && session.getAttribute("edate")==null)
{
session.setAttribute("sdate",sdate);
session.setAttribute("edate",edate);
}

String srtdate=session.getAttribute("sdate").toString();
String enddate=session.getAttribute("edate").toString();

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
								<li class="active"><a href="SearchAll.jsp">ALL DETAILS</a></li>
								<li><a href="SearchAllAchievement.jsp">ACHIEVEMENTS</a></li>
								<li><a href="SearchAllPublications.jsp">PUBLICATIONS</a></li>
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
									
								try
								{
								connection = DriverManager.getConnection(connectionUrl+database, userid, password);
								statement=connection.createStatement();
								String sql;
								
									 sql ="select achid,FirstName,LastName,achname,eventname,achorganiser,achcity,winner_participation,inter_intra,achstate,eventdate from achievement,student where achievement.RegID = student.RegID and  eventdate >= '"+srtdate+"' and eventdate <= '"+enddate+"'";

								resultSet = statement.executeQuery(sql);
									
																	
										if(resultSet.next())
										{
											resultSet = statement.executeQuery(sql);
										
									 %>		 
									 <caption class="text-center">ACHIEVEMENTS </caption>       
									  <thead>

							            <tr>
							            
							              <th>NAME</th>
							              <th>STUDENT NAME</th>
							              <th>EVENT_NAME</th>
							              <th>EVENT DATE</th>
							              <th>ORGANIZER</th>
							              <th>CITY</th>
							               <th>STATUS</th>
							              <th>INTER/INTRA</th>
							              <th>STATE</th>
							              <th><a href="Download.jsp" target="_blank" ><button>Print</button></a></th>							            </tr>
							          </thead>
							         <tbody>
            	
 								<%
 									
									while(resultSet.next()){
								%>
								
							
								
										<tr>
											<td><%=resultSet.getString("achname") %></td>
											<td><%=resultSet.getString("FirstName")+" "+resultSet.getString("LastName")%></td>
											<td><%=resultSet.getString("eventname") %></td>
											<td><%=resultSet.getString("eventdate") %></td>
											<td><%=resultSet.getString("achorganiser") %></td>
											<td><%=resultSet.getString("achcity") %></td>
											<td><%=resultSet.getString("winner_participation") %></td>
											<td><%=resultSet.getString("inter_intra") %></td>
											<td><%=resultSet.getString("achstate") %></td>	
											<td><button ><a href="AchievementImage.jsp?id=<%=resultSet.getString("achid")%>" target="_blank" > View Certificate</a></button></td>
										 	<td><button ><a href="AchievementImage.jsp?id=<%=resultSet.getString("achid")%>" download="Achievement" > Download Certificate</a></button></td>
										</tr>									
							<%
								} // end while
								} // end if
								
								%>
									  </tbody>
							       
							        </table>
							
								
								<% 
								connection.close();
								} catch (Exception e) {
										e.printStackTrace();
									}
								%>
						</div>
					</div>
					
					
				</div>
			</div>
		</section>
		
		<section class="welcome">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="welcome-content"  style="padding: 0px;">
							<table class="table table-bordered table-hover">
							
							<%
							
							
							try{
							connection = DriverManager.getConnection(connectionUrl+database, userid, password);
							statement=connection.createStatement();
							String sql;
						    sql ="select actid,FirstName,LastName,proffbody_chapter,eventname,worknature,startperiod,endperiod from activity,student where activity.RegID = student.RegID and startperiod >= '"+srtdate+"' and endperiod <= '"+enddate+"'";

							
							resultSet = statement.executeQuery(sql);
							
							if(resultSet.next()){
								resultSet = statement.executeQuery(sql);
							
							%>
							
					          		<caption class="text-center">ACTIVITIES </caption>
							          <thead>
							            <tr>
							              <th>PROFFESSIONAL BODY / CHAPTER</th>
							              <th>STUDENT NAME</th>
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
										    <td><%=resultSet.getString("FirstName")+" "+resultSet.getString("LastName")%></td>
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
									}
								%>
						</div>
					</div>
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
										
									    sql ="select ceid,FirstName,LastName,examname,organizer,score_grade,startperiod,endperiod from competitive_exams,student where competitive_exams.RegID=student.RegID and startperiod >= '"+srtdate+"' and endperiod <= '"+enddate+"'";
								
										resultSet = statement.executeQuery(sql);
										
										if(resultSet.next()){
											resultSet = statement.executeQuery(sql);
					%>
					          		<caption class="text-center">COMPETITIVE EXAMS </caption>
							          <thead>
							            <tr>
							              <th>EXAM NAME</th>
							              <th>STUDENT NAME</th>
							              <th>ORGANIZER</th>
							              <th>SCORE</th>
							              <th>START DATE</th>
							              <th>END DATE</th>				             
							            </tr>
							          </thead>
							         <tbody>
								<%
										while(resultSet.next()){
								%>			
										<tr>
										<td><%=resultSet.getString("examname") %></td>
										<td><%=resultSet.getString("FirstName")+" "+resultSet.getString("LastName")%></td>
										<td><%=resultSet.getString("organizer") %></td>
										<td><%=resultSet.getString("score_grade") %></td>
										<td><%=resultSet.getString("startperiod") %></td>
										<td><%=resultSet.getString("endperiod") %></td>
										<td><button><a href="CompetitiveImage.jsp?id=<%=resultSet.getString("ceid")%>" target="_blank">View Certificate</a></button></td>
										
										</tr>
							<%
								}
										
							%>
									  </tbody>
							        
							        </table>	
								<% 
										}//if
								connection.close();
								} catch (Exception e) {
										e.printStackTrace();
									}
								%>
						</div>
					</div>			
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
									<%
								try{
								connection = DriverManager.getConnection(connectionUrl+database, userid, password);
								statement=connection.createStatement();
								String sql;
								sql ="select intid,FirstName,LastName,companyname,intlocation,worknature,intstatus,startperiod,endperiod from internship,student where internship.RegID=student.RegID and startperiod >= '"+srtdate+"' and endperiod <= '"+enddate+"'";
			
								resultSet = statement.executeQuery(sql);
								if(resultSet.next()){
									resultSet = statement.executeQuery(sql);
								
								%>
					          		<caption class="text-center">INTERNSHIPS </caption>
							          <thead>
							            <tr>
							              <th>COMPANY NAME</th>
							              <th>STUDENT NAME</th>
							              <th>LOCATION</th>
							              <th>WORK NATURE</th>
							              <th>STATUS</th>
							              <th>START-DATE</th>
							              <th>END-DATE</th>           
							            </tr>
							          </thead>
							         <tbody>
							<% 
								while(resultSet.next()){
								%>	
										<tr>
											<td><%=resultSet.getString("companyname") %></td>
											<td><%=resultSet.getString("FirstName")+" "+resultSet.getString("LastName")%></td>
											<td><%=resultSet.getString("intlocation") %></td>
											<td><%=resultSet.getString("worknature") %></td>
											<td><%=resultSet.getString("intstatus") %></td>
											<td><%=resultSet.getString("startperiod") %></td>
											<td><%=resultSet.getString("endperiod") %></td>
											<td><button><a href="InternshipImage.jsp?id=<%=resultSet.getString("intid")%>" target="_blank">View Certificate</a></button></td>
											</tr>									
							<%
								}
							%>
									  </tbody>
							          
							        </table>			
								<% 
								}//if end
								connection.close();
								} catch (Exception e) {
										e.printStackTrace();
									}
								%>
						</div>
					</div>				
				</div>
			</div>
		</section>
		
		<section class="welcome">
	
		<div class="container">
		  <div class="row">
		    <div class="col-lg-12"><div class="welcome-content">
		      <div class="table-responsive">
		      		<table class="table table-bordered table-hover">
		      		<%
						try{
							connection = DriverManager.getConnection(connectionUrl+database, userid, password);
							statement=connection.createStatement();
							String sql;
					
							sql ="select pubid,FirstName,LastName,titlename,journalname,nat_internat,volume_no,pageno,pubdate,impactfactor, organiser_publ,doi,paid_unpaid,indexing from publication,student where publication.RegID=student.REgID and  pubdate >= '"+srtdate+"' and pubdate <= '"+enddate+"'";
					
							resultSet = statement.executeQuery(sql);
							if(resultSet.next()){
								resultSet = statement.executeQuery(sql);
							
							%>
					          		<caption class="text-center">PUBLICATIONS </caption>
							          <thead>
							            <tr>
							              <th>Title Name</th>
							              <th>STUDENT NAME</th>
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
										<td><%=resultSet.getString("FirstName")+" "+resultSet.getString("LastName")%></td>
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
								}
							%>
									  </tbody>
							      
							        </table>
						 <% 
							}//if end
							connection.close();
								} catch (Exception e) {
										e.printStackTrace();
							}}
						%>
							      
						</div>
						</div>
					</div>		
				</div>
			</div>
		</section>
		
	</body>
	</html>
