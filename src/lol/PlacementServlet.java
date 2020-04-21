package lol;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/PlacementServlet")
@MultipartConfig(maxFileSize = 65536)
public class PlacementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PlacementServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=ISO-8859-1");
		String cname = request.getParameter("cname");
		String job = request.getParameter("job");
		int lpa = Integer.parseInt(request.getParameter("lpa"));
		String date = request.getParameter("date");
		Part photo = request.getPart("photo");
		HttpSession session = request.getSession();
		String regid = session.getAttribute("RegID").toString();

		String url = "jdbc:mysql://localhost:3306/miniproject";
		String username = "root";
		String password = "root";

		try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection conn=DriverManager.getConnection(url, username, password);	    	
	    	PreparedStatement pstmt = conn.prepareStatement("insert into placement(cmpname,jobdesignation,offerdate,salary,RegID,plcproof) " + "values(?,?,?,?,?,?)");
    
	    	pstmt.setString(1, cname);
	    	pstmt.setString(2, job);
	    	pstmt.setString(3, date);
	    	pstmt.setInt(4, lpa);
	    	pstmt.setString(5, regid);
	    	pstmt.setBinaryStream(6, photo.getInputStream(),(int)photo.getSize());
		
	    	int count = pstmt.executeUpdate();

	    	if(count>0)
	    	{
	    		response.sendRedirect("PlacementIndex.jsp");  
	    	}
	    	else
	    	{
	    			    
	    	}
	    	} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();

		}
	}

}
