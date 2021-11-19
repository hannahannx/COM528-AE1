

<%--
    Document   : transact
    Created on : 15 nov. 2021, 12:49:25
    Author     : dagbo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import= "org.apache.logging.log4j.LogManager" %>
<%@ page import= "org.apache.logging.log4j.Logger" %>

<%@page import= "org.solent.com504.oodd.bank.model.dto.BankTransactionStatus"%>
<%@page import= "org.solent.com504.oodd.bank.model.dto.CreditCard"%>
<%@page import= "org.solent.com504.oodd.bank.model.dto.TransactionReplyMessage"%>
<%@page import= "org.solent.com504.oodd.bank.model.client.BankRestClient"%>
<%@page import= "org.solent.com504.oodd.bank.client.impl.BankRestClientImpl"%>
<%@page import= "java.io.IOException"%>
<%@page import= "java.nio.file.StandardOpenOption"%>
<%@page import= "java.nio.file.Paths"%>
<%@page import= "java.nio.file.Files"%>
<%@page import= "java.util.function.Function"%>



<%
    

    //code to log in the customer details i.e username and password
    String username = null;
    String password = null;

    if (request.getParameter("username") != null) {

        username = request.getParameter("username");
        password = request.getParameter("password");
    }

    String sessionUser = (String) session.getAttribute("sessionUser");

    if (sessionUser == null) {

        session.setAttribute("sessionUser", username);
        session.setAttribute("sessionPassword", password);
        System.out.println("logging the details");
        System.out.println((String) session.getAttribute("sessionUser"));
        System.out.println((String) session.getAttribute("sessionPassword"));
    }

    String bankUrl = "http://com528bank.ukwest.cloudapp.azure.com:8080/rest/";

    BankRestClient client = new BankRestClientImpl(bankUrl);

    TransactionReplyMessage reply = null;

    String action = null;
    action = request.getParameter("action");

    CreditCard cardFrom = null;
    CreditCard cardTo = null;

    //  final Logger LOG = LogManager.getLogger(BankClientTest.class);
    if ("transaction".equals(action)) {

        //Card From
        String fullname = request.getParameter("fullname");
        String expirydate = request.getParameter("expirydate");
        String cardnumber1 = request.getParameter("cardnumber1");
        String cvv1 = request.getParameter("cvv1");
        String issueNumber1 = request.getParameter("issueNumber1");

        cardFrom = new CreditCard();

        cardFrom.setName(fullname);
        cardFrom.setEndDate(expirydate);
        cardFrom.setCardnumber(cardnumber1);
        cardFrom.setCvv(cvv1);
        cardFrom.setIssueNumber(issueNumber1);

        //Card To
        String name2 = request.getParameter("name2");
        String endDate2 = request.getParameter("endDate2");
        String cardnumber2 = request.getParameter("cardnumber2");
        String cvv2 = request.getParameter("cvv2");
        String issueNumber2 = request.getParameter("issueNumber2");

        cardTo = new CreditCard();

        cardTo.setName(name2);
        cardTo.setEndDate(endDate2);
        cardTo.setCardnumber(cardnumber2);
        cardTo.setCvv(cvv2);
        cardTo.setIssueNumber(issueNumber2);

        //Amount
        Double amount = Double.valueOf(request.getParameter("amount"));

        if (session.getAttribute("sessionUser") == null) {
            System.out.println("Transferring");
            reply = client.transferMoney(cardFrom, cardTo, amount);

        } else {
            System.out.println("");
            System.out.println(username);
            System.out.println(password);
            System.out.println((String) session.getAttribute("sessionUser"));
            System.out.println((String) session.getAttribute("sessionPassword"));
            reply = client.transferMoney(cardFrom, cardTo, amount, (String) session.getAttribute("sessionUser"), (String) session.getAttribute("sessionPassword"));
            if (reply.getStatus() == null) {
                reply.setStatus(BankTransactionStatus.FAIL);
            }

        }

        System.out.println(reply);

        // client.transferMoney(cardFrom, cardTo, amount);
    } else if ("refund".equals(action)) {

        String name3 = request.getParameter("name3");
        String endDate3 = request.getParameter("endDate3");
        String cardnumber3 = request.getParameter("cardnumber3");
        String cvv3 = request.getParameter("cvv3");
        String issueNumber3 = request.getParameter("issueNumber3");

        cardFrom = new CreditCard();

        cardFrom.setName(name3);
        cardFrom.setEndDate(endDate3);
        cardFrom.setCardnumber(cardnumber3);
        cardFrom.setCvv(cvv3);
        cardFrom.setIssueNumber(issueNumber3);

        //Card To
        String name4 = request.getParameter("name4");
        String endDate4 = request.getParameter("endDate4");
        String cardnumber4 = request.getParameter("cardnumber4");
        String cvv4 = request.getParameter("cvv4");
        String issueNumber4 = request.getParameter("issueNumber4");

        cardTo = new CreditCard();

        cardTo.setName(name4);
        cardTo.setEndDate(endDate4);
        cardTo.setCardnumber(cardnumber4);
        cardTo.setCvv(cvv4);
        cardTo.setIssueNumber(issueNumber4);

        Double amount = 50.0;

        reply = client.transferMoney(cardFrom, cardTo, amount);

    } else if ("logout".equals(action)) {

        session.setAttribute("sessionUser", null);
        session.setAttribute("sessionPassword", null);
    }


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>POS</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3">
            <span class="navbar-brand">New transactions</span>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <hr>
                    <form action="transact.jsp" method="post">
                        <div class="row">
                            <div>
                                <input type="hidden" class="form-control" name="action" value="logout">
                                <button class="btn btn-lg btn-block btn btn-grey mt-4" type="submit">
                                    Log out
                                </button>
                            </div>
                        </div>
                    </form>

                    <hr>

                </ul>
            </div>
        </nav> 


        <div class="row card-body align-items-center justify-content-center ">
            <div class="col-sm-10">
                <div class="card shadow-lg">
                    <div class="card-body">
                        <h1 class="card-title">Begin transaction</h1>
                        <% if (session.getAttribute("sessionUser") == null) { %>
                        Not logged in
                        <% } else {%>

                        Logged as <%= session.getAttribute("sessionUser")%>

                        <% }%>

                        <hr>

                        <% if (("transaction".equals(action))) {%>

                        <h6><%= reply.toString()%> <br></h6>

                        <% if (reply.getStatus().equals(BankTransactionStatus.SUCCESS)) {%>

                        <div class="alert alert-info">
                            <a class="close" data-dismiss="alert" href="#">×</a>
                            &#163;<%= reply.getAmount()%> Transactions successful FROM <%= reply.getFromCardNo()%> TO <%= reply.getToCardNo()%>


                            <form action="transact.jsp" method="post">
                                <input type="hidden" name="name3" >
                                <input type="hidden" name="endDate3" >
                                <input type="hidden" name="cardnumber3" >
                                <input type="hidden" name="cvv3" >
                                <input type="hidden" name="issueNumber3" >
                                <input type="hidden" name="name4" >
                                <input type="hidden" name="endDate4" >
                                <input type="hidden" name="cardnumber4" >
                                <input type="hidden" name="cvv4" >
                                <input type="hidden" name="issueNumber4" >
                                <input type="hidden" name="action" value="refund">
                                <button type="submit" >Process refund</button>
                            </form>

                        </div>

                        <%} else if (reply.getStatus().equals(BankTransactionStatus.FAIL)) {%>

                        <div class="alert alert-danger" role="alert">
                            <a class="close" data-dismiss="alert" href="#">×</a>INVALID TRANSACTION!!! <br>
                            <%= reply.getMessage().substring(0, 24)%>
                        </div>


                        <% }%>
                        <% } %>
                        <%if (("refund".equals(action))) {%>


                        <div  class="alert alert-success" role="alert">
                            <a class="close" data-dismiss="alert" href="#">×</a>Refund successful
                        </div>
                        <% }%>





                        <form action="transact.jsp" method="post">
                            <div class="row">
                                <div class="col">
                                    <h3>Please enter details of the transferring card</h3>
                                    <div class="mb-2">
                                        <div class="label-container">
                                            <label>Full Name</label>
                                        </div>
                                        <input type="text" class="form-control" name="fullname" value="">
                                    </div>
                                    <div class="mb-2">
                                        <div class="label-container">
                                            <label>Expiry date</label>
                                        </div>
                                        <input type="text" class="form-control" name="expirydate" value="">
                                    </div>
                                    <div class="mb-2">
                                        <div class="label-container">
                                            <label>Card Number</label>
                                        </div>
                                        <input type="text" class="form-control" name="cardnumber1" value="">
                                    </div>
                                    <div class="mb-2">
                                        <div class="label-container">
                                            <label>CVV</label>
                                        </div>
                                        <input type="text" class="form-control" name="cvv1" value="">
                                    </div>
                                    <div class="mb-2">
                                        <div class="label-container">
                                            <label>Issuer Number</label>
                                        </div>
                                        <input type="text" class="form-control" name="issueNumber1" value="">
                                    </div>
                                </div>

                                <div class="col">
                                    <h3>please enter the details of receiving card</h3>
                                    <div class="mb-2">
                                        <div class="label-container">
                                            <label>Name</label>
                                        </div>
                                        <input type="text" class="form-control" name="name2" value="">
                                    </div>
                                    <div class="mb-2">
                                        <div class="label-container">
                                            <label>Expiry date</label>
                                        </div>
                                        <input type="text" class="form-control" name="endDate2" value="">
                                    </div>
                                    <div class="mb-2">
                                        <div class="label-container">
                                            <label>Card Number</label>
                                        </div>
                                        <input type="text" class="form-control" name="cardnumber2" value="">
                                    </div>
                                    <div class="mb-2">
                                        <div class="label-container">
                                            <label>CVV</label>
                                        </div>
                                        <input type="text" class="form-control" name="cvv2" value="">
                                    </div>
                                    <div class="mb-2">
                                        <div class="label-container">
                                            <label>Issuer Number</label>
                                        </div>
                                        <input type="text" class="form-control" name="issueNumber2" value="">
                                    </div>
                                </div>
                            </div>
                            <div class="row pt-5 pb-5 mb-5 ">
                                <div class="col">
                                    <div class="mb-2">
                                        <h3>Amount</h3>
                                        <input type="number" class="form-control" name="amount" value="" placeholder="Enter amount">
                                    </div>
                                </div>

                            </div>
                            <input type="hidden" name="action" value="transaction">
                            <button type="submit" class="btn btn-primary">Enter</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>

    </body>
</html>
