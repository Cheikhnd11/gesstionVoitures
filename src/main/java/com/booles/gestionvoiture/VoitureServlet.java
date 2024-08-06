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
        int Nb_place= Integer.parseInt(request.getParameter("Nb_place"));
        String marque = request.getParameter("marque");
        String modele = request.getParameter("modele");
        String anneeDeMiseEnService = request.getParameter("anneeDeMiseEnService");
        String kilometrageStr = request.getParameter("kilomeetrage");
        String typeCarburant = request.getParameter("typeCarburant");
        String categorie = request.getParameter("categorie");
        String prixDeLocationParJourStr = request.getParameter("prixDeLocationParJour");
        String status = request.getParameter("status");


        try {
            if (immatriculation == null || marque == null || modele == null ||
                     kilometrageStr == null || typeCarburant == null || categorie == null || prixDeLocationParJourStr == null) {
                throw new IllegalArgumentException("All parameters are required.");
            }

            int kilomeetrage = Integer.parseInt(kilometrageStr);
            double prixDeLocationParJour = Double.parseDouble(prixDeLocationParJourStr);

            addNewVoiture(immatriculation,Nb_place, marque, modele, anneeDeMiseEnService, kilomeetrage, typeCarburant, categorie, prixDeLocationParJour,status);
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

    private void addNewVoiture(String Immatriculation,int nb_place, String marque, String modele, String anneeDeMiseEnService, int kilomeetrage, String typeCarburant, String categorie, double prixDeLocationParJour,String status) throws SQLException {
        String query = "INSERT INTO Voiture (Immatriculation,nombreDePlace, marque, modele, anneeDeMiseEnService, kilomeetrage, typeCarburant, categorie, prixDeLocationParJour,status) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?,?)";
        try (Connection connection = DataBase.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, Immatriculation);
            ps.setInt(2,nb_place);
            ps.setString(3, marque);
            ps.setString(4, modele);
            ps.setString(5, anneeDeMiseEnService);
            ps.setInt(6, kilomeetrage);
            ps.setString(7, typeCarburant);
            ps.setString(8, categorie);
            ps.setDouble(9, prixDeLocationParJour);
            ps.setString(10, status);
            ps.executeUpdate();
        }
    }
}
