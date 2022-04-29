<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="stili.css">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

    <title>Sneaka</title>
</head>

<body style="padding-top:65px;">
<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark py-3">
        <div class="container-fluid">
            <span class="navbar-brand mb-0 h1 fs-1" style="font-weight:bold">SNEAKA</span>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="offerte.jsp">Offerte</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Marche
                        </a>
                    
                        <ul class="dropdown-menu" style="color:orange"aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item dropdown-show" href="#">Nike</a></li>
                            <li><a class="dropdown-item" href="#">Adidas</a></li>
                            <li><a class="dropdown-item" href="#">Converse</a></li>
                            <li><a class="dropdown-item" href="#">New Balance</a></li>
                        </ul>
                    </li>
                   <li class="nav-item">
                        <a class="nav-link" href="ricerca.jsp"><i class="bi bi-search"></i></a>
                    </li>
                </ul>

                <ul class="nav navbar-nav ml-auto">
                <!--
                    <li class="nav-item">
                        <form class="d-flex">
                            <!<button class="btn btn-outline-success" style="background-color:orange; color:white; border-color:white" type="submit">Search</button>
                        </form>
                    </li>
                -->
                    <li class="nav-item">
                        <a class="nav-link" style="margin-top:10px;">
                        <%Object value = session.getAttribute("msg");                            
                        if (value != null){%>
                           <i><%=value%></i>
                        <%}%>
                        </a>
                    </li>
                           
                    <%
                    String dest;
                    if (value == null)
                        dest = "login.jsp";
                    else{
                        dest = "logout.jsp";
                        }
                    %>
                    <li class="nav-item">
                    <a class="nav-link" href=<%=dest%>><i class="bi bi-person-circle fs-4 mb-3"></i></a>
                    </li>
                    <% boolean user;
                    user = true;
                    if (user == true) {%>
                    <li class="nav-item">
                       <a class="nav-link" href="#"><i class="bi bi-cart fs-4 mb-3"></i></a>
                    </li>
                    <%}%>
                    <% boolean admin;
                    admin = true;
                    if (admin == true) {%>
                    <li class="nav-item">
                       <a class="nav-link" href="#"><i class="bi bi-pencil-square fs-4 mb-3"></i></a>
                    </li>
                    <%}%>
                </ul>
            </div>
        </div>
    </nav>
</header>


<main>
<div class="container mt-5">
</div>
<div class="container">
  <div class="row">
    <div class="col-md-6">
      <div>
        <img src="img/b.webp" width="300" height="250">
      </div>
    </div>
    <div class="col-md-6">
      <div class="row">
        <h2>Nike Air Jordan 1 low</h2>
      </div>
      <div class="row">
        <h1><i class="fa fa-inr" aria-hidden="true"></i> 599 €</h1>
        <!--&nbsp; &nbsp;
        <h3><del>799</del></h3>
        &nbsp; &nbsp;
        <h2 class="text-success">30% off</h2>
      </div>-->
      <div class="row">
        <!--<h3 class="text-warning"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star-half-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i></h3>-->
        <h5>Rating: 4.5/5</h5>
      </div>
      <!--<div class="row">
        <p><i class="text-success fa fa-check-square-o" aria-hidden="true"></i> <strong>Bank Offer</strong> 20% Instant Discount on SBI Credit Cards</p>
        <p><i class="text-success fa fa-check-square-o" aria-hidden="true"></i> <strong>Bank Offer</strong> 5% Unlimited Cashback on Flipkart Axis Bank Credit Card </p>
        <p><i class="text-success fa fa-check-square-o" aria-hidden="true"></i> <strong>Bank Offer</strong> Extra 5% off* with Axis Bank Buzz Credit Card</p>
        <p><i class="text-success fa fa-check-square-o" aria-hidden="true"></i> <strong>Bank Offer</strong>20% Instant Discount on pay with <i class="fa fa-google-wallet" aria-hidden="true"></i> google wallet </p>
      </div>-->
      <!--<div class="row mt-4">
        <h3 class="text-info"><i class="fa fa-map-marker" aria-hidden="true"></i></h3>
        <p style="font-size: 20px"> &nbsp; Delivery by23 Jul, Tuesday | &nbsp; <span class="text-success">FREE</span> </p>
      </div>-->
      <div class="row mt-4">
        <h4>Size: &nbsp; &nbsp;</h4>
        <!--<div class="dropdown show"> <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Select sizes </a>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuLink"> <a class="dropdown-item" href="#">small</a> <a class="dropdown-item" href="#">meduam </a> <a class="dropdown-item" href="#">large</a> </div>
                        <ul class="dropdown-menu" style="color:orange"aria-labelledby="dropdownMenuButton">
                            <li><a class="dropdown-item" href="#">Nike</a></li>
                            <li><a class="dropdown-item" href="#">Adidas</a></li>
                            <li><a class="dropdown-item" href="#">Reebok</a></li>
                        </ul>
          </div> 
        </div>-->
      <form method="POST">  
      <div class="form-group" style="width:100px; height:100px">
      <select class="form-control" id="exampleFormControlSelect1">
      <option>37</option>
      <option>38</option>
      <option>39</option>
      <option>40</option>
      <option>41</option>
      <option>42</option>
      <option>43</option>
      </select>
      &nbsp;
      &nbsp;
      <input class="btn btn-success text-light"  name="action" type="submit" value="acquisto">
      &nbsp;
      <input class="btn btn-primary text-light" style="margin-top:10px"name="action" type="submit" value="carrello">
      </form>
  </div>
      </div>
      
    </div>
  </div>
</div>


<div class="container">
   <br/>
   <div class="row mt-5">
   	 <h2>Prodotti simili</h2>
   </div>
   
   <div class="row mt-2">
   	<div class="col-md-3">
   		<div class="card">
   			<img class="card-img-top img-fluid" src="img/b.webp">
   			<div class="card-title">
   				<h4>GYM Tops</h4>
   			</div> 
   			<div class="card-text">
   				<a  class="btn btn-secondary text-light" href="buy.jsp"> Details</a> &nbsp;<br/><br/>
   			</div>
   		</div>
   	</div>
   	
   	
   	<div class="col-md-3">
   		<div class="card">
   			<img class="card-img-top img-fluid" src="img/b.webp">
   			<div class="card-title">
   				<h4>GYM Tops</h4>
   			</div> 
   			<div class="card-text">
   				<a  class="btn btn-secondary text-light" href="buy.jsp"> Details</a> &nbsp;<br/><br/>
   			</div>
   		</div>
   	</div>
   	
   	
   	<div class="col-md-3">
   		<div class="card">
   			<img class="card-img-top img-fluid" src="img/b.webp">
   			<div class="card-title">
   				<h4>GYM Tops</h4>
   			</div> 
   			<div class="card-text">
   				<a  class="btn btn-secondary text-light" href="buy.jsp"> Details</a> &nbsp;<br/><br/>
   			</div>
   		</div>
   	</div>
   	
   	<div class="col-md-3">
   		<div class="card">
   			<img class="card-img-top img-fluid" src="img/b.webp">
   			<div class="card-title">
   				<h4>GYM Tops</h4>
   			</div> 
   			<div class="card-text">
   				<a  class="btn btn-secondary text-light" href="buy.jsp"> Details</a> &nbsp;<br/><br/>
   			</div>
	
</div>



</main>





<script src="bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>