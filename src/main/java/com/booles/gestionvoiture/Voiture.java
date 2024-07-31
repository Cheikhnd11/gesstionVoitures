package com.booles.gestionvoiture;

public class Voiture {

    private String Immatriculation;
    private int nombreDePlace;
    private String marque;
    private String modele;
    private String anneeDeMiseEnService;
    private  int kilomeetrage;
    private String typeCarburant;
    private  String categorie;
    private float prixDeLocationParJour;

    public Voiture() {
    }



    public Voiture(String Immatriculation, int nombreDePlace, String marque, String modele, String anneeDeMiseEnService, int kilomeetrage, String typeCarburant, String categorie, float prixDeLocationParJour) {
        this.Immatriculation = Immatriculation;
        this.nombreDePlace = nombreDePlace;
        this.marque = marque;
        this.modele = modele;
        this.anneeDeMiseEnService = anneeDeMiseEnService;
        this.kilomeetrage = kilomeetrage;
        this.typeCarburant = typeCarburant;
        this.categorie = categorie;
        this.prixDeLocationParJour = prixDeLocationParJour;
    }


    public String getImmatriculation() {
        return Immatriculation;
    }

    public void setImmatriculation(String immatriculation) {
        this.Immatriculation = immatriculation;
    }

    public int getNombreDePlace() {
        return nombreDePlace;
    }

    public void setNombreDePlace(int nombreDePlace) {
        this.nombreDePlace = nombreDePlace;
    }

    public String getMarque() {
        return marque;
    }

    public void setMarque(String marque) {
        this.marque = marque;
    }

    public String getModele() {
        return modele;
    }

    public void setModele(String modele) {
        this.modele = modele;
    }

    public String getAnneeDeMiseEnService() {
        return anneeDeMiseEnService;
    }

    public void setAnneeDeMiseEnService(String anneeDeMiseEnService) {
        this.anneeDeMiseEnService = anneeDeMiseEnService;
    }

    public int getKilomeetrage() {
        return kilomeetrage;
    }

    public void setKilomeetrage(int kilomeetrage) {
        this.kilomeetrage = kilomeetrage;
    }

    public String getTypeCarburant() {
        return typeCarburant;
    }

    public void setTypeCarburant(String typeCarburant) {
        this.typeCarburant = typeCarburant;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public float getPrixDeLocationParJour() {
        return prixDeLocationParJour;
    }

    public void setPrixDeLocationParJour(float prixDeLocationParJour) {
        this.prixDeLocationParJour = prixDeLocationParJour;
    }


}
