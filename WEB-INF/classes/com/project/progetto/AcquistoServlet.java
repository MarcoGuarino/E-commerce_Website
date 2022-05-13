package com.project.progetto;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.http.*;
public class AcquistoServlet extends HttpServlet {
    private AcquistoDB acquistoDB;
    
    public void init() {
        acquistoDB = new AcquistoDB();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
                HttpSession session = request.getSession(false);
                int idSU = (int) session.getAttribute("idU");
                
                Cookie[] ck = request.getCookies();
 
                int nn = 0;
 
                if (ck != null) {
                    for (Cookie c : ck) {
                        if (c.getName().equals("n")) {
                            String n = c.getValue();
                            nn = Integer.parseInt(n);
                        }
                    }
                }
 
                for (int i = 0; i <= nn; i++){
 
                    Cookie[] cookies = request.getCookies();
 
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals(i+"")) {
                                String str = cookie.getValue();
                                String[] parts = str.split("!");
                                String modello = parts[0];
                                String size = parts[1];
                                String prezzo = parts[2];
                                String immagine = parts[3];
                                String idU = parts[4];
                                if (idSU == Integer.parseInt(idU)) {
 
                Acquisto acquisto = new Acquisto();
                acquisto.setID_utente(Integer.valueOf(idU));
                acquisto.setN_scarpa(Integer.valueOf(size));
                acquisto.setNome(modello);

        


        try {
             acquistoDB.inserisciAcquisto(acquisto);
            } catch (ClassNotFoundException e) 
            {
            throw new RuntimeException(e);
            }
            

    }//if
   
     }

                        }
                    }
                } 
                response.sendRedirect("carrello.jsp");
            }
        }
  
