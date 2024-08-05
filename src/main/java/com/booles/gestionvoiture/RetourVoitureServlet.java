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

@WebServlet("/RetourVoitureServlet")
public class RetourVoitureServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RetourVoitureServlet() {
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

        try {
            int idRetour = Integer.parseInt(request.getParameter("id"));
            int idLocation = Integer.parseInt(request.getParameter("idLocation"));
            int kmRetour = Integer.parseInt(request.getParameter("km"));
            String dateRetour = request.getParameter("date");

            Location location = returnLocation(idLocation);

            if (location == null) {
                out.println("<h1>Aucune location trouvée avec l'identifiant numéro " + idLocation + "</h1>");
                return;
            }

            if (location.getStatutLocation().equals("terminee")) {
                out.println("<h1>Cette location (ID: " + idLocation + ") est terminée depuis le " + location.getDateFin() + "</h1>");
                return;
            }

            ajouterRetourVoiture(idRetour, idLocation, kmRetour, dateRetour);
            String matricule = location.getVoiture();
            updateStatutVoiture(matricule);
            updateKilometrageVoiture(matricule, kmRetour);
            updateStatutLocation(idLocation);

            out.println("<h1>Retour de voiture enregistré avec succès</h1>");
        } catch (NumberFormatException e) {
            out.println("<h1>Erreur de format de nombre: " + e.getMessage() + "</h1>");
        } catch (SQLException e) {
            out.println("<h1>Erreur lors de la manipulation de la base de données: " + e.getMessage() + "</h1>");
        } catch (Exception e) {
            out.println("<h1>Une erreur inattendue est survenue: " + e.getMessage() + "</h1>");
        }
    }

    public void ajouterRetourVoiture(int id, int location, int kmRetour, String dateRetour) throws SQLException {
        String query = "INSERT INTO RetourVoiture(id, location, kilometrageDeRetour, dateRetour) VALUES (?, ?, ?, ?)";
        try (Connection connection = DataBase.getConnection(); PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setInt(1, id);
            pst.setInt(2, location);
            pst.setInt(3, kmRetour);
            pst.setString(4, dateRetour);
            pst.executeUpdate();
        }
    }

    public void updateStatutVoiture(String matricule) throws SQLException {
        String query = "UPDATE Voiture SET status = 'disponible' WHERE Immatriculation = ?";
        try (Connection connection = DataBase.getConnection(); PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, matricule);
            ps.executeUpdate();
        }
    }

    public void updateStatutLocation(int idLoc) throws SQLException {
        String query = "UPDATE Location SET statutLocation = 'terminee' WHERE idLocation = ?";
        try (Connection connection = DataBase.getConnection(); PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, idLoc);
            ps.executeUpdate();
        }
    }

    public void updateKilometrageVoiture(String matricule, int kmRetour) throws SQLException {
        String query = "UPDATE Voiture SET kilomeetrage = ? WHERE Immatriculation = ?";
        try (Connection connection = DataBase.getConnection(); PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, kmRetour);
            ps.setString(2, matricule);
            ps.executeUpdate();
        }
    }

    public Location returnLocation(int idLocation) throws SQLException {
        Location location = null;
        String query = "SELECT * FROM Location WHERE idLocation = ?";
        try (Connection con = DataBase.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, idLocation);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    location = new Location();
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
        }
        return location;
    }
}
