<%-- 
    Document   : Welcome
    Created on : 24 Mar, 2017, 2:36:52 AM
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
        .leftDiv
        {
            width: 45%;
            border: 3px solid blueviolet;
            padding: 10px;
            float: left;
            margin-top: 40px;
            margin-bottom: 40px;
                
        }
        .rightDiv
        {
            width: 45%;
            border: 3px solid blueviolet;
            padding: 10px;
            float: right;
            margin-top: 40px;
            margin-bottom: 40px;
                
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
    <%
    	    %>
        <center>
            <h1>Hello Shoppers</h1>
            <div class = 'leftDiv'>
                <img src ="images/shopping1.jpeg" height="200" width="200">
                <br>
                <br>
                <br>
                <br>
                <a href = "Login.jsp">Start Shopping</a>
            </div>
            <div class = 'rightDiv'>
                <img src ="images/shopping4.jpg" height="200" width="200">
                <br>
                <br>
                <br>
                <br>
                <a href = "SignUp.jsp">Become A Member</a>
            </div>
            <div class="partition"></div>

        </center>
    </body>
</html>
