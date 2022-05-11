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


<body class="text-center" style="background-image: url('img/login.png')">
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
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Marche
                        </a> 
                        <ul class="dropdown-menu" style="color:orange"aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item dropdown-show" href="ricerca.jsp?marcanav=nike">Nike</a></li>
                            <li><a class="dropdown-item" href="ricerca.jsp?marcanav=adidas" >Adidas</a></li>
                            <li><a class="dropdown-item" href="ricerca.jsp?marcanav=converse">Converse</a></li>
                            <li><a class="dropdown-item" href="ricerca.jsp?marcanav=new balance" >New Balance</a></li>
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
                            <%Object valuemsg = session.getAttribute("msg");
                                if (valuemsg != null){%>
                            <i><%=valuemsg%></i>
                            <%}%>
                        </a>
                    </li>

                    <%
                        String dest;
                        if (valuemsg == null)
                            dest = "login.jsp";
                        else{
                            dest = "logout.jsp";
                        }
                    %>
                    <li class="nav-item">
                        <a class="nav-link active" href=<%=dest%>><i class="bi bi-person-circle fs-4 mb-3"></i></a>
                    </li>
                    <% Object value_us = session.getAttribute("admin");
                        if (value_us == "no") {%>
                    <li class="nav-item">
                        <a class="nav-link" href="carrello.jsp"><i class="bi bi-cart fs-4 mb-3"></i></a>
                    </li>
                    <%}%>
                    <% Object value_ad = session.getAttribute("admin");
                        if (value_ad == "yes") {%>
                    <li class="nav-item">
                        <a class="nav-link" href=""><i class="bi bi-pencil-square fs-4 mb-3"></i></a>
                    </li>
                    <%}%>
                </ul>
            </div>
        </div>
    </nav>
</header>



<main>
    <div class="col d-flex justify-content-center" style="margin-top:250px; widht:50px">
        <div class="card w-20 h-40">
            <div class="card-body">
                <%Object user_log = session.getAttribute("utente");%> 
                <h5 class="card-title"><%=user_log%></h5>
                    <% //Object value_us = session.getAttribute("admin");
                        if (value_us == "no") {%>
                            <p class="card-text">Sei un user</p>
                    <%}%>
                    <% //Object value_ad = session.getAttribute("admin");
                        if (value_ad == "yes") {%>
                            <p class="card-text">Sei admin</p>
                    <%}%>

                <a href="LogoutServlet" class="btn btn-danger">effettua il logout</a>
            </div>
        </div>
    </div>
</main>
<script src="bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>