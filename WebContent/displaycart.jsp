<%@page import="com.bendthetrend.userbean.UserBean"%>
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
			UserBean ub = (UserBean)session.getAttribute("userBean");
			int userId = ub.getUserId();
        	ApparelDao ad = new ApparelDao();
        	ResultSet rs = ad.apparelCart(userId);
        	session.setAttribute("previousPage","displaywishlist");
        	int appPrice = 0;
        	String offerName;
        	if(rs==null)
        	{
        		%>
        		<center><i>No Contents To Display</i></center>
        		<% 
        	}
        	else
        	{
        		
        %>
       
			<div class="content">
				
				<div class="products">                  	
                    	<% 
                    		while(rs.next())
							{
                    			++count;
                    			if(count%4==1)
                    			{	
                    	%>
                        			<ul> 
                    				<li class="first"><img src="images/app_id (<%=rs.getInt(3)%>).jpg" alt="" height="275" width="200"/>
            						Purchased: <%= rs.getString(5)%>
            						Offer Name: <%= ad.getOfferName(rs.getInt(4)) %>	
            						<a href = "trendingthatday.jsp?trendDate=<%= rs.getString(5)%>">Trends Back Then</a>
            						</li>
                    	<% 		}
                    			else
                    			{
                    	%>
                    				<li><img src="images/app_id (<%=rs.getInt(3)%>).jpg" alt="" height="275" width="200"/>
        							Purchased: <%= rs.getString(5)%>
        							Offer Name: <%= ad.getOfferName(rs.getInt(4)) %>
        							<a href = "trendingthatday.jsp?trendDate=<%= rs.getString(5)%>">Trends Back Then</a>
        							</li>
        				<%
                    			}
                    			
                    			if(count%4==0)
                    			{
                    	%>
                    				</ul>
                    	<% 		
                    			}                   			
							}
        	}
                    	%>

				</div>
			</div>

</div>

<%@include file = "include/footer_include.jsp" %>
</body>
</html>