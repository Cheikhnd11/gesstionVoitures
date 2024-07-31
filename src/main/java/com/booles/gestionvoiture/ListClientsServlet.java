package com.booles.gestionvoiture;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ListClientsServlet")
public class ListClientsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Client> clients = new ArrayList<>();
        try {
            clients = listClients();
            request.setAttribute("clients", clients);
            request.getRequestDispatcher("listClients.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Client> listClients() throws SQLException {
        List<Client> clients = new ArrayList<>();
        String query = "SELECT * FROM Client";

        try (Connection connection = DataBase.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                Client client = new Client();
                client.setIdentifient(resultSet.getInt("identifient"));
                client.setNom(resultSet.getString("nom"));
                client.setPrenom(resultSet.getString("prenom"));
                client.setAge(resultSet.getInt("age"));
                client.setEmail(resultSet.getString("email"));
                client.setAdresse(resultSet.getString("adresse"));
                client.setTelephone(resultSet.getString("telephone"));
                clients.add(client);
            }
        }
        return clients;
    }
}
