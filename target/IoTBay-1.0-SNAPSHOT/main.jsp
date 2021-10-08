<%-- 
    Document   : welcome
    Created on : 2021-4-13, 22:31:14
    Author     : bababab
--%>

<%@page import="com.mycompany.iotbay.models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("loginUser");
            if (user != null) {
        %>
        <h1>Hello, <%= user.getEmail()%> <a href="LogoutServlet" class="btn btn-secondary">Logout</a></h1>
        <div>
            <a href="profile.jsp">My Profile</a>
        </div>
        <div>
            <a href="card.jsp">Card Top-up</a>
        </div>
        <%
            } else {
                response.sendRedirect("index.html");
            }
        %>

    </body>
</html>
