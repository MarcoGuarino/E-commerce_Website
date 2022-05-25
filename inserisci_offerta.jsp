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
      String colore = request.getParameter("colore");
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
              <%
                  try {
                      Class.forName("com.mysql.jdbc.Driver");
                  } catch (ClassNotFoundException e) {
                      throw new RuntimeException(e);
                  }
                  
                  int mediaVoto = 420;

                  String url = "jdbc:mysql://localhost:3306/sneaka";
                  String user = "sneaka";
                  String password = "sneaka";

                  String QUERY = "SELECT AVG(voto) FROM votazione WHERE nomescarpa = ?";


                  try (Connection conn = DriverManager
                          .getConnection(url, user, password);

                       PreparedStatement prst = conn.prepareStatement(QUERY)) {
                      prst.setString(1, modello);


                      ResultSet res = prst.executeQuery();
                      

                      if (res.next()) {
                          mediaVoto = (res.getInt(1));
                      }
                  } catch (SQLException e) {
                      
                  }
                  
              %>

              <%
                  if (mediaVoto == 0) { %> <h5>questa scarpa non ha ancora ricevuto alcun rating</h5> <% }
                  else { %> <h5>Rating: <%=mediaVoto%></h5> <% }
              %>
          </div>
          <div class="row mt-4">
           
            <form>
                 <div class="col-12">
                            <label class="form-label">Prezzo in offerta</label>
                            <input type="text" class="form-control" name="prezzo" required>
                        </div>
                &nbsp;
                &nbsp;<%
                    String destin = "login.jsp";
                    if (valuemsg != null){ destin = "OffertaServlet?mm=" +modello;}
                 
                 %>
 
                <br>
 
                <button class="w-10 btn btn-lg btn-success" type="submit" formaction=<%=destin%> formmethod="post">Inserisci</button>
               
 
          </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
 
 
  <div class="container">
    <br/>
    <div class="row mt-2">
                <%@ page import="java.io.IOException"%>
                <%@ page import="java.sql.*" %> 
                <%@ page import="java.util.*" %>
                <%
                try {
                Class.forName("com.mysql.jdbc.Driver");
                } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
                }
                

                String SQL = "SELECT id,nome,genere,prezzo,prezzoOF,immagine,offerta,colore FROM scarpa where genere like ? and colore like ? and ((prezzo>=? and prezzo<=?) or (prezzoOF>=? and prezzoOF<=?))";

                Connection connection = DriverManager.getConnection(url, user, password);

                PreparedStatement preparedStatement = connection.prepareStatement(SQL, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                preparedStatement.setString(1, genere.toString());
                preparedStatement.setString(2, colore.toString());
                preparedStatement.setString(3, String.valueOf(prezzo-40));
                preparedStatement.setString(4, String.valueOf(prezzo+40));
                preparedStatement.setString(5, String.valueOf(prezzo-40));
                preparedStatement.setString(6, String.valueOf(prezzo+40));
                ResultSet result = preparedStatement.executeQuery();

                int lung_query = 0;

                if (result != null) {
                result.last();    // moves cursor to the last row
                lung_query = result.getRow(); // get row id 
                result.beforeFirst();
                }
                int j = 4;
                if (lung_query < 4) j = lung_query; 
                if (lung_query > 1){%>
                    
                <%}%>
                <%
                ResultSetMetaData rsmd = result.getMetaData();
                int jj = 0;
                while (result.next() && jj < j){
                int idcon = Integer.parseInt(result.getString(1));
                String modellocon = (String)(result.getString(2));
                if (modello.equals(modellocon)){
                  continue;
                }
                jj = jj + 1;
                String generecon = (String)(result.getString(3));
                int prezzocon = Integer.parseInt(result.getString(4));
                int prezzoOFcon = Integer.parseInt(result.getString(4));
                String immaginecon = (String)(result.getString(6));
                String offertacon = (String)(result.getString(7));
                String colorecon = (String)(result.getString(8));
                %>
      
      </div>
                <%}%>
  </div>
  </div>
 
 
 
</main>
 
 
 
 
 
<script src="bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>