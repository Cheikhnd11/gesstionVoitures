package com.booles.gestionvoiture;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class RechercherVoitureServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RechercherVoitureServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String marque = request.getParameter("marque");
        String kilometrage= request.getParameter("kilometrage");
        String annee= request.getParameter("annee");
        String carburant= request.getParameter("carburant");
        String categorie= request.getParameter("categorie");
        Voiture voiture=null;


    }
    public  Voiture RechercherVoiture(String marque,String kilometrage,String annee, String carburant, String categorie) {
        Voiture voiture=null;
        String req="SELECT * FROM Voiture WHERE marque= ? AND Kilometrage= ? AND Annee= ? AND Categorie= ?";
        return voiture;
    }
}
