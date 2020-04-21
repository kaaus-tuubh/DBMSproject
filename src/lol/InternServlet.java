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

@WebServlet("/InternshipServlet")
@MultipartConfig(maxFileSize = 65536)
public class InternServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InternServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=ISO-8859-1");
		String cname = request.getParameter("name");
		String loc = request.getParameter("location");
		String wnature = request.getParameter("nature");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String intst = request.getParameter("status");
		Part photo = request.getPart("photo");
		HttpSession session = request.getSession();
		String regid = session.getAttribute("RegID").toString();

		String url = "jdbc:mysql://localhost:3306/miniproject";
		String username = "root";
		String password = "root";

		try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection conn=DriverManager.getConnection(url, username, password);	    	
	    	PreparedStatement pstmt = conn.prepareStatement("insert into internship(companyname,intlocation,worknature,intstatus,startperiod,endperiod,RegID,document) " + "values(?,?,?,?,?,?,?,?)");
    
	    	pstmt.setString(1, cname);
	    	pstmt.setString(2, loc);
	    	pstmt.setString(3, wnature);
	    	pstmt.setString(4, intst);
	    	pstmt.setString(5, sdate);
	    	pstmt.setString(6, edate);
	    	pstmt.setString(7, regid);
	    	pstmt.setBinaryStream(8, photo.getInputStream(),(int)photo.getSize());
		
	    	int count = pstmt.executeUpdate();

	    	if(count>0)
	    	{
	    		response.sendRedirect("InternshipIndex.jsp");  
	    	}
	    	else
	    	{
	    			    
	    	}
	    	} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();

		}
	}

}
