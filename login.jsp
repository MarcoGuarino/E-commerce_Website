<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

        <title>Login</title>

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>

        <link href="bootstrap/css/login.css" rel="stylesheet">
    </head>

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
                    <li class="nav-item">
                        <a class="nav-link" style="margin-top:10px;">
                        <%Object value = session.getAttribute("msg");
                        if (value != null){%>
                        <i><%=value%></i>
                        <%}%>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="login.jsp"><i class="bi bi-person-circle fs-4 mb-3"></i></a>
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

    <body class="text-center" style="background-image: url('img/login.png')">

        <main class="form-signin bg-white" style="border-radius:20px; height:300px">
            <form action="LoginServlet" method="post">
                <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

                <div class="form-floating" style="margin-top:30px">
                    <input type="text" class="form-control" id="floatingInput" name="username" placeholder="username">
                    <label for="floatingInput">Username</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
                    <label for="floatingPassword">Password</label>
                </div>

                <!--<div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" style="color:white; margin-top:70px" value="remember-me"> Remember me
                    </label>
                </div> -->
                <!--<button class="w-10 btn btn-lg btn-primary" style="color:white" type="submit">Sign in</button> -->
                <button class="w-10 btn btn-lg btn-secondary" style="color:white" type="submit">Sign up</button>
            </form>
        </main>
    </body>
</html>

