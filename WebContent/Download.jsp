<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.servlet.http.HttpSession" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "miniproject";
String userid = "root";
String password = "root";

String srtdate=session.getAttribute("sdate").toString();
String enddate=session.getAttribute("edate").toString();


try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;


%>
<meta charset="UTF-8" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.js">  </script>
<script type="text/javascript">
$(function(){
    
        var url='data:application/vnd.ms-excel,' + encodeURIComponent($('#tableWrap69').html()) 
        location.href=url
        return false
 		
})

</script>

<style type="text/css">

</style>
<title>Generate Report</title>
    </head>
    <body >
    
    <div id="tableWrap69">
<table class="table table-bordered table-hover">
					       								
								  
									 <%	
									
								try
								{
								connection = DriverManager.getConnection(connectionUrl+database, userid, password);
								statement=connection.createStatement();
								String sql;
								
									 sql ="select achid,achname,eventname,achorganiser,achcity,winner_participation,inter_intra,achstate,eventdate from achievement where eventdate >= '"+srtdate+"' and eventdate <= '"+enddate+"'";

								resultSet = statement.executeQuery(sql);
									
																	
										if(resultSet.next())
										{
											resultSet = statement.executeQuery(sql);
										
									 %>		 
									 <caption class="text-center">ACHIEVEMENTS </caption>       
									  <thead>

							            <tr>
							            
							              <th>NAME</th>
							              <th>EVENT_NAME</th>
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
    </body>
  </html>
