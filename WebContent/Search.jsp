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
String regid = request.getParameter("search");
String sdate = request.getParameter("sdate");
String edate = request.getParameter("edate");
String me = session.getAttribute("me").toString();
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "miniproject";
String userid = "root";
String password = "root";
String NAME="";
String RN="";
String EMAIL="";
String CONTACT="";
String ADMYEAR="";
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

try {
Class.forName(driver);
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select Name,RollNo,Email,Contact,AdmissionYear from mis inner join student where student.RegID=mis.RegID and mis.RegID ='" + regid + "'";
ResultSet rs = statement.executeQuery(sql);
if(rs.next())
{
	NAME=rs.getString(1);
	RN=rs.getString(2);
	EMAIL=rs.getString(3);
	CONTACT=rs.getString(4);
	ADMYEAR=rs.getString(5);
}

} catch (ClassNotFoundException e) {
e.printStackTrace();
}

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
	
	
    <title>Achievement Details</title>

	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/hover.min.css">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
								<%=me%>
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
			
			
			
			<div class="container">
			<br><br>
  
  <!-- Trigger the modal with a button -->
  <table width="100%">
  <tr>
  <td>
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"><%=regid %></button>
  </td>
  <td>
  <center>
  <a href="https://accounts.google.com/ServiceLogin?sacu=1#identifier"><button name="mail" class="btn btn-info btn-lg">Send Mail</button></a>
  </center>

  </td>
  </tr>
  </table>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Student Details</h4>
        </div>
        <div class="modal-body">

        
         <table>

<tr>
    
    <th style="background-color: white;color: brown;">REG ID</th>
    <td><%= regid %></td>
  </tr>
  <tr>
    
    <th style="background-color: white;color: brown;">Name</th>
    <td><%= NAME %></td></tr>
  <tr>
    
    <th style="background-color: white;color: brown;">Email</th>
    <td><%= EMAIL %></td>
  </tr>
  <tr>
    <th style="background-color: white;color: brown;">Phone</th>
    <td><%= CONTACT %></td>
  </tr>
  
  <tr>
    
    <th style="background-color: white;color: brown;">Roll Number</th>
    <td><%=RN%></td>
  </tr>
  
  <tr>
    <th style="background-color: white;color: brown;">Admission Year</th>
    <td><%= ADMYEAR %></td>
  </tr>
</table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
	
	<form action = "Search.jsp" method = "post">
	
	<input type="hidden" name="search" value="<%=regid%>"><br><br>
	
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	
	<label>Start Date</label> : <input type="date" name="sdate" <% if(!sdate.equals("2000-01-01")){%> value="<%=sdate %>" <%} %>><br><br>
	
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	
	<label>End Date</label> : <input type="date" name="edate" <% if(!edate.equals("2050-01-01")){%> value="<%=edate %>" <%} %>><br><br>
	
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	
	<input type="submit" value="search">
	
	</form>	
				
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
								
							    sql ="select achid,achname,eventname,achorganiser,achcity,winner_participation,inter_intra,achstate,eventdate from achievement inner join student where achievement.RegID = student.RegID and achievement.RegID ='" + regid + "' and eventdate >= '"+sdate+"' and eventdate <= '"+edate+"'";

								resultSet = statement.executeQuery(sql);
									
																	
										if(resultSet.next())
										{
											resultSet = statement.executeQuery(sql);
										
									 %>		 
									 <caption class="text-center">ACHIEVEMENTS </caption>       
									  <thead>

							            <tr>
							            
							              <th>NAME</th>
							              <th>EVENT NAME</th>
							              <th>EVENT DATE</th>
							              <th>ORGANIZER</th>
							              <th>CITY</th>
							               <th>STATUS</th>
							              <th>INTER/INTRA</th>
							              <th>STATE</th>
							            </tr>
							          </thead>
							         <tbody>
            	
 								<%
 									
									while(resultSet.next()){
								%>
															
										<tr>
											<td><%=resultSet.getString("achname") %></td>
											<td><%=resultSet.getString("eventname") %></td>
											<td><%=resultSet.getString("eventdate") %></td>
											<td><%=resultSet.getString("achorganiser") %></td>
											<td><%=resultSet.getString("achcity") %></td>
											<td><%=resultSet.getString("winner_participation") %></td>
											<td><%=resultSet.getString("inter_intra") %></td>
											<td><%=resultSet.getString("achstate") %></td>	
											<td><button ><a href="AchievementImage.jsp?id=<%=resultSet.getString("achid")%>" target="_blank"> View Certificate</a></button></td>
										 
										</tr>									
							<%
								} // end while
							
								
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
					<div class="col-xs-12">
						<div class="welcome-content">
							<table class="table table-bordered table-hover">
							
							<%
							
							
							try{
							connection = DriverManager.getConnection(connectionUrl+database, userid, password);
							statement=connection.createStatement();
							
							String sql ="select actid,proffbody_chapter,eventname,worknature,startperiod,endperiod from activity inner join student where activity.RegID = student.RegID and activity.RegID ='" + regid + "' and startperiod >= '"+sdate+"' and endperiod <= '"+edate+"'";

							
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
		    <div class="col-xs-12">
		      <div class="table-responsive">
				<table class="table table-bordered table-hover">
				
				<%
								try{
										connection = DriverManager.getConnection(connectionUrl+database, userid, password);
										statement=connection.createStatement();
										
										String sql ="select ceid,examname,organizer,score_grade,startperiod,endperiod from competitive_exams inner join student where competitive_exams.RegID = student.RegID and competitive_exams.RegID ='" + regid + "' and startperiod >= '"+sdate+"' and endperiod <= '"+edate+"'";
								
										resultSet = statement.executeQuery(sql);
										
										if(resultSet.next()){
											resultSet = statement.executeQuery(sql);
					%>
				<caption class="text-center">COMPETITIVE EXAMS </caption>
							          <thead>
							            <tr>
							              <th>EXAM NAME</th>
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
								
								String sql ="select intid,companyname,intlocation,worknature,intstatus,startperiod,endperiod from internship inner join student where internship.RegID = student.RegID and internship.RegID ='" + regid + "' and startperiod >= '"+sdate+"' and endperiod <= '"+edate+"'";
			
								resultSet = statement.executeQuery(sql);
								if(resultSet.next()){
									resultSet = statement.executeQuery(sql);
								
								%>
							<caption class="text-center">INTERNSHIPS </caption>
							          <thead>
							            <tr>
							              <th>COMPANY NAME</th>
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
		    <div class="col-lg-12">
		      <div class="table-responsive">
		      		<table class="table table-bordered table-hover">
		      		
		      	<%
						try{
							connection = DriverManager.getConnection(connectionUrl+database, userid, password);
							statement=connection.createStatement();
					
							String sql ="select pubid,titlename,journalname,nat_internat,volume_no,pageno,pubdate,impactfactor, organiser_publ,doi,paid_unpaid,indexing from publication inner join student where publication.RegID = student.RegID and publication.RegID ='" + regid + "' and pubdate >= '"+sdate+"' and pubdate <= '"+edate+"'";
					
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
				</div>s
			</div>
		</section>
	
		
		
	</body>
	</html>
		