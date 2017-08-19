package com.bendthetrend.addtocartservlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bendthetrend.connection.MyConnection;
import com.bendthetrend.userbean.UserBean;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet(description = "For adding to cart", urlPatterns = { "/AddToCartServlet" })
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		UserBean ub = (UserBean)session.getAttribute("userBean");
		int app_id = Integer.parseInt(request.getParameter("app_id"));
		System.out.println(session+" "+ub.getUserId()+" "+" "+app_id);
		PreparedStatement ps, ps1, ps2, ps3, ps4, ps5;		
		try
		{
			Connection con = MyConnection.getConnection();
			ps = con.prepareStatement("UPDATE wishlist SET activeStatus =  ? WHERE userId = ? and appId = ?");
			ps.setString(1, "Inactive");
			ps.setInt(2, ub.getUserId());
			ps.setInt(3, app_id);
			
			int i = ps.executeUpdate();
			System.out.println("Successful: "+i);
			ps1 = con.prepareStatement("select offerId from apparel where appId = ?");
			ps1.setInt(1, app_id);
			ResultSet rs1= ps1.executeQuery();
			rs1.next();
			
			ps2 = con.prepareStatement("INSERT INTO `buycart`(`userId`, `appId`, `offerId`, `date`) VALUES (?,?,?,?)");
				
			LocalDate localDate = LocalDate.now();
			String currDate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(localDate);
			   
			ps2.setInt(1, ub.getUserId());
			ps2.setInt(2, app_id);
			ps2.setInt(3, rs1.getInt(1));
			ps2.setString(4, currDate);
			ps2.execute();
				
			//rs1.getInt(1) will give offer Id
			//app_Id gives the app id jispe offer kam karna hai
			
			if(rs1.getInt(1)>1)
			{
				ps3 = con.prepareStatement("update apparel set offerId = offerId - 1 where appId = ?");
				ps3.setInt(1, app_id);
				ps3.execute();
				ps4 = con.prepareStatement("select * from apparelhistory_offer where appId = ?");
				ps4.setInt(1, app_id);
    			ResultSet rs4 = ps4.executeQuery();
    			System.out.println("Hello out");
    			boolean flag = rs4.next();
    			//System.out.println(rs2.next());
    			System.out.println("Flag = "+flag);
    			if(flag==false)
    			{
    				System.out.println("Hello World");
    				ps5 = con.prepareStatement("INSERT INTO apparelhistory_offer( appId, validFrom, validTill, offerId) VALUES (?,?,?,?)");
    				ps5.setInt(1, app_id);
        			ps5.setString(2,"0000-00-00");
        			ps5.setString(3,currDate);
        			ps5.setInt(4, rs1.getInt(1));
        			ps5.execute();
        			System.out.println("Bye World");
    			}
    			else
    			{
    				ps5 = con.prepareStatement("select max(validTill) from apparelhistory_offer where appId = ?");
    				ps5.setInt(1, app_id);
        			ResultSet rs5 = ps5.executeQuery();
        			//System.out.println(rs);
        			//System.out.println(rs.next());
        			rs5.next();
        			String validDate = rs5.getString(1);
        			System.out.println(validDate);
        			
        			ps5 = con.prepareStatement("INSERT INTO apparelhistory_offer( appId, validFrom, validTill, offerId) VALUES (?,?,?,?)");
    				ps5.setInt(1, app_id);
        			ps5.setString(2,validDate);
        			ps5.setString(3,currDate);
        			ps5.setInt(4, rs1.getInt(1));
        			ps5.executeUpdate();
    			}
			}
			

		    RequestDispatcher rd = request.getRequestDispatcher("displaycart.jsp");
		    rd.forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
