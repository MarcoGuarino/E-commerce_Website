package com.project.progetto;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class RemoveServlet extends HttpServlet {
    private RemoveDB removeDB;

    public void init() {
        removeDB = new RemoveDB();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {



                                  String tedua = request.getParameter("pino"); //id scarpa


                                  Remove izi = new Remove();
                                  izi.setID(Integer.parseInt(tedua)); //rimuoviamo scarpa con id tedua
                                  
          
          
                                  try {
                                      removeDB.eliminaArticolo(izi);
                                  } catch (ClassNotFoundException e) {
                                      throw new RuntimeException(e);
                                  }
                                 

                                  response.sendRedirect("adminRemove.jsp?marcaserv=" + request.getParameter("marca") + "&genereserv=" + request.getParameter("udb") + "&coloreserv=" + request.getParameter("colore") + "&customRange1serv=" + request.getParameter("min") + "&customRange2serv=" + request.getParameter("max")+"&guarino="+"gem");
    
                               }

}
