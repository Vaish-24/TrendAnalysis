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
        <div class="header">
			<div>
                            <a href="home.jsp" id="logo"><img src="images/ourlogo.jpg" alt="logo" height="100" width="150"/></a>
				<div class="navigation">
					<ul class="first">
						<li class="first"><a href="updateprofile.jsp">Update Profile</a></li>
						<li><a href="displaywishlist.jsp">My WishList</a></li>
						<li><a href="displaycart.jsp">My Cart</a></li>
                                                
					</ul>
					<ul>
						<li><a href="Logout.jsp">Logout</a></li>
					</ul>
				</div>
<!--				<form action="" class="search">
					<input type="text" value="search" onblur="this.value=!this.value?'search':this.value;" onfocus="this.select()" onclick="this.value='';"/>
					<input type="submit" id="submit" value=""/>
				</form>-->
			</div>
			<div id="navigation">
				<ul>
					<li></li>
					<li><a href="home.jsp">Home</a></li>
                                        
					<li><a href="new_apparel.jsp">New Arrival</a></li>
					<li><a href="classics.jsp">Classics</a></li>
                                        <li><a href="male_apparel.jsp">Male Apparel</a></li>
					
                                        <li><a href="female_apparel.jsp">Female Apparel</a></li>
                                        <li></li>
                                </ul>
			</div>
		</div> 
    </body>
</html>
