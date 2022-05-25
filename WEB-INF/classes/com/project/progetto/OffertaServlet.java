package com.project.progetto;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class OffertaServlet extends HttpServlet {
    private ScarpaDB scarpaDB;

    public void init() {
        scarpaDB = new ScarpaDB();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

       
        
        String nome = request.getParameter("mm");
        Integer prezzoOF=0;
       
        prezzoOF = Integer.valueOf(request.getParameter("prezzo"));
        
       

        Scarpa scarpa = new Scarpa();
       
        scarpa.setNome(nome);
        
        scarpa.setPrezzoOF(prezzoOF);
        


        try {
            scarpaDB.inserisciOfferta(scarpa);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }


        response.sendRedirect("indexA.jsp");
    }





}