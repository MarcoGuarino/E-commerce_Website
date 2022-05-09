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
                        <a class="nav-link" href=<%=dest%>><i class="bi bi-person-circle fs-4 mb-3"></i></a>
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

<!-- una scarpa può essere filtrata per: marca, uomo/donna/bambino, colore, prezzo -->
<main>
  <section class="py-1 text-center container-fluid">
    <div class="row py-lg-1">
      <div class="col-lg-7 col-md-8 mx-auto">
        <form class="row row-cols-5" style="margin-top:65px" method="post" action="ricerca.jsp">

          <div class="col-md-2">
            <label for="inputState1" class="form-label">Marca</label>
            <select id="inputState1" class="form-select" name="marca">
              <option selected>Scegli...</option>
              <option>Nike</option>
              <option>Adidas</option>
              <option>Converse</option>
              <option>New Balance</option>
            </select>
          </div>

          <div class="col-md-2">
            <label for="inputState2" class="form-label">Uomo/Donna/Bambino</label>
            <select id="inputState2" class="form-select" name="uomo/donna/bambino">
              <option selected>Scegli...</option>
              <option>Uomo</option>
              <option>Donna</option>
              <option>Bambino</option>
            </select>
          </div>

          <div class="col-md-2">
            <label for="inputState3" class="form-label">Colore</label>
            <select id="inputState3" class="form-select" name="colore">
              <option selected>Scegli...</option>
              <option>Rosso</option>
              <option>Giallo</option>
              <option>Nero</option>
              <option>Bianco</option>
            </select>
          </div>

          <div class="col-md-3">
            <label for="customRange1" class="form-label">Prezzo Minimo</label>
            <input type="range" class="form-range" min="0" max="500" value="0" id="customRange1" oninput="this.nextElementSibling.value = this.value">
            <output>0</output>

          </div>

          <div class="col-md-3">
            <label for="customRange2" class="form-label">Prezzo Massimo</label>
            <input type="range" class="form-range" min="0" max="500" value="500" id="customRange2" oninput="this.nextElementSibling.value = this.value">
            <output>500</output>

          </div>
          <div class="col-12">
            <button type="submit" class="btn btn-success" style="margin-top: 40px;">Ricerca</button>
          </div>
        </form>
      </div>
    </div>
  </section>

  <!-- filtri -->


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


</body>
</html>