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

@WebServlet("/InternshipUpdateServlet")
@MultipartConfig(maxFileSize = 65536)
public class InternshipUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public InternshipUpdateServlet() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,NullPointerException{
	
		response.setContentType("text/html; charset=ISO-8859-1");
		String id=request.getParameter("id");
		String cname=request.getParameter("name");
		String location=request.getParameter("location");
		String nature=request.getParameter("nature");
		String status=request.getParameter("status");
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
	    		 pstmt = conn.prepareStatement("Update internship set companyname=?,intlocation=?,worknature=?,intstatus=?,startperiod=?,endperiod=?,document=? where intid="+id);
	    	}
	    	else{
	    		 pstmt = conn.prepareStatement("Update internship set companyname=?,intlocation=?,worknature=?,intstatus=?,startperiod=?,endperiod=? where intid="+id);
	    	}
	    	pstmt.setString(1, cname);
	    	pstmt.setString(2, location);
	    	pstmt.setString(3, nature);
	    	pstmt.setString(4, status);
	    	pstmt.setString(5, sdate);
	    	pstmt.setString(6, edate);
	    	if(imgsize > 0)
	    		pstmt.setBinaryStream(7, photo.getInputStream(),(int)photo.getSize());
	    		
	    	int count = pstmt.executeUpdate();

	    	if(count>0)
	    	{
	    		response.sendRedirect("InternshipIndex.jsp");  
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
