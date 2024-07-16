/**
 *
 */
package com.booles.gestionvoiture;

/**
 *
 */
public class Utilisateur {

    private int identifient;
    private String password;
    private String nom;
    private String prenom;
    private int age;
    private String email;
    private String adresse;
    private String role;
    public Utilisateur(int identifient, String password,String nom, String prenom, int age, String role, String email, String adresse) {
        super();
        this.identifient = identifient;
        this.password = password;
        this.nom = nom;
        this.prenom = prenom;
        this.age = age;
        this.role = role;
        this.email = email;
        this.adresse = adresse;
    }
    public Utilisateur() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
     * @return the identifient
     */
    public int getIdentifient() {
        return identifient;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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
     * @return the role
     */
    public String getRole() {
        return role;
    }
    /**
     * @param role the role to set
     */
    public void setRole(String role) {
        this.role = role;
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



}
