package com.bendthetrend.appareldao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.bendthetrend.apparelbean.ApparelBean;
import com.bendthetrend.connection.MyConnection;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;


public class ApparelDao {
	
	
		
	public ApparelBean getApparel(int appId)
	{
		ApparelBean ab = new ApparelBean();
		try
		{
			Connection con = MyConnection.getConnection();
			System.out.println("Apparel Id: "+appId);
			PreparedStatement ps = con.prepareStatement("select * from apparel where appId = ?");
			System.out.println("Hello 1");
			ps.setInt(1, appId);
			ResultSet rs = ps.executeQuery();
			System.out.println("ResultSet: "+rs);
			rs.next();
			System.out.println(rs.getInt(1));
			ab.setAppId(rs.getInt(1));
			ab.setAppName(rs.getString(2));
			ab.setAppPrice(rs.getFloat(3));
			ab.setAppType(rs.getString(4));
			ab.setAppCategory(rs.getString(5));
			ab.setAppFabric(rs.getString(6));
			ab.setAppColor(rs.getString(7));
			ab.setAppDate(rs.getString(8));
			ab.setAppWearDate(rs.getString(9));
			ab.setOfferId(rs.getInt(10));	//Make it offername return sorts
			
			//con.close();
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		
		return ab;
	}
	
	public int getOfferId(String offerName)
	{
		int offerId = 0;
		try
		{
			Connection con = MyConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select offerId from offer where offerName = ?");
			ps.setString(1, offerName);
			ResultSet rs = ps.executeQuery();
			rs.next();
			offerId = rs.getInt(1);
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return offerId;
	}
	
	public String getOfferName(int offerId)
	{
		String offerName = null;
		try
		{
			Connection con = MyConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select offerName from offer where offerId = ?");
			ps.setInt(1, offerId);
			ResultSet rs = ps.executeQuery();
			rs.next();
			offerName = rs.getString(1);
			System.out.println(offerName);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return offerName;
	}
	
	public void apparelHit(int appId)
	{
		
		try
		{
			Connection con = MyConnection.getConnection();
			LocalDate localDate = LocalDate.now();
		    String currDate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(localDate);
		    System.out.println(currDate);
		    PreparedStatement ps = con.prepareStatement("insert into hitlist(appId, hitDate) values(?,?)");
		    ps.setInt(1, appId);
		    ps.setString(2, currDate);
		    ps.execute();
//		    ps = con.prepareStatement("select * from hitlist");
//		    ResultSet rs = ps.executeQuery();
//		    while(rs.next())
//		    {
//		    	System.out.println(rs.getInt(1)+" ---- "+rs.getInt(2)+" ---- "+rs.getString(3));
//		    }
		    //scon.close();
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	     
	}
	
	public ResultSet apparelNewArrival()
	{
		ResultSet rs = null;
		Connection con = null;
		try{
			con = MyConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `apparel` WHERE DATE(appDate) < CURDATE() ORDER by appDate DESC LIMIT 12");
			rs = ps.executeQuery();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet apparelgetOfferAt(String offerDate)
	{
		ResultSet rs = null;
		Connection con = null;
		try{
			con = MyConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT DISTINCT offerId FROM `apparelhistory_offer` WHERE validFrom <= ? and validTill >= ?");
			ps.setString(1, offerDate);
			ps.setString(2, offerDate);
			rs = ps.executeQuery();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet apparelgetOfferOn(int app_id)
	{
		ResultSet rs = null;
		Connection con = null;
		try{
			con = MyConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `apparelhistory_offer` WHERE appId = ?");
			ps.setInt(1, app_id);
			rs = ps.executeQuery();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}
	public ResultSet apparelOffer(int offerId)
	{
		ResultSet rs = null;
		Connection con = null;
		try{
			con = MyConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT appId FROM `apparel` WHERE offerId = ?");
			ps.setInt(1, offerId);
			rs = ps.executeQuery();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet apparelClassics()
	{
		ResultSet rs = null;
		Connection con = null;
		try{
			con = MyConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT distinct appId FROM hitlist ORDER by hitDate LIMIT 12");
			rs = ps.executeQuery();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet apparelWishList(int userId)
	{
		ResultSet rs = null;
		Connection con = null;
		try{
			con = MyConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT appId FROM wishlist WHERE userId = ? and activeStatus = ?");
			ps.setInt(1, userId);
			ps.setString(2, "Active");
			rs = ps.executeQuery();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}
	
	
	public ResultSet apparelCart(int userId)
	{
		ResultSet rs = null;
		Connection con = null;
		try{
			con = MyConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM buycart WHERE userId = ?");
			ps.setInt(1, userId);
			
			rs = ps.executeQuery();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}
	
	
	public ResultSet apparelUpcomingArrival()
	{
		ResultSet rs = null;
		Connection con = null;
		try{
			con = MyConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `apparel` WHERE DATE(appDate) > CURDATE() ORDER by appDate DESC LIMIT 12");
			rs = ps.executeQuery();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet apparelPopularity()
	{
		ResultSet rs = null;
		Connection con = null;
		try{
			con = MyConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT appId, count(appId) FROM hitlist GROUP BY appId ORDER by COUNT(appId) DESC LIMIT 12");
			rs = ps.executeQuery();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet apparelTrendingToday()
	{
		ResultSet rs = null;
		Connection con = null;
		try{
			LocalDate localDate = LocalDate.now();
		    String currDate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(localDate);
			con = MyConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT appId, count(appId) FROM hitlist WHERE hitDate = ? GROUP BY appId ORDER by COUNT(appId) DESC LIMIT 12");
			ps.setString(1, currDate);
			rs = ps.executeQuery();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet apparelTrendingThatDay(String trendDate)
	{
		ResultSet rs = null;
		Connection con = null;
		try{    
			con = MyConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT appId, count(appId) FROM hitlist WHERE hitDate = ? GROUP BY appId ORDER by COUNT(appId) DESC LIMIT 12");
			ps.setString(1, trendDate);
			rs = ps.executeQuery();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet apparelCollection(String collName)
	{
		ResultSet rs = null;
		Connection con = null;
		try{
			
			con = MyConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT appId FROM apparel where EXTRACT(MONTH FROM appWearDate) IN (?,?,?) LIMIT 12");
			
			switch(collName)
			{
				case "summer":
						ps.setInt(1,5);
						ps.setInt(2,6);
						ps.setInt(3,7);
						break;
				case "winter":
						ps.setInt(1,11);
						ps.setInt(2,12);
						ps.setInt(3,1);
						break;
				case "spring":
						ps.setInt(1,2);
						ps.setInt(2,3);
						ps.setInt(3,4);
						break;
				case "fall":
						ps.setInt(1,8);
						ps.setInt(2,9);
						ps.setInt(3,10);
						break;
			}
			
			
			
			rs = ps.executeQuery();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}
	
	public void updateWishListOffer()
	{
		try
		{
			Connection con = MyConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT appId from wishlist where activeStatus = ? GROUP by appId having count(appId)>=2");
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			PreparedStatement ps1 = null, ps2 =null, ps3 = null;
			while(rs.next())
			{   
				LocalDate localDate = LocalDate.now();
				String currDate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(localDate);
				System.out.println("Hello world out");
				ps1 = con.prepareStatement("select offerId from apparel where appId = ?");
				ps1.setInt(1, rs.getInt(1));
				ResultSet rs1 = ps1.executeQuery();
				rs1.next();
				if(rs1.getInt(1)<10)
				{   
					ps2 = con.prepareStatement("select * from apparelhistory_offer where appId = ?");
					ps2.setInt(1, rs.getInt(1));
	    			ResultSet rs2 = ps2.executeQuery();
	    			System.out.println("Hello out");
	    			boolean flag = rs2.next();
	    			//System.out.println(rs2.next());
	    			System.out.println("Flag = "+flag);
	    			if(flag==false)
	    			{
	    				System.out.println("Hello World");
	    				ps3 = con.prepareStatement("INSERT INTO apparelhistory_offer( appId, validFrom, validTill, offerId) VALUES (?,?,?,?)");
	    				ps3.setInt(1, rs.getInt(1));
	        			ps3.setString(2,"0000-00-00");
	        			ps3.setString(3,currDate);
	        			ps3.setInt(4, rs1.getInt(1));
	        			ps3.execute();
	        			System.out.println("Bye World");
	    			}
	    			else
	    			{
	    				ps3 = con.prepareStatement("select max(validTill) from apparelhistory_offer where appId = ?");
	    				ps3.setInt(1, rs.getInt(1));
	        			rs2 = ps3.executeQuery();
	        			//System.out.println(rs);
	        			//System.out.println(rs.next());
	        			rs2.next();
	        			String validDate = rs2.getString(1);
	        			System.out.println(validDate);
	        			
	        			ps3 = con.prepareStatement("INSERT INTO apparelhistory_offer( appId, validFrom, validTill, offerId) VALUES (?,?,?,?)");
	    				ps3.setInt(1, rs.getInt(1));
	        			ps3.setString(2,validDate);
	        			ps3.setString(3,currDate);
	        			ps3.setInt(4, rs1.getInt(1));
	        			ps3.executeUpdate();
	    			}
					PreparedStatement ps5 = con.prepareStatement("update apparel set offerId = offerId + 1 where appId = ?");
					ps5.setInt(1, rs.getInt(1));
					ps5.executeUpdate();
					System.out.println("Inside if");
				}
				
			}

			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	public void updateSummerOffer()
	{
		try
		{
			Connection con = MyConnection.getConnection();
			PreparedStatement ps = null, ps1 = null, ps2 = null, ps3 = null;
			LocalDate localDate = LocalDate.now();
			String currDate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(localDate);
			
			String datePart[] = currDate.split("-");
			int month = Integer.parseInt(datePart[1]);
			
			if(month>=2&&month<=4)
			{
				ps = con.prepareStatement("select appId, offerId from apparel where EXTRACT(MONTH FROM appWearDate) IN (?,?,?)");
				ps.setInt(1, 2);
				ps.setInt(2, 3);
				ps.setInt(3, 4);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					ps1 = con.prepareStatement("select * from apparelhistory_offer where appId = ?");
					ps1.setInt(1, rs.getInt(1));
	    			ResultSet rs1 = ps1.executeQuery();
	    			System.out.println("Hello out");
	    			boolean flag = rs1.next();
	    			//System.out.println(rs2.next());
	    			System.out.println("Flag = "+flag);
	    			if(flag==false)
	    			{
	    				System.out.println("Hello World");
	    				ps2 = con.prepareStatement("INSERT INTO apparelhistory_offer( appId, validFrom, validTill, offerId) VALUES (?,?,?,?)");
	    				ps2.setInt(1, rs.getInt(1));
	        			ps2.setString(2,"0000-00-00");
	        			ps2.setString(3,currDate);
	        			ps2.setInt(4, rs.getInt(2));
	        			ps2.execute();
	        			System.out.println("Bye World");
	    			}
	    			else
	    			{
	    				ps2 = con.prepareStatement("select max(validTill) from apparelhistory_offer where appId = ?");
	    				ps2.setInt(1, rs.getInt(1));
	        			ResultSet rs2 = ps2.executeQuery();
	        			//System.out.println(rs);
	        			//System.out.println(rs.next());
	        			rs2.next();
	        			String validDate = rs2.getString(1);
	        			System.out.println(validDate);
	        			
	        			ps3 = con.prepareStatement("INSERT INTO apparelhistory_offer( appId, validFrom, validTill, offerId) VALUES (?,?,?,?)");
	    				ps3.setInt(1, rs.getInt(1));
	        			ps3.setString(2,validDate);
	        			ps3.setString(3,currDate);
	        			ps3.setInt(4, rs.getInt(2));
	        			ps3.executeUpdate();
	    			}
					PreparedStatement ps4 = con.prepareStatement("update apparel set offerId = 5 where appId = ?");
					ps4.setInt(1, rs.getInt(1));
					ps4.executeUpdate();
					System.out.println("Inside if");
					
				}
			}
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	

}