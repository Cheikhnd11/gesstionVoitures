package com.booles.gestionvoiture;

import java.util.Date;

public class Client {

    private int identifient;

    public Client() {
        super();
    }

    private String nom;
    private String prenom;
    private int age;
    private String email;
    private String adresse;
    private String telephone;
    /**
     * @return the telephone
     */
    public String getTelephone() {
        return telephone;
    }
    /**
     * @param telephone the telephone to set
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    /**
     * @return the dateInscription
     */
    public Date getDateInscription() {
        return dateInscription;
    }
    /**
     * @param dateInscription the dateInscription to set
     */
    public void setDateInscription(Date dateInscription) {
        this.dateInscription = dateInscription;
    }
    private Date dateInscription;
    /**
     * @return the identifient
     */
    public int getIdentifient() {
        return identifient;
    }
    /**
     * @param identifient the identifient to set
     */
    public void setIdentifient(int identifient) {
        this.identifient = identifient;
    }
    /**
     * @return the nom
     */
    public String getNom() {
        return nom;
    }

    /**
     * @param nom the nom to set
     */
    public void setNom(String nom) {
        this.nom = nom;
    }
    /**
     * @return the prenom
     */
    public String getPrenom() {
        return prenom;
    }
    /**
     * @param prenom the prenom to set
     */
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    /**
     * @return the age
     */
    public int getAge() {
        return age;
    }
    /**
     * @param age the age to set
     */
    public void setAge(int age) {
        this.age = age;
    }
    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }
    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    /**
     * @return the adresse
     */
    public String getAdresse() {
        return adresse;
    }
    /**
     * @param adresse the adresse to set
     */
    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public void setIdentifiant(int identifiant) {
        this.identifient = identifiant;
    }
}
