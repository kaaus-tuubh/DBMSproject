<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("RegID")==null)
{
	response.sendRedirect("Login.jsp");
}
else{
String id=request.getParameter("id");
int aid=Integer.parseInt(id);
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM achievement WHERE achid="+aid);

response.sendRedirect("AchievementIndex.jsp"); 

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
}
%>