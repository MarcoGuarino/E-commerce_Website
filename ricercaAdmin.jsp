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
                        <a class="nav-link active" aria-current="page" href="indexA.jsp">Home</a>
                    </li>
                </ul>

                <ul class="nav navbar-nav ml-auto">
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
                            dest = "logoutA.jsp";
                        }
                    %>
                    <li class="nav-item">
                        <a class="nav-link" href=<%=dest%>><i class="bi bi-person-circle fs-4 mb-3"></i></a>
                    </li>
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
        <form class="row row-cols-5" style="margin-top:65px" method="post" action="ricercaAdmin.jsp">

          <%Object strMarca = request.getParameter("marca");
          Object strMarcanav = request.getParameter("marcanav");%>
          
          <div class="col-md-2">
            <label for="inputState1" class="form-label">Marca</label>
            <select id="inputState1" class="form-select" name="marca">
              <%if (strMarcanav != null){%>
              <%if (strMarcanav.equals("Scegli"))%><option selected>Scegli...</option><%else%><option>Scegli...</option>
              <%if (strMarcanav.equals("nike"))%><option selected>nike</option><%else%><option>nike</option>
              <%if (strMarcanav.equals("adidas"))%><option selected>adidas</option><%else%><option>adidas</option>
              <%if (strMarcanav.equals("converse"))%><option selected>converse</option><%else%><option>converse</option>
              <%if (strMarcanav.equals("new balance"))%><option selected>new balance</option><%else%><option>new balance</option>
              <%}%>
              <%if (strMarcanav == null){%>
              <%if (strMarca != null && strMarca.equals("Scegli"))%><option selected>Scegli...</option><%else%><option>Scegli...</option>
              <%if (strMarca != null && strMarca.equals("nike"))%><option selected>nike</option><%else%><option>nike</option>
              <%if (strMarca != null && strMarca.equals("adidas"))%><option selected>adidas</option><%else%><option>adidas</option>
              <%if (strMarca != null && strMarca.equals("converse"))%><option selected>converse</option><%else%><option>converse</option>
              <%if (strMarca != null && strMarca.equals("new balance"))%><option selected>new balance</option><%else%><option>new balance</option>
              <%}%>
            </select>
          </div>
          <%Object strGenNav = request.getParameter("genere");
          Object strGen = request.getParameter("uomo/donna/bambino");%>
          <div class="col-md-2">
            <label for="inputState2" class="form-label">Uomo/Donna/Bambino</label>
            <select id="inputState2" class="form-select" name="uomo/donna/bambino">
              <%if (strGenNav != null){%>
              <%if (strGenNav.equals("Scegli"))%><option selected>Scegli...</option><%else%><option>Scegli...</option>
              <%if (strGenNav.equals("uomo"))%><option selected>uomo</option><%else%><option>uomo</option>
              <%if (strGenNav.equals("donna"))%><option selected>donna</option><%else%><option>donna</option>
              <%if (strGenNav.equals("bambino"))%><option selected>bambino</option><%else%><option>bambino</option>
              <%}%>
              <%if (strGenNav == null){%>
              <%if (strGen != null && strGen.equals("Scegli"))%><option selected>Scegli...</option><%else%><option>Scegli...</option>
              <%if (strGen != null && strGen.equals("uomo"))%><option selected>uomo</option><%else%><option>uomo</option>
              <%if (strGen != null && strGen.equals("donna"))%><option selected>donna</option><%else%><option>donna</option>
              <%if (strGen != null && strGen.equals("bambino"))%><option selected>bambino</option><%else%><option>bambino</option>
              <%}%>
            </select>
          </div>

          <%Object strCol = request.getParameter("colore");%>
          <div class="col-md-2">
            <label for="inputState3" class="form-label">Colore</label>
            <select id="inputState3" class="form-select" name="colore">
              <%if (strCol != null && strCol.equals("Scegli"))%><option selected>Scegli...</option><%else%><option>Scegli...</option>
              <%if (strCol != null && strCol.equals("nero"))%><option selected>nero</option><%else%><option>nero</option>
              <%if (strCol != null && strCol.equals("bianco"))%><option selected>bianco</option><%else%><option>bianco</option>
              <%if (strCol != null && strCol.equals("grigio"))%><option selected>grigio</option><%else%><option>grigio</option>
              <%if (strCol != null && strCol.equals("rosso"))%><option selected>rosso</option><%else%><option>rosso</option>
            </select>
          </div>

          <%Object strCR1 = request.getParameter("customRange1");%>
          <div class="col-md-3">
            <label for="customRange1" class="form-label">Prezzo Minimo</label>
            <%if (strCR1 != null){%>
            <input type="range" class="form-range" name = "customRange1" min="0" max="350" value="<%=strCR1%>" id="customRange1" oninput="this.nextElementSibling.value = this.value">
            <output><%=strCR1%></output><%}%>
            <%if (strCR1 == null){%>
            <input type="range" class="form-range" name = "customRange1" min="0" max="350" value="0" id="customRange1" oninput="this.nextElementSibling.value = this.value">            
            <output>0</output><%}%>
          </div>

          <%Object strCR2 = request.getParameter("customRange2");%>
          <div class="col-md-3">
            <label for="customRange2" class="form-label">Prezzo Massimo</label>
            <%if (strCR2 != null){%>
            <input type="range" class="form-range" name = "customRange2" min="0" max="350" value="<%=strCR2%>" id="customRange2" oninput="this.nextElementSibling.value = this.value">
            <output><%=strCR2%></output><%}%>
            <%if (strCR2 == null){%>
            <input type="range" class="form-range" name = "customRange2" min="0" max="350" value="350" id="customRange2" oninput="this.nextElementSibling.value = this.value">
            <output>350</output><%}%>

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

        <%
        Object marcanav = request.getParameter("marcanav"); //se la richiesta mi viene da ricerca.jsp allora questa è in null
        Object marca = request.getParameter("marca");
        Object gen = request.getParameter("genere"); //genere se la richiesta viene da index.jsp
        Object udb = request.getParameter("uomo/donna/bambino");
        Object colore = request.getParameter("colore");
        Object min = request.getParameter("customRange1");
        Object max = request.getParameter("customRange2");
        if (marca != null && marca.equals("Scegli...")){marca = "%";}
        if (udb != null && udb.equals("Scegli...")){udb = "%";}
        if (colore != null && colore.equals("Scegli...")){colore = "%";}
        %>
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
        //String url = "jdbc:mariadb://localhost:3306/sneaka";
        String url = "jdbc:mysql://localhost:3306/sneaka";
        String user = "sneaka";
        String password = "sneaka";

        String SQL = "SELECT id,nome,genere,prezzo,prezzoOF,immagine,offerta,colore FROM scarpa where offerta='no' and marca like ? and genere like ? and colore like ? and ((prezzo>=? and prezzo<=?) or (prezzoOF>=? and prezzoOF<=?))";

        Connection connection = DriverManager.getConnection(url,user,password);
        
        PreparedStatement preparedStatement = connection.prepareStatement(SQL);



        if (marca == null){
          marca="%";
          udb="%";
          colore="%";
          min="0";
          max="350";
        }

        if (marcanav != null){
          marca = marcanav;
        }

        if (gen != null){ //dalle img di index.jsp
          udb = gen;
        }

        preparedStatement.setString(1, marca.toString());
        preparedStatement.setString(2, udb.toString());
        preparedStatement.setString(3, colore.toString());
        preparedStatement.setString(4, min.toString());
        preparedStatement.setString(5, max.toString());
        preparedStatement.setString(6, min.toString());
        preparedStatement.setString(7, max.toString());



        ResultSet result = preparedStatement.executeQuery();

        ResultSetMetaData rsmd = result.getMetaData();
        while (result.next()){
            int id = Integer.parseInt(result.getString(1));
            String modello = (String)(result.getString(2));
            String genere = (String)(result.getString(3));
            int prezzo = Integer.parseInt(result.getString(4));
            String immagine = (String)(result.getString(6));
            String offerta = (String)(result.getString(7));
            int prezzoOF = Integer.parseInt(result.getString(4));
            String colore_q = (String)(result.getString(8));
            %>
        <div class="col">
            <div class="card shadow-sm">
                <svg class="bd-placeholder-img card-img-top" width="200" height="200"
                         xmlns="http://www.w3.org/2000/svg">
                         <%if (offerta.equals("no"))%>
                         <a href="inserisci_offerta.jsp?modello=<%=modello%>&genere=<%=genere%>&colore=<%=colore_q%>&prezzo=<%=prezzo%>&immagine=<%=immagine%>"><image href="<%=immagine%>" height="200" width="200"></image></a>
                         
                </svg>
            <div class="card-body">
                <p class="card-price"><%=modello%>&nbsp;&nbsp;&nbsp;&nbsp;<%=genere%></p>
                <%
                if (offerta.equals("no")){%>
                <p class="card-price"><%=prezzo%>€</p><%}%>
                <%
                if (offerta.equals("si")){ prezzoOF = Integer.parseInt(result.getString(5));%>
                <p class="card-price"><del><%=prezzo%></del>€&nbsp;&nbsp;&nbsp;&nbsp;<%=prezzoOF%>€</p><%}%>
            </div>
          </div>
        </div>
        <% } %>


      </div>
    </div>
  </div>

</main>

<script src="bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>