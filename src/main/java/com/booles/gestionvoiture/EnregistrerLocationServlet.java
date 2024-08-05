package com.booles.gestionvoiture;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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

            Client client1= null;
            client1 = returnClient(client);
            String nom=client1.getNom();
            String prenom=client1.getPrenom();
            String telephone=client1.getTelephone();
            Voiture voiture1= null;
            voiture1 = returnVoiture(voiture);
            String marque=voiture1.getMarque();
            //verifier si le client que concerne la location existe dans la base de donnees!
            if (client1 == null) {
                out.println("Le client saisi pour cette location n'est pas inscrit dans la base de donnees!");
                return;
            }

            if (nombreJour < 0) {
                out.println("Erreur : La date de fin est avant la date de début.");
                return;
            }

            float montantTotal = prixParJour * nombreJour;
                // Enregistrement de la location
                ajouterLocation(idLocation, client, voiture, dateDebut, dateFin, nombreJour, montantTotal, statutLocation, kilometrageActuel);

                ajouterFacture(idLocation,nom,prenom,telephone,voiture,kilometrageActuel,marque,nombreJour,montantTotal,dateDebut);

                updateSatutVoiture(voiture);
                HttpSession session = request.getSession();
                Utilisateur responsable = (Utilisateur) session.getAttribute("user");

                // Récupération de la location et le client pour les affichage dans la facture
                Location location = returnLocation(idLocation);
                request.setAttribute("location", location);
                request.setAttribute("client", client1);
                request.setAttribute("voiture", voiture1);
                request.setAttribute("responsable", responsable);
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

    public void ajouterFacture(int idFacture,String nomClient,String prenomClient,String telephoneClient,String matriculeVoiture,int kilometrage,String marque,int nbjr,float montant,String date){
        String query="INSERT INTO Facture(idFacture,nomClient,PrenomClient,TelephonneClient,matriculeVoiture,kilometrageVoiture,marqueVoiture,nombreJour,montantTotal,dateFacture) VALUES (?,?,?,?,?,?,?,?,?,?)";
        try(Connection connection=DataBase.getConnection();
        PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, idFacture);
            ps.setString(2, nomClient);
            ps.setString(3, prenomClient);
            ps.setString(4, telephoneClient);
            ps.setString(5, matriculeVoiture);
            ps.setInt(6, kilometrage);
            ps.setString(7, marque);
            ps.setInt(8, nbjr);
            ps.setFloat(9, montant);
            ps.setString(10, date);
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
        Client client = null;
        String query = "SELECT * FROM Client WHERE identifient = ?";
        try (Connection connection=DataBase.getConnection(); PreparedStatement ps=connection.prepareStatement(query)){
            ps.setInt(1, idClient);
            try (ResultSet rs=ps.executeQuery()) {
                if (rs.next()) {
                    client = new Client();
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
    public void updateSatutVoiture(String matricule){
        String query = "UPDATE Voiture SET status = 'en cours de location' WHERE Immatriculation = ?";
        try(Connection connection=DataBase.getConnection();
        PreparedStatement ps=connection.prepareStatement(query)) {
            ps.setString(1, matricule);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
