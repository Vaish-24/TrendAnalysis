<%-- 
    Document   : UserProfile
    Created on : 23 Mar, 2017, 11:29:03 AM
    Author     : rkjain2001
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        
        <h1> Profile Details</h1>
        
        <form method="POST" action="SignUpServlet">
            
            <div class = 'labelDiv'>
                Name
            </div>
            <div class = 'fieldDiv'>
                <input type="text" name="userName" placeholder="Name" />
            </div>
            <div class="partition"></div>
            <div class = 'labelDiv'>
                Password
            </div>
            <div class = 'fieldDiv'>
                <input type="password" name="userPass" placeholder="Password" />
            </div>
            <div class="partition"></div>
            <div class = 'labelDiv'>
                Email Id
            </div>
            <div class = 'fieldDiv'>
                <input type="text" name="emailId" placeholder="Email Id" />
            </div>
            <div class="partition"></div>
            <div class = 'labelDiv'>
                Gender
            </div>
            <div class = 'fieldDiv'>
                <input type="radio" name="userGender" value="Female" />Female
                &nbsp; &nbsp; &nbsp; &nbsp; <input type="radio" name="userGender" value="Male" />Male
            </div>
            <div class="partition"></div>
            <div class = 'labelDiv'>
                Marital Status
            </div>
            <div class = 'fieldDiv'>
                <input type="radio" name="userMaritalStatus" value="Unmarried" />Single
                &nbsp; &nbsp; &nbsp; &nbsp; <input type="radio" name="userMaritalStatus" value="Married" />Married
            </div>
            <div class="partition"></div>
            <div class = 'labelDiv'>
                Date Of Birth
            </div>
            <div class = 'fieldDiv'>
                <select name="dateDOB">
                    <% for(int i =1; i<=31; ++i){%>
                        <option><%= i %></option>
                        <% } %>
                </select>
                &nbsp; &nbsp;            
                <select name="monthDOB">
                    <% for(int i =1; i<=12; ++i){ %>
                        <option><%= i %></option>
                    <% } %>
                </select>
                &nbsp; &nbsp;     
                <select name="yearDOB">
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
