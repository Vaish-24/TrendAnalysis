<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bendthetrend.connection.MyConnection"%>
<%@page import="java.sql.Connection"%>
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
			Connection con = MyConnection.getConnection();
        	int app_id = Integer.parseInt((String)request.getParameter("offersOn"));
			PreparedStatement ps = con.prepareStatement("SELECT offerID from apparel where appId = ?");
			ps.setInt(1, app_id);
			ResultSet rs1 = ps.executeQuery();
			rs1.next();
        	ApparelDao ad = new ApparelDao();
        	ResultSet rs = ad.apparelgetOfferOn(app_id);
        	
        	//rs.next();
        %>
        <div id="displayItem">
				
					<img src="images/app_id (<%=app_id %>).jpg" alt="" height="350" width="300"/>
			</div>
			<div id="contentItem">
				
					<table cellpadding="2px" cellspacing="20px">
					<tr>
							<td width="250px">Current Offer</td>
							<td width="250px" align="center"><%= ad.getOfferName(rs1.getInt(1))%></td>
						</tr>
						<% 
                    		while(rs.next())
							{
                    			//System.out.println(rs.getString(3)  + " "+rs.getString(4));
                    	%>
						<tr>
							<td width="250px">Offer Name</td>
							<td width="250px" align="center"><%= ad.getOfferName(rs.getInt(5))%></td>
						</tr>
						<tr>
							<td width="250px">Valid From</td>
							<td width="250px" align="center"><%=rs.getString(3) %></td>
						</tr>
						<tr>
							<td width="250px">Valid Till</td>
							<td width="250px" align="center"><%=rs.getString(4) %></td>
						</tr>
						<% } %>
						</table>
			</div>

		</div>
		<br>
        		
			

<%@include file = "include/footer_include.jsp" %>
</body>
</html>