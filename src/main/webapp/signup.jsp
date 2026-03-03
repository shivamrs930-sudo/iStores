<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Signup - iStore</title>

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

.signup-card{
width:360px;
padding:40px;

background:rgba(0,0,0,0.55);
backdrop-filter:blur(18px);

border-radius:18px;

text-align:center;
color:white;

box-shadow:0 20px 40px rgba(0,0,0,0.5);
}

.signup-card h2{
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

</style>
</head>

<body>

<div class="signup-card">

<h2>Create Account</h2>

<form action="SignupServlet" method="post">

<input class="input" type="text" name="name" placeholder="Full Name" required>

<input class="input" type="email" name="email" placeholder="Email Address" required>

<input class="input" type="password" name="password" placeholder="Password" required>

<button class="btn" type="submit">Create Account</button>

</form>

<div class="link">
Already have an account?
<a href="login.jsp">Login</a>
</div>

</div>

</body>
</html>