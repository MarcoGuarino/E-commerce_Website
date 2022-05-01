package com.project.progetto;

import jakarta.servlet.http.*;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {



        HttpSession session = request.getSession();
        session.invalidate();
        RequestDispatcher req = request.getRequestDispatcher("/index.jsp");
        req.forward(request, response);
        response.setContentType("text/html");
    }

}
