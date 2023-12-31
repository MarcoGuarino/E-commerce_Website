package com.project.progetto;

import java.sql.*;

public class ScarpaDB {

    public int inserisciScarpa(Scarpa scarpa) throws ClassNotFoundException {

        String SQL;
        
        if (scarpa.getOfferta().equals("si")){
            SQL = "INSERT INTO scarpa" +
            "  (marca, nome, colore, genere, prezzo, offerta, immagine, prezzoOF) VALUES " +
            " (?, ?, ?, ?, ?, ?, ?, ?);";
        }
        else{
            
            SQL = "INSERT INTO scarpa" +
            "  (marca, nome, colore, genere, prezzo, offerta, immagine) VALUES " +
            " (?, ?, ?, ?, ?, ?, ?);";
        }

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");
        //Class.forName("org.mariadb.jdbc.Driver");

        //String url = "jdbc:mariadb://localhost:3306/sneaka";
        String url = "jdbc:mysql://localhost:3306/sneaka";
        String user = "sneaka";
        String password = "sneaka";

        try (Connection connection = DriverManager
                .getConnection(url, user, password);


             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

            preparedStatement.setString(1, scarpa.getMarca());
            preparedStatement.setString(2, scarpa.getNome());
            preparedStatement.setString(3, scarpa.getColore());
            preparedStatement.setString(4, scarpa.getGenere());
            preparedStatement.setInt(5, scarpa.getPrezzo());
            preparedStatement.setString(6, scarpa.getOfferta());
            preparedStatement.setString(7, scarpa.getImmagine());
            if (scarpa.getOfferta().equals("si")){
                preparedStatement.setInt(8, scarpa.getPrezzoOF());
            }


            System.out.println(preparedStatement);

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {

            printSQLException(e);
        }
        return result;
    }

    public int inserisciOfferta(Scarpa scarpa) throws ClassNotFoundException
    {
        String SQL="update scarpa set offerta='si', prezzoOF=? where  nome=?;";
        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");
        //Class.forName("org.mariadb.jdbc.Driver");

        //String url = "jdbc:mariadb://localhost:3306/sneaka";
        String url = "jdbc:mysql://localhost:3306/sneaka";
        String user = "sneaka";
        String password = "sneaka";

        try (Connection connection = DriverManager
                .getConnection(url, user, password);


             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

                preparedStatement.setInt(1, scarpa.getPrezzoOF());
            preparedStatement.setString(2, scarpa.getNome());
          
          
            


            System.out.println(preparedStatement);

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {

            printSQLException(e);
        }
        return result;


    
    }

    public int rimuoviOfferta(Scarpa scarpa)  throws ClassNotFoundException
    {
        String SQL="update scarpa set offerta='no', prezzoOF=null where  id=?;";
        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");
        //Class.forName("org.mariadb.jdbc.Driver");

        //String url = "jdbc:mariadb://localhost:3306/sneaka";
        String url = "jdbc:mysql://localhost:3306/sneaka";
        String user = "sneaka";
        String password = "sneaka";

        try (Connection connection = DriverManager
                .getConnection(url, user, password);


             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

                preparedStatement.setInt(1, scarpa.getPrezzo());    
           
          
          
            


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
