package com.bendthetrend.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class MyConnection {
	
	private static Connection con = null;
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";
    private static final String URL = "jdbc:mysql://localhost:3306/meghna";
    
    public static Connection getConnection() {
        if (con != null)
            return con;
        else 
        {
            try {
                Class.forName(DRIVER);
                con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            } catch (Exception ex){
                ex.printStackTrace();
        } 
            return con;
        }

    }
    
    public static void closeConnection()
    {
    	try
    	{
    		
    		con.close();
    		
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    }
    
    //Comment meain afterwards. not needed. Used to test.
    
//    public static void main(String[] args) {
//        
//        try
//        {
//            getConnection();
//            String query = "select * from user";
//            PreparedStatement ps = con.prepareStatement(query);
//            ResultSet rs = ps.executeQuery();
//            while(rs.next())
//            {
//                System.out.println(rs.getInt(1)+" ----- "+rs.getString(2)+" ----- "+rs.getString(3)+" ----- "+rs.getString(4)+" ----- "+rs.getString(5)+" ----- "+rs.getString(6)+" ----- "+rs.getString(7)+" ----- "+rs.getInt(8));
//            }
//            
//            String query1 = "insert into user(userName, emaild, userPass, userGender, userDOB, maritalStatus, userAge) values(?,?,?,?,?,?,?)";
//            ps = con.prepareStatement(query1);
//            ps.setString(1, "Sheldon Cooper");
//            ps.setString(2, "bazinga@gmail.com");
//            ps.setString(3, "modeltrains");
//            ps.setString(4, "male");
//            ps.setString(6, "unmarried");
//            ps.setString(5, "1990-04-28");
//            ps.setInt(7, 26);
//            boolean flag = ps.execute();
//            
//        }catch(Exception ex)
//        {
//            ex.printStackTrace();
//        }
//        
//    }
	
	

}
