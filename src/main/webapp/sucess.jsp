<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Order Success</title>

<style>

body{
display:flex;
justify-content:center;
align-items:center;
height:100vh;
background:#111;
font-family:sans-serif;
}

.popup{
background:#28a745;
padding:30px 50px;
border-radius:15px;
color:white;
font-size:20px;
box-shadow:0 10px 30px rgba(0,0,0,0.5);
}

</style>

<script>

setTimeout(function(){
window.location="index.jsp";
},3000);

</script>

</head>

<body>

<div class="popup">
✅ Order Submitted Successfully! <br>
Redirecting to Home...
</div>

</body>
</html>