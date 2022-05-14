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

                                  String tedua = request.getParameter("pino");

                                  Remove izi = new Remove();
                                  izi.setID(Integer.parseInt(tedua));
                                  
          
          
                                  try {
                                      removeDB.eliminaArticolo(izi);
                                  } catch (ClassNotFoundException e) {
                                      throw new RuntimeException(e);
                                  }

                                  response.sendRedirect("adminRemove.jsp?genere=bambino");
    
                               }

}
