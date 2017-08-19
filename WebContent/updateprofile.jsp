<%@page import="com.bendthetrend.userbean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <style>
            
            .labelDiv
            {
                width: 45%;
                float: left;
                text-align: end;
            }
            
            .fieldDiv
            {
                width: 45%;
                float: right;
                text-align: start;
            }
            
            .partition
            {
                width: 100%;
                height: 40px;
                padding: 10px;
                float: center;

            }
            
        </style>
    </head>
    <body>
    <center>
        <%
        	UserBean ub = (UserBean)session.getAttribute("userBean");
        %>
        <h1> Profile Details</h1>
        
        <form method="POST" action="UpdateUserServlet">
            
            <div class = 'labelDiv'>
                Name
            </div>
            <div class = 'fieldDiv'>
                <input type="text" name="userName" value = "<%=ub.getUserName() %>" disabled="disabled"/>
            </div>
            <div class="partition"></div>
            <div class = 'labelDiv'>
                Password
            </div>
            <div class = 'fieldDiv'>
                <input type="password" name="userPass" value = "<%=ub.getUserPass() %>" placeholder="Password" />
            </div>
            <div class="partition"></div>
            <div class = 'labelDiv'>
                Email Id
            </div>
            <div class = 'fieldDiv'>
                <input type="text" name="emailId" value = "<%=ub.getEmailId() %>" placeholder="Email Id" />
            </div>
            <div class="partition"></div>
            <div class = 'labelDiv'>
                Gender
            </div>
            <div class = 'fieldDiv'>
            <%
            	
            	if(ub.getUserGender().equals("Female"))
            	{
            %>
            	<input type="radio" name="userGender" value="Female" disabled="disabled" checked="checked"/>Female
                &nbsp; &nbsp; &nbsp; &nbsp; <input type="radio" name="userGender" value="Male" disabled="disabled"/>Male           	
            <% 
            	}
            	else
            	{
            %>
            
            	<input type="radio" name="userGender" value="Female" disabled="disabled" />Female
                &nbsp; &nbsp; &nbsp; &nbsp; <input type="radio" name="userGender" value="Male" disabled="disabled" checked="checked"/>Male
            <%
            		
            	}
            
            %>
                
            </div>
            <div class="partition"></div>
            <div class = 'labelDiv'>
                Marital Status
            </div>
            <div class = 'fieldDiv'>
            <%
            	
            	if(ub.getUserMaritalStatus().equals("Unmarried"))
            	{
            %>
            	<input type="radio" name="userMaritalStatus" value="Unmarried" checked="checked"/>Unmarried
                &nbsp; &nbsp; &nbsp; &nbsp; <input type="radio" name="userMaritalStatus" value="Married" />Married           	
            <% 
            	}
            	else
            	{
            %>
            
            	<input type="radio" name="userMaritalStatus" value="Unmarried" />Unmarried
                &nbsp; &nbsp; &nbsp; &nbsp; <input type="radio" name="userMaritalStatus" value="Married" checked="checked"/>Married
            <%
            		
            	}
            
            %>
                
            </div>
            <div class = 'fieldDiv'>
            
                
            </div>
            <div class="partition"></div>
            <div class = 'labelDiv'>
                Date Of Birth
            </div>
            <div class = 'fieldDiv'>
                <select name="dateDOB" disabled="disabled">
                    <% for(int i =1; i<=31; ++i){%>
                        <option><%= i %></option>
                        <% } %>
                </select>
                &nbsp; &nbsp;            
                <select name="monthDOB" disabled="disabled">
                    <% for(int i =1; i<=12; ++i){ %>
                        <option><%= i %></option>
                    <% } %>
                </select>
                &nbsp; &nbsp;     
                <select name="yearDOB" disabled="disabled">
                    <% for(int i =1950; i<=1999; ++i) {%>
                        <option><%= i %></option>
                    <% } %>
                </select>
            </div>
            <div class="partition"></div>
            <div class="partition"><input type="submit" value="Submit" name="subBt" /></div>
        </form>
    </center>


    </body>
</html>
