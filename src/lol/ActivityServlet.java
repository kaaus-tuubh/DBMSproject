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

@WebServlet("/ActivityServlet")
@MultipartConfig(maxFileSize = 65536)//64 kB photo
public class ActivityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ActivityServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=ISO-8859-1");
		String pc = request.getParameter("chapter");
		String ename = request.getParameter("event");
		String wnature = request.getParameter("nature");
		String speriod = request.getParameter("sdate");
		String eperiod = request.getParameter("edate");
		Part photo = request.getPart("photo");
		HttpSession session = request.getSession();
		String regid = session.getAttribute("RegID").toString();

		String url = "jdbc:mysql://localhost:3306/miniproject";
		String username = "root";
		String password = "root";

		try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection conn=DriverManager.getConnection(url, username, password);	    	
	    	PreparedStatement pstmt = conn.prepareStatement("insert into activity(proffbody_chapter,eventname,worknature,startperiod,endperiod,RegID,document) " + "values(?,?,?,?,?,?,?)");
    
	    	pstmt.setString(1, pc);
	    	pstmt.setString(2, ename);
	    	pstmt.setString(3, wnature);
	    	pstmt.setString(4, speriod);
	    	pstmt.setString(5, eperiod);
	    	pstmt.setString(6, regid);
	    	pstmt.setBinaryStream(7, photo.getInputStream(),(int)photo.getSize());
	    		
	    	int count = pstmt.executeUpdate();

	    	if(count>0)
	    	{
	    		response.sendRedirect("ActivityIndex.jsp");
 
	    	}
	    	else
	    	{
	    	
	    
	    	}
	    	} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();

		}
	}
}
