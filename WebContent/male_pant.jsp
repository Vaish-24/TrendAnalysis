<%-- 
    Document   : home
    Created on : 24 Mar, 2017, 8:42:35 PM
    Author     : rkjain2001
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" />
    </head>
    <body>
        <%@include file = "include/header_include.jsp" %>
        <div class="body">
			<%@include file = "include/male_apparel_sidebar.jsp" %>
			<div class="content">
				
				<div class="products">                  	
                    	<% for(int i =180; i<192; ++i) 
							{
                    			int count = i + 3;
                    	%>
                    			<ul> 
                    				<li class="first"><a href = "display.jsp?app_id=<%=i+1 %>"><img src="images/app_id (<%=i+1 %>).jpg" alt="" height="275" width="200"/></a>
            							
            						</li>
                    	<% 
                    			for(i=i+1;i<=count;++i)
                    			{      				
                    	%>
                    				<li><a href = "display.jsp?app_id=<%=i+1 %>"><img src="images/app_id (<%=i+1 %>).jpg" alt="" height="275" width="200"/></a>
            							
            						</li>
            						
                    	<% 		
                    			}
                    	--i;
                    				%>
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

