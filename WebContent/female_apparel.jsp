<%-- 
    Document   : home
    Created on : 24 Mar, 2017, 8:42:35 PM
    Author     : rkjain2001
--%>

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
        <div class="body">
			<%@include file = "include/female_apparel_sidebar.jsp" %>
			<div class="content">
				<div class="figure">
					<img src="images/apparel.jpg" alt=""/>
					<% System.out.println(session); 
					session.setAttribute("previousPage","apparel");
					%>
				</div>
				<div class="products">
					<ul>
						<li class="first">
							<a href="new_arrival.html"><img src="images/apparel1.jpg" alt=""/></a>
							<h4>Lorem Ipsum</h4>
							<p>dolor sit amet</p>
							<span>US$28.00 ~PHP1,217.44</span>
						</li>
						
						<% for(int i =2; i<=4; ++i) 
							{ 
						%>
						<li><a href = "display.jsp?app_id=<%=i %>"><img src="images/apparel<%=i %>.jpg" alt=""/></a>
						<h4>Lorem Ipsum</h4>
							<p>dolor sit amet</p>
							<span>US$28.00 ~PHP1,217.44</span>
						<% %>
						</li>
						<% } %>
						
					<!--  	<li>
							<a href="new_arrival.html"><img src="images/apparel2.jpg" alt=""/></a>
							<h4>Lorem Ipsum</h4>
							<p>dolor sit amet</p>
							<span>US$28.00 ~PHP1,210.44</span>
						</li>
						<li>
							<a href="new_arrival.html"><img src="images/apparel3.jpg" alt=""/></a>
							<h4>Lorem Ipsum</h4>
							<p>dolor sit amet</p>
							<span>US$28.00 ~PHP1,210.44</span>
						</li>
						<li>
							<a href="new_arrival.html"><img src="images/apparel4.jpg" alt=""/></a>
							<h4>Lorem Ipsum</h4>
							<p>dolor sit amet</p>
							<span>US$28.00 ~PHP1,210.44</span>
						</li> -->
					</ul>
					<ul>
						<li class="first">
							<a href="new_arrival.html"><img src="images/apparel5.jpg" alt=""/></a>
							<h4>Lorem Ipsum</h4>
							<p>dolor sit amet</p>
							<span>US$28.00 ~PHP1,210.44</span>
						</li>
						<li>
							<a href="new_arrival.html"><img src="images/apparel6.jpg" alt=""/></a>
							<h4>Lorem Ipsum</h4>
							<p>dolor sit amet</p>
							<span>US$28.00 ~PHP1,210.44</span>
						</li>
						<li>
							<a href="new_arrival.html"><img src="images/apparel7.jpg" alt=""/></a>
							<h4>Lorem Ipsum</h4>
							<p>dolor sit amet</p>
							<span>US$28.00 ~PHP1,210.44</span>
						</li>
						<li>
							<a href="new_arrival.html"><img src="images/apparel8.jpg" alt=""/></a>
							<h4>Lorem Ipsum</h4>
							<p>dolor sit amet</p>
							<span>US$28.00 ~PHP1,210.44</span>
						</li>
					</ul>
				</div>
			</div>

		</div>
        <%@include file = "include/footer_include.jsp" %>
        
    </body>
</html>
