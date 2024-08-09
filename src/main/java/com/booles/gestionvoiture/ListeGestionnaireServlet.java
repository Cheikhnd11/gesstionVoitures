package com.booles.gestionvoiture;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ListeGestionnaireServlet")
public class ListeGestionnaireServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public ListeGestionnaireServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Utilisateur> utilisateurs = new ArrayList<>();
        utilisateurs=returnUtilisateurs();
        request.setAttribute("utilisateurs", utilisateurs);
        request.getRequestDispatcher("listeGestionnaire.jsp").forward(request, response);
    }

    public List<Utilisateur> returnUtilisateurs() {
        List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
        String query="select * from utilisateur where role='gestionnaire'";
        try(Connection connection=DataBase.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(query);
            ResultSet resultSet=preparedStatement.executeQuery()) {
            while(resultSet.next()) {
                Utilisateur utilisateur = new Utilisateur();
                utilisateur.setIdentifient(resultSet.getInt("identifient"));
                utilisateur.setNom(resultSet.getString("nom"));
                utilisateur.setPrenom(resultSet.getString("prenom"));
                utilisateur.setAge(resultSet.getInt("age"));
                utilisateur.setEmail(resultSet.getString("email"));
                utilisateur.setAdresse(resultSet.getString("adresse"));
                utilisateur.setRole(resultSet.getString("role"));
                utilisateur.setPassword(resultSet.getString("password"));
                utilisateurs.add(utilisateur);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return utilisateurs;
    }
}
