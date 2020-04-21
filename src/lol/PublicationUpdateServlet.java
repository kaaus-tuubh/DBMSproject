
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

@WebServlet("/PublicationUpdateServlet")
@MultipartConfig(maxFileSize = 65536)
public class PublicationUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public PublicationUpdateServlet() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,NullPointerException{
	
		response.setContentType("text/html; charset=ISO-8859-1");
		String id=request.getParameter("id");
		String tname = request.getParameter("title");
		String jname = request.getParameter("name");
		String n_i = request.getParameter("n_i");
		int vno = Integer.parseInt(request.getParameter("volume"));
		int pno = Integer.parseInt(request.getParameter("tpages"));
		String pdate = request.getParameter("dop");
		String isbn = request.getParameter("factor");
		String organizer = request.getParameter("organizer");
		String idate = request.getParameter("doi");
		String paid = request.getParameter("paid_unpaid");
		String index = request.getParameter("indexing");
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
	    		 pstmt = conn.prepareStatement("Update publication set titlename=?,journalname=?,nat_internat=?,volume_no=?,organiser_publ=?,impactfactor=?,pageno=?,pubdate=?,doi=?,paid_unpaid=?,indexing=?,document=? where pubid="+id);
	    	}
	    	else{
	    		 pstmt = conn.prepareStatement("Update publication set titlename=?,journalname=?,nat_internat=?,volume_no=?,organiser_publ=?,impactfactor=?,pageno=?,pubdate=?,doi=?,paid_unpaid=?,indexing=? where pubid="+id);
	    	}
	    	pstmt.setString(1, tname);
	    	pstmt.setString(2, jname);
	    	pstmt.setString(3, n_i);
	    	pstmt.setInt(4, vno);
	    	pstmt.setString(5, organizer);
	    	pstmt.setString(6, isbn);
	    	pstmt.setInt(7, pno);
	    	pstmt.setString(8, pdate);
	    	pstmt.setString(9, idate);
	    	pstmt.setString(10, paid);
	    	pstmt.setString(11, index);
	    	if(imgsize > 0)
	    		pstmt.setBinaryStream(12, photo.getInputStream(),(int)photo.getSize());
	    		
	    	int count = pstmt.executeUpdate();

	    	if(count>0)
	    	{
	    		response.sendRedirect("PublicationIndex.jsp"); 
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
