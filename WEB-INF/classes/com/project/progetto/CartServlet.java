package com.project.progetto;
 
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
 
import java.io.IOException;
import java.io.PrintWriter;
 
public class CartServlet extends HttpServlet {
 
    public int count = 0;
    String c = String.valueOf(count);
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
 
        String modello = request.getParameter("modello");
        int size = Integer.parseInt(request.getParameter("size"));
        int prezzo = Integer.parseInt(request.getParameter("prezzo"));
        String immagine = request.getParameter("immagine");
        HttpSession session = request.getSession(false);
        int idU = (int) session.getAttribute("idU");
 
        String value = modello+"!"+size+"!"+prezzo+"!"+immagine+"!"+idU;


        ServletContext context = getServletContext();
        context.setAttribute("cartItems", count);

        Cookie ck = new Cookie(c,value);
        response.addCookie(ck);


        count++;
        c = String.valueOf(count);


        response.sendRedirect("carrelloOK.jsp");

    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        doPost(request, response);
    }
}