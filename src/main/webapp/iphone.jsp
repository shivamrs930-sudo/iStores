<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>iPhone 18 Series - iStore</title>

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

.iphone-container{
    display:flex;
    justify-content:center;
    gap:40px;
    padding:40px;
}

.iphone-card{
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(15px);
    border-radius:25px;
    padding:30px;
    width:320px;
    text-align:center;
    box-shadow:0 20px 40px rgba(0,0,0,0.6);
    transition:0.4s;
}

.iphone-card:hover{
    transform:translateY(-10px);
}

.iphone-card img{
    width:220px;
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
    gap:10px;
    margin:15px 0;
    flex-wrap:wrap;
}

.color-options input,
.storage-options input{
    display:none;
}

.color-options label{
    width:25px;
    height:25px;
    border-radius:50%;
    cursor:pointer;
    border:2px solid white;
    display:inline-block;
}

.storage-options label{
    padding:6px 15px;
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

<h2 class="title">iPhone 18 Series</h2>

<div class="iphone-container">

<!-- iPhone 18 -->
<div class="iphone-card">
    <img src="https://i.pinimg.com/736x/a6/68/ef/a668efe8627933dde9d9c4144c964c9e.jpg">
    <h3>iPhone 18</h3>
    <p>Powerful. Smart. Elegant.</p>
    <div class="price">₹ 79999</div>

    <form action="<%= request.getContextPath() %>/CartServlet" method="post">
        <input type="hidden" name="id" value="4">
        <input type="hidden" name="action" value="add">

        <div class="color-options">
            <input type="radio" name="color" value="Black" id="black1" required>
            <label for="black1" style="background:black;"></label>

            <input type="radio" name="color" value="Purple" id="purple1">
            <label for="purple1" style="background:purple;"></label>

            <input type="radio" name="color" value="White" id="white1">
            <label for="white1" style="background:white;"></label>

            <input type="radio" name="color" value="Light Blue" id="blue1">
            <label for="blue1" style="background:lightblue;"></label>
        </div>

        <div class="storage-options">
            <input type="radio" name="storage" value="512GB" id="512_1" required>
            <label for="512_1">512GB</label>

            <input type="radio" name="storage" value="1TB" id="1tb_1">
            <label for="1tb_1">1TB</label>
        </div>

        <button type="submit" class="btn">Add to Cart</button>
    </form>
</div>


<!-- iPhone 18 Pro -->
<div class="iphone-card">
    <img src="https://i.pinimg.com/1200x/22/5f/95/225f953a5b53ac8bc8d43a8c9e2f9cb1.jpg">
    <h3>iPhone 18 Pro</h3>
    <p>Advanced. Professional. Stunning.</p>
    <div class="price">₹ 99999</div>

    <form action="<%= request.getContextPath() %>/CartServlet" method="post">
        <input type="hidden" name="id" value="5">
        <input type="hidden" name="action" value="add">

        <div class="color-options">
            <input type="radio" name="color" value="Burgundy" id="burgundy2" required>
            <label for="burgundy2" style="background:#800020;"></label>
            
            <input type="radio" name="color" value="Golden Brown" id="gold3">
            <label for="gold3" style="background:goldenrod;"></label>
            <input type="radio" name="color" value="Golden Brown" id="gold2">
            <label for="gold2" style="background:purple;"></label>
            

           

        </div>

        <div class="storage-options">
            <input type="radio" name="storage" value="512GB" id="512_2" required>
            <label for="512_2">512GB</label>

            <input type="radio" name="storage" value="1TB" id="1tb_2">
            <label for="1tb_2">1TB</label>
        </div>

        <button type="submit" class="btn">Add to Cart</button>
    </form>
</div>


<!-- iPhone 18 Pro Max -->
<div class="iphone-card">
    <img src="https://i.pinimg.com/1200x/22/5f/95/225f953a5b53ac8bc8d43a8c9e2f9cb1.jpg">
    <h3>iPhone 18 Pro Max</h3>
    <p>Ultimate. Massive. Next Level.</p>
    <div class="price">₹ 119999</div>

    <form action="<%= request.getContextPath() %>/CartServlet" method="post">
        <input type="hidden" name="id" value="6">
        <input type="hidden" name="action" value="add">

        <div class="color-options">
            <input type="radio" name="color" value="Burgundy" id="burgundy3" required>
            <label for="burgundy3" style="background:#800020;"></label>

            <input type="radio" name="color" value="Golden Brown" id="gold3">
            <label for="gold3" style="background:goldenrod;"></label>
            
            <input type="radio" name="color" value="Golden Brown" id="gold2">
            <label for="gold2" style="background:purple;"></label>
        </div>

        <div class="storage-options">
            <input type="radio" name="storage" value="512GB" id="512_3" required>
            <label for="512_3">512GB</label>

            <input type="radio" name="storage" value="1TB" id="1tb_3">
            <label for="1tb_3">1TB</label>
        </div>

        <button type="submit" class="btn">Add to Cart</button>
    </form>
</div>

</div>

</body>
</html>