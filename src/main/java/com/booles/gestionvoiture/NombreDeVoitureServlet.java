package com.booles.gestionvoiture;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/NombreDeVoitureServlet")
public class NombreDeVoitureServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public NombreDeVoitureServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int nombre=retournerNombreDeVoiture();
        request.setAttribute("nombre", nombre);
        request.getRequestDispatcher("etatPARKING.jsp").forward(request, response);
    }

    public int retournerNombreDeVoiture() {
        int nombre = 0;
        String query = "SELECT COUNT(Immatriculation) AS nombre FROM Voiture";

        try (Connection connection = DataBase.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            if (resultSet.next()) {
                nombre = resultSet.getInt("nombre");
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération du nombre de voitures: " + e.getMessage(), e);
        }

        return nombre;
    }

}
