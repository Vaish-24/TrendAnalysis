<%@page import="com.bendthetrend.appareldao.ApparelDao"%>
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
			
              	<br>
              	<br>
       		
       	<%
       	
       		String collName = request.getParameter("collName");
       		ApparelDao ad = new ApparelDao();
       		
    
       		ResultSet rs = ad.apparelCollection(collName);
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