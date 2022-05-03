package com.project.progetto;

import java.sql.*;

public class UtenteDB {

    public int inserisciUtente(Utente utente) throws ClassNotFoundException {
        String SQL = "INSERT INTO utenti" +
                "  (nome, cognome, username, email, pwd, datan, comunen, indirizzo, paese) VALUES " +
                " (?, ?, ?, ?, ?, ?, ?, ?, ?);";

        int result = 0;

        //Class.forName("org.mariadb.jdbc.Driver");
        Class.forName("com.mysql.jdbc.Driver"); //potrebbe essere Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/sneaka";
        String user = "sneaka";
        String password = "sneaka";

        try (Connection connection = DriverManager
                .getConnection(url, user, password);

             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {
            preparedStatement.setString(1, utente.getNome());
            preparedStatement.setString(2, utente.getCognome());
            preparedStatement.setString(3, utente.getUsername());
            preparedStatement.setString(4, utente.getEmail());
            preparedStatement.setString(5, utente.getPwd());
            preparedStatement.setObject(6, utente.getDatan());
            preparedStatement.setString(7, utente.getComunen());
            preparedStatement.setString(8, utente.getIndirizzo());
            preparedStatement.setString(9, utente.getPaese());

            System.out.println(preparedStatement);

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {

            printSQLException(e);
        }
        return result;
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
