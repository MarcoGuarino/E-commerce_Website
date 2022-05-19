package com.project.progetto;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class VotaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String nomeScarpa = request.getParameter("scarpa");
        int idU = Integer.parseInt(request.getParameter("idU"));
        int voto = Integer.parseInt(request.getParameter("voto"));


        String SQL = "INSERT INTO votazione" +
                "  (nomescarpa, idutente, voto) VALUES " +
                " (?, ?, ?);";

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/sneaka";
        String user = "sneaka";
        String password = "sneaka";

        try (Connection connection = DriverManager
                .getConnection(url, user, password);

             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {
            preparedStatement.setString(1, nomeScarpa);
            preparedStatement.setInt(2, idU);
            preparedStatement.setInt(3, voto);


            preparedStatement.executeUpdate();

        } catch (SQLException e) {

            printSQLException(e);
        }

        response.sendRedirect("acquistate.jsp");

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