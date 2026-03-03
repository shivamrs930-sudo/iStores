<%@ page import="java.sql.*" %>
<%
if(session.getAttribute("user")==null){
response.sendRedirect("login.jsp");
return;
}
%>
<%
String message="";

if(request.getMethod().equalsIgnoreCase("POST")){

String name=request.getParameter("name");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String coupon=request.getParameter("coupon");
String payment=request.getParameter("payment");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/istore","root","root");

PreparedStatement ps=con.prepareStatement(
"insert into orders(name,email,phone,address,coupon,payment_method) values(?,?,?,?,?,?)");

ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,phone);
ps.setString(4,address);
ps.setString(5,coupon);
ps.setString(6,payment);

ps.executeUpdate();

message="success";

con.close();

}catch(Exception e){
message="error";
}

}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Secure Checkout</title>

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
linear-gradient(to bottom, rgba(0,0,0,0.8), rgba(17,17,17,0.9)),
url("https://i.pinimg.com/1200x/d8/be/5c/d8be5c315d6bc5713fc0e1e1be72c482.jpg");

background-size:cover;
background-position:center;
color:white;
}

.checkout-container{
width:520px;
padding:40px;
border-radius:25px;

background:rgba(255,255,255,0.08);
backdrop-filter:blur(25px);

box-shadow:0 20px 50px rgba(0,0,0,0.6);

animation:fadeIn 0.6s ease;
}

@keyframes fadeIn{
from{opacity:0; transform:translateY(20px);}
to{opacity:1; transform:translateY(0);}
}

h2{
text-align:center;
margin-bottom:25px;
font-weight:600;
}

.input-group{
margin-bottom:18px;
}

label{
font-size:14px;
display:block;
margin-bottom:6px;
opacity:0.8;
}

input,textarea{
width:100%;
padding:12px;
border-radius:12px;
border:1px solid rgba(255,255,255,0.2);
background:rgba(255,255,255,0.05);
color:white;
font-size:14px;
}

textarea{
resize:none;
}

input:focus,textarea:focus{
outline:none;
border-color:#0071e3;
box-shadow:0 0 10px rgba(0,113,227,0.5);
}

.payment-options{
display:flex;
gap:20px;
margin-top:10px;
}

.submit-btn{
width:100%;
padding:14px;
border:none;
border-radius:30px;

background:linear-gradient(135deg,#0071e3,#00a2ff);
color:white;

font-size:16px;
cursor:pointer;
transition:0.3s;
}

.submit-btn:hover{
transform:translateY(-3px);
box-shadow:0 10px 25px rgba(0,113,227,0.6);
}

#cardDetails{
display:none;
}

.success-popup{
display:none;
position:fixed;
top:30px;
right:30px;

background:rgba(40,167,69,0.95);
padding:20px 30px;
border-radius:20px;

color:white;
box-shadow:0 10px 25px rgba(0,0,0,0.4);
}

</style>

<script>

function showCard(){
document.getElementById("cardDetails").style.display="block";
}

function hideCard(){
document.getElementById("cardDetails").style.display="none";
}

function confirmOrder(){

let payment=document.querySelector('input[name="payment"]:checked');

if(!payment){
alert("Please select payment method");
return false;
}

document.getElementById("checkoutForm").submit();

}

</script>

</head>

<body>

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
 Order placed successfully!
 please check email for further details.
</div>

<script>
setTimeout(function(){
    window.location.href="index.jsp";
},3000);
</script>

<%
}
%>

<div class="checkout-container">

<h2>&#128274; Secure Checkout</h2>

<form action="OrderServlet" method="post" id="checkoutForm">

<div class="input-group">
<label>Full Name</label>
<input type="text" name="name" required>
</div>

<div class="input-group">
<label>Email</label>
<input type="email" name="email" required>
</div>

<div class="input-group">
<label>Phone Number</label>
<input type="tel" name="phone" maxlength="10" pattern="[0-9]{10}" required>
</div>

<div class="input-group">
<label>Shipping Address</label>
<textarea rows="3" name="address" required></textarea>
</div>

<div class="input-group">
<label>Coupon Code (Optional)</label>
<input type="text" name="coupon">
</div>

<div class="input-group">

<label>Select Payment Method</label>

<div class="payment-options">

<label>
<input type="radio" name="payment" value="COD" onclick="hideCard()">
Cash on Delivery
</label>

<label>
<input type="radio" name="payment" value="CARD" onclick="showCard()">
Credit Card
</label>

</div>

</div>

<div id="cardDetails">

<div class="input-group">
<label>Card Number</label>
<input type="text" name="cardNumber" maxlength="16" placeholder="1234567890123456">
</div>

<div class="input-group">
<label>Card Holder Name</label>
<input type="text" name="cardName">
</div>

<div class="input-group">
<label>Expiry Date</label>
<input type="month" name="expiry">
</div>

<div class="input-group">
<label>CVV</label>
<input type="password" name="cvv" maxlength="3">
</div>

</div>

<button type="button" onclick="confirmOrder()" class="submit-btn">
Place Order
</button>

</form>

</div>

<div class="success-popup" id="popup">
✅ Order Submitted Successfully! <br>
Please check your email for further details.
</div>

<% if("success".equals(message)){ %>

<script>

window.onload=function(){

document.getElementById("popup").style.display="block";

setTimeout(function(){
window.location.href="index.jsp";
},3000);

}

</script>

<% } %>

</body>
</html>