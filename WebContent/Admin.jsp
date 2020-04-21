<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("RegID")==null)
{
	response.sendRedirect("LoginAdmin.jsp");
}
else{ %>

<meta name="viewport" content="width=device-width">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin page</title>

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
<%

String id = session.getAttribute("RegID").toString();
String me = session.getAttribute("me").toString();

if(session.getAttribute("sdate")!=null && session.getAttribute("edate")!=null)
{
session.setAttribute("sdate",null);
session.setAttribute("edate",null);
}
%>
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
									<a href="LogoutAdminServlet" class="btn btn-info" style="background-color: darkgray;">LOGOUT</a>
								</li>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
	<center>	
<br><br><br>		
<a href="MisPage.jsp"><input type="button" value="MIS"></a>
<br><br>
<form action = "Search.jsp" method = "post">
<br><br><br>
&nbsp&nbsp&nbsp&nbsp
<label>Student RegID</label> :
<input type="text" name="search" placeholder="Enter RegID">
<br>
<input type="hidden" name="sdate" value="2000-01-01">
<input type="hidden" name="edate" value="2050-01-01"><br>

&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<input type="submit" value="Search by Id">
</form>
<br><br><br>
----------------------------------------------------------------------------------------
<br><br><br>

<form action="SearchAll.jsp" method="post">
&nbsp&nbsp&nbsp&nbsp
<label>Start Date</label> : <input type="date" name="sdate" required><br><br>
&nbsp&nbsp&nbsp&nbsp
<label>End Date</label> : <input type="date" name="edate" required><br><br>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<input type="submit" value="Search by date">
</form>
</center>
</body><%} %>
</html>