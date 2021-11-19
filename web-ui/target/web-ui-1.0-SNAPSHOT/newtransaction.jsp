<%-- 
    Document   : newtransaction
    Created on : 15 Nov 2021, 03:17:27
    Author     : hannah-ann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Credit Card Application - New Transaction</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!<!-- CSS for bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        <!<!-- the main content on the page -->
        <div class ="container-fluid bg-dark">
        <!<!-- header -->
            <div class ="container-fluid bg-light text-center">
                <h1>New Transaction</h1>
            </div> 
            <div class = "container bg-light">
                <div class="col justify-content-centre align-items-center">
                    <!<!-- hidden card details -->
                <form id="creditcarddetails">
                    <div class="d-flex align-items-centre flex-column col-sm-3">
                        <label for="card-name">Name on card:</label><br>
                        <input type="text" id="nameOnCard" name="nameOnCard"><br>
                        <label for="expirydate">Expiry Date:</label><br>
                        <input type="month" id="expirydate" name="expirydate"><br>
                        <label for="cvv">CVV</label><br>
                        <input type="number" id="cvv" name="cvv">
                    </div>
                    <div class="ml-4 justify-content-centre" id="pinpad"> 
                        <div class="col-12 d-flex justify-content-center">
                            <input type="text" class="text-center" id="cardnumber">
                        </div>
                        <div id="numpad" class=" d-flex justify-content-center row align-items-center">
                            <div class="btn-group">
                                <button type="button" class="btn" onclick="document.getElementById('cardnumber').value=document.getElementById('cardnumber').value + '1';">1</button>
                                <button type="button" class="btn" onclick="document.getElementById('cardnumber').value=document.getElementById('cardnumber').value + '2';">2</button>
                                <button type="button" class="btn" onclick="document.getElementById('cardnumber').value=document.getElementById('cardnumber').value + '3';">3</button>
                            </div>
                            <div class="btn-group">
                                <button type="button" class="btn" onclick="document.getElementById('cardnumber').value=document.getElementById('cardnumber').value + '4';">4</button>
                                <button type="button" class="btn" onclick="document.getElementById('cardnumber').value=document.getElementById('cardnumber').value + '5';">5</button>
                                <button type="button" class="btn" onclick="document.getElementById('cardnumber').value=document.getElementById('cardnumber').value + '6';">6</button><br>
                            </div>
                            <div class="btn-group">
                                <button type="button" class="btn" onclick="document.getElementById('cardnumber').value=document.getElementById('cardnumber').value + '7';">7 </button>
                                <button type="button" class="btn" onclick="document.getElementById('cardnumber').value=document.getElementById('cardnumber').value + '8';">8</button>
                                <button type="button" class="btn" onclick="document.getElementById('cardnumber').value=document.getElementById('cardnumber').value + '9';">9</button><br>
                            </div>
                            <div class="btn-group">
                                <button type="button" class="btn btn-warning" class="btn btn-outline-secondary py-3" onclick="document.getElementById('cardnumber').value=document.getElementById('cardnumber').value.slice(0, -1);">&lt;</button>
                                <button type="button" class="btn" onclick="document.getElementById('cardnumber').value=document.getElementById('cardnumber').value + '0';">0</button>
                                <button type="button" class="btn btn-danger" onclick="">X</button><br>
                            </div>
                            <button type="submit" class="btn btn-success col-12 d-flex justify-content-center" value="submit">Enter</button>
                        </div>
                        <!-- edit this for loading when the submit button is pressed and confirmed -->
                        <!-- <button class="btn btn-secondry">
                            <span class="spinner-border spinner-border-sm"></span>
                            Waiting for confirmation....
                        </button> -->       
                    </div>
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

