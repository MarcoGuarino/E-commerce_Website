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
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#0"/></svg>

                <div class="container">
                    <div class="carousel-caption">
                        <img src="img/snk111.jpeg" class="img-fluid">
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#0"/></svg>

                <div class="container">
                    <div class="carousel-caption">
                        <img src="img/snk22.jpeg" class="img-fluid">
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
                <%@ page import="java.io.IOException"%>
                <%@ page import="java.sql.*" %> 
                <%@ page import="java.util.*" %>
                <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                    }
                    String img1 = "";
                    String mod1 = ""; //modello scarpa
                    int prezzo1 = 0;
                    String offerta1 = "";
                    String genere1 = "";
                    String colore1 = "";

                    String img2 = "";
                    String mod2 = ""; //modello scarpa
                    int prezzo2 = 0;
                    String offerta2 = "";
                    String genere2 = "";
                    String colore2 = "";

                    String img3 = "";
                    String mod3 = ""; //modello scarpa
                    int prezzo3 = 0;
                    String offerta3 = "";
                    String genere3 = "";
                    String colore3 = "";

                    String img4 = "";
                    String mod4 = ""; //modello scarpa
                    int prezzo4 = 0;
                    String offerta4 = "";
                    String genere4 = "";
                    String colore4 = "";



                    String url = "jdbc:mysql://localhost:3306/sneaka";
                    String user = "sneaka";
                    String password = "sneaka";

                    Connection connection = DriverManager.getConnection(url,user,password);

                    String query1 = "SELECT * FROM scarpa ORDER BY rand() LIMIT 1;"; //query per scarpa random
                    String query3 = "SELECT * FROM `scarpa` where nome = (SELECT nome_scarpa FROM `acquisto` GROUP BY nome_scarpa ORDER BY COUNT(nome_scarpa) DESC LIMIT 1)"; //query per la scarpa piu' venduta di sempre

                    PreparedStatement statement1 = connection.prepareStatement(query1, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    PreparedStatement statement3 = connection.prepareStatement(query3, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                    ResultSet resultSet1 = statement1.executeQuery(query1);
                    ResultSet resultSet3 = statement3.executeQuery(query3);
                    

                    while(resultSet1.next()){ //risultati della query
                        mod1 = String.valueOf(resultSet1.getString(2)); //modello è nome in mysql
                        genere1 = String.valueOf(resultSet1.getString(4));
                        colore1 = String.valueOf(resultSet1.getString(3));
                        prezzo1 = Integer.parseInt(resultSet1.getString(5));
                        offerta1 = String.valueOf(resultSet1.getString(6));
                        if (offerta1.equals("si")){
                            prezzo1 = Integer.parseInt(resultSet1.getString(8));
                        }
                        img1 = String.valueOf(resultSet1.getString(7));
                    }

                    int conta1 = 0; //per controllare che la query2 produca qualcosa
                    int conta2 = 0; //per controllare che la query3 produca qualcosa
                    int conta3 = 0; //per controllare che la query4 produca qualcosa
                    boolean continua = true;

                    if (session.getAttribute("msg") != null){

                        int idSU = (int) session.getAttribute("idU");
                        String query2 = "SELECT * FROM `scarpa` where nome = (SELECT nome_scarpa FROM `acquisto` WHERE id_utente =" + String.valueOf(idSU) +" GROUP BY nome_scarpa ORDER BY COUNT(nome_scarpa) DESC LIMIT 1);"; //query per scarpa per l'utente

                        PreparedStatement statement2 = connection.prepareStatement(query2, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        //statement2.setString(1, String.valueOf(idSU));
                        ResultSet resultSet2 = statement2.executeQuery(query2);

                        if (!resultSet2.next()){
                           conta1 = 0;
                        } 
                        else {
                           conta1 = 1;
                           mod2 = String.valueOf(resultSet2.getString(2)); //modello è nome in mysql
                           genere2 = String.valueOf(resultSet2.getString(4));
                           colore2 = String.valueOf(resultSet2.getString(3));
                           prezzo2 = Integer.parseInt(resultSet2.getString(5));
                           offerta2 = String.valueOf(resultSet2.getString(6));
                           if (offerta2.equals("si")){
                              prezzo2 = Integer.parseInt(resultSet2.getString(8));
                            }
                           img2 = String.valueOf(resultSet2.getString(7));
                        }


                        if (conta1 == 1){
                           String query4 = "SELECT id,nome,genere,prezzo,prezzoOF,immagine,offerta,colore FROM scarpa where genere like " + "'" + String.valueOf(genere2) + "'" + " and colore like " + "'" + String.valueOf(colore2) + "'" + " and ((prezzo>="+String.valueOf(prezzo2-40)+ " and prezzo<=" + String.valueOf(prezzo2+40)+ ") or (prezzoOF>=" + String.valueOf(prezzo2-40) + " and prezzoOF<=" + String.valueOf(prezzo2+40) + "))";
                           PreparedStatement statement4 = connection.prepareStatement(query4, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                           //statement4.setString(1, genere2.toString());
                           //statement4.setString(2, colore2.toString());
                           //statement4.setString(3, String.valueOf(prezzo2-40));
                           //statement4.setString(4, String.valueOf(prezzo2+40));
                           //statement4.setString(5, String.valueOf(prezzo2-40));
                           //statement4.setString(6, String.valueOf(prezzo2+40));
                           ResultSet resultSet4 = statement4.executeQuery(query4);
                            if (!resultSet4.next()){
                               conta3 = 0;
                            }
                            else{
                               conta3 = 1;
                               resultSet4.beforeFirst();
                            }
                            while (resultSet4.next() && continua == true){
                               mod4 = String.valueOf(resultSet4.getString(2)); //modello è nome in mysql
                               if (mod4.equals(mod2)) continue;
                               else continua = false;
                               genere4 = String.valueOf(resultSet4.getString(3));
                               colore4 = String.valueOf(resultSet4.getString(8));
                               prezzo4 = Integer.parseInt(resultSet4.getString(4));
                               offerta4 = String.valueOf(resultSet4.getString(7));
                               if (offerta4.equals("si")){
                                  prezzo4 = Integer.parseInt(resultSet4.getString(5));
                                }
                               img4 = String.valueOf(resultSet4.getString(6));
                            }

                        }


                    }



                    if (!resultSet3.next()){
                       conta2 = 0;
                    } 
                    else {
                       conta2 = 1;
                       mod3 = String.valueOf(resultSet3.getString(2)); //modello è nome in mysql
                       genere3 = String.valueOf(resultSet3.getString(4));
                       colore3 = String.valueOf(resultSet3.getString(3));
                       prezzo3 = Integer.parseInt(resultSet3.getString(5));
                       offerta3 = String.valueOf(resultSet3.getString(6));
                       if (offerta3.equals("si")){
                           prezzo3 = Integer.parseInt(resultSet3.getString(8));
                       }
                       img3 = String.valueOf(resultSet3.getString(7));
                    }


                %>

        <div class="row">
            <%
            if (session.getAttribute("msg") != null){%>
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="200" height="200"
                     xmlns="http://www.w3.org/2000/svg">
                <%
                if (conta1 == 0){%>
                <image href="<%=img1%>" height="200" width="200"></image>
                <%}%>
                <%
                if (conta1 == 1 && conta3 == 1){%>
                <image href="<%=img4%>" height="200" width="200"></image>
                <%}%>
                </svg>
                <h2>La scarpa che fa per te</h2>
                <p>In base ai tuoi acquisti</p>
                <%
                if (conta1 == 0){%>
                <p><a class="btn btn-secondary" href="buy.jsp?modello=<%=mod1%>&genere=<%=genere1%>&colore=<%=colore1%>&prezzo=<%=prezzo1%>&immagine=<%=img1%>">Guarda &raquo;</a></p>
                <%}%>
                <%
                if (conta1 == 1 && conta3 == 1){%>
                <p><a class="btn btn-secondary" href="buy.jsp?modello=<%=mod4%>&genere=<%=genere4%>&colore=<%=colore4%>&prezzo=<%=prezzo4%>&immagine=<%=img4%>">Guarda &raquo;</a></p>
                <%}%>
            </div>
            <%}%>

            <%
            if (session.getAttribute("msg") == null){%>
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="200" height="200"
                     xmlns="http://www.w3.org/2000/svg">
                    <image href="img/dito.jpg" height="200" width="200"></image>
                </svg>
                <p>&nbsp;</p> 
                <p>esegui il login &nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="login.jsp">Premi&raquo;</a></p>
                <p>esegui la registrazione &nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="signup.jsp">Premi&raquo;</a></p>
            </div>
            <%}%>

            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="200" height="200"
                     xmlns="http://www.w3.org/2000/svg">
                <%
                if (conta2 == 0){%>
                <image href="<%=img1%>" height="200" width="200"></image>
                <%}%>
                <%
                if (conta2 == 1){%>
                <image href="<%=img3%>" height="200" width="200"></image>
                <%}%>
                </svg>
                <h2>La scarpa piu acquistata</h2>
                <p>La pi&ugrave; acquistata nel nostro e-commerce</p>
                <%
                if (conta2 == 0){%>
                <p><a class="btn btn-secondary" href="buy.jsp?modello=<%=mod1%>&genere=<%=genere1%>&colore=<%=colore1%>&prezzo=<%=prezzo1%>&immagine=<%=img1%>">Guarda &raquo;</a></p>
                <%}%>
                <%
                if (conta2 == 1){%>
                <p><a class="btn btn-secondary" href="buy.jsp?modello=<%=mod3%>&genere=<%=genere3%>&colore=<%=colore3%>&prezzo=<%=prezzo3%>&immagine=<%=img3%>">Guarda &raquo;</a></p>
                <%}%>
            </div>
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="200" height="200"
                     xmlns="http://www.w3.org/2000/svg">
                    <image href="img/pint.png" height="200" width="200"></image>
                </svg>

                <h2>Sorprendimi</h2>
                <p>&nbsp;</p> 
                <p><a class="btn btn-secondary" href="buy.jsp?modello=<%=mod1%>&genere=<%=genere1%>&colore=<%=colore1%>&prezzo=<%=prezzo1%>&immagine=<%=img1%>">Scopri&raquo;</a></p>
            </div>

        </div>



        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">Scarpe da uomo</h2>
            </div>
            <div class="col-md-5">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg">
                    <a href="ricerca.jsp?genere=uomo" ><image href="img/modelliScarpe/uomo_scarpe.png" height="500" width="500"></image></a>
                </svg>

            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading">Scarpe da donna</h2>
            </div>
            <div class="col-md-5 order-md-1">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg">
                    <a href="ricerca.jsp?genere=donna" ><image href="img/modelliScarpe/donna_scarpe.png" height="500" width="500"></image></a>
                </svg>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">Scarpe da bambino</h2>
            </div>
            <div class="col-md-5">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg">
                    <a href="ricerca.jsp?genere=bambino" ><image href="img/modelliScarpe/bambino_scarpe.png" height="500" width="500"></image></a>
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