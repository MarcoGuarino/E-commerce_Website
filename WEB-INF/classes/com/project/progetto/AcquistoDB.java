package com.project.progetto;
import java.sql.*;
public class AcquistoDB {
    public  int inserisciAcquisto(Acquisto acquisto) throws ClassNotFoundException {

        String SQL;
        
        
            SQL = "INSERT INTO acquisto" +
            "  (nome_scarpa,id_utente,taglia) VALUES " +
            " (?, ?, ?);";
       

        int result = 0;

        //Class.forName("com.mysql.jdbc.Driver");
        Class.forName("org.mariadb.jdbc.Driver");

        String url = "jdbc:mariadb://localhost:3306/sneaka";
        //String url = "jdbc:mysql://localhost:3306/sneaka";
        String user = "sneaka";
        String password = "sneaka";

        try (Connection connection = DriverManager
                .getConnection(url, user, password);


             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

            preparedStatement.setString(1, acquisto.getNome());
            preparedStatement.setInt(2, acquisto.get_idutente());
            preparedStatement.setInt(3, acquisto.get_taglia());
            


            System.out.println(preparedStatement);

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {

            printSQLException(e);
        }
        return result;
    }

    private static void printSQLException(SQLException ex) {
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
