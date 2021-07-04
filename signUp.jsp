<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ include file="config.jsp" %>    
<%
	try{
		String name = request.getParameter("name");
		String passwd = request.getParameter("passwd");
		String adl1 = request.getParameter("adl1");
		String adl2 = request.getParameter("adl2");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pin = request.getParameter("pin");
		String type = request.getParameter("type");
		String query;
		int balance = 0;
		if(name != null && passwd != null && adl1 != null && adl2 != null && city != null && state != null && pin != null && type != null){
			if(passwd.length() >= 8){
				if(pin.length() == 6){
					if(type.equals("savings") || type.equals("current")){
						Random rand = new Random();
						String accNo = "";
						int temp;
						for(int i=1; i<=10; i++){
							temp = rand.nextInt(10);
							accNo = accNo + Integer.toString(temp);
						}
						String userId = name + accNo;
						if(type.equals("current")){
							balance = 5000;
						}
						query = "insert into USERS values('" + accNo + "', '" + userId + "', '" + name + "', '" + passwd + "', '" + adl1 + "', '" + adl2 + "', '" + city + "', '" + state + "', " + pin + ", 'f', 0,'" + type + "'," + balance + ");";
						st.executeUpdate(query);
						query = "create table " + userId + "(howmuch int,what varchar(255),whom varchar(255));";
						st.executeUpdate(query);
						session.setAttribute("logged_in", "true");
						session.setAttribute("logged_in_as", userId);
						response.sendRedirect("index.jsp");
					}
					else{
						%> <center>Account type not supported...</center><%
					}
				}
				else{
					%> <center>Invalid pincode...</center><%
				}
			}
			else{
				%> <center>Password length should be minimum 8 characters...</center><%
			}
		}
	}
	catch(Exception e){
		e.getMessage();
	}
%>    
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

<body style="background: rgb(241,247,252);">
    <nav class="navbar navbar-light navbar-expand-md navigation-clean-button" style="background: rgb(163,178,217);">
        <div class="container"><a class="navbar-brand" href="#">SlothBank</a><span>Sign Up</span><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"></li>
                    <li class="nav-item"></li>
                </ul><span class="navbar-text actions"> <a class="login" href="logIn.jsp">Log In</a></span>
            </div>
        </div>
    </nav>
    <h1 style="text-align: center;font-family: 'Alegreya SC', serif;margin-top: 100px;"><strong>Sign Up :</strong></h1>
    <form style="margin-top: 50px;text-align: left;margin-right: 300px;margin-left: 300px;" action="signUp.jsp" method="post"><label class="form-label">Name</label><input name="name" class="form-control" type="text" style="width: 300px;"><label class="form-label">Password</label><input name="passwd" class="form-control" type="password" style="width: 300px;"><label class="form-label">Address Line 1</label><input name="adl1" class="form-control" type="text"><label class="form-label">Address Line 2</label><input name="adl2" class="form-control" type="text"><label class="form-label">City</label><input name="city" class="form-control" type="text" style="width: 250px;"><label class="form-label">State</label><input name="state" class="form-control" type="text" style="width: 250px;"><label class="form-label">Pincode</label><input name="pin" class="form-control" type="number" style="width: 250px;"><label class="form-label">Account Type</label><select class="form-select" name="type" style="width: 250px;"><optgroup label="Account type"><option value="savings">Savings</option><option value="current">Current</option></optgroup></select><input class="form-control" type="submit" style="width: 300px;"></form>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/script.min.js"></script>
</body>

</html>