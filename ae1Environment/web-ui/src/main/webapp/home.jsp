<%-- 
    Document   : home
    Created on : 15 Nov 2021, 02:54:24
    Author     : hannah-ann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- jsp goes here-->

<!DOCTYPE html>
    <head>
        <title>Credit Card Application - Homepage</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!<!-- CSS for bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        <!<!-- the main content on the page -->
        <div class ="container-fluid bg-dark">
        <!<!-- header -->
            <div class ="container-fluid bg-light text-center">
                <h1>Welcome to the Homepage!</h1>
            </div> 
            <div class = "container bg-light">
                <div class="col justify-content-centre align-items-center">
                    <p>This is the main page where you can do the following tasks:</p>
                        <ul>
                            <li>Admin Login</li>
                            <li>Create a new transaction</li>
                            <li>Refund a transaction</li>
                        </ul>
                </div>
                
                <!<!-- buttons for interaction -->
                <div class="row justify-content-around align-items-center">
                    <a href="adminlogin.jsp">
                        <button type="button" class="btn btn-dark col-12 ">Admin Login</button>
                    </a>
                    <p></p>
                    <a href="transact.jsp">
                        <button type="button" class="btn btn-dark col-12">New Transaction</button>
                    </a>
                    <p></p>
                    <a href="refundpage.jsp">
                        <button type="button" class="btn btn-dark col-12">Refund Transaction</button>
                    </a>
                    <p> </p>
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
