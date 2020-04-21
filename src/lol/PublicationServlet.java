

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

@WebServlet("/PublicationServlet")
@MultipartConfig(maxFileSize = 65536)
public class PublicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PublicationServlet() {
        super();

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=ISO-8859-1");
		String ptitle = request.getParameter("title");
		String jname = request.getParameter("name");
		String certi = request.getParameter("n_i");
		int pvol = Integer.parseInt(request.getParameter("volume"));
		int pg = Integer.parseInt(request.getParameter("tpages"));
		String pdate = request.getParameter("dop");
		String pisbn = request.getParameter("factor");
		String organizer = request.getParameter("organizer");
		String idate = request.getParameter("doi");
		String pay = request.getParameter("paid_unpaid");
		String index = request.getParameter("indexing");
		Part photo = request.getPart("photo");
		HttpSession session = request.getSession();
		String regid = session.getAttribute("RegID").toString();

		String url = "jdbc:mysql://localhost:3306/miniproject";
		String username = "root";
		String password = "root";

	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection conn=DriverManager.getConnection(url, username, password);	    	
	    	PreparedStatement pstmt = conn.prepareStatement("insert into publication(titlename,journalname,nat_internat,volume_no,pageno,organiser_publ,impactfactor,pubdate,doi,paid_unpaid,indexing,document,RegID) " + "values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
    
	    	pstmt.setString(1, ptitle);
	    	pstmt.setString(2, jname);
	    	pstmt.setString(3, certi);
	    	pstmt.setInt(4, pvol);
	    	pstmt.setInt(5, pg);
	    	pstmt.setString(6, organizer);
	    	pstmt.setString(7, pisbn);
	    	pstmt.setString(8, pdate);
	    	pstmt.setString(9, idate);
	    	pstmt.setString(10, pay);
	    	pstmt.setString(11, index);
	    	pstmt.setBinaryStream(12, photo.getInputStream(),(int)photo.getSize());
	    	pstmt.setString(13,regid);
	    		
	    	int count = pstmt.executeUpdate();

	    	if(count>0)
	    	{
	    		response.sendRedirect("PublicationIndex.jsp");
	    	}
	    	else
	    	{
	    	
	    	}
	    	}catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();

		}

	}
}
