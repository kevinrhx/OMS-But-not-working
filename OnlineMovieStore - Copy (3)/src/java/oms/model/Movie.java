/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.model;

/**
 *
 * @author Hieu
 */
public class Movie {
    private String movieID;
    private String title;
    private String genre;
    private double price;
    private String releasedate;
    private int availableCopies;
    
    public Movie() {
    }
    
    public Movie(String movieID, String title, String genre, double price, String releasedate, int availableCopies) {
        this.movieID = movieID;
        this.title = title;
        this.genre = genre;
        this.price = price;
        this.releasedate = releasedate;
        this.availableCopies = availableCopies; 
    }
    public String getMovieID() {
        return movieID;
    }

    public void setCustomerID(String customerID) {
        this.movieID = customerID;
    
    }
    public String getTitle() {
        return title;
    }

    public void setTitle(String Title) {
        this.title = title;
    }
    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }
    public Double getPrice() {
        return price;
    }

    public void setTitle(double price) {
        this.price = price;
    }
    public String getReleaseDate() {
        return releasedate;
    }

    public void setReleaseDate(String releasedate) {
        this.releasedate = releasedate;
    } 
    public int getAvailableCopies() {
        return availableCopies;
    }

    public void setAvailableCopies(int availableCopies) {
        this.availableCopies = availableCopies;
    
    }
    
}
