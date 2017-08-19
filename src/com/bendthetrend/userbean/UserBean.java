package com.bendthetrend.userbean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.bendthetrend.connection.MyConnection;

public class UserBean {
	
	private String userName;
    private int userId;
    private String userPass;
    private String emailId;
    private String userGender;
//    private int userAge;
//    private int dateDOB;
//    private int monthDOB;
//    private int yearDOB;
    private String userDOB;
    private String userMaritalStatus;
    
    public UserBean()
    {
    	
    }
    
    
    //The ideal constructor that we should be using
	
	public UserBean(int userId, String userName,  String emailId, String userPass, String userGender, 
			String userDOB, String userMaritalStatus) {
		super();
		this.userName = userName;
		this.userId = userId;
		this.userPass = userPass;
		this.emailId = emailId;
		this.userGender = userGender;
		this.userDOB = userDOB;
		this.userMaritalStatus = userMaritalStatus;
	}
	
	public UserBean(String userName,  String emailId, String userPass, String userGender, 
			String userDOB, String userMaritalStatus) {
		super();
		this.userName = userName;
		//this.userId = userId;
		this.userPass = userPass;
		this.emailId = emailId;
		this.userGender = userGender;
		this.userDOB = userDOB;
		this.userMaritalStatus = userMaritalStatus;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

//	public int getUserAge() {
//		return userAge;
//	}
//
//	public void setUserAge(int userAge) {
//		this.userAge = userAge;
//	}

//	public int getDateDOB() {
//		return dateDOB;
//	}
//
//	public void setDateDOB(int dateDOB) {
//		this.dateDOB = dateDOB;
//	}
//
//	public int getMonthDOB() {
//		return monthDOB;
//	}
//
//	public void setMonthDOB(int monthDOB) {
//		this.monthDOB = monthDOB;
//	}
//
//	public int getYearDOB() {
//		return yearDOB;
//	}
//
//	public void setYearDOB(int yearDOB) {
//		this.yearDOB = yearDOB;
//	}

	public String getUserDOB() {
		return userDOB;
	}

	public void setUserDOB(String userDOB) {
		this.userDOB = userDOB;
	}

	public String getUserMaritalStatus() {
		return userMaritalStatus;
	}

	public void setUserMaritalStatus(String userMaritalStatus) {
		this.userMaritalStatus = userMaritalStatus;
	}
    
	
    

}
