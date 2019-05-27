/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.model;
import java.util.ArrayList;
/**
 *
 * @author Hieu
 */
public class Movies {
    private ArrayList<Movie> movies = new ArrayList<Movie>();
    
     public ArrayList<Movie> getAllMovies() {
        return this.movies;
    }
    
    public void addMovie (Movie movie) {
        movies.add(movie);
    }
    
    public void removeMovie(Movie movie) {
        movies.remove(movie);
    }
    //search movies 
    
    
    //search movies by genre
    public ArrayList<Movie> search(String genre) {
        ArrayList<Movie> moviegenre = new ArrayList<Movie>();
        for (Movie c : movies) {
            if (c.getGenre().equals(genre))
            // login done.
            moviegenre.add(c); 

        }
        return moviegenre;
    }
}
