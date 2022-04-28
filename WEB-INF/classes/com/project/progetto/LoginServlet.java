package com.project.progetto;

import java.io.*;

import jakarta.servlet.http.*;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Objects;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;;

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



    String email=request.getParameter("email");

    String msg=" ";

    msg = "welcome, " + email;
    HttpSession session = request.getSession();
    session.setAttribute("msg", msg);
    RequestDispatcher req = request.getRequestDispatcher("/index.jsp");
    req.forward(request, response);
    response.setContentType("text/html");
    PrintWriter out=response.getWriter();
}

}