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
    <link rel="stylesheet" href="stili_carrello.css">

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
                       <a class="nav-link active" href="carrello.jsp"><i class="bi bi-cart fs-4 mb-3"></i></a>
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
<div class="container-fluid" style="margin-top:90px">
  <div class="row">
    <div class="col-12 col-sm-8 col-lg-12">
        <section class="py-7container">
        <div style="background-color:black; color:white">
            <div class="mx-auto">
                <h4 class="fw-light" style="margin-top:0px">Sei un utente premium, la spedizione è gratuita</h4>
            </div>
        </div>
        </section>
      <h1 class="fw-bold">Il tuo carrello</h1> 
      <ul class="list-group">
      <% for(int i = 0; i < 10; i+=1) { %>
        <li class="list-group-item d-flex justify-content-between align-items-center">
          Don Quixote &nbsp;&nbsp;&nbsp;&nbsp;
          Size: 42 &nbsp;&nbsp;&nbsp;&nbsp;
          30€
          <button type="button" class="btn btn-danger">Rimuovi</button>
          <button type="button" class="btn btn-success">Acquista</button>
          <div class="image-parent">
              <img src="img/b.webp" class="img-fluid" alt="quixote">
          </div>
        </li>
        <% } %>
      </ul>
    <br>
    <button type="button" class="btn btn-danger">Rimuovi tutto</button>
    <button type="button" class="btn btn-success">Acquista tutto</button>
    </div>
  </div>
</div>
</main>

</body>
</html>