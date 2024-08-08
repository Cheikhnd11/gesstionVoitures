package com.booles.gestionvoiture;

public class RevenuVoiture {

    private String immatriculation;
    private double revenuTotal;

    // Constructeur
    public RevenuVoiture(String immatriculation, double revenuTotal) {
        this.immatriculation = immatriculation;
        this.revenuTotal = revenuTotal;
    }

    // Getters et Setters
    public String getImmatriculation() {
        return immatriculation;
    }

    public void setImmatriculation(String immatriculation) {
        this.immatriculation = immatriculation;
    }

    public double getRevenuTotal() {
        return revenuTotal;
    }

    public void setRevenuTotal(double revenuTotal) {
        this.revenuTotal = revenuTotal;
    }
}
