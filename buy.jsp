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
 
 
<main>
  <div class="container mt-5">
  </div>
      <%@ page import="java.util.*" %>
      <%
      String modello = request.getParameter("modello");
      String genere  = request.getParameter("genere");
      String prezzo2 = request.getParameter("prezzo");
      int prezzo = Integer.parseInt(request.getParameter("prezzo"));
      String immagine = request.getParameter("immagine");
      %>
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <div>
          <img src="<%=immagine%>" width="300" height="250">
        </div>
      </div>
      <div class="col-md-6" style="width:600px">
        <div class="row">
          <h2><%=modello%></h2>
          <h4><%=genere%></h4>
        </div>
        <div class="row">
          <h1><i class="fa fa-inr" aria-hidden="true"></i><%=prezzo%> €</h1>
          <div class="row">
            <h5>Rating: 4.5/5</h5>
          </div>
          <div class="row mt-4">
            <h4>Size: &nbsp; &nbsp;</h4>
            <form>
                <div class="col-md-4">
                    <label for="size" class="form-label">Size</label>
                    <select class="form-select" id="size" name="size" required>
                        <option value="">Choose...</option>
                        <option selected>37</option>
                        <option>38</option>
                        <option>39</option>
                        <option>40</option>
                        <option>41</option>
                        <option>42</option>
                        <option>43</option>
                    </select>
                    <div class="invalid-feedback">
                        Please choose a size.
                    </div>
                </div>
                &nbsp;
                &nbsp;<%
                    String destin = "login.jsp";
                    if (valuemsg != null){ destin = "buy.jsp?modello=" + modello + "&genere=" + genere + "&prezzo=" + prezzo + "&immagine=" + immagine;}
                    String destin2 = "login.jsp";
                    if (valuemsg != null){ destin2 = "CartServlet?modello=" + modello + "&prezzo=" + prezzo + "&immagine=" + immagine;}
                 %>
 
                <br>
 
                <button class="w-10 btn btn-lg btn-success" type="submit" formaction=<%=destin%> formmethod="post">buy</button>
                <button class="w-10 btn btn-lg btn-primary" type="submit" formaction=<%=destin2%> formmethod="post">cart</button>
 
          </div>
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
      </div>
    </div>
  </div>
 
 
 
</main>
 
 
 
 
 
<script src="bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>