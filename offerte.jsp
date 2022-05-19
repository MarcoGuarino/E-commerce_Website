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

                <%@ page import="java.io.IOException"%>
                <%@ page import="java.sql.*" %> 
                <%@ page import="java.util.*" %>
                <%
                try {
                //Class.forName("org.mariadb.jdbc.Driver");
                Class.forName("com.mysql.jdbc.Driver");
                } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
                }

               // String url = "jdbc:mariadb://localhost:3306/sneaka";
                String url = "jdbc:mysql://localhost:3306/sneaka";
                String user = "sneaka";
                String password = "sneaka";

                String SQL = "SELECT id,nome,genere,prezzo,prezzoOF,immagine,colore FROM scarpa where offerta=?";

                Connection connection = DriverManager.getConnection(url, user, password);

                PreparedStatement preparedStatement = connection.prepareStatement(SQL);
                preparedStatement.setString(1, "si");

                ResultSet result = preparedStatement.executeQuery();

                ResultSetMetaData rsmd = result.getMetaData();
                while (result.next()){
                int id = Integer.parseInt(result.getString(1));
                String modello = (String)(result.getString(2));
                String genere = (String)(result.getString(3));
                int prezzo = Integer.parseInt(result.getString(4));
                int prezzoOF = Integer.parseInt(result.getString(5));
                String immagine = (String)(result.getString(6));
                String colore = (String)(result.getString(7));
                %>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="200" height="200"
                             xmlns="http://www.w3.org/2000/svg">
                            <a href="buy.jsp?modello=<%=modello%>&genere=<%=genere%>&colore=<%=colore%>&prezzo=<%=prezzoOF%>&immagine=<%=immagine%>"><image href="<%=immagine%>" height="200" width="200"></image></a>
                        </svg>
                        <div class="card-body">
                            <p class="card-price"><%=modello%>&nbsp;&nbsp;&nbsp;&nbsp;<%=genere%></p>
                            <p class="card-price"><del><%=prezzo%>€</del>&nbsp;&nbsp;&nbsp;&nbsp;<%=prezzoOF%>€</p>
                        </div>
                    </div>
                </div>
                <%
                }
                %>

            </div>
        </div>
    </div>

</main>





<script src="bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>