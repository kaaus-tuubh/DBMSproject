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

@WebServlet("/PlacementUpdateServlet")
@MultipartConfig(maxFileSize = 65536)
public class PlacementUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public PlacementUpdateServlet() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,NullPointerException{
	
		response.setContentType("text/html; charset=ISO-8859-1");
		String id=request.getParameter("id");
		String cname=request.getParameter("cname");
		String job=request.getParameter("job");
		int lpa = Integer.parseInt(request.getParameter("lpa"));
		String odate=request.getParameter("odate");
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
	    		 pstmt = conn.prepareStatement("Update placement set cmpname=?,jobdesignation=?,salary=?,offerdate=?,plcproof=? where plcid="+id);
	    	}
	    	else{
	    		 pstmt = conn.prepareStatement("Update placement set cmpname=?,jobdesignation=?,salary=?,offerdate=? where plcid="+id);
	    	}
	    	pstmt.setString(1, cname);
	    	pstmt.setString(2,job);
	    	pstmt.setInt(3, lpa);
	    	pstmt.setString(4,odate);
	    	if(imgsize > 0)
	    		pstmt.setBinaryStream(5, photo.getInputStream(),(int)photo.getSize());
	   
	    	int count = pstmt.executeUpdate();

	    	if(count>0)
	    	{
	    		response.sendRedirect("PlacementIndex.jsp"); 
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
