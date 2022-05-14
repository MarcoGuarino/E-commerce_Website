package com.project.progetto;

import java.sql.*;

public class RemoveDB {
    public int eliminaArticolo(Remove remove) throws ClassNotFoundException {
    
        
       
        int result = 0;

        //Class.forName("org.mariadb.jdbc.Driver");
       Class.forName("com.mysql.jdbc.Driver");

       // String url = "jdbc:mariadb://localhost:3306/sneaka";
        String url = "jdbc:mysql://localhost:3306/sneaka";
        String user = "sneaka";
        String password = "sneaka";

       
        String SQL = "delete from scarpa where id = ?";

        try (Connection connection = DriverManager
                .getConnection(url, user, password);

             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {
            preparedStatement.setInt(1, remove.getID());
            

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
