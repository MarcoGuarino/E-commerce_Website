package com.project.progetto;
 
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
 
        /*Cookie mod = new Cookie(c,modello);
        count++;
        c = String.valueOf(count);
        Cookie sz = new Cookie(c,size+"");
        count++;
        c = String.valueOf(count);
        Cookie prz = new Cookie(c,prezzo+"");
        count++;
        c = String.valueOf(count);
        Cookie img = new Cookie(c,immagine);
        count++;
 
        response.addCookie(mod);
        response.addCookie(sz);
        response.addCookie(prz);
        response.addCookie(img);*/
 
        Cookie ck = new Cookie(c,value);
        Cookie ck2 = new Cookie("n",c);
        count++;
        c = String.valueOf(count);
        
        response.addCookie(ck);
        response.addCookie(ck2);
 
 
        response.sendRedirect("carrello.jsp");
 
 
        /*PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + modello +"</h1>");
        out.println("<h1>" + size +"</h1>");
        out.println("<h1>" + prezzo +"</h1>");
        out.println("<h1>" + immagine +"</h1>");
        out.println("</body></html>");*/
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        doPost(request, response);
    }
}