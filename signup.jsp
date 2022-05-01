<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Sign up</title>

    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>

</head>
<body class="bg-light">

<div class="container">
    <main>
        <div class="row g-5">
            <div class="col-md-7 col-lg-8">
                <h4 class="mb-3">Inserisci le tue informazioni personali</h4>
                <form class="form" action="UserServlet" method="post">
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label class="form-label">Nome</label>
                            <input type="text" class="form-control" name="nome" placeholder="" required>
                        </div>

                        <div class="col-sm-6">
                            <label class="form-label">Cognome</label>
                            <input type="text" class="form-control" name="cognome" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Username</label>
                            <input type="text" class="form-control" name="username" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" name="pwd" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Data di Nascita</label>
                            <input type="date" class="form-control" name="datan" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Comune di Nascita</label>
                            <input type="text" class="form-control" name="comunen" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Indirizzo</label>
                            <input type="text" class="form-control" name="indirizzo" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Paese</label>
                            <input type="text" class="form-control" name="paese" placeholder="" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Cap</label>
                            <input type="number" class="form-control" name="cap" placeholder="" required>
                        </div>
                    </div>

                    <hr class="my-4">

                    <button class="w-10 btn btn-primary btn-lg" type="submit">Registrati</button>
                </form>
            </div>
        </div>
    </main>

</div>


<script src="bootstrap/js/bootstrap.bundle.js"></script>

</body>
</html>
