<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <style>
    </style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/carousel.css" rel="stylesheet">

    <title>Sneaka</title>
</head>


<body>
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
                        <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
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
                            <%Object value = session.getAttribute("msg");
                            if (value == null){%>
                            <i></i>
                            <%}%>
                            <%else{%>
                            <i><%=value%></i>                           
                            <%}%>
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
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#0"/></svg>

                <div class="container">
                    <div class="carousel-caption">
                        <img src="img/a.webp" class="img-fluid">
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#0"/></svg>

                <div class="container">
                    <div class="carousel-caption">
                        <img src="img/a.webp" class="img-fluid">
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#0"/></svg>

                <div class="container">
                    <div class="carousel-caption">
                        <img src="img/a.webp" class="img-fluid">
                    </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>


    <div class="container marketing">


        <div class="row">
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="200" height="200"
                     xmlns="http://www.w3.org/2000/svg">
                    <image href="img/b.webp" height="200" width="200"></image>
                </svg>
                <h2>Trend anni '90 da uomo</h2>
                <p>Stile in primo piano</p>
                <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="200" height="200"
                     xmlns="http://www.w3.org/2000/svg">
                    <image href="img/b.webp" height="200" width="200"></image>
                </svg>
                <h2>Look primaverili allegri da donna</h2>
                <p>Tira su il morale con colori accesi</p>
                <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="200" height="200"
                     xmlns="http://www.w3.org/2000/svg">
                    <image href="img/b.webp" height="200" width="200"></image>
                </svg>

                <h2>Look primaverili allegri per bambini</h2>
                <p>Per giocare al parco con stile</p>
                <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
            </div>
        </div>



        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">Scarpe da uomo</h2>
                <p class="lead">blblblbblblasdasdsad</p>
            </div>
            <div class="col-md-5">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg">
                    <image href="img/b.webp" height="500" width="500"></image>
                </svg>

            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading">Scarpe da donna</h2>
                <p class="lead">blblblbblblasdasdsad</p>
            </div>
            <div class="col-md-5 order-md-1">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg">
                    <image href="img/b.webp" height="500" width="500"></image>
                </svg>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">Scarpe da bambino</h2>
                <p class="lead">blblblbblblasdasdsad</p>
            </div>
            <div class="col-md-5">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg">
                    <image href="img/b.webp" height="500" width="500"></image>
                </svg>
            </div>
        </div>

        <hr class="featurette-divider">


    </div>




    <footer class="container">
        <p></p>
    </footer>



</main>

<script src="bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>