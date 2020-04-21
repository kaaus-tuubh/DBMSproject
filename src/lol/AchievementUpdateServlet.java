package lol;

import java.io.*;
import java.sql.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/AchievementUpdate")
@MultipartConfig(maxFileSize = 65536)
public class AchievementUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public AchievementUpdateServlet() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		response.setContentType("text/html; charset=ISO-8859-1");
		String id=request.getParameter("id");
		String name=request.getParameter("aname");
		String eventname=request.getParameter("ename");
		String organiser=request.getParameter("organizer");
		String city=request.getParameter("city");
		String w_p=request.getParameter("w_p");
		String inter_intra = request.getParameter("inter_intra");
		String state = request.getParameter("state");
		Part photo = request.getPart("newphoto");
		long imgsize = photo.getSize();
	
		String url = "jdbc:mysql://localhost:3306/miniproject";
		String username = "root";
		String password = "root";
		PreparedStatement pstmt = null;
		
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection conn=DriverManager.getConnection(url, username, password);
	    	if(imgsize > 0){
	    		 pstmt = conn.prepareStatement("Update achievement set achname=?,eventname=?,achorganiser=?,achcity=?,winner_participation=?,inter_intra=?,achstate=?,document=? where achid="+id);
	    	}
	    	else{
	    		 pstmt = conn.prepareStatement("Update achievement set achname=?,eventname=?,achorganiser=?,achcity=?,winner_participation=?,inter_intra=?,achstate=? where achid="+id);
	    	}
	    	pstmt.setString(1, name);
	    	pstmt.setString(2, eventname);
	    	pstmt.setString(3, organiser);
	    	pstmt.setString(4, city);
	    	pstmt.setString(5, w_p);
	    	pstmt.setString(6, inter_intra);
	    	pstmt.setString(7, state);
	    	if(imgsize > 0)
	    		pstmt.setBinaryStream(8, photo.getInputStream(),(int)photo.getSize());
	    	
	   
	    	int count = pstmt.executeUpdate();
	    	if(count>0)
	    	{
	    	
	    	response.sendRedirect("AchievementIndex.jsp"); 
	    	}
	    	else
	    	{
	    	
	    	}
	    	}
	    	catch(Exception ex)
	    	{
	    	
	    	ex.printStackTrace();
	    	}
	    	
	 }
	
}
