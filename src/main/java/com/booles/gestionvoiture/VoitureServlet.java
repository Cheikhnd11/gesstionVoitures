package com.booles.gestionvoiture;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/VoitureServlet")
public class VoitureServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public VoitureServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       response.setContentType("text/html");
       PrintWriter out = response.getWriter();

        String immatriculation = request.getParameter("Immatriculation");
        String marque = request.getParameter("marque");
        String modele = request.getParameter("modele");
        String anneeDeMiseEnService = request.getParameter("anneeDeMiseEnService");
        String kilometrageStr = request.getParameter("kilomeetrage");
        String typeCarburant = request.getParameter("typeCarburant");
        String categorie = request.getParameter("categorie");
        String prixDeLocationParJourStr = request.getParameter("prixDeLocationParJour");

        out.println(immatriculation);
        out.println(marque);
        out.println(modele);
        out.println(anneeDeMiseEnService);
        out.println(kilometrageStr);
        out.println(typeCarburant);
        out.println(categorie);
        out.println(prixDeLocationParJourStr);

        try {
            if (immatriculation == null || marque == null || modele == null ||
                     kilometrageStr == null || typeCarburant == null || categorie == null || prixDeLocationParJourStr == null) {
                throw new IllegalArgumentException("All parameters are required.");
            }

            int kilomeetrage = Integer.parseInt(kilometrageStr);
            double prixDeLocationParJour = Double.parseDouble(prixDeLocationParJourStr);

            addNewVoiture(immatriculation, marque, modele, anneeDeMiseEnService, kilomeetrage, typeCarburant, categorie, prixDeLocationParJour);
            request.setAttribute("message", "Car added successfully");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("message", "Invalid number format: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            request.setAttribute("message", "Missing or invalid parameters: " + e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Error adding car: " + e.getMessage());
        }

        request.getRequestDispatcher("gestionnaire.jsp").forward(request, response);
    }

    private void addNewVoiture(String Immatriculation, String marque, String modele, String anneeDeMiseEnService, int kilomeetrage, String typeCarburant, String categorie, double prixDeLocationParJour) throws SQLException {
        String query = "INSERT INTO Voiture (Immatriculation, marque, modele, anneeDeMiseEnService, kilomeetrage, typeCarburant, categorie, prixDeLocationParJour) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DataBase.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, Immatriculation);
            ps.setString(2, marque);
            ps.setString(3, modele);
            ps.setString(4, anneeDeMiseEnService);
            ps.setInt(5, kilomeetrage);
            ps.setString(6, typeCarburant);
            ps.setString(7, categorie);
            ps.setDouble(8, prixDeLocationParJour);
            ps.executeUpdate();
        }
    }
}
