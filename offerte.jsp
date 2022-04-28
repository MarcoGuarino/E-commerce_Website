<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

    <title>Sneaka</title>
</head>

<body style>
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
                        <a class="nav-link active" href="offerte.jsp">Offerte</a>
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
                        <a class="nav-link" href="#"><i class="bi bi-search"></i></a>
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
                    <% boolean flag;
                    flag = true;
                    if (flag == true) {%>
                        <li class="nav-item">
                            <a class="nav-link" style="margin-top:10px;">
                            <%Object value = session.getAttribute("msg");%>
                            <i><%=value%></i>
                            </a>
                        </li>
                    <%}%>

                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp"><i class="bi bi-person-circle fs-4 mb-3"></i></a>
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

    <section class="py-1 text-center container">
        <div class="row py-lg-3">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light" style="margin-top:65px">PRODOTTI IN OFFERTA</h1>
                <p class="lead text-muted">scarpe in offerta fino al 70% per tutte le marche</p>
            </div>
        </div>
    </section>

    <div class="album py-4 bg-light">
        <div class="container">

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <% for(int i = 0; i < 10; i+=1) { %>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="200" height="200"
                             xmlns="http://www.w3.org/2000/svg">
                            <a href="buy.jsp"><image href="img/b.webp" height="200" width="200"></image></a>
                        </svg>
                        <div class="card-body">
                            <p class="card-price">modello</p>
                            <p class="card-price"><del>30€</del>&nbsp;&nbsp;&nbsp;&nbsp;20€</p>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>

</main>





<script src="bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>