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
                        <a class="nav-link" aria-current="page" href="indexA.jsp">Home</a>
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
                    <li class="nav-item">
                        <a class="nav-link active" href="adminAdd.jsp"><i class="bi bi-plus-lg fs-4 mb-3"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="adminRemove.jsp"><i class="bi bi-eraser fs-4 mb-3"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<body>
<main>
<div class="container" style="margin-top:70px">
        <div class="row g-5">
            <div class="col-md-7 col-lg-8">
                <h4 class="mb-3">Ciao admin, aggiungi la scarpa nel database!</h4>
                <form class="form" action="ScarpaServlet" method="post">
                    <div class="row g-3">
                        <div class="col-12">
                            <label class="form-label">nome</label>
                            <input type="text" class="form-control" name="nome" required>
                        </div>


                        <div class="col-12">
                           <label class="form-label">marca</label>
                           <select class="form-control" name="marca" required>
                           <option selected></option> 
                           <option>nike</option>
                           <option>adidas</option>
                           <option>newbalance</option>
                           <option>converse</option>
                           </select>
                        </div>

                        <div class="col-12">
                           <label class="form-label">colore</label>
                           <select class="form-control" name="colore" required>
                           <option selected></option>
                           <option>nero</option>
                           <option>bianco</option>
                           <option>rosso</option>
                           <option>grigio</option>
                           <option>rosa</option>
                           <option>rosso</option>
                           </select>
                        </div>


                        <div class="col-12">
                           <label class="form-label">genere</label>
                           <select class="form-control" name="genere" required>
                           <option selected></option>
                           <option>uomo</option>
                           <option>donna</option>
                           <option>bambino</option>
                           </select>
                        </div> 


                        <div class="col-12">
                            <label class="form-label">prezzo</label>
                            <input type="text" class="form-control" name="prezzo" required>
                        </div>


                        <div class="col-12">
                           <label class="form-label">in offerta?</label>
                           <select class="form-control" name="offerta" required>
                           <option selected></option>
                           <option>si</option>
                           <option>no</option>
                           </select>
                        </div>


                        <div class="col-12">
                            <label class="form-label">prezzo in offerta</label>
                            <input type="text" class="form-control" name="prezzoOF">
                        </div>

                        <div class="col-12">
                            <label class="form-label">immagine</label>
                            <input type="text" class="form-control" name="immagine"required>
                        </div>

                    </div>

                    <hr class="my-4">

                    <button class="w-10 btn btn-primary btn-lg" type="submit">Aggiungi</button>
                </form>
            </div>
        </div>
    </div>
</main>

</body>
</body>
</html>