package com.project.progetto;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class FilterLog implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ((username.equals("test")) && (password.equals("password"))) {
            HttpSession session = req.getSession(true);
            chain.doFilter(request, response);
        } else {
            res.sendRedirect("login.jsp");
        }
    }
}
