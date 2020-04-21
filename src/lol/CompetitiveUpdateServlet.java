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

@WebServlet("/CompetitiveUpdateServlet")
@MultipartConfig(maxFileSize = 65536)
public class CompetitiveUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public CompetitiveUpdateServlet() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,NullPointerException{
	
		response.setContentType("text/html; charset=ISO-8859-1");
		String id=request.getParameter("id");
		String ename=request.getParameter("ename");
		String organizer=request.getParameter("organiser");
		int score = Integer.parseInt(request.getParameter("score"));
		String sdate=request.getParameter("sdate");
		String edate=request.getParameter("edate");
		Part photo = request.getPart("newphoto");
		long imgsize = photo.getSize();
	
		String url = "jdbc:mysql://localhost:3306/miniproject";
		String username = "root";
		String password = "root";
		
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection conn=DriverManager.getConnection(url, username, password);	    	
	    	PreparedStatement pstmt = null;
	    	if(imgsize > 0){
	    		 pstmt = conn.prepareStatement("Update competitive_exams set examname=?,score_grade=?,startperiod=?,endperiod=?,organizer=?,document=? where ceid="+id);
	    	}
	    	else{
	    		 pstmt = conn.prepareStatement("Update competitive_exams set examname=?,score_grade=?,startperiod=?,endperiod=?,organizer=? where ceid="+id);
	    	}

	    	pstmt.setString(1, ename);
	    	pstmt.setInt(2, score);
	    	pstmt.setString(3,sdate);
	    	pstmt.setString(4,edate);
	    	pstmt.setString(5,organizer);
	    	if(imgsize > 0)
	    		pstmt.setBinaryStream(6, photo.getInputStream(),(int)photo.getSize());
	   
	    	int count = pstmt.executeUpdate();

	    	if(count>0)
	    	{
	    		response.sendRedirect("CompetitiveIndex.jsp"); 
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
