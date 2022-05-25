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
                    <li class="nav-item">
                        <a class="nav-link" href="adminAdd.jsp"><i class="bi bi-plus-lg fs-4 mb-3"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="adminRemove.jsp"><i class="bi bi-eraser fs-4 mb-3"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<main>
   
 <div class="album py-4 bg-light">
    <div class="container">

         <div class="row row-cols-1 row-cols-md-3 " style="margin-top: 40px;">

          <div class="col">
               <div class="card shadow-sm">
                <svg class="bd-placeholder-img card-img-top" width="200" height="200"
                         xmlns="http://www.w3.org/2000/svg">
                        
                         <a><image href="img\shoes.png" height="200" width="200"></image></a>
                        
                        
                </svg>
            <div class="card-body">
                <form>
                

                 <p class="card-price"><button type="submit" formaction="adminAdd.jsp"  formmethod="post" class="btn btn-danger">Aggiungi Scarpa</button></p>
                 </form>
               
            </div>
                 </div>
                        </div>
            <div class="card shadow-sm">
                <svg class="bd-placeholder-img card-img-top" width="200" height="200"
                         xmlns="http://www.w3.org/2000/svg">
                        
                         <a><image href="img\cestino.png" height="200" width="200"></image></a>
                        
                        
                </svg>
            <div class="card-body">
                <form>
                

                 <p class="card-price"><button type="submit" formaction="adminRemove.jsp"  formmethod="post" class="btn btn-danger">Rimuovi Scarpa</button></p>
                 </form>
               
            </div>
                 </div>
                        </div>
                        
          <div class="col">
               <div class="card shadow-sm">
                <svg class="bd-placeholder-img card-img-top" width="200" height="200"
                         xmlns="http://www.w3.org/2000/svg">
                        
                         <a><image href="img\shoes.png" height="200" width="200"></image></a>
                        
                        
                </svg>
            <div class="card-body">
                <form>
                

                 <p class="card-price"><button type="submit" formaction="ricercaAdmin.jsp"  formmethod="post" class="btn btn-danger">Aggiungi offerta</button></p>
                 </form>
               
            </div>
                 </div>
                        </div>
                        
          <div class="col">
               <div class="card shadow-sm">
                <svg class="bd-placeholder-img card-img-top" width="200" height="200"
                         xmlns="http://www.w3.org/2000/svg">
                        
                         <a><image href="img\shoes.png" height="200" width="200"></image></a>
                        
                        
                </svg>
            <div class="card-body">
                <form>
                

                 <p class="card-price"><button type="submit" formaction="adminRimuoviOF.jsp"  formmethod="post" class="btn btn-danger">Rimuovi Offerta</button></p>
                 </form>
               
            </div>
                 </div>
                        </div>
            </div>
          </div>
        </div>

        </div>
      </div>
</div>
          
          
</main>
<script src="bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>