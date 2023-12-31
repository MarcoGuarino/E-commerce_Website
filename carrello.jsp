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
                        <a class="nav-link active" href="carrello.jsp"><i class="bi bi-cart fs-4 mb-3"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="acquistate.jsp"><i class="bi bi-star fs-4 mb-3"></i></a>
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
  <div class="container-fluid" style="margin-top:90px">
    <div class="row">
      <div class="col-12 col-sm-8 col-lg-12">
        <%
        Object premium = session.getAttribute("premium");
        if (premium.equals("si")){%>
        <section class="py-7container">
          <div style="background-color:black; color:white">
            <div class="mx-auto">
              <h4 class="fw-light" style="margin-top:0px">Sei un utente premium, la spedizione è gratuita</h4>
            </div>
          </div>
        </section>
        <%}%>
 
        <h1 class="fw-bold">Il tuo carrello</h1>
        <ul class="list-group">
            <%

                int idSU = (int) session.getAttribute("idU");


                ServletContext context = request.getServletContext();
                Integer cartItems = (Integer) context.getAttribute("cartItems");


                Cookie[] cookies = request.getCookies();

                boolean isEmpty = true;

                if (cookies != null & cartItems != null) {
                    for (int i = 0; i <= cartItems; i++){
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals(i+"")) {
                                String coo = cookie.getName();
                                String str = cookie.getValue();
                                String[] parts = str.split("!");
                                String modello = parts[0];
                                String size = parts[1];
                                String prezzo = parts[2];
                                String immagine = parts[3];
                                String idU = parts[4];
                                if (idSU == Integer.parseInt(idU)) {
                                    isEmpty = false;

            %>
                                <form>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <h3><%=modello%></h3>
                                        <h3>size:  <%=size%></h3>
                                        <h3><%=prezzo%>  €</h3>

                                        <%
                                            String urlRemove = "RemoveCartServlet?c=" + coo;
                                            String urlBuy = "AcquistoServlet?c=" + coo;
                                        %>

                                        <button class="w-10 btn btn-lg btn-danger" type="submit" formaction=<%=urlRemove%> formmethod="post">Rimuovi</button>
                                        <button class="w-10 btn btn-lg btn-success" type="submit" formaction=<%=urlBuy%> formmethod="post">Acquista</button>

                                        <div class="image-parent">
                                            <img src=<%=immagine%> class="img-fluid" alt="quixote">
                                        </div>

                                    </li>
                                </form>

                         <%
                                    }
                                }
                            }
                        }  if (isEmpty) { %> <h3>in questo momento non ha prodotti inseriti</h3> <% }
                } else { %> <h3>in questo momento non ha prodotti inseriti</h3> <% }

                         %>

            </ul>
            <br>

            <%if(!isEmpty){%>
              <form>
                <button class="w-10 btn btn-lg btn-danger" type="submit" formaction="RemoveAllCartServlet" formmethod="post">Rimuovi Tutto</button>
                <button class="w-10 btn btn-lg btn-success" type="submit" formaction="AcquistoServlet" formmethod="post">Acquista Tutto</button>
              </form>
            <%}%>

      </div>
    </div>
  </div>
</main>
 
<script src="bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>