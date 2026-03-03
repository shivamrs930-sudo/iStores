<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.ProductDao" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.*" %>


<%
String user = (String)session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Products - iStore</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:-apple-system, BlinkMacSystemFont, sans-serif;
}

body{
    background:
        linear-gradient(to bottom, rgba(0,0,0,0.85), rgba(17,17,17,0.85)),
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
    padding:15px 60px;
    background:#111;
}

.navbar a{
    color:white;
    text-decoration:none;
    margin-left:20px;
    transition:0.3s;
}

.navbar a:hover{
    color:#0071e3;
}

/* TITLE */
.title{
    text-align:center;
    margin:40px 0;
    font-size:40px;
}

/* CATEGORY SECTION */
.category-section{
    display:flex;
    justify-content:center;
    gap:40px;
    padding:40px;
    flex-wrap:wrap;
}

.category-card{
    position:relative;
    width:320px;
    height:380px;
    border-radius:25px;
    overflow:hidden;
    cursor:pointer;
    transition:0.4s;
    box-shadow:0 20px 40px rgba(0,0,0,0.5);
}

.category-card img{
    width:100%;
    height:100%;
    object-fit:cover;
    transition:0.5s;
}

.category-card:hover img{
    transform:scale(1.1);
}

.category-overlay{
    position:absolute;
    bottom:0;
    width:100%;
    padding:15px;
    background:white;
    color:black;
}
.category-overlay h2{
    font-size:26px;
    font-weight:600;
    letter-spacing:-0.3px;
    font-family:-apple-system, BlinkMacSystemFont, "SF Pro Display", sans-serif;

    background: linear-gradient(90deg, #7b2ff7, #3a86ff);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}


/* PRODUCT GRID */
.product-container{
    display:flex;
    justify-content:center;
    gap:40px;
    flex-wrap:wrap;
    padding-bottom:60px;
}

/* PRODUCT CARD */
.product-card{
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(10px);
    border-radius:20px;
    padding:25px;
    width:280px;
    text-align:center;
    transition:0.4s;
    box-shadow:0 10px 30px rgba(0,0,0,0.5);
}

.product-card:hover{
    transform:translateY(-10px);
}

.product-card img{
    width:200px;
    height:200px;
    object-fit:contain;
}

.price{
    margin:10px 0;
    font-size:20px;
    font-weight:bold;
}

.btn{
    padding:10px 25px;
    background:#0071e3;
    border:none;
    color:white;
    border-radius:25px;
    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    background:#005bb5;
}
</style>
</head>

<body>

<div class="navbar">
    <div>🍎 iStore</div>
    <div>
        <a href="index.jsp">Home</a>
        <a href="product.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
    </div>
</div>

<h2 class="title">Our Categories</h2>

<div class="category-section">
    <a href="iphone.jsp" class="category-card">
        <img src="https://i.pinimg.com/1200x/b8/f5/79/b8f5798248a5404dd24bcff4ce940ec8.jpg">
        <div class="category-overlay"><h2>iPhone</h2>
        <p>Beyond Imagination</p>
        </div>
        


    <a href="macbook.jsp" class="category-card">
        <img src="https://i.pinimg.com/1200x/91/3b/f9/913bf94d641495f2afc9c3967e01424d.jpg">
        <div class="category-overlay"><h2>MacBook</h2>
        <p>Supercharged by M4 </p>
        </div>
    </a>

    <a href="ipad.jsp" class="category-card">
        <img src="https://i.pinimg.com/736x/22/a8/d0/22a8d0023fb930178185b721b9f0a8ee.jpg">
        <div class="category-overlay"><h2>iPad</h2>
        <p>Power Meets Portability</p>
        </div>
    </a>
</div>

<h2 class="title">All Products</h2>

<div class="product-container">
<%
List<Product> list = ProductDao.getAllProducts();
if(list != null){
    for(Product p : list){
%>

<div class="product-card">
    <img src="<%= p.getImage() %>" alt="<%= p.getName() %>">
    <h3><%= p.getName() %></h3>
    <p><%= p.getDescription() %></p>
    <div class="price">₹ <%= p.getPrice() %></div>

    <form action="<%=request.getContextPath()%>/CartServlet" method="post">
        <input type="hidden" name="id" value="<%= p.getId() %>">
        <input type="hidden" name="color" value="Default">
        <input type="hidden" name="storage" value="Default">
        <input type="hidden" name="action" value="add">
        <button type="submit" class="btn">Add to Cart</button>
    </form>
</div>

<%
    }
}
%>
</div>

</body>
</html>