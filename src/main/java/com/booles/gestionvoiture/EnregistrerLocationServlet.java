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
import java.sql.ResultSet;
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

        try {
            int idLocation = Integer.parseInt(request.getParameter("idLocation"));
            int client = Integer.parseInt(request.getParameter("client"));
            String voiture = request.getParameter("voiture");
            String dateDebut = request.getParameter("dateDebut");
            String dateFin = request.getParameter("dateFin");
            float prixParJour = Float.parseFloat(request.getParameter("prix"));
            String statutLocation = request.getParameter("statutLocation");
            int kilometrageActuel = Integer.parseInt(request.getParameter("kilometrage"));

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate startDate = LocalDate.parse(dateDebut, formatter);
            LocalDate endDate = LocalDate.parse(dateFin, formatter);
            int nombreJour = (int) ChronoUnit.DAYS.between(startDate, endDate);

            if (nombreJour < 0) {
                out.println("Erreur : La date de fin est avant la date de début.");
                return;
            }

            float montantTotal = prixParJour * nombreJour;

            // Enregistrement de la location
            ajouterLocation(idLocation, client, voiture, dateDebut, dateFin, nombreJour, montantTotal, statutLocation, kilometrageActuel);

            // Récupération de la location et le client pour les affichage dans la facture
            Location location = returnLocation(idLocation);
            Client client1 = returnClient(client);
            Voiture voiture1 = returnVoiture(voiture);
            request.setAttribute("location", location);
            request.setAttribute("client", client1);
            request.setAttribute("voiture", voiture1);
            request.getRequestDispatcher("facture.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Erreur lors de la création de la location : " + e.getMessage());
        }
    }

    public void ajouterLocation(int idLocation, int client, String voiture, String dateDebut, String dateFin, int nombreJour, float montantTotal, String statutLocation, int kilometrageActuel) {
        String query = "INSERT INTO Location (idLocation, client, voiture, dateDebut, dateFin, nombreJour, montantTotal, statutLocation, kilometrageActuel) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DataBase.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
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
        }
    }

    public Location returnLocation(int idLocation) {
        Location location = new Location();
        String query = "SELECT * FROM Location WHERE idLocation= ?";
        try (Connection con = DataBase.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, idLocation);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    location.setIdLocation(rs.getInt("idLocation"));
                    location.setClient(rs.getInt("client"));
                    location.setVoiture(rs.getString("voiture"));
                    location.setDateDebut(rs.getString("dateDebut"));
                    location.setDateFin(rs.getString("dateFin"));
                    location.setNombreJour(rs.getInt("nombreJour"));
                    location.setMontantTotal(rs.getFloat("montantTotal"));
                    location.setStatutLocation(rs.getString("statutLocation"));
                    location.setKilometrage(rs.getInt("kilometrageActuel"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return location;
    }

    public Client returnClient(int idClient) {
        Client client = new Client();
        String query = "SELECT * FROM Client WHERE identifient = ?";
        try (Connection connection=DataBase.getConnection(); PreparedStatement ps=connection.prepareStatement(query)){
            ps.setInt(1, idClient);
            try (ResultSet rs=ps.executeQuery()) {
                if (rs.next()) {
                    client.setNom(rs.getString("nom"));
                    client.setPrenom(rs.getString("prenom"));
                    client.setTelephone(rs.getString("telephone"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return client;
    }

    public Voiture returnVoiture(String idVoiture) {
        Voiture voiture = new Voiture();
        String query = "SELECT * FROM Voiture WHERE Immatriculation = ?";
        try(Connection connection=DataBase.getConnection();PreparedStatement ps=connection.prepareStatement(query)) {
            ps.setString(1, idVoiture);
            try (ResultSet rs=ps.executeQuery()) {
                if (rs.next()) {
                    voiture.setMarque(rs.getString("marque"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return voiture;
    }

}
