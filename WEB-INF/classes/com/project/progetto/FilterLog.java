package com.project.progetto;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

public class FilterLog implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String username = request.getParameter("username");
        String pwd = request.getParameter("pwd");

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/sneaka";
        String user = "sneaka";
        String password = "sneaka";

        String SQL = "SELECT id,username,pwd FROM utenti where username=? and pwd=?";


        try (Connection connection = DriverManager
                .getConnection(url, user, password);

             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, pwd);

            //System.out.println(preparedStatement);

            ResultSet result = preparedStatement.executeQuery();

            ResultSetMetaData rsmd = result.getMetaData();


            if (result.next()){
                int idValue = Integer.parseInt(result.getString(1));
                HttpSession session = req.getSession(true);
                if (idValue == 0) session.setAttribute("admin", "yes");
                else session.setAttribute("admin", "no");
                chain.doFilter(request, response);
            } else {
                res.sendRedirect("login.jsp");
            }


        } catch (SQLException e) {

            printSQLException(e);
        }


    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}