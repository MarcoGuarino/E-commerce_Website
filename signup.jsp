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
                        <a class="nav-link" href="admin.jsp"><i class="bi bi-pencil-square fs-4 mb-3"></i></a>
                    </li>
                    <%}%>
                </ul>
            </div>
        </div>
    </nav>
</header>


<body>
<main>
<div class="container" style="margin-top:50px">
        <div class="row g-5">
            <div class="col-md-7 col-lg-8">
                <h4 class="mb-3">Inserisci le tue informazioni personali</h4>
                <form class="form" action="UserServlet" method="post">
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label class="form-label">Nome</label>
                            <input type="text" class="form-control" name="nome" placeholder="" required>
                        </div>

                        <div class="col-sm-6">
                            <label class="form-label">Cognome</label>
                            <input type="text" class="form-control" name="cognome" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Username</label>
                            <input type="text" class="form-control" name="username" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" name="pwd" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Data di Nascita</label>
                            <input type="date" class="form-control" name="datan" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Comune di Nascita</label>
                            <input type="text" class="form-control" name="comunen" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Indirizzo</label>
                            <input type="text" class="form-control" name="indirizzo" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Paese</label>
                            <input type="text" class="form-control" name="paese" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Premium</label>
                            <select class="form-control" name="premium">
                            <option selected>si</option>
                            <option>no</option>
                            </select>
                        </div>
                    </div>

                    <hr class="my-3">

                    <button class="w-10 btn btn-primary btn-success" type="submit">Registrati</button>
                </form>
            </div>
        </div>
    </div>
</main>
<script src="bootstrap/js/bootstrap.bundle.js"></script>
</body>
</body>
</html>