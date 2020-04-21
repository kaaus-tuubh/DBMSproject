<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "miniproject";
String userid = "root";
String password = "root";

Blob image = null;
byte[ ] imgData = null ;

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
<body>


<%

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select document from competitive_exams where ceid="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){


image = resultSet.getBlob(1);
imgData = image.getBytes(1,(int)image.length());

response.setContentType("image/jpeg");
OutputStream o = response.getOutputStream();
o.write(imgData);
o.flush();
o.close();

}
%>
<% 
connection.close();
} catch (Exception e) {

e.printStackTrace();
}
%>

</body>
</html>