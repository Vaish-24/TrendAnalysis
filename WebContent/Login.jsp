<%-- 
    Document   : Login
    Created on : 24 Mar, 2017, 5:11:19 AM
    Author     : rkjain2001
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	System.out.println(session.getAttribute("userBean"));
	if(session.getAttribute("userBean")==null)
	{	
		System.out.println("Session is null: "+session);

%>
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
            <h1>Let's be Impulsive</h1>
                
                <form method="POST" action = "LoginServlet">
                    
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
                    <div class="partition">
                        <input type="submit" value="Submit" name="subBt" />
                    </div>
                    
                </form>
            
        </center>
    </body>
</html>

<% 
	}
	else
	{
		RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		rd.forward(request, response);
		
	}

%>