<%-- 
    Document   : header_include
    Created on : 24 Mar, 2017, 10:43:53 PM
    Author     : rkjain2001
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<!--        <link rel="stylesheet" href="css/style.css" type="text/css" />-->
    </head>
    <body>
    <% session.setAttribute("previousPage","apparel"); %>
        <div class="sidebar">
				<div class="first">
					<h2><a href="#">Categories</a></h2>
					 <ul>
						<li><a href="female_tees.jsp">Tees / T-Shirts</a></li>
						<li><a href="female_tops.jsp">Casual Tops</a></li>
						<li><a href="female_dresses.jsp">Dresses</a></li>
						<li><a href="female_denim.jsp">Denims &amp; Jeans</a></li>
						<li><a href="female_kurti.jsp">Kurtis</a></li>
						<li><a href="female_saree.jsp">Sarees</a></li>
						<li><a href="female_sweater.jsp">Sweaters</a></li>
						<li><a href="female_jacket.jsp">Jackets &amp; Blazers</a></li>
						
					</ul> 
                    
                    
				</div>
				<div>
					<h2><a href="popularity.jsp">Popularity</a></h2>
				</div>
				<div>
					<h2><a href="trendingtoday.jsp">Trending Today</a></h2>
				</div>
				<div>
					<h2><a href="custompopularity.jsp">Custom Popularity</a></h2>
				</div>
				<div>
					<h2><a href="offerinfo.jsp">Offer InFo</a></h2>
				</div>
			</div> 
    </body>
</html>
