package com.project.progetto;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AcquistoServlet extends HttpServlet {
    private AcquistoDB acquistoDB;

    public void init() {
        acquistoDB = new AcquistoDB();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession(false);
        int idSU = (int) session.getAttribute("idU");
        String c = request.getParameter("c");
        int cartItems=0;
        ServletContext context = getServletContext();
        Object app=context.getAttribute("cartItems");
        
        if(app!=null){
         cartItems = (int) context.getAttribute("cartItems");
        }
        Cookie[] cookies = request.getCookies();

        String fibra=request.getParameter("marra");

        if(fibra!=null)//acquisto diretto
        {
            String monello=request.getParameter("mm");
            int ss = Integer.parseInt(request.getParameter("size"));
          
            Acquisto acquisto = new Acquisto();
                        acquisto.setID_utente(idSU);
                        acquisto.setN_scarpa(ss);
                        acquisto.setNome(monello);


                        try {
                            acquistoDB.inserisciAcquisto(acquisto);
                        } catch (ClassNotFoundException e) {
                            throw new RuntimeException(e);
                        }
                        
            

        }
        
        if(c!=null && fibra==null){ //acquisto singolo

            

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(c)) {
                    String str = cookie.getValue();
                        String[] parts = str.split("!");
                        String modello = parts[0];
                        String size = parts[1];
                        String prezzo = parts[2];
                        String immagine = parts[3];
                        String idU = parts[4];
                        Acquisto acquisto = new Acquisto();
                        acquisto.setID_utente(Integer.parseInt(idU));
                        acquisto.setN_scarpa(Integer.parseInt(size));
                        acquisto.setNome(modello);


                        try {
                            acquistoDB.inserisciAcquisto(acquisto);
                        } catch (ClassNotFoundException e) {
                            throw new RuntimeException(e);
                        }


                    cookie.setValue(null);
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }
        }

        }


else if(fibra==null && c==null){

        if (cookies != null) {
            for (int i = 0; i <= cartItems; i++) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals(i + "")) {
                        String str = cookie.getValue();
                        String[] parts = str.split("!");
                        String modello = parts[0];
                        String size = parts[1];
                        String prezzo = parts[2];
                        String immagine = parts[3];
                        String idU = parts[4];
                        if (idSU == Integer.parseInt(idU)) {

                            Acquisto acquisto = new Acquisto();
                            acquisto.setID_utente(Integer.parseInt(idU));
                            acquisto.setN_scarpa(Integer.parseInt(size));
                            acquisto.setNome(modello);


                            try {
                                acquistoDB.inserisciAcquisto(acquisto);
                            } catch (ClassNotFoundException e) {
                                throw new RuntimeException(e);
                            }

                            cookie.setValue(null);
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);


                        }

                    }

                }
            }
        }
     }//aquista tutto
       
        response.sendRedirect("acquistoOK.jsp");
    }
}
  
