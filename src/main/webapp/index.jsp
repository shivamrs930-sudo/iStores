<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String user = (String)session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>iStore - Home</title>

<style>

/* RESET */
*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:-apple-system,BlinkMacSystemFont,sans-serif;
}

/* BODY */
body{
display:flex;
flex-direction:column;
height:100vh;

background:
url("https://i.pinimg.com/1200x/d8/be/5c/d8be5c315d6bc5713fc0e1e1be72c482.jpg");

background-size:cover;
background-position:center;
background-attachment:fixed;
color:white;
}

/* NAVBAR */

.navbar{
display:flex;
justify-content:space-between;
align-items:center;
padding:18px 80px;
background:rgba(0,0,0,0.6);
backdrop-filter:blur(12px);
position:fixed;
width:100%;
top:0;
z-index:1000;
}

.logo{
font-size:20px;
font-weight:600;
letter-spacing:1px;
}

.nav-links a{
color:white;
text-decoration:none;
margin-left:25px;
font-size:15px;
transition:0.3s;
}

.nav-links a:hover{
color:#2997ff;
}

/* HERO */

.hero{
flex:1;
display:flex;
flex-direction:column;
justify-content:center;
align-items:center;
text-align:center;
padding:0 20px;
}

.hero h1{
font-size:70px;
font-weight:600;
margin-bottom:20px;
}

.hero p{
font-size:22px;
opacity:0.9;
margin-bottom:35px;
}

/* BUTTON */

.btn{
padding:14px 35px;
background:#0071e3;
border-radius:30px;
color:white;
text-decoration:none;
font-size:16px;
transition:0.3s ease;
}

.btn:hover{
background:#2997ff;
transform:scale(1.05);
}

/* FOOTER */

.footer{
background:#111;
color:#bfbfbf;
text-align:center;
padding:18px;
font-size:12px;
border-top:1px solid #333;
}

</style>
</head>

<body>



<!-- NAVBAR -->
<div class="navbar">

<div class="logo">🍎 iStore</div>

<div class="nav-links">

<a href="index.jsp">Home</a>
<a href="product.jsp">Products</a>
<a href="cart.jsp">Cart</a>
<a href="LogoutServlet" class="logout-btn">Logout</a>

<%
if(user==null){
%>

<a href="login.jsp">Login</a>
<a href="signup.jsp">Signup</a>

<%
}else{
%>

<span style="margin-left:25px;">Welcome <%=user%></span>
<a href="LogoutServlet">Logout</a>

<%
}
%>

</div>

</div>

<!-- HERO SECTION -->

<div class="hero">

<h1>Welcome to iStore</h1>

<p>Experience Premium iStore Products Like Never Before</p>

<%
if(user!=null){
%>

<a href="product.jsp" class="btn">Explore Products</a>

<%
}else{
%>

<a href="login.jsp" class="btn">Explore Products</a>

<%
}
%>

</div>

<!-- FOOTER -->

<div class="footer">

Copyright © 2026 iStore Inc. All rights reserved.
Designed by Shivam / Ashmith

</div>


<%
String success = request.getParameter("success");

if("1".equals(success)){
%>

<div id="successBox" style="
position:fixed;
top:20px;
right:20px;
background:#28a745;
color:white;
padding:15px 25px;
border-radius:8px;
font-weight:bold;
box-shadow:0 4px 8px rgba(0,0,0,0.2);
z-index:9999;">

✅ Order placed successfully!

</div>

<script>

setTimeout(function(){

document.getElementById("successBox").style.display="none";

},4000);

</script>

<%
}
%>

</body>
</html>