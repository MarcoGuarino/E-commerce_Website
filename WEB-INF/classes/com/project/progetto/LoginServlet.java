package com.project.progetto;

import jakarta.servlet.http.*;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class LoginServlet extends HttpServlet {
/*
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + "hello man" +"</h1>");
        out.println("</body></html>");
    }
*/

    protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {

        String username=request.getParameter("username");

        String msg=" ";

        msg = "welcome, " + username;
        HttpSession session = request.getSession();
        session.setAttribute("msg", msg);
        session.setAttribute("utente", username);
        RequestDispatcher req = request.getRequestDispatcher("/index.jsp");
        req.forward(request, response);
        response.setContentType("text/html");
    }

}