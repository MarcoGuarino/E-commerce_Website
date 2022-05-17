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
  <link rel="stylesheet" href="stili.css">
 
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
  <div class="container-fluid" style="margin-top:90px">
    <div class="row">
      <div class="col-12 col-sm-8 col-lg-12">
 
        <h1 class="fw-bold">I tuoi acquisti</h1>
        <ul class="list-group">

                <%@ page import="java.io.IOException"%>
                <%@ page import="java.sql.*" %> 
                <%@ page import="java.util.*" %>
                
                <%
                int idSU = (int) session.getAttribute("idU");
                boolean isEmpty = true;

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

                String SQL = "select scarpa.id, scarpa.nome, scarpa.immagine from scarpa,acquisto where scarpa.nome=acquisto.nome_scarpa and acquisto.id_utente like ?";
                //String SQL = "SELECT id.scarpa,nome.scarpa,immagine.scarpa, FROM scarpa where genere like ? and colore like ? and ((prezzo>=? and prezzo<=?) or (prezzoOF>=? and prezzoOF<=?))";

                Connection connection = DriverManager.getConnection(url, user, password);

                PreparedStatement preparedStatement = connection.prepareStatement(SQL, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                preparedStatement.setString(1, String.valueOf(idSU));
                ResultSet result = preparedStatement.executeQuery();
                
                int lung_query = 0;
                if (result != null) {
                result.last();    // moves cursor to the last row
                lung_query = result.getRow(); // get row id 
                result.beforeFirst();
                }
                if (lung_query > 0) isEmpty = false;
                
                
                ResultSetMetaData rsmd = result.getMetaData();

                List<Integer> idscarpe=new ArrayList<Integer>();  
                List<String> nomiscarpe=new ArrayList<String>();  
                List<String> immaginiscarpe=new ArrayList<String>();  
                String immaginescarpa = "";
                String nomescarpa = "";
                int idscarpa = 0;
                if (lung_query > 0){
                while (result.next()){
                idscarpa = Integer.parseInt(result.getString(1));
                nomescarpa = (String)(result.getString(2));
                immaginescarpa = (String)(result.getString(3));
                idscarpe.add(idscarpa);
                nomiscarpe.add(nomescarpa);
                immaginiscarpe.add(immaginescarpa);
                }
                }
                
                for (int i=0; i < idscarpe.size(); i++){
                String SQL1 = "select id,voto from votazione where nomescarpa like ? and idutente like ?";
                PreparedStatement preparedStatement1 = connection.prepareStatement(SQL1, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                preparedStatement1.setString(1, nomiscarpe.get(i).toString());
                preparedStatement1.setString(2, String.valueOf(idSU)); 
                ResultSet result1 = preparedStatement1.executeQuery();
                ResultSetMetaData rsmd1 = result1.getMetaData();
                int conta=0;
                int voto=0;
                if (!result1.isBeforeFirst()){
                    conta = 0;
                } 
                else {
                    conta = 1;
                    voto = Integer.parseInt(result.getString(2));
                    }
                if (conta == 0){%>
                                <form>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <h3><%=nomiscarpe.get(i)%></h3>
                                        <select class="form-container" style="width:100px;" name="voto" required>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option selected>4</option>
                                        <option>5</option>
                                        </select>
                                        <button class="w-10 btn btn-lg btn-success pull-left" type="submit" formaction="index.jsp" formmethod="post">Vota</button>
                                        <div class="image-parent">
                                            <img src=<%=immaginiscarpe.get(i)%> class="img-fluid" alt="quixote">
                                        </div>
                                    </li>
                                    
                                </form>
                <%}%>
                <%if (conta != 0){%>
                        <form>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <h3><%=nomiscarpe.get(i)%></h3>
                            <h5>voto:<%=voto%></h5>
                            <div class="image-parent">
                                <img src=<%=immaginiscarpe.get(i)%> class="img-fluid" alt="quixote">
                            </div>
                        </li>
                        </form>
                <%}%>
                <%}%>


<%

if (isEmpty) { %> <h3>non hai effettuato mai acquisti</h3> <% }
else { %> <h3></h3> <% }

%>

        </ul>
        <br>
      </div>
    </div>
  </div>
</main>
 
<script src="bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>