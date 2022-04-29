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
                        <a class="nav-link active" href="ricerca.jsp"><i class="bi bi-search"></i></a>
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

    <!-- una scarpa può essere filtrata per: marca, uomo/donna/bambino, colore, prezzo -->
    <main>
    <section class="py-1 text-center container-fluid">
        <div class="row py-lg-1">
            <div class="col-lg-7 col-md-8 mx-auto">
<form class="row g-3" style="margin-top:65px">

  <div class="col-md-4">
    <label for="inputState" class="form-label">Marca</label>
    <select id="inputState" class="form-select" name="marca">
      <option selected>Choose...</option>
      <option>...</option>
    </select>
  </div>

  <div class="col-md-4">
    <label for="inputState" class="form-label">Uomo/Donna/Bambino</label>
    <select id="inputState" class="form-select" name="uomo/donna/bambino">
      <option selected>Choose...</option>
      <option>...</option>
    </select>
  </div>

  <div class="col-md-4">
    <label for="inputState" class="form-label">Colore</label>
    <select id="inputState" class="form-select" name="colore">
      <option selected>Choose...</option>
      <option>...</option>
    </select>
  </div>

  <div class="col-md-4">
    <label for="inputState" class="form-label">Prezzo</label>
    <select id="inputState" class="form-select" name="prezzo">
      <option selected>Choose...</option>
      <option>...</option>
    </select>
  </div>
  <div class="col-12">
    <button type="submit" class="btn btn-primary">Sign in</button>
  </div>
</form>
            </div>
        </div>
    </section>

    </main>


</body>
</html>