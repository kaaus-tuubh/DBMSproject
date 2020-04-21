package lol;

import java.io.*;
import java.sql.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/Achieve")
@MultipartConfig(maxFileSize = 65536)
public class AchievementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public AchievementServlet() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,NullPointerException{
	
		response.setContentType("text/html; charset=ISO-8859-1");
		String aname=request.getParameter("aname");
		String ename=request.getParameter("ename");
		String edate=request.getParameter("eventdate");
		String aorganiser=request.getParameter("organizer");
		String acity=request.getParameter("city");
		String ainter_intra=request.getParameter("inter_intra");
		String awinner_participation=request.getParameter("w_p");
		String astate=request.getParameter("state");
		Part photo = request.getPart("photo");
		HttpSession session = request.getSession();
		String id = session.getAttribute("RegID").toString();
	
		String url = "jdbc:mysql://localhost:3306/miniproject";
		String username = "root";
		String password = "root";
		
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection conn=DriverManager.getConnection(url, username, password);	    	
	    	PreparedStatement pstmt = conn.prepareStatement("insert into achievement(achname,eventname,eventdate,achorganiser,achcity,inter_intra,winner_participation,achstate,document,RegID) " + "values(?,?,?,?,?,?,?,?,?,?)");
    
	    	pstmt.setString(1, aname);
	    	pstmt.setString(2, ename);
	    	pstmt.setString(3, edate);
	    	pstmt.setString(4, aorganiser);
	    	pstmt.setString(5, acity);
	    	pstmt.setString(6, ainter_intra);
	    	pstmt.setString(7, awinner_participation);
	    	pstmt.setString(8, astate);
	    	pstmt.setBinaryStream(9, photo.getInputStream(),(int)photo.getSize());
	    	pstmt.setString(10,id);
	    		
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
	    	System.out.print("hello");
	    	ex.printStackTrace();
	    	}
	    	
	    	}

}
