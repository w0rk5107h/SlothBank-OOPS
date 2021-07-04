<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="config.jsp" %>    
<%
	try{
		String userId = request.getParameter("userId");
		String passwd = request.getParameter("passwd");
		if(userId != null && passwd != null){
			String query = "select * from USERS where userId='" + userId + "';";
			ResultSet r = st.executeQuery(query);
			ResultSet temp;
			if(r.next()){
				if(r.getString("deactive").equals("f")){
					if(r.getString("passwd").equals(passwd)){
						query = "update USERS set logAt=0 where userId='" + userId + "';";
						st.executeUpdate(query);
						session.setAttribute("logged_in", "true");
						session.setAttribute("logged_in_as", userId);
						response.sendRedirect("index.jsp");
					}
					else{
						query = "update USERS set logAt=" + (r.getInt("logAt")+1) + " where userId='" + userId + "';";
						st.executeUpdate(query);
						query = "select logAt from USERS where userId='" + userId + "';";
						r = st.executeQuery(query);
						r.next();
						if(r.getInt("logAt") == 3){
							query = "update USERS set deactive='t' where userId='" + userId + "';";
							st.executeUpdate(query);
						}
						%> <center>Incorrect creds...</center><%
					}
				}
				else{
					%> <center>Account is deactivated...</center><%
				}
			}
			else{
				%> <center>Incorrect creds...</center><%
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
        <div class="container"><a class="navbar-brand" href="/">SlothBank</a><span>Log In</span><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"></li>
                    <li class="nav-item"></li>
                </ul><span class="navbar-text actions"><a class="btn btn-light action-button" role="button" href="signUp.jsp">Sign up</a></span>
            </div>
        </div>
    </nav>
    <h1 style="text-align: center;font-family: 'Alegreya SC', serif;margin-top: 100px;"><strong>Log In :</strong></h1>
    <form style="margin-top: 50px;text-align: left;margin-right: 300px;margin-left: 300px;" action="logIn.jsp" method="post"><label class="form-label">User ID</label><input class="form-control" type="text" name="userId" style="width: 300px;"><label class="form-label">Password</label><input class="form-control" type="password" name="passwd" style="width: 300px;"><input class="form-control" type="submit" style="width: 300px;"></form>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/script.min.js"></script>
</body>

</html>