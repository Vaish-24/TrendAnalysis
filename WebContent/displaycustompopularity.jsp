<%@page import="java.sql.ResultSet"%>
<%@page import="com.bendthetrend.connection.MyConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
<center>
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
			
              	<br>
              	<br>
       		
       	<%
       		String query = null;
       		PreparedStatement ps = null;
       		Connection con = MyConnection.getConnection();
       		if(request.getParameter("subBt1")!=null)
       		{
       			
       			query = "SELECT appId FROM hitlist WHERE hitDate > ? GROUP BY appId ORDER by COUNT(appId) DESC LIMIT 12";
       			ps = con.prepareStatement(query);
       			ps.setString(1, request.getParameter("trendingAfter"));
       		}else if(request.getParameter("subBt2")!=null)
       		{
       			query = "SELECT appId FROM hitlist WHERE hitDate < ? GROUP BY appId ORDER by COUNT(appId) DESC LIMIT 12";
       			ps = con.prepareStatement(query);
       			ps.setString(1, request.getParameter("trendingBefore"));
       			
       		}else if(request.getParameter("subBt3")!=null)
       		{
       			query = "SELECT appId FROM hitlist WHERE hitDate BETWEEN ? AND ? GROUP BY appId ORDER by COUNT(appId) DESC LIMIT 12";
       			ps = con.prepareStatement(query);
       			ps.setString(1, request.getParameter("trendingFrom"));
       			ps.setString(2, request.getParameter("trendingTo"));
       		}
       		else
       		{
       			RequestDispatcher rd = request.getRequestDispatcher("custompopularity.jsp");
       			rd.forward(request, response);
       		}
       		System.out.println(query);
       		ResultSet rs = ps.executeQuery();
       		int count = 0;	
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
                    				<li class="first"><a href = "display.jsp?app_id=<%=rs.getInt(1)%>"><img src="images/app_id (<%=rs.getInt(1)%>).jpg" alt="" height="275" width="200"/></a>
            							
            						</li>
                    	<% 		}
                    			else
                    			{
                    	%>
                    				<li><a href = "display.jsp?app_id=<%=rs.getInt(1)%>"><img src="images/app_id (<%=rs.getInt(1)%>).jpg" alt="" height="275" width="200"/></a>
        							
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
                    	%>

				</div>
			</div>
                    	
			
</div>



</center>
</body>
</html>