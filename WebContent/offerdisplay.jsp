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
			<br>
			<center>
			<form action = "offerapparel.jsp">
			<div class = 'labelDiv'>
                Offer Name
            </div>
            <div class = 'fieldDiv'>
                <input type="text" name="offerName" placeholder="Offer Name" />
            </div>
            	<div class="partition"></div>
            <div class="partition"><input type="submit" value="Submit" name="subBt" /></div>
            </form>
			</center>	

<%@include file = "include/footer_include.jsp" %>
</body>
</html>
	
