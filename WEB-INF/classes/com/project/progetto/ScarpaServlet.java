package com.project.progetto;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.http.*;

public class ScarpaServlet extends HttpServlet {
    private ScarpaDB scarpaDB;

    public void init() {
        scarpaDB = new ScarpaDB();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int prezzoOF = 0;
        String marca = request.getParameter("marca");
        String nome = request.getParameter("nome");
        String colore = request.getParameter("colore");
        String genere = request.getParameter("genere");
        int prezzo = Integer.valueOf(request.getParameter("prezzo"));
        String offerta = request.getParameter("offerta");
        if (offerta.equals("si")){
            prezzoOF = Integer.valueOf(request.getParameter("prezzoOF"));
        }
        String immagine = request.getParameter("immagine");


        Scarpa scarpa = new Scarpa();
        scarpa.setMarca(marca);
        scarpa.setNome(nome);
        scarpa.setColore(colore);
        scarpa.setGenere(genere);
        scarpa.setPrezzo(prezzo);
        scarpa.setOfferta(offerta);
        scarpa.setPrezzoOF(prezzoOF);
        scarpa.setImmagine(immagine);


        try {
            scarpaDB.inserisciScarpa(scarpa);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }


        response.sendRedirect("adminAdd.jsp");
    }
}