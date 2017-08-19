package com.bendthetrend.userdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

import com.bendthetrend.connection.MyConnection;
import com.bendthetrend.userbean.UserBean;

/**
 *
 * @author rkjain2001
 */
public class UserDao {
    private static int dayDob;
    private static int monthDob;
    private static int yearDob;
    
    public static int setValues(UserBean ub)            
    {
    	int flag = 0;
        try
        {
            //getConnection();
            Connection con = MyConnection.getConnection();
            
            
            String query1 = "insert into user(userName, emaild, userPass, userGender, userDOB, maritalStatus) values(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query1);
            ps.setString(1, ub.getUserName());
            ps.setString(2, ub.getEmailId());
            ps.setString(3, ub.getUserPass());
            ps.setString(4, ub.getUserGender());
            ps.setString(5, ub.getUserDOB());
            ps.setString(6, ub.getUserMaritalStatus());
            flag = ps.executeUpdate();
            System.out.println(flag);
            
        }catch(Exception ex)
        {
            ex.printStackTrace();
        }
        return flag;
    }
    
    public static UserBean getLoginDetails(String userName, String userPass)
    {

    	UserBean ub = null;
    	try
    	{
    		Connection con = MyConnection.getConnection();
    		PreparedStatement ps = con.prepareStatement("select * from user where userName = ? and userPass = ?");
    		ps.setString(1, userName);
    		ps.setString(2, userPass);
    		ResultSet rs = ps.executeQuery();
    		boolean flag = rs.next();
    		if(flag)
    		{
    			ub = new UserBean(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
    		}
    		else
    		{
    			ub = null;
    		}
    		
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	
    	return ub;
    }
    
    public void updateUserProfile(UserBean ub, String userPass, String emailId, String userMaritalStatus)
    {
    	Connection con = null;
    	boolean flag1 = false, flag2 = false, flag3 = false;
    	PreparedStatement ps = null, ps1 = null, ps2= null,ps3 = null;
    	try
    	{
    		LocalDate localDate = LocalDate.now();
			String currDate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(localDate);
    		con = MyConnection.getConnection();
    		if(ub.getUserPass()!=userPass)
    			flag1 = true;
    		if(ub.getEmailId()!=emailId)
    			flag2 = true;
    		if(ub.getUserMaritalStatus()!=userMaritalStatus)
    			flag3 = true;
    		if(flag1|flag2|flag3)
    		{
    			ps = con.prepareStatement("select * from userhistory where userId = ?");
    			ps.setInt(1, ub.getUserId());
    			ResultSet rs = ps.executeQuery();
    			System.out.println("Hello out");
    			//rs.next();
    			if(rs.next()==false)
    			{
    				System.out.println("Hello World");
    				ps = con.prepareStatement("INSERT INTO userhistory( userId, emailId, userPass, maritalStatus, validFrom, validTill) VALUES (?,?,?,?,?,?)");
    				ps.setInt(1, ub.getUserId());
        			ps.setString(2,ub.getEmailId());
        			ps.setString(3,ub.getUserPass());
        			ps.setString(4,ub.getUserMaritalStatus());
        			ps.setString(5,"0000-00-00");
        			ps.setString(6,currDate);
        			ps.execute();
        			System.out.println("Bye World");
    			}
    			else
    			{
    				ps = con.prepareStatement("select max(validTill) from userhistory where userId = ?");
        			ps.setInt(1, ub.getUserId());
        			rs = ps.executeQuery();
        			//System.out.println(rs);
        			//System.out.println(rs.next());
        			rs.next();
        			String validDate = rs.getString(1);
        			System.out.println(validDate);
        			
        			ps = con.prepareStatement("INSERT INTO userhistory( userId, emailId, userPass, maritalStatus, validFrom, validTill) VALUES (?,?,?,?,?,?)");
        			ps.setInt(1, ub.getUserId());
        			ps.setString(2,ub.getEmailId());
        			ps.setString(3,ub.getUserPass());
        			ps.setString(4,ub.getUserMaritalStatus());
        			ps.setString(5,validDate);
        			ps.setString(6,currDate);
        			ps.executeUpdate();
    			}
    			
    			ps = con.prepareStatement("UPDATE user SET emaild = ?, userPass = ?, maritalStatus = ? WHERE userId = ?");
    			ps.setString(1,emailId);
    			ps.setString(2,userPass);
    			ps.setString(3,userMaritalStatus);
    			ps.setInt(4,ub.getUserId());
    			ps.executeUpdate();
    		}
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	
    	
    }
    
    public void entryUpdateTable(UserBean ub)
    {
    	try
    	{
    		Connection con = MyConnection.getConnection();
    		PreparedStatement ps = con.prepareStatement("");
    		
    	}catch(Exception ex)
    	{
    		
    	}
    	
    }
    
    
    
}
