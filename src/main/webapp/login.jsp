<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Login - iStore</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:-apple-system,BlinkMacSystemFont,sans-serif;
}

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;

background:
url("https://i.pinimg.com/1200x/d8/be/5c/d8be5c315d6bc5713fc0e1e1be72c482.jpg");

background-size:cover;
background-position:center;
}

/* glass card */

.login-card{
width:360px;
padding:40px;

background:rgba(0,0,0,0.55);
backdrop-filter:blur(18px);

border-radius:18px;

text-align:center;
color:white;

box-shadow:0 20px 40px rgba(0,0,0,0.5);
}

.login-card h2{
font-size:28px;
margin-bottom:25px;
}

/* input */

.input{
width:100%;
padding:14px;

margin:10px 0;

border:none;
border-radius:10px;

background:rgba(255,255,255,0.15);
color:white;

font-size:14px;
}

.input::placeholder{
color:#ccc;
}

/* button */

.btn{
width:100%;
padding:14px;

margin-top:15px;

border:none;
border-radius:30px;

background:linear-gradient(90deg,#0071e3,#3fb6ff);

color:white;
font-size:16px;
cursor:pointer;

transition:0.3s;
}

.btn:hover{
transform:scale(1.04);
}

/* link */

.link{
margin-top:18px;
font-size:14px;
}

.link a{
color:#4da3ff;
text-decoration:none;
}

.error{
color:red;
margin-top:10px;
}

</style>
</head>

<body>

<div class="login-card">

<h2>Login</h2>

<form action="LoginServlet" method="post">

<input class="input" type="email" name="email" placeholder="Email" required>

<input class="input" type="password" name="password" placeholder="Password" required>

<button class="btn" type="submit">Login</button>

</form>

<%
if(request.getParameter("error")!=null){
%>
<p class="error">Invalid Email or Password</p>
<%
}
%>

<div class="link">
Don't have an account?
<a href="signup.jsp">Sign Up</a>
</div>

</div>

</body>
</html>