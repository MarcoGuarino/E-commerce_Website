package com.project.progetto;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class OffertaRemoveServlet extends HttpServlet{
    private ScarpaDB scarpaDB;

    public void init() {
        scarpaDB = new ScarpaDB();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException {

    String tedua = request.getParameter("pino");

    int id_o=Integer.parseInt(tedua);

    Scarpa scarpa = new Scarpa();
    scarpa.setPrezzo(id_o);    //uso prezzo come variabile per passare id al database essendo un AI non mi serve definirlo in scarpa

    try {
        scarpaDB.rimuoviOfferta(scarpa);
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }


    response.sendRedirect("adminRimuoviOF.jsp?marcaserv=" + request.getParameter("marca") + "&genereserv=" + request.getParameter("udb") + "&coloreserv=" + request.getParameter("colore") + "&customRange1serv=" + request.getParameter("min") + "&customRange2serv=" + request.getParameter("max")+"&guarino="+"gem");
    

    
}



}
