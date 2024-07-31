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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

@WebServlet("/EnregistrerLocationServlet")
public class EnregistrerLocationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public EnregistrerLocationServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int idLocation = Integer.parseInt(request.getParameter("idLocation"));
        int client = Integer.parseInt(request.getParameter("client"));
        String voiture = request.getParameter("voiture");
        String dateDebut = request.getParameter("dateDebut");
        String dateFin = request.getParameter("dateFin");
        float prixParJour = Float.parseFloat(request.getParameter("prix"));
        float montantTotal = 0;
        String statutLocation = request.getParameter("statutLocation");
        int kilometrageActuel = Integer.parseInt(request.getParameter("kilometrage"));

        int nombreJour = 0;
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate startDate = LocalDate.parse(dateDebut, formatter);
            LocalDate endDate = LocalDate.parse(dateFin, formatter);
            nombreJour = (int) ChronoUnit.DAYS.between(startDate, endDate);
        } catch (Exception e) {
            e.printStackTrace();
        }

        montantTotal = prixParJour * nombreJour;

        // Vérification et géstion des erreurs possibles, par exemple, si la date de fin est avant la date de début
        if (nombreJour < 0) {
            out.println("Erreur : La date de fin est avant la date de début.");
            return;
        }

        // Appele de la méthode pour ajouter la location
        ajouterLocation(idLocation, client, voiture, dateDebut, dateFin, nombreJour, montantTotal, statutLocation, kilometrageActuel);
    }

    public void ajouterLocation(int idLocation, int client, String voiture, String dateDebut, String dateFin, int nombreJour, float montantTotal, String statutLocation, int kilometrageActuel) {
        Connection con = null;
        PreparedStatement ps = null;
        String query = "INSERT INTO Location (idLocation, client, voiture, dateDebut, dateFin, nombreJour, montantTotal, statutLocation, kilometrageActuel) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            con = DataBase.getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, idLocation);
            ps.setInt(2, client);
            ps.setString(3, voiture);
            ps.setString(4, dateDebut);
            ps.setString(5, dateFin);
            ps.setInt(6, nombreJour);
            ps.setFloat(7, montantTotal);
            ps.setString(8, statutLocation);
            ps.setInt(9, kilometrageActuel);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            // fermeture des ressources pour éviter les fuites de mémoire
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
