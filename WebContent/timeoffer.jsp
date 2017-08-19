<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.bendthetrend.appareldao.ApparelDao"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
<%@include file = "include/header_include.jsp" %>
<% session.setAttribute("previousPage","apparel"); %>
 <div class="body">
			<div class="sidebar">
				
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
			<%
        	int count = 0;
			String offerDate = request.getParameter("offersAt");
        	ApparelDao ad = new ApparelDao();
        	ResultSet rs = ad.apparelgetOfferAt(offerDate);
        	//rs.next();
        %>
       
			<div class="content">
				
				<div class="products">                  	
                    	<% 
                    		while(rs.next())
							{
                    			
                    				
                    	%>
                        			<ul> 
                    				<li >
            							<%= ad.getOfferName(rs.getInt(1)) %>
            						</li>
                    	
                    				       				
                    				</ul>
                    	<% 		
                    			                   			
							}
                    	%>

				</div>
			</div>

</div>

<%@include file = "include/footer_include.jsp" %>
</body>
</html>