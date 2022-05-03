package com.project.progetto;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.http.*;

public class UserServlet extends HttpServlet {
    private UtenteDB utenteDB;

    public void init() {
        utenteDB = new UtenteDB();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");
        Date datan = Date.valueOf(request.getParameter("datan"));
        String comunen = request.getParameter("comunen");
        String indirizzo = request.getParameter("indirizzo");
        String paese = request.getParameter("paese");



        Utente utente = new Utente();
        utente.setNome(nome);
        utente.setCognome(cognome);
        utente.setUsername(username);
        utente.setEmail(email);
        utente.setPwd(pwd);
        utente.setDatan(datan);
        utente.setComunen(comunen);
        utente.setIndirizzo(indirizzo);
        utente.setPaese(paese);



        try {
            utenteDB.inserisciUtente(utente);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }


        response.sendRedirect("login.jsp");
    }
}
