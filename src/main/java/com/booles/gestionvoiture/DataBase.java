package com.booles.gestionvoiture;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBase {

    private static final String URL = "jdbc:mysql://localhost:3306/GestionVoiture?serverTimezone=GMT&useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError("Driver JDBC MySQL non trouvé");
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static Connection getConnection(String username, String password) throws SQLException {
        return DriverManager.getConnection(URL, username, password);
    }

    public static void main(String[] args) {
        try (Connection conn = getConnection()) {
            if (conn != null) {
                System.out.println("Connexion JDBC OK");
            }
        } catch (SQLException e) {
            System.out.println("Erreur : " + e.getMessage());
            e.printStackTrace();
        }
    }
}
