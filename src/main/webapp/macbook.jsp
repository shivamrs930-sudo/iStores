<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>MacBook Series - iStore</title>

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
    width:380px;
    text-align:center;
    box-shadow:0 20px 40px rgba(0,0,0,0.6);
    transition:0.4s;
}

.product-card:hover{
    transform:translateY(-10px);
}

.product-card img{
    width:300px;
    height:200px;
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

/* Color & Storage Options */
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

<h2 class="title">MacBook Series</h2>

<div class="product-container">

<!-- MacBook Air -->
<div class="product-card">
    <img src="https://i.pinimg.com/736x/bd/08/99/bd089985ccfaa728954f036908d44e83.jpg">
    <h3>MacBook Air M4</h3>
    <p>Light. Fast. Powerful.</p>
    <div class="price">₹ 129999</div>

    <form action="<%= request.getContextPath() %>/CartServlet" method="post">

        <!-- ✅ Use correct DB ID -->
        <input type="hidden" name="id" value="7">
        <input type="hidden" name="action" value="add">

        <div class="color-options">
            <input type="radio" name="color" value="Space Gray" id="gray4" required>
            <label for="gray4" style="background:gray;"></label>

            <input type="radio" name="color" value="Silver" id="silver4">
            <label for="silver4" style="background:silver;"></label>
        </div>

        <div class="storage-options">
            <input type="radio" name="storage" value="512GB" id="512_4" required>
            <label for="512_4">512GB</label>

            <input type="radio" name="storage" value="1TB" id="1tb_4">
            <label for="1tb_4">1TB</label>
        </div>

        <button type="submit" class="btn">Add to Cart</button>

    </form>
</div>


<!-- MacBook Pro -->
<div class="product-card">
    <img src="https://i.pinimg.com/736x/ae/5b/d8/ae5bd8c71421a17ca832c4c5bc18a0d3.jpg">
    <h3>MacBook Pro M4</h3>
    <p>For Professionals.</p>
    <div class="price">₹ 199999</div>

    <form action="<%= request.getContextPath() %>/CartServlet" method="post">

        <!-- ✅ Replace with real DB ID -->
        <input type="hidden" name="id" value="10">
        <input type="hidden" name="action" value="add">

        <div class="color-options">
            <input type="radio" name="color" value="Space Black" id="black5" required>
            <label for="black5" style="background:black;"></label>

            <input type="radio" name="color" value="Silver" id="silver5">
            <label for="silver5" style="background:silver;"></label>
        </div>

        <div class="storage-options">
            <input type="radio" name="storage" value="512GB" id="512_5" required>
            <label for="512_5">512GB</label>

            <input type="radio" name="storage" value="1TB" id="1tb_5">
            <label for="1tb_5">1TB</label>
        </div>

        <button type="submit" class="btn">Add to Cart</button>

    </form>
</div>
        

    </form>
</div>

</div>

</body>
</html>