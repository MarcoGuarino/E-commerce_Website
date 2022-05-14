package com.project.progetto;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;

public class RemoveAllCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {


        HttpSession session = request.getSession(false);

        int idSU = (int) session.getAttribute("idU");

        ServletContext context = getServletContext();
        int cartItems = (int) context.getAttribute("cartItems");

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (int i = 0; i <= cartItems; i++) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals(i + "")) {
                        String str = cookie.getValue();
                        String[] parts = str.split("!");
                        String idU = parts[4];
                        if (idSU == Integer.parseInt(idU)) {
                            cookie.setValue(null);
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);
                        }
                    }
                }
            }
        }

        response.sendRedirect("carrello.jsp");

    }
}
