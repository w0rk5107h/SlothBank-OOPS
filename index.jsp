<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="config.jsp" %>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>SlothBank</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aclonica">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Alegreya+SC">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arbutus">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Barriecito">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bungee+Inline">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="assets/css/styles.min.css">
</head>

<body style="background: url(&quot;assets/img/sharon-mccutcheon-8lnbXtxFGZw-unsplash.jpg&quot;) top / cover no-repeat;">
	<% if((String)session.getAttribute("logged_in") == "true") { %>
    <nav class="navbar navbar-light navbar-expand-md navigation-clean-button" style="background: rgb(163,178,217);">
        <div class="container"><a class="navbar-brand" href="/">SlothBank</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"></li>
                    <li class="nav-item"></li>
                    <% if(session.getAttribute("logged_in_as").equals("admin0000000000")){ %>
                    <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">Tasks</a>
                        <div class="dropdown-menu"><a class="dropdown-item" href="userDetails.jsp">User Details</a><a class="dropdown-item" href="closedAccounts.jsp">Closed Accounts</a></div>
                    </li>
                    <% }
                    else { %>
                    <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">Tasks</a>
                        <div class="dropdown-menu"><a class="dropdown-item" href="userDetails.jsp">User Details</a><a class="dropdown-item" href="changeAddress.jsp">Change Address</a><a class="dropdown-item" href="depositMoney.jsp">Deposit Money</a><a class="dropdown-item" href="withdrawMoney.jsp">Withdraw Money</a><a class="dropdown-item" href="printStatement.jsp">Print Statement</a><a class="dropdown-item" href="transferMoney.jsp">Transfer Money</a><a class="dropdown-item" href="accountClosure.jsp">Account Closure</a></div>
                    </li>
                    <% } %>
                </ul><span class="navbar-text actions">Logged in as <%= session.getAttribute("logged_in_as") %><a class="btn btn-light action-button" role="button" href="logOut.jsp">Log out</a></span>
            </div>
        </div>
    </nav>
    <% } 
    else { %>
    <nav class="navbar navbar-light navbar-expand-md navigation-clean-button" style="background: rgb(163,178,217);">
        <div class="container"><a class="navbar-brand" href="/">SlothBank</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"></li>
                    <li class="nav-item"></li>
                </ul><span class="navbar-text actions"> <a class="login" href="logIn.jsp">Log In</a><a class="btn btn-light action-button" role="button" href="signUp.jsp">Sign Up</a></span>
            </div>
        </div>
    </nav>
    <% } %>
    <h1 data-bss-hover-animate="pulse" style="text-shadow: 3px 3px 9px;font-family: Arbutus, serif;text-align: center;font-size: 71px;margin-top: 220px;color: rgb(0,0,0);">Welcome to SlothBank</h1>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/script.min.js"></script>
</body>

</html>