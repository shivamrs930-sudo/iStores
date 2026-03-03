<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.ProductDao" %>
<%@ page import="model.Product" %>

<%
String user = (String)session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart - iStore</title>

<style>
body{
    background:#000;
    color:white;
    font-family:-apple-system,BlinkMacSystemFont,sans-serif;
    padding:40px;
}

h2{
    margin-bottom:30px;
}

.cart-item{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:20px;
    margin-bottom:15px;
    background:#111;
    border-radius:10px;
}

.total{
    text-align:right;
    font-size:22px;
    font-weight:bold;
    margin-top:30px;
}
button{
    padding:5px 10px;
    background:#0071e3;
    border:none;
    color:white;
    border-radius:5px;
    cursor:pointer;
}
</style>
</head>
<body>

<h2>Your Cart</h2>

<%
Map<String, Integer> cart =
    (Map<String, Integer>) session.getAttribute("cart");

double total = 0;

if(cart != null && !cart.isEmpty()){

    for(Map.Entry<String, Integer> entry : cart.entrySet()){

        String key = entry.getKey();   // format: id-color-storage
        int quantity = entry.getValue();

        String[] parts = key.split("-");
        int productId = Integer.parseInt(parts[0]);
        String color = parts[1];
        String storage = parts[2];

        Product p = ProductDao.getProductById(productId);

        if(p != null){

            double subTotal = p.getPrice() * quantity;
            total += subTotal;
%>

<div class="cart-item">
    <div>
        <h3><%= p.getName() %></h3>
        <p>Color: <%= color %> | Storage: <%= storage %></p>
        <p>Price: ₹ <%= p.getPrice() %></p>

        <!-- Decrease -->
        <form action="CartServlet" method="post" style="display:inline;">
            <input type="hidden" name="key" value="<%= key %>">
            <input type="hidden" name="action" value="decrease">
            <button type="submit">-</button>
        </form>

        <strong> <%= quantity %> </strong>

        <!-- Increase -->
        <form action="CartServlet" method="post" style="display:inline;">
            <input type="hidden" name="key" value="<%= key %>">
            <input type="hidden" name="action" value="increase">
            <button type="submit">+</button>
        </form>
    </div>

    <div>
        ₹ <%= subTotal %>
    </div>
</div>

<%
        }
    }
}else{
%>

<p>Your cart is empty.</p>

<%
}
%>

<div class="total">
    Total: ₹ <%= total %>
</div>

<form action="checkout.jsp" method="get">
    <button style="
        padding:15px 30px;
        background:#0071e3;
        color:white;
        border:none;
        border-radius:8px;
        font-size:16px;
        cursor:pointer;
    ">
        Proceed to Checkout
    </button>
</form>

</body>
</html>