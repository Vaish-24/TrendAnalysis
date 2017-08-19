<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JSP Page</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
        <style>
            
            .labelDiv1
            {
                width: 40%;
                float: left;
                text-align: center;
            }
            .labelDiv2
            {
                width: 40%;
                float: left;
                text-align: start;
            }
            
            .fieldDiv
            {
                width: 40%;
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
                    	
			<form action = "displaycustompopularity.jsp" method = "GET">
				<div class = 'labelDiv1'>
                Trending After
	            </div>
	            <div class = 'fieldDiv'>
	                <input type="text" name="trendingAfter" placeholder="yyyy-mm-dd" /> &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="Submit" name="subBt1" />
	            </div>
	            <div class="partition"></div>
			</form>
			<form action = "displaycustompopularity.jsp" method = "GET">
            <div class = 'labelDiv1'>
                Trending Before
            </div>
            <div class = 'fieldDiv'>
                <input type="text" name="trendingBefore" placeholder="yyyy-mm-dd" /> &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="Submit" name="subBt2" />
            </div>
            <div class="partition"></div>
            </form>
            <form action = "displaycustompopularity.jsp" method = "GET">
            <div class = 'labelDiv2'>
                Trending Between &nbsp; &nbsp; &nbsp; &nbsp;<input type="text" name="trendingFrom" placeholder="yyyy-mm-dd" /> &nbsp; &nbsp; -
            </div>
            <div class = 'fieldDiv'>
                <input type="text" name="trendingTo" placeholder="yyyy-mm-dd" /> &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="Submit" name="subBt3" />

            </div>
            
            <div class="partition"></div>
            </form>


</div>



</center>
</body>
</html>