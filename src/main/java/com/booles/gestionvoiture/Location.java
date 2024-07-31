package com.booles.gestionvoiture;

public class Location {
    private int idLocation;
    private int client;
    private String voiture;
    private String dateDebut;
    private String dateFin;
    private int nombreJour;
    private float montantTotal;
    private String statutLocation;
    private int kilometrageActuel;

    public Location() {
        super();
    }

    @Override
    public String toString() {
        return "Location{" +
                "idLocation=" + idLocation +
                ", client=" + client +
                ", voiture='" + voiture + '\'' +
                ", dateDebut='" + dateDebut + '\'' +
                ", dateFin='" + dateFin + '\'' +
                ", nombreJour=" + nombreJour +
                ", montantTotal=" + montantTotal +
                ", statutLocation='" + statutLocation + '\'' +
                ", kilometrage=" + kilometrageActuel +
                '}';
    }

    public Location(int idLocation, int client, String voiture, String dateDebut, String dateFin, int nombreJour, float montantTotal, String statutLocation, int kilometrage) {
        this.idLocation = idLocation;
        this.client = client;
        this.voiture = voiture;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.nombreJour = nombreJour;
        this.montantTotal = montantTotal;
        this.statutLocation = statutLocation;
        this.kilometrageActuel = kilometrage;
    }

    public int getIdLocation() {
        return idLocation;
    }

    public int getClient() {
        return client;
    }

    public String getVoiture() {
        return voiture;
    }

    public String getDateDebut() {
        return dateDebut;
    }

    public String getDateFin() {
        return dateFin;
    }

    public int getNombreJour() {
        return nombreJour;
    }

    public float getMontantTotal() {
        return montantTotal;
    }

    public String getStatutLocation() {
        return statutLocation;
    }

    public void setIdLocation(int idLocation) {
        this.idLocation = idLocation;
    }

    public void setClient(int client) {
        this.client = client;
    }

    public void setVoiture(String voiture) {
        this.voiture = voiture;
    }

    public void setDateDebut(String dateDebut) {
        this.dateDebut = dateDebut;
    }

    public void setDateFin(String dateFin) {
        this.dateFin = dateFin;
    }

    public void setNombreJour(int nombreJour) {
        this.nombreJour = nombreJour;
    }

    public void setMontantTotal(float montantTotal) {
        this.montantTotal = montantTotal;
    }

    public void setStatutLocation(String statutLocation) {
        this.statutLocation = statutLocation;
    }

    public void setKilometrage(int kilometrage) {
        this.kilometrageActuel = kilometrage;
    }

    public int getKilometrage() {
        return kilometrageActuel;
    }
}
