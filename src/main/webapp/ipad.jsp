<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>iPad Series - iStore</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:-apple-system, BlinkMacSystemFont, sans-serif;
}

body{
    background:linear-gradient(to bottom,#000,#111,#222);
    color:white;
}

.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:20px 60px;
    background:black;
}

.navbar a{
    color:white;
    text-decoration:none;
    margin-left:30px;
}

.navbar a:hover{
    color:#0071e3;
}

.title{
    text-align:center;
    margin:50px 0;
    font-size:40px;
}

.product-container{
    display:flex;
    justify-content:center;
    gap:60px;
    padding:40px;
}

.product-card{
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(15px);
    border-radius:25px;
    padding:30px;
    width:360px;
    text-align:center;
    box-shadow:0 20px 40px rgba(0,0,0,0.6);
    transition:0.4s;
}

.product-card:hover{
    transform:translateY(-10px);
}

.product-card img{
    width:250px;
    height:220px;
    object-fit:contain;
    margin-bottom:20px;
}

.price{
    font-size:22px;
    margin:15px 0;
    font-weight:bold;
}

.btn{
    padding:12px 30px;
    background:#0071e3;
    border:none;
    border-radius:25px;
    color:white;
    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    background:#005bb5;
}

.color-options,
.storage-options{
    display:flex;
    justify-content:center;
    gap:12px;
    margin:15px 0;
    flex-wrap:wrap;
}

.color-options input,
.storage-options input{
    display:none;
}

.color-options label{
    width:28px;
    height:28px;
    border-radius:50%;
    cursor:pointer;
    border:2px solid white;
    display:inline-block;
}

.storage-options label{
    padding:6px 18px;
    border-radius:20px;
    border:2px solid white;
    cursor:pointer;
    font-size:14px;
}

.color-options input:checked + label,
.storage-options input:checked + label{
    border:3px solid #0071e3;
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

<h2 class="title">iPad Series</h2>

<div class="product-container">

<!-- iPad Air -->
<div class="product-card">
    <img src="https://i.pinimg.com/736x/27/8a/e8/278ae8c77de8c58fc8b9cae28596494b.jpg">
    <h3>iPad Air M4</h3>
    <p>Light. Colorful. Powerful.</p>
    <div class="price">₹ 59999</div>

    <form action="<%= request.getContextPath() %>/CartServlet" method="post">

        <input type="hidden" name="id" value="11">
        <input type="hidden" name="action" value="add">

        <div class="color-options">
            <input type="radio" name="color" value="Space Gray" id="gray6" required>
            <label for="gray6" style="background:gray;"></label>

            <input type="radio" name="color" value="Blue" id="blue6">
            <label for="blue6" style="background:lightblue;"></label>

            <input type="radio" name="color" value="Pink" id="pink6">
            <label for="pink6" style="background:pink;"></label>
        </div>

        <div class="storage-options">
            <input type="radio" name="storage" value="512GB" id="512_6" required>
            <label for="512_6">512GB</label>

            <input type="radio" name="storage" value="1TB" id="1tb_6">
            <label for="1tb_6">1TB</label>
        </div>

        <button type="submit" class="btn">Add to Cart</button>

    </form>
</div>


<!-- iPad Pro -->
<div class="product-card">
    <img src="https://i.pinimg.com/1200x/9e/82/61/9e826171f28cd3eee80f88dcac486e21.jpg">
    <h3>iPad Pro M4</h3>
    <p>Ultimate Performance. Stunning Display.</p>
    <div class="price">₹ 89999</div>

    <form action="<%= request.getContextPath() %>/CartServlet" method="post">

        <input type="hidden" name="id" value="12">
        <input type="hidden" name="action" value="add">

        <div class="color-options">
            <input type="radio" name="color" value="Space Black" id="black7" required>
            <label for="black7" style="background:black;"></label>

            <input type="radio" name="color" value="Silver" id="silver7">
            <label for="silver7" style="background:silver;"></label>
        </div>

        <div class="storage-options">
            <input type="radio" name="storage" value="512GB" id="512_7" required>
            <label for="512_7">512GB</label>

            <input type="radio" name="storage" value="1TB" id="1tb_7">
            <label for="1tb_7">1TB</label>
        </div>

        <button type="submit" class="btn">Add to Cart</button>

    </form>
</div>
   

    </form>
</div>

</div>

</body>
</html>