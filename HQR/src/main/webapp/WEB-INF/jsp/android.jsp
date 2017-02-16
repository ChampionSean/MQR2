<%-- 
    Document   : android
    Created on : 15-feb-2017, 21:05:07
    Author     : Marco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     
        
        <table>
						    <thead>
						    <tr>
						        <th>numero</th>
						        <th>latitud</th>
						        <th>longitud</th>
						        
                                                        
                                                        
						    </tr>
						    </thead>
                                                    <c:forEach var="android" items="${androids}">
      <tr>
          
          <td>${android.id}</td>
          <td>${android.lat}</td> 
          <td>${android.lon}</td>
          
  
          
          
          
      </tr>
        </c:forEach>
						</table>
        
        
    </body>
</html>
