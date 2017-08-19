<%@page import="com.bendthetrend.appareldao.ApparelDao"%>
<%@page import="com.bendthetrend.apparelbean.ApparelBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />

<style>

#displayItem
        {
            width: 31%;
            border: 3px solid blueviolet;
            padding: 10px;
            float: left;
            margin-top: 40px;
            margin-bottom: 200px;
                
        }

#contentItem
        {
            width: 45%;
            border: 3px solid blueviolet;
            padding: 10px;
            float: right;
            margin-top: 40px;
            margin-bottom: 200px;
                
        }


</style>
</head>
<body>

<%
	
	int appId = Integer.parseInt(request.getParameter("app_id"));
	ApparelDao ad = new ApparelDao();
	ApparelBean ab = ad.getApparel(appId);
	String offer = null;
	if(ab.getOfferId()==0)
		offer = "No Current Offer";
	else
		offer = ad.getOfferName(ab.getOfferId());
	String prevPage = (String)session.getAttribute("previousPage");
	System.out.println("previous page: "+prevPage);
	if(!prevPage.equals("displaywishlist"))
		ad.apparelHit(appId);
	
	//Count = count + 1
	//Query that will insert into hit list which is separate from wishlist
	//Wishlist will offer models
	//Hit List will show kiska interest aaya. Uske buying/selling pattern se apan ko koi matlab nhi hai
	//User relevance mein hit list ka effect check karna hai
	//Sir ko dikhana hai sirf abhi new arrival
		
	

%>



        <%@include file = "include/header_include.jsp" %>
        <div class="body">
        <% if (appId < 97) { %>
          <jsp:include page="include/female_apparel_sidebar.jsp" />
<% }%>
<% if (appId >= 97) { %>
          <jsp:include page="include/male_apparel_sidebar.jsp" />
<% }%>
        			<div id="displayItem">
				
					<img src="images/app_id (<%=appId %>).jpg" alt="" height="350" width="300"/>
			</div>
			<div id="contentItem">
				
					<table cellpadding="2px" cellspacing="20px">
						
						<tr>
							<td width="250px">Apparel Name</td>
							<td width="250px" align="center"><%=ab.getAppName() %></td>
						</tr>
						<tr>
							<td width="250px">Apparel Category</td>
							<td width="250px" align="center"><%=ab.getAppCategory() %></td>
						</tr>
						<tr>
							<td width="250px">Apparel Type</td>
							<td width="250px" align="center"><%=ab.getAppType() %></td>
						</tr>
						<tr>
							<td width="250px">Apparel Fabric</td>
							<td width="250px" align="center"><%=ab.getAppFabric() %></td>
						</tr>
						<tr>
							<td width="250px">Apparel Color</td>
							<td width="250px" align="center"><%=ab.getAppColor() %></td>
						</tr>
						<tr>
							<td width="250px">Apparel Price</td>
							<td width="250px" align="center"><%=ab.getAppPrice() %></td>
						</tr>
						<tr>
							<td width="250px">Offer Applicable</td>
							<td width="250px" align="center"><%=offer %></td>
						</tr>
						<tr>
						<% if(prevPage.equals("displaywishlist")){ %>
							<td colspan = "2"><center><a href = "AddToCartServlet?app_id=<%=appId %>">Add To Cart</a></center></td>
						<% } else {%>
							<td colspan = "2"><center><a href = "AddToWishList?app_id=<%=appId %>">Add To WishList</a></center></td>
						<% } %>
						</tr>
					</table>
			</div>

		</div>
		<br>
        <%@include file = "include/footer_include.jsp" %>
        <% System.out.println(session); 
        	//session.setAttribute("previousPage","");
        %>
    </body>


</html>