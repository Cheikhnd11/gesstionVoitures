package com.booles.gestionvoiture;

public class Retours {
    private int idRetour;
    private int idLocation;
    private String voiture;
    private int client;
    private String dateRetour;
    private int kilometrageFinal;
    private String dateEnregistrement;

    public Retours() {
        super();
    }

    public Retours(int idRetour, int idLocation, String voiture, int client, String dateRetour, int kilometrageFinal, String dateEnregistrement) {
        this.idRetour = idRetour;
        this.idLocation = idLocation;
        this.voiture = voiture;
        this.client = client;
        this.dateRetour = dateRetour;
        this.kilometrageFinal = kilometrageFinal;
        this.dateEnregistrement = dateEnregistrement;
    }

    public int getIdRetour() {
        return idRetour;
    }

    public void setIdRetour(int idRetour) {
        this.idRetour = idRetour;
    }

    public int getIdLocation() {
        return idLocation;
    }

    public void setIdLocation(int idLocation) {
        this.idLocation = idLocation;
    }

    public String getVoiture() {
        return voiture;
    }

    public void setVoiture(String voiture) {
        this.voiture = voiture;
    }

    public int getClient() {
        return client;
    }

    public void setClient(int client) {
        this.client = client;
    }

    public String getDateRetour() {
        return dateRetour;
    }

    public void setDateRetour(String dateRetour) {
        this.dateRetour = dateRetour;
    }

    public int getKilometrageFinal() {
        return kilometrageFinal;
    }

    public void setKilometrageFinal(int kilometrageFinal) {
        this.kilometrageFinal = kilometrageFinal;
    }

    public String getDateEnregistrement() {
        return dateEnregistrement;
    }

    public void setDateEnregistrement(String dateEnregistrement) {
        this.dateEnregistrement = dateEnregistrement;
    }
}
