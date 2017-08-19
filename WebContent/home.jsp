<%-- 
    Document   : home
    Created on : 24 Mar, 2017, 8:42:35 PM
    Author     : rkjain2001
--%>

<%@page import="com.bendthetrend.userbean.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" />
    </head>
    <body>
        <%@include file = "include/header_include.jsp" %>
        <%
        	
        	UserBean ub = (UserBean)session.getAttribute("userBean");
        	System.out.println(ub.getUserId());
        	System.out.println(ub.getUserName());
        %>
        <div class="body">
			<div class="featured">
<!--				<a href="blog.html"><img src="images/advertisement.jpg" alt=""/></a>-->
                                <center>
				<div class="gallery">
                                    <a href="new_arrival.html"><img src="images/aurora.jpg" alt="" width="960" height="500"/></a>
                                    <br>
                                    <br>
					<ul class="first">
                                            <li><a href="displaycollection.jsp?collName=summer"><img src="images/summer-collection.jpg" alt=""/></a></li>                                
						<li><a href="displaycollection.jsp?collName=winter"><img src="images/beach-bride.jpg" alt="" /></a></li>
						<li><a href="upcoming_apparel.jsp"><img src="images/motherhood-apparel.jpg" alt="" /></a></li>
					</ul>
					<ul class="second">
						<li><a href="displaycollection.jsp?collName=spring"><img src="images/fashionable.jpg" alt=""/></a></li>
						<li><a href="displaycollection.jsp?collName=fall"><img src="images/accessories.jpg" alt=""/></a></li>
						<li><a href="offerdisplay.jsp"><img src="images/skin-perfect.jpg" alt=""/></a></li>
					</ul>
				</div>
                                </center>
			</div>

		</div>
        <%@include file = "include/footer_include.jsp" %>
        
    </body>
</html>