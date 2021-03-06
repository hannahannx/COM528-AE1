<%-- 
    Document   : adminlogin
    Created on : 15 Nov 2021, 02:57:28
    Author     : hannah-ann
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import= "properties.WebObjectFactory"%>
<%@page import= "properties.PropertiesDao"%>

<%
    PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();
 
    String username = propertiesDao.getProperty("username");
    String password = propertiesDao.getProperty("password");
    String message = "";
    
    String action = (String) request.getParameter("action");
    if ("updateProperties".equals(action)) {
        message = "updating properties";
      
        username = (String) request.getParameter("username");
        password = (String) request.getParameter("password");
      
        propertiesDao.setProperty("username", username);
        propertiesDao.setProperty("password", password);
    }
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Credit Card Application - Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!<!-- CSS for bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        <!<!-- the main content on the page -->
        <div class ="container-fluid bg-dark">
        <!<!-- header -->
            <div class ="container-fluid bg-light text-center">
                <h1>Log in</h1>
            </div> 
            <div class = "container bg-light">
                <div class="row justify-content-centre align-items-center">
                    <p>Welcome to the login page</p>
                    <%=message  %>
                    <form id="login" action = "adminlogin.jsp">
                        <label for="username">username</label>
                        <input type="text" placeholder="enter username" name="username" value="<%=username%>" required>
                        <label>password</label>
                        <input type="text" placeholder="enter password" name="password" value="<%= password %>" required>
                        
                        <input type="hidden" name="action" value="updateProperties">
                        <button type="submit">Login</button>
                    </form>
                </div>
            </div>
            <div>
                <button onclick="goBack()">Go Back</button>
            </div>
        </div>
        
        <!<!-- Javascript to bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script>
        function goBack() {
          window.history.back();
        }
        
    </script>
    </body>
</html>
