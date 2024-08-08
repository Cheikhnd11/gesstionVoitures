package com.booles.gestionvoiture;

public class RevenuClient {
    private int clientId;
    private double revenuTotal;

    // Constructeur
    public RevenuClient(int clientId, double revenuTotal) {
        this.clientId = clientId;
        this.revenuTotal = revenuTotal;
    }

    // Getters et Setters
    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    public double getRevenuTotal() {
        return revenuTotal;
    }

    public void setRevenuTotal(double revenuTotal) {
        this.revenuTotal = revenuTotal;
    }
}
